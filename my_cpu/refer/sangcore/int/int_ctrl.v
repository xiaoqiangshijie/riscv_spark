//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
//file          : int_ctrl.v
//author        : fengyi
//date          : 7/26/2021
//version       : 0.1
//description   : this file is int_ctrl module in int_top module.
//-----------------------------------------------------------------------------------
//modiication history:
//Date           By            Version           Change Description/
//7/30/2021      fengyi        0.1
//8/4/2021       fengyi        0.11              signals to MIP register   
//8/12/2021      fengyi        0.12              ready && valid as enable signal          
//8/16/2021      fengyi        0.13              add ecall
//            
//-----------------------------------------------------------------------------------


module int_ctrl(
  input             clk                 ,
  input             rstn                ,

//three interrupts
  input             ext_irq             ,     //external interrupt
  input             sft_irq             ,     //software interrupt
  input             tmr_irq             ,     //timer    interrupt

//with csr 
  output            int_csr_ext         ,     // ext_irq for MIP
  output            int_csr_tmr         ,     // tmr_irq for MIP
  output            int_csr_sft         ,     // sft_irq for MIP
  input             csr_int_meip        ,     // external irq mask
  input             csr_int_msip        ,     // software irq mask
  input             csr_int_mtip        ,     // timer    irq mask
  input             csr_int_mie         ,     // global interrupt 1: irq acceptable  in mstatus register
  input      [31:0] csr_int_epc         ,     // pc back when interrupt complete   
  input      [31:0] csr_int_mtvec       ,     // interrupt service program pc
  output reg [31:0] int_csr_epc         ,     // breakpoint when interrrupt claim
  output     [31:0] int_csr_ecause      ,     // interrupt cause when interrupt claim
  output            int_csr_ena         ,     // modify enable signal of mstatus reg when claim
  output     [31:0] int_csr_dpc         ,     // ebreak pc
  output            int_csr_dena        ,     // enable signal to modify dcsr and dcause
  output     [2:0]  int_csr_dcause      ,     // ebreak cause
  output            int_csr_mret        ,     // mret instruction from ctrl
                                              // enable signal of breakpoint recovery
  output reg [31:0] int_csr_mtval       ,     // m trap value of exception

//with dbg
  output            int_jtag_ebreak     ,     // ebreak instruction after arbitration
  input             jtag_irq            ,     // jtag is going to debug mode or debug mode now
  
//with ctrl
  input             ctrl_int_ready      ,     // biu is ready to accept next instruction pc
  input             ctrl_int_valid      ,     // the instruction last has been completely finsished
  input             ctrl_int_ebreak     ,     // instruction now is ebreak
  input             ctrl_int_ecall      ,     // instruction now is ecall
  input             ctrl_int_mret       ,     // instruction now is mter
  input      [31:0] ctrl_int_epc        ,     // breakpoint pc  claim process
  input             ctrl_int_illegal    ,     // illegal instruction
  output            int_ctrl_flush_req  ,     // flush require
  output     [31:0] int_ctrl_mtvec      ,     // interrupt service program pc
  output            int_ctrl_pcen       ,     // enable signal of mtcev
  output     [31:0] int_ctrl_epc        ,     // breakpoint pc  complete process

//with alu
  input             alu_int_l_misa      ,     // load addr misaligned
  input             alu_int_s_misa      ,     // load addr misaligned
  input      [31:0] alu_int_ls_addr

  );

  reg          irq_1_arb        ;    // arbitration of three kinds of interrupts
  wire         irq_2_arb        ;    // arbitration of interrupt and jtag_irq
  reg   [31:0] int_cause        ;    // interrupt cause

  wire         sync_excp        ;
  wire         async_excp       ;

//MIP reg
  assign int_csr_ext = ext_irq  ;
  assign int_csr_tmr = tmr_irq  ;
  assign int_csr_sft = sft_irq  ;

//interrupt signal
  always@(*) begin
    if(!csr_int_mie) begin
      irq_1_arb=1'b0;
    end
    else begin
      irq_1_arb = (ext_irq && !csr_int_meip) || (sft_irq && !csr_int_msip) || (tmr_irq && !csr_int_mtip);
    end
  end

  assign irq_2_arb = irq_1_arb && !(jtag_irq && csr_int_mie);  

//synchronization exception signal
  assign sync_excp = csr_int_mie && (alu_int_l_misa || alu_int_s_misa || ctrl_int_illegal);

//asynchronization exception signal
  assign async_excp = 1'b0;

  wire  int_pcen       ;
  wire  excp_pcen      ;
  reg   int_flush_tmp  ;
  reg   excp_flush_tmp ;
  wire  excp_flush     ;
  wire  int_flush      ;

//pc change enable
  assign int_pcen      = ctrl_int_valid && (irq_2_arb || ctrl_int_mret) ;
  assign excp_pcen     = sync_excp || async_excp ;
  assign int_ctrl_pcen = int_pcen  || excp_pcen ;

//ctrl_int_flush_req
  always@(posedge clk) begin
    if(int_pcen) begin
      int_flush_tmp <= 1'b1;
    end
    else if(!int_pcen && ctrl_int_valid) begin
      int_flush_tmp <= 1'b0;
    end
  end

  always@(posedge clk) begin
      excp_flush_tmp <= excp_pcen;
  end

  assign excp_flush = excp_pcen || excp_flush_tmp ;
  assign int_flush  = int_pcen  || int_flush_tmp  ;

  assign int_ctrl_flush_req = excp_flush || int_flush;

//claim process
  assign int_ctrl_mtvec  = csr_int_mtvec;
  assign int_csr_ena     = int_ctrl_pcen && !ctrl_int_ebreak; //enable signal of modify CSR registers

//interrupt cause
  always@(*) begin 
    if(ext_irq && !csr_int_meip && irq_2_arb)      begin
      int_cause[31]   = 1'b1  ;   //there is a interrupt now
      int_cause[30:0] = 31'h11;   //cause = external interrupt
    end
    else if(sft_irq && !csr_int_msip && irq_2_arb) begin
      int_cause[31]   = 1'b1  ;   //there is a interrupt now
      int_cause[30:0] = 31'h3 ;   //cause = software interrupt
    end
    else if(tmr_irq && !csr_int_mtip && irq_2_arb) begin
      int_cause[31]   = 1'b1  ;   //there is a interrupt now
      int_cause[30:0] = 31'h7 ;   //cause = timeint_csr_epc = ctrl_int_epc;r interrupt
    end
    else if(sync_excp && ctrl_int_illegal)         begin
      int_cause[31]   = 1'b0  ;
      int_cause[30:0] = 31'h2 ;
    end
    else if(ctrl_int_ebreak)          begin
      int_cause[31]   = 1'b0  ;   //there is exception now
      int_cause[30:0] = 31'h3 ;   //cause = ebreak
    end
    else if(ctrl_int_ecall)           begin
      int_cause[31]   = 1'b0  ;
      int_cause[30:0] = 31'h11;  //environment call from m_mode
    end
    else if(sync_excp && alu_int_l_misa)           begin
      int_cause[31]   = 1'b0  ;
      int_cause[30:0] = 31'h4 ;
    end
    else if(sync_excp && alu_int_s_misa)           begin
      int_cause[31]   = 1'b0  ;
      int_cause[30:0] = 31'h6 ;
    end
    else begin
      int_cause = 32'b0       ;   //no interrupt now
    end
  end

  assign int_csr_ecause   = int_cause   ;

//breakpoint protection
//inerrupt pc = breakpoint pc +4, exception pc = breakpoint pc
  always@(*) begin
      if(async_excp) begin
          int_csr_epc = ctrl_int_epc;
      end
      else if (!async_excp && irq_2_arb) begin
          int_csr_epc = ctrl_int_epc + 32'h4;
      end
      else begin
          int_csr_epc = ctrl_int_epc;
      end
  end

//ebreak pc and cause

  assign int_csr_dcause   = 3'b1                ;  //ebreak cause
  assign int_csr_dpc      = ctrl_int_epc        ;  //ebreak is exception, pc needn`t +4
  assign int_jtag_ebreak  = ctrl_int_ebreak && int_ctrl_pcen;
  assign int_csr_dena     = ctrl_int_ebreak && int_ctrl_pcen;

//cmplt process
  assign int_csr_mret     = ctrl_int_mret && int_ctrl_pcen;
  assign int_ctrl_epc     = csr_int_epc                   ;

//mtval 
  always@(*) begin
      if(!async_excp && !irq_2_arb && sync_excp && (alu_int_l_misa || alu_int_s_misa)) begin
          int_csr_mtval = alu_int_ls_addr;
      end
      else if (!async_excp && !irq_2_arb && sync_excp && ctrl_int_ecall) begin
          int_csr_mtval = 32'h73;
      end
      else if (!async_excp && !irq_2_arb && sync_excp && ctrl_int_ebreak) begin
          int_csr_mtval = 32'h100073;
      end
      else begin
          int_csr_mtval = 32'b0;
      end
  end

endmodule
  
