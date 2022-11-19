//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
//File          : countcmp_dff.v
//Author        : fengyi
//Date          : 7/29/2021
//Version       : 0.1
//Description   : this file is counter_cmp RW registers.
//-----------------------------------------------------------------------------------
//Modiication history:
//Date           By            Version           Change Description
//07/27/2021     fengyi        0.1               
//                                               
//-----------------------------------------------------------------------------------

module countcmp_dff(
  input              clk      ,
  input              rstn     ,
  input              reg_en   ,
  input              reg_wr   ,
  input      [63:0]  reg_wdata,
  output reg [63:0]  reg_rdata,
  input              sel
  );

always@(posedge clk or negedge rstn) begin
  if(!rstn) begin
    reg_rdata <= 64'hffff_ffff_ffff_ffff ;
  end
  else begin
    if(reg_en && reg_wr && sel) begin
      reg_rdata <= reg_wdata;
    end
  end
end

endmodule
      


