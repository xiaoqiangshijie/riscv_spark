//-----------------------------------------------------------------------------
//This confidential and proprietary software may be used only used as
//by a licensing aggrement from Orbbec Inc.
//In the event of publication ,the following notice is applicable:
//(C)COPYRIGHT 2013 ORBBEC INC.ALL RIGHTS RESERVED.
//The entire notice ablove must be reproduced on all authorized copies
//-----------------------------------------------------------------------------
//File          :gpr.v
//Author        :modi
//Date          :07/24/2021
//Version       :0.1
//Description   :This file is a gpr module for risc-v 
//-----------------------------------------------------------------------------
//Modification History:
//Date          By          Version         Change Description 
//07/24/2021    modi        0.1             Original
//-----------------------------------------------------------------------------
module gpr
#(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 5 ,
    parameter DEPTH_GPR  = 32
)(
  input                    clk                   ,       //system clock
  input  [ADDR_WIDTH-1:0]  de_gpr_rs1_addr       ,       //register1 address
  input  [ADDR_WIDTH-1:0]  de_gpr_rs2_addr       ,       //register2 address    
  input                    de_gpr_rd_write_en    ,       //wirte enable to rd register 
  input  [ADDR_WIDTH-1:0]  de_gpr_rd_write_addr  ,       //write rd register address
  input  [DATA_WIDTH-1:0]  wb_gpr_wdata          ,       //write rd register data
  input                    lsu_wb_valid          ,
  input  [1:0]             ctrl_lsu_typ          ,
  input                    ctrl_ifu_stall        ,
  output [DATA_WIDTH-1:0]  gpr_rs1_data          ,       //data of rs1 address
  output [DATA_WIDTH-1:0]  gpr_rs2_data          ,       //data of rs2 address

  input                    de_csr_write_en       ,
  input  [DATA_WIDTH-1:0]  csr_gpr_wdata         ,
  output [DATA_WIDTH-1:0]  gpr_csr_rdata         ,
  
  input                    jtag_gpr_we           ,
  input  [ADDR_WIDTH-1:0]  jtag_gpr_addr         ,
  input  [DATA_WIDTH-1:0]  jtag_gpr_wdata        ,
  output [DATA_WIDTH-1:0]  gpr_jtag_rdata        
);

  wire   [DATA_WIDTH-1:0]  gpr_mem[DEPTH_GPR-1:0];       //define 32 registers group
  wire                     gpr_wen[DEPTH_GPR-1:0];       //write enable to 32 registers
  reg    [DATA_WIDTH-1:0]  write_data            ;
  wire                     de_gpr_write_en       ;
  reg    [ADDR_WIDTH-1:0]  write_addr            ;
  
  //assign de_gpr_write_en = (ctrl_lsu_typ==2'b01) ? lsu_wb_valid : de_gpr_rd_write_en;
  assign de_gpr_write_en = de_gpr_rd_write_en & ~ctrl_ifu_stall;

  always@(*)begin
    if(jtag_gpr_we == 1'b1)begin
      write_data = jtag_gpr_wdata;
      write_addr = jtag_gpr_addr ;
    end
     else if(de_csr_write_en == 1'b1)begin
      write_addr = de_gpr_rd_write_addr;
      write_data = csr_gpr_wdata ;
    end 
    else if(de_gpr_rd_write_en == 1'b1)begin
      write_addr = de_gpr_rd_write_addr;
      write_data = wb_gpr_wdata  ;
    end 
    else begin 
      write_data = 32'b0         ;
      write_addr = 5'b0          ;
    end 
  end 
  //use generate syntax to generate 32 registers
  genvar i                                       ;
  generate
    for(i = 0 ; i < DEPTH_GPR ; i = i+1)begin:GENERATE_32REGISTERS
      if( i == 0)begin:ONLY_READ                         //register 0 cannot write and its value is 0
        assign  gpr_wen[i]   = 1'b0              ;
        assign  gpr_mem[i]   = {DATA_WIDTH{1'b0}};
      end 
      else begin:WRITE_OR_READ
        assign  gpr_wen[i]   = (de_gpr_write_en | de_csr_write_en | jtag_gpr_we) && (write_addr == i); //generate write enable 
        noreset_dffs gpr_dffs_inst                           //examplify 32 registers
        (
          .clk              (clk                 ),
          .wen              (gpr_wen[i]          ),
          .data_in          (write_data          ),
          .data_out         (gpr_mem[i]          )
        );
        end 
      end 
  endgenerate 
  
  assign gpr_rs1_data = gpr_mem[de_gpr_rs1_addr] ;       //output read rs1 data
  assign gpr_csr_rdata= gpr_mem[de_gpr_rs1_addr] ; 
  assign gpr_rs2_data = gpr_mem[de_gpr_rs2_addr] ;       //output read rs2 data 
  assign gpr_jtag_rdata = gpr_mem[jtag_gpr_addr] ;
endmodule   
