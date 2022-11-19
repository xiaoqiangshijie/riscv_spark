//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
//File          : claim_dff.v
//Author        : fengyi
//Date          : 7/28/2021
//Version       : 0.1
//Description   : this file is claim RO registers.
//-----------------------------------------------------------------------------------
//Modiication history:
//Date           By            Version           Change Description
//07/27/2021     fengyi        0.1               
//                                               
//-----------------------------------------------------------------------------------
module claim_dff(
  input            clk        ,
  input            rstn       ,
//  input            reg_en   ,
//  input      [31:0]reg_addr ,
//  input            reg_wr   ,
//  input            reg_wdata,
  output reg [31:0]reg_rdata  ,
  input            claim_ena  ,
  input      [31:0]final_id
  );

always@(posedge clk or negedge rstn) begin
  if(!rstn) begin
    reg_rdata <= 32'b0;
  end
  else begin
    if(claim_ena) begin
      reg_rdata <= final_id;
    end
  end
end

endmodule
