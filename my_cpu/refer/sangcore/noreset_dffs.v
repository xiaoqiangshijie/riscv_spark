//-----------------------------------------------------------------------------
//This confidential and proprietary software may be used only used as
//by a licensing aggrement from Orbbec Inc.
//In the event of publication ,the following notice is applicable:
//(C)COPYRIGHT 2013 ORBBEC INC.ALL RIGHTS RESERVED.
//The entire notice ablove must be reproduced on all authorized copies
//-----------------------------------------------------------------------------
//File          :noreset_dffs.v
//Author        :modi
//Date          :07/24/2021
//Version       :0.1
//Description   :This file is a general register for gpr module 
//-----------------------------------------------------------------------------
//Modification History:
//Date          By          Version         Change Description 
//07/24/2021    modi        0.1             Original
//-----------------------------------------------------------------------------
module noreset_dffs 
#(
  parameter DATA_WIDTH = 32
)(
  input                       clk      ,     //system clock
  input                       wen      ,     //write enable 
  input      [DATA_WIDTH-1:0] data_in  ,     //write data
  output     [DATA_WIDTH-1:0] data_out       //write data to read
);

reg [DATA_WIDTH-1:0] data_out_r        ;

always@(posedge clk)
begin : WRITE_DATA
  if (wen == 1'b1)                      //write enable,write data to data_out
    data_out_r <= data_in              ;
end

assign      data_out = data_out_r      ;
endmodule
