//-----------------------------------------------------------------------------
//This confidential and proprietary software may be used only used as
//by a licensing aggrement from Orbbec Inc.
//In the event of publication ,the following notice is applicable:
//(C)COPYRIGHT 2013 ORBBEC INC.ALL RIGHTS RESERVED.
//The entire notice ablove must be reproduced on all authorized copies
//-----------------------------------------------------------------------------
//File          :csr.v
//Author        :modi
//Date          :08/04/2021
//Version       :0.1
//Description   :This file is a general register for csr module 
//-----------------------------------------------------------------------------
//Modification History:
//Date          By          Version         Change Description 
//07/24/2021    modi        0.1             Original
//-----------------------------------------------------------------------------
module csr
#(  parameter INDEX_WIDTH = 12,
    parameter DATA_WIDTH  = 32      
)(
  input                   clk                 , //system clk
  input                   rst_n               , //reset signal
//=====================WITH INSTRUCTION========================================
  input                   de_csr_wr_ena       , //write enable of instruction
  input                   de_csr_wr_1         , //reset 1 to some bits
  input                   de_csr_wr_0         , //reset 0 to some bits
  input [INDEX_WIDTH-1:0] de_csr_idx          , //csr index from decode module
  input                   de_csr_imm_en       ,
  input [DATA_WIDTH -1:0] de_csr_zimm         , 
  input [DATA_WIDTH -1:0] gpr_csr_wdata       , //write data to csr 
  output[DATA_WIDTH -1:0] csr_gpr_rdata       , //read data from csr 
//=====================WITH JTAG===============================================
  input                   jtag_csr_ena        , //the enable signal that jtag operation to csr
  input                   jtag_csr_we         , //write enable, 1 is write , 0 is read operation
  input [INDEX_WIDTH-1:0] jtag_csr_idx        , //index of csr
  input [DATA_WIDTH -1:0] jtag_csr_wdata      , //write data from jtag to csr
  input                   jtag_csr_reset_req  , //reset dcsr[8:6],cause when reset active,[8:6]=000
  input                   jtag_csr_halt_req   , //halt dcr[8:6]
  output[DATA_WIDTH -1:0] csr_jtag_rdata      , //read data from csr
//=====================WITH INTERRUPT==========================================
  input [DATA_WIDTH-1 :0] int_csr_ecause      , //update data of mcause csr
  input [DATA_WIDTH-1 :0] int_csr_epc         , //update data of mepc csr
  input                   int_csr_ena         , //updata data enable signal, start interrupt
  input                   int_csr_mret        , //end od interrupt
  input [2 :0]            int_csr_dcause      , //update data of dcsr csr
  input [DATA_WIDTH-1 :0] int_csr_dpc         , //updata data of dpc
  input                   int_csr_dena        , //update data enable signal of debug csr
  input                   int_csr_ext         , //uart,gopio intrrupt
  input                   int_csr_tmr         , //timer interrupt
  input                   int_csr_sft         , //software interrupt  
  output                  csr_int_mie         , //value of mie in mstatus csr
  output                  csr_int_meie        , //value of meie in mie csr
  output                  csr_int_mtie        , //value of mtie in mie csr
  output                  csr_int_msie        , //value of msie in mie csr
  output[DATA_WIDTH-1 :0] csr_int_mtvec       , //value of mtvec csr
  output[DATA_WIDTH-1 :0] csr_int_epc         , //value of mepc csr
  output                  csr_int_counterstop , //value of counterstop csr
  input [DATA_WIDTH-1 :0] int_csr_mtval       
);
//=====================Generate write enable by three module===================
  reg  write_csr_enable                       ;
  always@(*)begin:WRITE_ENABLE
    if(jtag_csr_ena == 1'b1 && jtag_csr_we == 1'b1)
      write_csr_enable = 1'b1                 ;
    else if(int_csr_ena == 1'b1 || int_csr_dena == 1'b1)
      write_csr_enable = 1'b1                 ;
    else if(de_csr_wr_ena == 1'b1)
      write_csr_enable = 1'b1                 ;
    else 
      write_csr_enable = 1'b0                 ;
  end//tbd  
//=====================Generate instruction write data=========================
  //reset 1 or reset 0 to instruction 
  reg   [DATA_WIDTH-1 :0] instruction_wdata ;
  //instruction and jtag read csr
  reg   [DATA_WIDTH -1:0]     csr_rdata     ;
  reg   [INDEX_WIDTH-1:0]     read_idx      ;
  wire  [DATA_WIDTH -1:0]     csr_wdata     ;
  assign  csr_wdata = (de_csr_imm_en == 1'b1) ? de_csr_zimm : gpr_csr_wdata;
  always@(*)begin:GENERATE_INSTRUCTION_WDATA
    if(de_csr_wr_ena == 1'b1 && jtag_csr_ena == 1'b0)begin 
      if(de_csr_wr_1 == 1'b1)
        instruction_wdata  = csr_wdata | csr_rdata;
      else if(de_csr_wr_0 == 1'b1)
        instruction_wdata  =~csr_wdata & csr_rdata;
      else 
        instruction_wdata  = csr_wdata            ;
    end 
    else 
        instruction_wdata  = csr_wdata            ;
  end      
//======================Index = 0x300,mstatus csr==============================
  //mstatus csr
  wire  [DATA_WIDTH-1:0]  mstatus           ;              
  //XS field
  wire  [1:0]             xs                ;
  assign xs = 2'b00                         ;
  //FS field
  wire  [1:0]             fs                ;
  assign fs = 2'b00                         ;
  //MPP field
  reg  [1:0]             mpp               ; //mpp represents privilege mode 
   //SD field
  wire                    sd                ;
  assign sd = (fs == 2'b11) | (xs == 2'b11) ;
  //MIE field       
  reg                     mie_r             ; 
  reg                     mpie_r            ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MPP
    if(rst_n == 2'b0)
      mpp <= 2'b11                         ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_idx == 12'h300)
      mpp <= jtag_csr_wdata[12:11]         ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'h300)
      mpp <= instruction_wdata[12:11]      ;
   end
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MIE
    if(rst_n == 1'b0)
      mie_r <= 1'b0                         ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_idx == 12'h300)
      mie_r <= jtag_csr_wdata[3]            ;
    else if(int_csr_mret == 1'b1)
      mie_r <= mpie_r                       ;
    else if(int_csr_ena == 1'b1)
      mie_r <= 1'b0                         ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'h300)
      mie_r <= instruction_wdata[3]         ;
   end 
  //MPIE field
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MPIE
    if(rst_n == 1'b0)
      mpie_r <= 1'b1                  ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_ena == 1'b1 && jtag_csr_idx == 12'h300)
      mpie_r <= jtag_csr_wdata[3]     ;
    else if(int_csr_ena == 1'b1)
      mpie_r <= mie_r                 ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'h300)
      mpie_r <= instruction_wdata[3]  ;
    else if(int_csr_mret == 1'b1)
      mpie_r <= 1'b1                  ;
  end 
  //mstatus csr
  assign mstatus = {sd,14'b0,xs,fs,mpp,3'b0,mpie_r,3'b0,mie_r,3'b0};
//=====================Index = 0x304,mie csr===================================
  //MEIE field
  reg                     meie_r        ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MEIE
    if(rst_n == 1'b0)
      meie_r   <= 1'b0                  ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_idx == 12'h304)
      meie_r   <= jtag_csr_wdata[11]    ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'h304)
      meie_r   <= instruction_wdata[11] ;
  end
  //MTIE field-----------------------------------------------------------------
  reg                     mtie_r        ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MTIE
    if(rst_n == 1'b0)
      mtie_r   <= 1'b0                  ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_idx == 12'h304)
      mtie_r   <= jtag_csr_wdata[7]     ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'h304)
      mtie_r   <= instruction_wdata[7]  ;
  end
  //MSIE field-----------------------------------------------------------------
  reg                     msie_r        ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MSIE
    if(rst_n == 1'b0)
      msie_r   <= 1'b0                  ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_idx == 12'h304)
      msie_r   <= jtag_csr_wdata[3]     ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'h304)
      msie_r   <= instruction_wdata[3]  ;
  end
   //mie csr 
  wire[DATA_WIDTH-1:0]    mie           ;
  assign mie = {20'b0,meie_r,3'b0,mtie_r,3'b0,msie_r,3'b0};
//=====================Index = 0x344,mip=======================================
  //external interrupt
  reg                     external_int_r  ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_EXT_INT
    if(rst_n == 1'b0)
      external_int_r   <= 1'b0            ;
    else 
      external_int_r   <= int_csr_ext     ;
  end
  //timer interrupt
  reg                     timer_int_r     ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_TIMER_INT
    if(rst_n == 1'b0)
      timer_int_r   <= 1'b0               ;
    else 
      timer_int_r   <= int_csr_tmr        ;
  end
  //software interrupt
  reg                     soft_int_r      ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_SOFT_INT
    if(rst_n == 1'b0)
      soft_int_r   <= 1'b0                ;
    else 
      soft_int_r   <= int_csr_sft         ;
  end
  //mip csr
  wire  [DATA_WIDTH-1:0]  mip             ;//tbd
  assign mip = {20'b0,external_int_r,3'b0,timer_int_r,3'b0,soft_int_r,3'b0};
//=====================Index = 0x305,mtvec=====================================  
  reg  [DATA_WIDTH-1:0]   mtvec           ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MTVEC_CSR
    if(rst_n == 1'b0)
      mtvec <= 32'h0000_0000              ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_ena && jtag_csr_idx == 12'h305)
      mtvec <= jtag_csr_wdata             ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'h305)
      mtvec <= instruction_wdata          ;
  end 
//=====================Index = 0x340,mscratch==================================
  reg  [DATA_WIDTH-1:0]   mscratch        ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MSCRATCH_CSR
    if(rst_n == 1'b0)
      mscratch <= 32'b0                   ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_ena && jtag_csr_idx == 12'h340)
      mscratch <= jtag_csr_wdata          ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'h340)
      mscratch <= instruction_wdata       ;
  end 
//=====================Index = 0xbff,mcounterstop==============================
  reg  [DATA_WIDTH-1:0] mcounterstop      ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MCONSTOP_CSR
    if(rst_n == 1'b0)
      mcounterstop[2:0] <= 2'b0                   ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_ena && jtag_csr_idx == 12'hbff)
      mcounterstop[2:0] <= jtag_csr_wdata[2:0]    ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'hbff)
      mcounterstop[2:0] <= instruction_wdata[2:0] ;
  end 
//=====================Index = 0xb00,mcycle====================================
  wire                        cy_stop                       ;//clock cycle counter stop enable 
  assign                      cy_stop = mcounterstop[0]     ;
  wire                        tm_stop                       ;//timeer stop enable
  assign                      tm_stop = mcounterstop[1]     ;
  wire                        instret_stop                  ;//instret stop enable 
  assign                      instret_stop = mcounterstop[2];

  reg  [DATA_WIDTH-1:0]       mcycle                        ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MCYCLE_CSR
    if(rst_n == 1'b0)
      mcycle <= 32'b0             ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_idx == 12'hb00)
      mcycle <= jtag_csr_wdata    ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'hb00)
      mcycle <= instruction_wdata ;
    else if(cy_stop == 1'b1) 
      mcycle <= mcycle            ;
    else 
      mcycle <= mcycle+1'b1       ;
  end 
//=====================Index = 0xb80,mcycleh===================================
  reg  [DATA_WIDTH-1:0] mcycleh   ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MCYCLEH_CSR
    if(rst_n == 1'b0)
      mcycleh <= 32'b0            ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_idx == 12'hb80)
      mcycleh <= jtag_csr_wdata   ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'hb80)
      mcycleh <= instruction_wdata;
    else if(cy_stop == 1'b1)
      mcycleh <= mcycleh          ;
    else if(mcycle == 32'hffff_ffff)
      mcycleh <= mcycleh+1'b1     ;
  end
//=====================Index = 0xb02,minstret===================================
  reg  [DATA_WIDTH-1:0] minstret   ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MINSTRET_CSR
    if(rst_n == 1'b0)
      minstret <= 32'b0            ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_idx == 12'hb02)
      minstret <= jtag_csr_wdata   ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'hb02)
      minstret <= instruction_wdata;
    else if(instret_stop == 1'b1)
      minstret <= minstret         ;
    else 
      minstret <= minstret+1'b1    ;
  end 
//=====================Index = 0xb82,minstreth====================================
  reg  [DATA_WIDTH-1:0] minstreth   ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MINSTRETH_CSR
    if(rst_n == 1'b0)
      minstreth <= 32'b0            ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_idx == 12'hb82)
      minstreth <= jtag_csr_wdata   ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'hb82)
      minstreth <= instruction_wdata;
    else if(instret_stop == 1'b1)
      minstreth <= minstreth        ;
    else if(minstret == 32'h1111_1111)
      minstreth <= minstreth+1'b1   ;
  end
//=====================Index = 0x341,mepc csr==================================
  reg  [DATA_WIDTH-1:0]  mepc       ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MEPC
    if(rst_n == 1'b0)
      mepc <= 32'b0                 ;
    else if(int_csr_ena == 1'b1)
      mepc <= {int_csr_epc[31:1],1'b0}           ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_idx == 12'h341)
      mepc <= {jtag_csr_wdata[31:1],1'b0}        ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'h341)
      mepc <= {instruction_wdata[31:1],1'b0}     ;
  end 
//=====================Index = 0x342,mcause csr================================
  reg [DATA_WIDTH-1:0]        mcause;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MCAUSE
    if(rst_n == 1'b0)
      mcause <= 32'b0               ;
    else if(int_csr_ena == 1'b1)
      mcause <= int_csr_ecause      ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_idx == 12'h342)
      mcause <= jtag_csr_wdata      ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'h342)
      mcause <= instruction_wdata   ;
  end
//=====================Index = 0x343,mtval======================================
  reg  [DATA_WIDTH-1:0] mtval         ;  
  always@(posedge clk or negedge rst_n)begin:ASSIGN_MTVAL
    if(rst_n == 1'b0)
      mtval <= 32'b0                ;
    else if(int_csr_ena == 1'b1)
      mtval <= int_csr_mtval         ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_idx == 12'h343)
      mtval <= jtag_csr_wdata      ;
    else if(de_csr_wr_ena == 1'b1 && de_csr_idx == 12'h343)
      mtval <= instruction_wdata   ;
  end 
//=====================Index = 0x301,misa======================================
  //define misa read-only register 
  wire [DATA_WIDTH-1:0] misa          ;
  assign  misa = {2'b01,21'b0,1'b1,8'b0};
//=====================Index= 0xf11,mvendorid==================================
//define mvendorid read-only register 
  wire [DATA_WIDTH-1:0] mvendorid     ;
  assign  mvendorid = 32'b0           ;
//=====================Index = 0xf12,marchid===================================
  //define marchid read-only register 
  wire [DATA_WIDTH-1:0]       marchid ;
  assign  marchid = 32'h0000_0001     ;      
//=====================Index = 0xf13,mimpid====================================
  //define mimpid read-only register 
  wire [DATA_WIDTH-1:0]       mimpid  ;
  assign  mimpid = 32'h0000_0002;      
//=====================Index = 0xf14,mhartid===================================
  //define mhartid read-only register 
  wire [DATA_WIDTH-1:0]       mhartid ;
  assign  mhartid = 32'h0000_0001     ;   
//=====================Index = 0x7b0,dcsr======================================
  //define dcsr
  wire[DATA_WIDTH-1:0]        dcsr    ;
  reg [31:9]                  dcsrh   ; //dcsr[31:9]
  reg [2:0]                   dcause  ; //dcsr[8:6]
  reg [5:0]                   dcsrl   ; //dcsr[5:0]
  wire                        stepie  ; //dcsr[11]
  assign  stepie = dcsr[11]           ;

  always@(posedge clk or negedge rst_n)begin:ASSIGN_DCSRH //dcsr[31:9]
    if(rst_n == 1'b0)
      dcsrh <= 23'b0                ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_ena == 1'b1 && jtag_csr_idx == 12'h7b0)
      dcsrh <= jtag_csr_wdata[31:9] ;
  end 

  always@(posedge clk or negedge rst_n)begin:ASSIGN_DCAUSE//dcsr[8:6]
    if(rst_n == 1'b0)
      dcause <= 3'b0                ;
    else if(jtag_csr_halt_req == 1'b1)begin 
      if(jtag_csr_reset_req == 1'b1)
        dcause <= 3'b101            ;
      else if(stepie == 1'b1)
        dcause <= 3'b100            ;    
      else 
        dcause <= 3'b011            ;
    end 
    else if(int_csr_dena == 1'b1)
      dcause <= int_csr_dcause      ; //
    else 
      dcause <= 3'b000              ;
  end 

  always@(posedge clk or negedge rst_n)begin:ASSIGN_DCSRL //dcsr[5:0]
    if(rst_n == 1'b0)
      dcsrl <= 6'b0                 ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_ena == 1'b1 && jtag_csr_idx == 12'h7b0)
      dcsrl <= jtag_csr_wdata[5:0]  ;
  end
 
  assign  dcsr = {dcsrh,dcause,dcsrl};              //dcsr
//=====================Index = 0x7b1,debug pc==================================
  //define debug pc
  reg  [DATA_WIDTH-1:0]        dpc  ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_DPC
    if(rst_n == 1'b0)
      dpc <= 32'b0                  ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_ena == 1'b1)
      dpc <= jtag_csr_wdata         ;
    else if(int_csr_dena == 1'b1)
      dpc <= int_csr_dpc            ; 
  end
//=====================Index = 0x7b2,debug scratch=============================
  //define debug pc
  reg  [DATA_WIDTH-1:0]   dscratch  ;
  always@(posedge clk or negedge rst_n)begin:ASSIGN_DSC
    if(rst_n == 1'b0)
      dscratch <= 32'b0             ;
    else if(jtag_csr_we == 1'b1 && jtag_csr_ena == 1'b1)
      dscratch <= jtag_csr_wdata    ;
  end 
//=====================Read CSR data===========================================
  //connect data with interrupt module 
  assign  csr_int_mie         = mie_r          ;//mstatus csr
  assign  csr_int_meie        = meie_r         ;//mie csr -->meie field
  assign  csr_int_mtie        = mtie_r         ;//mie csr -->mtie field
  assign  csr_int_msie        = msie_r         ;//mie csr -->msie field
  assign  csr_int_mtvec       = mtvec          ;//mtvec csr
  assign  csr_int_epc         = mepc           ;//mepc csr
  assign  csr_int_counterstop = mcounterstop[1];//mcounerstop csr
  always@(*)begin:ASSIGN_READ_IDX
    if(jtag_csr_ena == 1'b1)
      read_idx = jtag_csr_idx               ;
    else 
      read_idx = de_csr_idx                 ;
  end

  always@(*)begin:ASSIGN_READ_DATA
    case(read_idx)
      12'h300:  csr_rdata = mstatus       ;
      12'h304:  csr_rdata = mie           ;
      12'h344:  csr_rdata = mip           ;
      12'h305:  csr_rdata = mtvec         ;
      12'h340:  csr_rdata = mscratch      ;
      12'hbff:  csr_rdata = mcounterstop  ;
      12'hb00:  csr_rdata = mcycle        ;
      12'hb80:  csr_rdata = mcycleh       ;
      12'hb02:  csr_rdata = minstret      ;
      12'hb82:  csr_rdata = minstreth     ;
      12'h341:  csr_rdata = mepc          ;
      12'h342:  csr_rdata = mcause        ;
      12'h343:  csr_rdata = mtval         ;
      12'h301:  csr_rdata = misa          ;
      12'hf11:  csr_rdata = mvendorid     ;
      12'hf12:  csr_rdata = marchid       ;
      12'hf13:  csr_rdata = mimpid        ;
      12'hf14:  csr_rdata = mhartid       ;
      12'h7b0:  csr_rdata = dcsr          ;
      12'h7b1:  csr_rdata = dpc           ;
      12'h7b2:  csr_rdata = dscratch      ;
      default:  csr_rdata = 32'h0000_0000 ;
    endcase
  end 
//=====================output rdata============================================
  assign  csr_gpr_rdata = csr_rdata       ;
  assign  csr_jtag_rdata= csr_rdata       ; 
endmodule     
