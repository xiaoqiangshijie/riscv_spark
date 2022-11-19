//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
//File          : rw32_dff.v
//Author        : yingzheng
//Date          : 10/28/2021
//Version       : 0.1
//Description   : this file is interrupt enable and priority registers.
//-----------------------------------------------------------------------------------
//Modiication history:
//Date           By            Version           Change Description
//10/19/2021     yingzheng       0.1               ori   
//                                               
//-----------------------------------------------------------------------------------

module rw32_dff(
  input            clk      ,
  input            rstn     ,
  input            reg_en   ,
  input            reg_wr   ,
  input      [63:0]reg_wdata,
  output reg [31:0]reg_rdata,
  input            sel
  );

always@(posedge clk or negedge rstn) begin
  if(!rstn) begin
    reg_rdata <= 32'b0;
  end
  else begin
    if(reg_en && reg_wr && sel) begin
      reg_rdata <= reg_wdata[31:0];
    end
  end
end

endmodule