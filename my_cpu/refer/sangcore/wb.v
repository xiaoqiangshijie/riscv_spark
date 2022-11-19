//This confidential and proprietary software may be used only used as
//by a licensing aggrement from Orbbec Inc.
//In the event of publication ,the following notice is applicable:
//(C)COPYRIGHT 2013 ORBBEC INC.ALL RIGHTS RESERVED.
//The entire notice ablove must be reproduced on all authorized copies
//-----------------------------------------------------------------------------
//File          :alu.v
//Author        :modi
//Date          :07/27/2021
//Version       :0.1
//Description   :This file is a write back module of risc-v project
//-----------------------------------------------------------------------------
//Modification History:
//Date          By          Version         Change Description 
//07/27/2021    modi        0.1             Original
//-----------------------------------------------------------------------------
module  wb
#(
  parameter        DATA_WIDTH = 32
)(
  input  wire                 lsu_wb_valid          ,//data valid of lsu data
  input  wire[DATA_WIDTH-1:0] lsu_wb_data           ,//data from lsu
  input  wire[DATA_WIDTH-1:0] alu_wb_data           ,//data from alu
  output reg [DATA_WIDTH-1:0] wb_gpr_wdata      //data that write to gpr module 
);
//2-2 mux to wb_gpr_write_data===============================================
  always@(*)begin:CHOOSE_DATA_TO_GPR
    if(lsu_wb_valid == 1'b1)
      wb_gpr_wdata = lsu_wb_data;
    else 
      wb_gpr_wdata = alu_wb_data;
  end 

endmodule 

