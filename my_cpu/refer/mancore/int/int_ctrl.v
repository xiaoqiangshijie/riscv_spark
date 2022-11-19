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
//8/27/2021      fengyi        0.2               change interface for auto_man          
//-----------------------------------------------------------------------------------


module int_ctrl#(
      parameter CSR_DW  = 64

)(
  input                    clk                 ,
  input                    rstn                ,

//three interrupts
  input                    ext_irq             ,  //external interrupt
  input                    sft_irq             ,  //software interrupt
  input                    tmr_irq             ,  //timer    interrupt

//with csr 
  output                   int_csr_ext         ,  // ext_irq for MIP
  output                   int_csr_tmr         ,  // tmr_irq for MIP
  output                   int_csr_sft         ,  // sft_irq for MIP
  input                    csr_int_meip        ,  // external irq mask
  input                    csr_int_msip        ,  // software irq mask
  input                    csr_int_mtip        ,  // timer    irq mask
  input                    csr_int_mie         ,  // global interrupt 1: irq acceptable  in mstatus register
  input      [31:0]        csr_int_epc         ,  // pc back when interrupt complete   
  input      [31:0]        csr_int_mtvec       ,  // interrupt service program pc
  output reg [31:0]        int_csr_epc         ,  // breakpoint when interrrupt claim
  output     [31:0]        int_csr_ecause      ,  // interrupt cause when interrupt claim
  output                   int_csr_ena         ,  // modify enable signal of mstatus reg when claim
  output     [31:0]        int_csr_dpc         ,  // ebreak pc
  output                   int_csr_dena        ,  // enable signal to modify dcsr and dcause
  output     [ 2:0]        int_csr_dcause      ,  // ebreak cause
  output                   int_csr_mret        ,  // mret instruction from ctrl
  output reg [31:0]        int_csr_mtval       ,  //--- value of mtval reg

//with dbg
  output                   int_jtag_ebreak     ,  // ebreak instruction after arbitration
  input                    jtag_irq            ,  // jtag is going to debug mode or debug mode now 

//with ctrl
  output      [31:0]       int_ctrl_mtvec      ,  // interrupt service program pc
  output      [31:0]       int_ctrl_epc        ,  // pc recover
  output                   int_ctrl_req        ,  // interrupt require to cpu
  output                   int_ctrl_mret       ,  // interrupt finish signal

//with alu
  input                    alu_int_vld         ,
  input       [31:0]       alu_int_pc          ,
  input                    alu_int_beq         ,
  input                    alu_int_l_misa      ,  //--- load  inst misalign exception
  input                    alu_int_s_misa      ,  //--- store inst misalign exception
  input       [31:0]       alu_int_ls_addr     ,  //--- load store misalign addr

//with de tbd
  input                    de_int_ebreak       ,
  input                    de_int_ecall        ,
  input                    de_int_mret         ,
  input                    de_int_misa         ,  //--- current inst misalign exception
  input                    de_int_memerr       ,  //--- current inst memory access error
  input                    de_int_illegal      ,  //--- illegal inst 
  input       [31:0]       de_int_illegal_inst 
  );

  reg          irq_1_arb        ;    // arbitration of three kinds of interrupts
  wire         irq_2_arb        ;    // arbitration of interrupt and jtag_irq
  reg   [31:0] int_cause        ;    // interrupt cause

  reg          int_pcen         ;    // pc change signal of interrupt or ebreak 
  reg          mret_pcen        ;    // pc change signal of mret inst
  reg          flush_tmp        ;
  wire         sync_excp        ;
  wire         async_excp       ;
  wire         mode             ;
  wire  [29:0] direct_base      ;
  wire  [29:0] vectore_base     ;


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
  assign sync_excp =  csr_int_mie && (alu_int_l_misa || alu_int_s_misa || de_int_illegal || de_int_ebreak || de_int_ecall);

//asynchronization exception signal
  assign async_excp = 1'b0;

//pc change enable
  assign int_ctrl_req = !alu_int_beq && (irq_2_arb || async_excp || sync_excp);

//claim process
  assign mode            = csr_int_mtvec[0] ;
  assign direct_base     = csr_int_mtvec[31:2];
  assign vectore_base    = int_cause[31] ? (csr_int_mtvec[31:2]+ int_cause[29:0]) : csr_int_mtvec[31:2] ;
  assign int_ctrl_mtvec  = mode ? { vectore_base , 2'b00 } : { direct_base , 2'b00 }  ;
  assign int_csr_ena     = int_ctrl_req ; //enable signal of modify CSR registers

//interrupt cause mcause
  always@(*) begin 
    if(ext_irq && !csr_int_meip && irq_2_arb)      begin
      int_cause[31]   = 1'b1  ;   //there is a interrupt now
      int_cause[30:0] = 31'hb ;   //cause = external interrupt
    end
    else if(sft_irq && !csr_int_msip && irq_2_arb) begin
      int_cause[31]   = 1'b1  ;   //there is a interrupt now
      int_cause[30:0] = 31'h3 ;   //cause = software interrupt
    end
    else if(tmr_irq && !csr_int_mtip && irq_2_arb) begin
      int_cause[31]   = 1'b1  ;   //there is a interrupt now
      int_cause[30:0] = 31'h7 ;   //cause = timer interrupt
    end
    else if(de_int_misa)                           begin
      int_cause[31]   = 1'b0  ;   //there is exception now
      int_cause[30:0] = 31'h0 ;   //cause = inst misa
    end
    else if(de_int_memerr)                         begin
      int_cause[31]   = 1'b0  ;   //there is exception now
      int_cause[30:0] = 31'h1 ;   //cause = memory access fault 
    end
    else if(de_int_illegal)                        begin
      int_cause[31]   = 1'b0  ;   //there is exception now
      int_cause[30:0] = 31'h2 ;   //cause = illegal inst
    end
    else if(de_int_ebreak)                         begin
      int_cause[31]   = 1'b0  ;   //there is exception now
      int_cause[30:0] = 31'h3 ;   //cause = ebreak
    end
    else if(alu_int_l_misa)                        begin
      int_cause[31]   = 1'b0  ;   //there is exception now
      int_cause[30:0] = 31'h4 ;   //cause = load misalign
    end
    else if(alu_int_s_misa)                        begin
      int_cause[31]   = 1'b0  ;   //there is exception now
      int_cause[30:0] = 31'h6 ;   //cause = stor misalign
    end
    else if(de_int_ecall)                          begin
      int_cause[31]   = 1'b0  ;
      int_cause[30:0] = 31'hb;   //environment call from m_mode
    end
    else begin
      int_cause = 32'b0       ;   //no interrupt now
    end
  end

  assign int_csr_ecause   = int_cause      ;

//mtval exception only tbd 
  always@(*) begin
      if(!async_excp && !irq_2_arb && sync_excp && (alu_int_l_misa || alu_int_s_misa)) 
          int_csr_mtval = alu_int_ls_addr ;
      else if (!async_excp && !irq_2_arb && sync_excp && de_int_illegal) 
          int_csr_mtval = de_int_illegal_inst ;
      else 
          int_csr_mtval = 32'b0;
  end

//breakpoint protection
  always@(*) begin
      if(async_excp) begin
          int_csr_epc = alu_int_pc;
      end
      else if (!async_excp && irq_2_arb) begin
          int_csr_epc = alu_int_pc+32'h4;
      end
      else if (!async_excp && !irq_2_arb && (sync_excp || de_int_ebreak || de_int_ecall)) begin
          int_csr_epc = alu_int_pc;
      end
      else begin
          int_csr_epc = 32'b0;
      end
  end

//ebreak pc and cause

  assign int_csr_dcause   = 3'b1        ;  //ebreak cause
  assign int_csr_dpc      = csr_int_epc ;  //ebreak pc
  assign int_jtag_ebreak  = !async_excp && !irq_2_arb && de_int_ebreak;
  assign int_csr_dena     = !async_excp && !irq_2_arb && de_int_ebreak;

//cmplt process
  assign int_csr_mret     = de_int_mret ;
  assign int_ctrl_epc     = csr_int_epc ;

  assign int_ctrl_mret    = de_int_mret ; //int_ctrl_mtvec  enable;

endmodule
  
