//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
//File          : ip_dff.v
//Author        : fengyi
//Date          : 7/28/2021
//Version       : 0.1
//Description   : this file is interrupt pending registers.
//-----------------------------------------------------------------------------------
//Modiication history:
//Date           By            Version           Change Description
//07/27/2021     fengyi        0.1               
//                                               
//-----------------------------------------------------------------------------------
module ip_dff(
  input            clk      ,
  output reg       reg_rdata, 
  input            gate     ,
  input            claim
  );

always@(posedge clk) begin
  if(claim) begin
    reg_rdata <= 0;
  end
  else begin
    reg_rdata <= gate;
  end
end

endmodule
