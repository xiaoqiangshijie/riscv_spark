//-----------------------------------------------------------------------------
//This confidential and proprietary software may be used only used as
//by a licensing aggrement from Orbbec Inc.
//In the event of publication ,the following notice is applicable:
//(C)COPYRIGHT 2013 ORBBEC INC.ALL RIGHTS RESERVED.
//The entire notice ablove must be reproduced on all authorized copies
//-----------------------------------------------------------------------------
//File          :csr.v
//Author        :lihua
//Date          :08/25/2021
//Version       :0.1
//Description   :This file is a gpr module for risc-v 
//-----------------------------------------------------------------------------
//Modification History:
//Date          By          Version         Change Description 
//08/25/2021    lihua        0.1             Original
//-----------------------------------------------------------------------------
module csr #(
    parameter  CSR_DW      = 64                        ,
    parameter  CSR_ADW     = 12  
)(
    input                          clk                 ,       //system clock 
    input                          rstn                ,       //system rstn

//WITH ROB
    input                          rob_csr_pc_vld      ,

//WITH GPR
    input                          x8                  ,

//WITH JTAG
    input                          jtag_csr_ena        , //the enable signal that                            j tag operation to csr
    input                          jtag_csr_we         , //write enable, 1 is write , 0 is read operation
    input      [CSR_ADW-1:0]       jtag_csr_idx        , //index of csr
    input      [    32 -1:0]       jtag_csr_wdata      , //write data from                                   j tag to csr
    input                          jtag_csr_reset_req  , //reset dcsr[8:6],cause when reset active,[8:6]=000
    input                          jtag_csr_halt_req   , //halt dcr[8:6]
    output     [CSR_DW -1:0]       csr_jtag_rdata      , //read data from cs
       
//WITH DE
    input      [CSR_ADW-1:0]       de_csr_rd_idx       ,
    input                          de_csr_rd_vld       ,

//WITH ALU
    output reg                     csr_alu_data_vld    ,
    output reg [CSR_DW-1:0]        csr_alu_data        ,

//WITH INT    
    input                          int_csr_ext         ,
    input                          int_csr_tmr         ,
    input                          int_csr_sft         ,
    output                         csr_int_mie         ,
    output                         csr_int_meip        ,
    output                         csr_int_mtip        ,
    output                         csr_int_msip        ,
    output     [    32-1:0]        csr_int_mtvec       ,
    output     [    32-1:0]        csr_int_epc         ,
    input      [    32-1:0]        int_csr_ecause      ,
    input      [    32-1:0]        int_csr_epc         ,
    input                          int_csr_ena         ,
    input                          int_csr_mret        ,
    input      [       2:0]        int_csr_dcause      ,
    input      [    32-1:0]        int_csr_dpc         ,
    input                          int_csr_dena        ,
    input      [    32-1:0]        int_csr_mtval       ,

//WITH WB    
    input                          wb_csr_ena          ,
    input      [CSR_DW-1:0]        wb_csr_wdata        ,

//WITH OITF    
    input      [CSR_ADW-1:0]       oitf_csr_index      ,
//WITH checker 
    output     [CSR_DW-1:0]        csr_mstatus         ,
    output     [CSR_DW-1:0]        csr_mie             ,
    output     [CSR_DW-1:0]        csr_mip             ,
    output     [CSR_DW-1:0]        csr_mtvec           ,
    output     [CSR_DW-1:0]        csr_mscratch        ,
    output     [CSR_DW-1:0]        csr_mcycle          ,
    output     [CSR_DW-1:0]        csr_minstret        ,
    output     [CSR_DW-1:0]        csr_mepc            ,
    output     [CSR_DW-1:0]        csr_mcause          ,
    output     [CSR_DW-1:0]        csr_mtval           ,
    output     [CSR_DW-1:0]        csr_misa            ,
    output     [CSR_DW-1:0]        csr_mvendorid       ,
    output     [CSR_DW-1:0]        csr_marchid         ,
    output     [CSR_DW-1:0]        csr_mimpid          ,
    output     [CSR_DW-1:0]        csr_mhartid         ,
    output     [CSR_DW-1:0]        csr_dcsr            ,
    output     [CSR_DW-1:0]        csr_dpc             ,
    output     [CSR_DW-1:0]        csr_dscratch        
);

localparam  ADR_MSTATUS      = 12'h300 ;//RW  //ONLY SUPPORT bit[3](MIE) and bit[7](MPIE)
localparam  ADR_MISA         = 12'h301 ;//RO  //
localparam  ADR_MIE          = 12'h304 ;//RW
localparam  ADR_MTVEC        = 12'h305 ;//RW
localparam  ADR_MSCRATCH     = 12'h340 ;//RW
localparam  ADR_MEPC         = 12'h341 ;//RW
localparam  ADR_MCAUSE       = 12'h342 ;//RW
localparam  ADR_MTVAL        = 12'h343 ;//RW
localparam  ADR_MIP          = 12'h344 ;//RW
localparam  ADR_MCYCLE       = 12'hB00 ;//RW
localparam  ADR_MINSTRE      = 12'hB02 ;//RW
localparam  ADR_MVENDORID    = 12'hF11 ;//RW
localparam  ADR_MARCHID      = 12'hF12 ;//RO
localparam  ADR_MIMPID       = 12'hF13 ;//RO
localparam  ADR_MHARTID      = 12'hF14 ;//RO
localparam  ADR_DCSR         = 12'h7B0 ;//RW
localparam  ADR_DPC          = 12'h7B1 ;//RW
localparam  ADR_DSCRATCH     = 12'h7B2 ;//RW


///////////////////////////////////////////////////////////////////////////////
////////////////     Write      ///////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


//======================Index = 0x300,mstatus csr==============================
//mstatus csr
wire  [CSR_DW-1:0]  mstatus           ;              
wire  [1:0]         xs                ;
wire  [1:0]         fs                ;
wire  [1:0]         mpp               ; //mpp represents privilege mode 
wire                sd                ;
reg                 mie_r             ; 
reg                 mpie_r            ;

//XS field
assign xs = 2'b00                         ;

//FS field
assign fs = 2'b00                         ;

//SD field
//assign sd = (fs == 2'b11) | (xs == 2'b11) ;
assign sd = 1'b0 ;

//MPP field       
assign mpp = 2'b11 ;

always@(posedge clk or negedge rstn)begin:ASSIGN_MIE
  if(rstn == 1'b0)
    mie_r <= 1'b0; 
  else if(int_csr_mret == 1'b1)
    mie_r <= mpie_r;
  else if(int_csr_ena == 1'b1)
    mie_r <= 1'b0;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_MSTATUS)
    mie_r <= wb_csr_wdata[3];
end 

//MPIE field
always@(posedge clk or negedge rstn)begin:ASSIGN_MPIE
  if(rstn == 1'b0)
    mpie_r <= 1'b0;
  else if(int_csr_ena == 1'b1)
    mpie_r <= mie_r;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index==ADR_MSTATUS)
    mpie_r <= wb_csr_wdata[3];
  else if(int_csr_mret)
    mpie_r <= 1'b1 ;
end

//mstatus csr
assign mstatus = {sd,46'b0,xs,fs,mpp,3'b0,mpie_r,3'b0,mie_r,3'b0};


//=====================Index = 0x301,misa======================================
//define misa read-only register 
wire [CSR_DW-1:0] misa;

assign  misa = {2'b10,49'b0,1'b1,3'b0,1'b1,8'b0};  //64IM





//=====================Index = 0x304,mie csr===================================
//MEIE field
reg                     meie_r        ;

always@(posedge clk or negedge rstn)begin:ASSIGN_MEIE
  if(rstn == 1'b0)
    meie_r   <= 1'b0                  ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_MIE)
    meie_r   <= wb_csr_wdata[11]      ;
end

//MTIE field--
reg                     mtie_r        ;

always@(posedge clk or negedge rstn)begin:ASSIGN_MTIE
  if(rstn == 1'b0)
    mtie_r   <= 1'b0                  ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_MIE)
    mtie_r   <= wb_csr_wdata[7]       ;
end

//MSIE field---
reg                     msie_r        ;
always@(posedge clk or negedge rstn)begin:ASSIGN_MSIE
  if(rstn == 1'b0)
    msie_r   <= 1'b0                  ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_MIE)
    msie_r   <= wb_csr_wdata[3]       ;
end//mie csr 


wire[CSR_DW-1:0]    mie           ;
assign mie = {52'b0,meie_r,3'b0,mtie_r,3'b0,msie_r,3'b0};






//=====================Index = 0x305,mtvec===================================== 
reg  [CSR_DW-1:0]   mtvec           ;

always@(posedge clk or negedge rstn)begin:ASSIGN_MTVEC_CSR
  if(rstn == 1'b0)
    mtvec <= 64'h100                ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_MTVEC)
    mtvec <= wb_csr_wdata           ;
end 







//=====================Index = 0x340,mscratch==================================
reg  [CSR_DW-1:0]   mscratch        ;

always@(posedge clk or negedge rstn)begin:ASSIGN_MSCRATCH_CSR
  if(rstn == 1'b0)
    mscratch <= 64'b0               ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_MSCRATCH)
    mscratch <= wb_csr_wdata        ;
end 









//=====================Index = 0x341,mepc csr==================================
reg  [CSR_DW-1:0]  mepc       ;
always@(posedge clk or negedge rstn)begin:ASSIGN_MEPC
  if(rstn == 1'b0)
    mepc <= 64'b0                              ;
  else if(int_csr_ena == 1'b1)
    mepc <= {32'b0,int_csr_epc[31:2],2'b0}     ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_MEPC)
    mepc <= {wb_csr_wdata[63:2],2'b0}    ;
end







//=====================Index = 0x342,mcause csr================================
reg [CSR_DW-1:0]        mcause;
always@(posedge clk or negedge rstn)begin:ASSIGN_MCAUSE
  if(rstn == 1'b0)
    mcause <= 64'b0                 ;
  else if(int_csr_ena == 1'b1)
    mcause <= {32'b0,int_csr_ecause};
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_MCAUSE)
    mcause <= wb_csr_wdata          ;
end







//=====================Index = 0x343,mtval======================================
reg  [CSR_DW-1:0] mtval         ;  
always@(posedge clk or negedge rstn)begin:ASSIGN_MTVAL
  if(rstn == 1'b0)
    mtval <= 64'b0                ;
  else if(int_csr_ena == 1'b1)
    mtval <= {32'b0,int_csr_mtval};
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_MTVAL)
    mtval <= wb_csr_wdata         ;
end 







//=====================Index = 0x344,mip=======================================
//external interrupt
reg                     external_int_r  ;
always@(posedge clk or negedge rstn)begin:ASSIGN_EXT_INT
  if(rstn == 1'b0)
    external_int_r   <= 1'b0            ;
  else 
    external_int_r   <= int_csr_ext     ;
end
//timer interrupt
reg                     timer_int_r     ;
always@(posedge clk or negedge rstn)begin:ASSIGN_TIMER_INT
  if(rstn == 1'b0)
    timer_int_r   <= 1'b0               ;
  else 
    timer_int_r   <= int_csr_tmr        ;
end
//software interrupt
reg                     soft_int_r      ;
always@(posedge clk or negedge rstn)begin:ASSIGN_SOFT_INT
  if(rstn == 1'b0)
    soft_int_r   <= 1'b0                ;
  else 
    soft_int_r   <= int_csr_sft         ;
end
//mip csr
wire  [CSR_DW-1:0]  mip             ;
assign mip = {52'b0,external_int_r,3'b0,timer_int_r,3'b0,soft_int_r,3'b0};








//=====================Index = 0xB00,mcycle====================================
reg  [CSR_DW-1:0]       mcycle                        ;

always@(posedge clk or negedge rstn)begin:ASSIGN_MCYCLE_CSR
  if(rstn == 1'b0)
    mcycle <= 64'b0 ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_MCYCLE)
    mcycle <= wb_csr_wdata ;
  else  
    mcycle <= mcycle + 1'b1 ;
end














//=====================Index = 0xb02,minstret===================================
reg  [CSR_DW-1:0] minstret   ;
always@(posedge clk or negedge rstn)begin:ASSIGN_MINSTRET_CSR
  if(rstn == 1'b0)
    minstret <= 64'b0            ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_MINSTRE)
    minstret <= wb_csr_wdata;
  else if(rob_csr_pc_vld)
    minstret <= minstret + 1'b1    ;
end









//=====================Index= 0xf11,mvendorid==================================
//define mvendorid read-only register 
wire [CSR_DW-1:0] mvendorid     ;
assign  mvendorid = 64'b0           ;






//=====================Index = 0xf12,marchid===================================
//define marchid read-only register 
wire [CSR_DW-1:0]       marchid ;
assign  marchid = 64'h0000_0000     ;    








//=====================Index = 0xf13,mimpid====================================
//define mimpid read-only register 
wire [CSR_DW-1:0]       mimpid  ;
assign  mimpid = 64'h0000_0000;      







//=====================Index = 0xf14,mhartid===================================
//define mhartid read-only register 
wire [CSR_DW-1:0]       mhartid ;
assign  mhartid = 64'h0000_0000     ;








//=====================Index = 0x7b0,dcsr======================================
//define dcsr
wire  [31:0]                dcsr       ;
wire  [ 1:0]                xdebugver  ;
reg                         ndreset    ;
reg                         fullreset  ;
reg   [ 3:0]                ebreak     ;
reg                         stopcycle  ;
reg                         stoptime   ;
wire  [ 2:0]                cause      ; //dcsr[8:6]
wire                        debugint   ;
reg                         halt       ;
reg                         step       ;
reg   [ 1:0]                prv        ;


//xdebugver
assign xdebugver = 2'd1 ;

//ndreset
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    ndreset <= 1'b0 ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_DCSR)
    ndreset <= wb_csr_wdata[29]  ;
end

//fullreset
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    fullreset <= 1'b0 ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_DCSR)
    fullreset <= wb_csr_wdata[28]  ;
end

//ebreak
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    ebreak  <= 4'b0 ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_DCSR)
    ebreak <= wb_csr_wdata[15:12]  ;
end

//stopcycle
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    stopcycle  <= 1'b1 ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_DCSR)
    stopcycle  <= wb_csr_wdata[10]  ;
end


//stoptime
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    stoptime  <= 1'b0 ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_DCSR)
    stoptime  <= wb_csr_wdata[10]  ;
end


//cause,tbd
assign cause = int_csr_dcause ;

//debugint
assign debugint = jtag_csr_we ;

//halt
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    halt <= 1'b0 ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_DCSR)
    halt <= wb_csr_wdata[3]  ;
end

//step
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    step  <= 1'b0 ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_DCSR)
    step <=  wb_csr_wdata[2]  ;
end

//prv
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    prv  <= 1'b0 ;
  else if(wb_csr_ena == 1'b1 && oitf_csr_index == ADR_DCSR)
    prv <=  wb_csr_wdata[1:0]  ;
end


assign  dcsr = {xdebugver,ndreset,fullreset,12'b0,ebreak,1'b0,stopcycle,stoptime,cause,debugint,1'b0,halt,step,prv};              //dcsr


//=====================Index = 0x7b1,debug pc==================================
//define debug pc
reg  [31:0]        dpc  ;
always@(posedge clk or negedge rstn)begin:ASSIGN_DPC
  if(rstn == 1'b0)
    dpc <= 31'b0                  ;
  else if(jtag_csr_we == 1'b1 && jtag_csr_ena == 1'b1 && jtag_csr_idx == ADR_DPC )
    dpc <= jtag_csr_wdata   ;
  else if(int_csr_dena == 1'b1)
    dpc <= int_csr_dpc  ; 
end










//=====================Index = 0x7b2,debug scratch=============================
//define debug pc
reg  [CSR_DW-1:0]   dscratch  ;
always@(posedge clk or negedge rstn)begin:ASSIGN_DSR
  if(rstn == 1'b0)
    dscratch <= 64'b0  ;     
  else if(jtag_csr_we == 1'b1 && jtag_csr_ena == 1'b1 && jtag_csr_idx == ADR_DSCRATCH)
    dscratch <= x8     ;
end 








///////////////////////////////////////////////////////////////////////////////
////////////////     READ  ///////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//connect data with interrupt module 
assign  csr_int_mie         = mie_r          ;//mstatus csr
assign  csr_int_meip        = meie_r         ;//mie csr -->meie field
assign  csr_int_mtip        = mtie_r         ;//mie csr -->mtie field
assign  csr_int_msip        = msie_r         ;//mie csr -->msie field
assign  csr_int_mtvec       = mtvec[31:0]    ;//mtvec csr
assign  csr_int_epc         = mepc[31:0]     ;//mepc csr

reg  [CSR_ADW-1:0] read_idx ;
reg  [CSR_DW-1:0]  csr_rdata;

always@(*)begin:ASSIGN_READ_IDX
  if(jtag_csr_ena == 1'b1)
    read_idx = jtag_csr_idx;
  else 
    read_idx = de_csr_rd_idx;
end

always@(*)begin:ASSIGN_READ_DATA
  case(read_idx)
    ADR_MSTATUS      : csr_rdata = mstatus          ;
    ADR_MIE          : csr_rdata = mie              ;
    ADR_MIP          : csr_rdata = mip              ;
    ADR_MTVEC        : csr_rdata = mtvec            ;
    ADR_MSCRATCH     : csr_rdata = mscratch         ;
    ADR_MCYCLE       : csr_rdata = mcycle           ;
    ADR_MINSTRE      : csr_rdata = minstret         ;
    ADR_MEPC         : csr_rdata = mepc             ;
    ADR_MCAUSE       : csr_rdata = mcause           ;
    ADR_MTVAL        : csr_rdata = mtval            ;
    ADR_MISA         : csr_rdata = misa             ;
    ADR_MVENDORID    : csr_rdata = mvendorid        ;
    ADR_MARCHID      : csr_rdata = marchid          ;
    ADR_MIMPID       : csr_rdata = mimpid           ;
    ADR_MHARTID      : csr_rdata = mhartid          ;
    ADR_DCSR         : csr_rdata = {32'b0,dcsr}     ;
    ADR_DPC          : csr_rdata = {32'b0,dpc}      ;
    ADR_DSCRATCH     : csr_rdata = dscratch         ;
    default          : csr_rdata = 64'h0000_0000    ;
  endcase
end 
//=====================output rdata============================================
always@(posedge clk )begin
    if( de_csr_rd_vld == 1'b1)
        csr_alu_data <= csr_rdata;
end 

always@(posedge clk or negedge rstn)begin
    if(rstn == 1'b0)begin
        csr_alu_data_vld <= 1'b0;
    end
    else begin
        csr_alu_data_vld <= de_csr_rd_vld;
    end
end

assign  csr_jtag_rdata = csr_rdata  ; //TBD     

////////////////////////////////////////////////////////////////////////////////

assign  csr_mstatus          = mstatus          ;
assign  csr_mie              = mie              ;
assign  csr_mip              = mip              ;
assign  csr_mtvec            = mtvec            ;
assign  csr_mscratch         = mscratch         ;
assign  csr_mcycle           = mcycle           ;
assign  csr_minstret         = minstret         ;
assign  csr_mepc             = mepc             ;
assign  csr_mcause           = mcause           ;
assign  csr_mtval            = mtval            ;
assign  csr_misa             = misa             ;
assign  csr_mvendorid        = mvendorid        ;
assign  csr_marchid          = marchid          ;
assign  csr_mimpid           = mimpid           ;
assign  csr_mhartid          = mhartid          ;
assign  csr_dcsr             = {32'b0,dcsr}     ;
assign  csr_dpc              = {32'b0,dpc}      ;
assign  csr_dscratch         = dscratch         ;

endmodule
