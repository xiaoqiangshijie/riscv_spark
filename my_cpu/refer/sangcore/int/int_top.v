//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
//File          : int_top.v
//Author        : fengyi
//Date          : 8/2/2021
//Version       : 0.1
//Description   : this file is int_top module.
//-----------------------------------------------------------------------------------
//Modiication history:
//Date           By            Version           Change Description
//07/27/2021     fengyi        0.1               
//                                               
//-----------------------------------------------------------------------------------

module int_top #(
  parameter EXT_IRQ_NUM = 31,             //number of external interrupts
  parameter PRIO_WIDTH  = 3               //bit width of priorit 
)(
  input                  clk            ,
  input                  rstn           ,

//external interrupt require
  input  [EXT_IRQ_NUM:0] ext_plic_irq   ,

//with biu
  input  [31:0]          biu_int_haddr     ,
  input  [31:0]          biu_int_hwdata    ,
  input                  biu_int_hwrite    ,
  input  [1: 0]          biu_int_htrans    ,
  input  [2: 0]          biu_int_hsize     ,
  input  [2: 0]          biu_int_hburst    ,
  input                  biu_int_hsel      ,
  input                  biu_int_hready    ,
  output [31:0]          int_biu_hrdata    ,
  output                 int_biu_hresp     ,
  output                 int_biu_hreadyout ,
 
//with jtag
  input                  jtag_irq       ,
  output                 int_jtag_ebreak,

//with csr
  input                  counterstop    , // stop counting enable signal
  output                 int_csr_ext    ,
  output                 int_csr_tmr    ,
  output                 int_csr_sft    ,
  input                  csr_int_meip   , // external irq mask
  input                  csr_int_msip   , // software irq mask
  input                  csr_int_mtip   , // timer    irq mask
  input                  csr_int_mie    , // global interrupt 1: irq acceptable  in mstatus register
  input  [31:0]          csr_int_epc    , // pc back when interrupt complete
  input  [31:0]          csr_int_mtvec  , // interrupt service program pc
  output [31:0]          int_csr_epc    , // breakpoint when interrrupt claim
  output [31:0]          int_csr_ecause , // interrupt cause when interrupt claim
  output                 int_csr_ena    , // modify enable signal of mstatus reg when claim
  output [31:0]          int_csr_dpc    , // ebreak pc
  output                 int_csr_dena   , // enable signal to modify dcsr and dcause regs
  output [2:0]           int_csr_dcause , // ebreak cause
  output                 int_csr_mret   , // mret instruction from ctrl
                                          // enable signal of breakpoint recovery
  output [31:0]          int_csr_mtval  ,
//with ctrl
  input                  ctrl_int_ready     ,
  input                  ctrl_int_valid     , // instruction last has been completely finished
  input                  ctrl_int_ebreak    , // instruction now is ebreak
  input                  ctrl_int_ecall     , // instruction now is ecall
  input                  ctrl_int_mret      , // instruction now is mter
  input  [31:0]          ctrl_int_epc       , // breakpoint pc  claim process
  input                  ctrl_int_illegal   , //
  output                 int_ctrl_flush_req , // flush require
  output [31:0]          int_ctrl_mtvec     , // interrupt service program pc
  output                 int_ctrl_pcen      , // enable signal to change pc
  output [31:0]          int_ctrl_epc       , // breakpoint pc  complete process


//with timer
  input                  trigger            , //always on clk sync bose edge signals

//with alu
  input                  alu_int_l_misa     ,
  input                  alu_int_s_misa     ,
  input  [31:0]          alu_int_ls_addr 
);

  wire   [EXT_IRQ_NUM:0]  plic_reg_gate          ;
  wire   [7:0]            final_id               ;
  wire   [EXT_IRQ_NUM:0]  ip_r                   ;
  wire   [EXT_IRQ_NUM:0]  ie_r                   ;
  wire   [PRIO_WIDTH * (EXT_IRQ_NUM+1)-1:0] prio_r_1d;
  wire   [PRIO_WIDTH-1:0] threshold_r            ;
  wire   [7:0]            claim_id               ;
  wire   [7:0]            cmplt_id               ;
  wire                    ext_irq                ;

  wire   [31:0]           count0                 ;
  wire   [31:0]           count1                 ;
  wire   [31:0]           countcmp0              ;
  wire   [31:0]           countcmp1              ;
  wire   [31:0]           msip                   ;
  wire                    trigger_edge           ;
  wire                    tmr_irq                ;
  wire                    sft_irq                ;

  wire   [31:0]           reg_if_rdata           ;
  wire                    if_reg_wr              ;
  wire                    if_reg_en              ;
  wire   [31:0]           if_reg_wdata           ;
  wire   [31:0]           if_reg_addr            ;

  plic #(
    .EXT_IRQ_NUM(EXT_IRQ_NUM),
    .PRIO_WIDTH(PRIO_WIDTH)
  )plic(
    .clk (clk ),
    .rstn(rstn),
    .ext_plic_irq ( ext_plic_irq ),
    .plic_reg_gate( plic_reg_gate),
    .final_id     ( final_id     ),
    .ip_r         ( ip_r         ),
    .ie_r         ( ie_r         ),
    .prio_r_1d    ( prio_r_1d    ),
    .threshold_r  ( threshold_r  ),
    .claim_id     ( claim_id     ),
    .cmplt_id     ( cmplt_id     ),
    .ext_irq      ( ext_irq      )
  );

  clint clint(
    .clk (clk ),
    .rstn(rstn),
    .count0      ( count0      ),
    .count1      ( count1      ),
    .countcmp0   ( countcmp0   ),
    .countcmp1   ( countcmp1   ),
    .msip        ( msip        ),
    .trigger_edge( trigger_edge),
    .trigger     ( trigger     ),
    .tmr_irq     ( tmr_irq     ),
    .sft_irq     ( sft_irq     )
  );

  ahbl_slave_if ahbl_slave_if(
    .clk (clk ),
    .rstn(rstn),
    .biu_int_haddr ( biu_int_haddr ),
    .biu_int_hwdata( biu_int_hwdata),
    .biu_int_hwrite( biu_int_hwrite),
    .biu_int_htrans( biu_int_htrans),
    .biu_int_hsize ( biu_int_hsize ),
    .biu_int_hburst( biu_int_hburst),
    .biu_int_hsel  ( biu_int_hsel  ),
    .biu_int_hready( biu_int_hready),
    .int_biu_hrdata( int_biu_hrdata),
    .int_biu_hresp ( int_biu_hresp ),
    .int_biu_hreadyout( int_biu_hreadyout),             
    .reg_if_rdata  ( reg_if_rdata  ),
    .if_reg_wr     ( if_reg_wr     ),
    .if_reg_en     ( if_reg_en     ),
    .if_reg_wdata  ( if_reg_wdata  ),
    .if_reg_addr   ( if_reg_addr   )
  );

 regfile #(
    .EXT_IRQ_NUM(EXT_IRQ_NUM),
    .PRIO_WIDTH(PRIO_WIDTH)
  )regfile(
    .clk (clk ),
    .rstn(rstn),
    .counterstop  ( counterstop   ),
    .if_reg_wr    ( if_reg_wr     ),   
    .if_reg_en    ( if_reg_en     ),
    .if_reg_wdata ( if_reg_wdata  ),
    .if_reg_addr  ( if_reg_addr   ),
    .reg_if_rdata ( reg_if_rdata  ),
    .plic_reg_gate( plic_reg_gate ),
    .final_id     ( final_id      ),
    .ip_r         ( ip_r          ),
    .ie_r         ( ie_r          ),
    .prio_r_1d    ( prio_r_1d     ),
    .threshold_r  ( threshold_r   ),
    .claim_id     ( claim_id      ),
    .cmplt_id     ( cmplt_id      ),      
    .trigger_edge ( trigger_edge  ),
    .count0       ( count0        ),
    .count1       ( count1        ),
    .countcmp0    ( countcmp0     ),
    .countcmp1    ( countcmp1     ),
    .msip         ( msip          )
  );

  int_ctrl int_ctrl(
    .clk (clk ),
    .rstn(rstn),
    .ext_irq        ( ext_irq         ),
    .sft_irq        ( sft_irq         ),
    .tmr_irq        ( tmr_irq         ),
    .int_csr_ext    ( int_csr_ext     ),
    .int_csr_tmr    ( int_csr_tmr     ),
    .int_csr_sft    ( int_csr_sft     ),
    .csr_int_meip   ( csr_int_meip    ),
    .csr_int_msip   ( csr_int_msip    ),
    .csr_int_mtip   ( csr_int_mtip    ),
    .csr_int_mie    ( csr_int_mie     ),
    .csr_int_epc    ( csr_int_epc     ),
    .csr_int_mtvec  ( csr_int_mtvec   ),
    .int_csr_epc    ( int_csr_epc     ),
    .int_csr_ecause ( int_csr_ecause  ),
    .int_csr_ena    ( int_csr_ena     ),
    .int_csr_dpc    ( int_csr_dpc     ),
    .int_csr_dena   ( int_csr_dena    ),
    .int_csr_dcause ( int_csr_dcause  ),
    .int_csr_mret   ( int_csr_mret    ),    
    .int_csr_mtval  ( int_csr_mtval   ),    
    .int_jtag_ebreak( int_jtag_ebreak ),
    .jtag_irq       ( jtag_irq        ), 
    .ctrl_int_ready ( ctrl_int_ready  ),
    .ctrl_int_valid ( ctrl_int_valid  ),
    .ctrl_int_ebreak( ctrl_int_ebreak ),
    .ctrl_int_ecall ( ctrl_int_ecall  ),
    .ctrl_int_mret  ( ctrl_int_mret   ),
    .ctrl_int_epc   ( ctrl_int_epc    ),
    .ctrl_int_illegal(ctrl_int_illegal),
    .int_ctrl_flush_req( int_ctrl_flush_req ),
    .int_ctrl_mtvec ( int_ctrl_mtvec  ),
    .int_ctrl_pcen  ( int_ctrl_pcen   ),
    .int_ctrl_epc   ( int_ctrl_epc    ),
    .alu_int_l_misa ( alu_int_l_misa  ),
    .alu_int_s_misa ( alu_int_s_misa  ),
    .alu_int_ls_addr( alu_int_ls_addr )
); 

endmodule
