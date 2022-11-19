//-----------------------------------------------------------------------------------
//
////-----------------------------------------------------------------------------------
//file          : gate.v
//author        : fengyi
//date          : 7/26/2012
//version       : 0.1
//description   : this file is gate module in plic module.
//-----------------------------------------------------------------------------------
//Modiication history:
//Date           By            Version           Change Description
//07/27/2021     fengyi        0.1               
//                                             
//-----------------------------------------------------------------------------------

module gate(
  input clk,
  input rstn,
  input ext_irq,
  input cmplt,
  output reg gate);

reg  cmplt_1_r;
reg  cmplt_2_r;
wire cmplt_pos;

always@(posedge clk or negedge rstn) begin
  if(!rstn) begin
    cmplt_1_r <= 1'b0;
    cmplt_2_r <= 1'b0;
  end
  else begin
    cmplt_1_r <= cmplt;
    cmplt_2_r <= cmplt_1_r;
  end
end

assign cmplt_pos = cmplt_1_r & ~cmplt_2_r;

always@(posedge clk or negedge rstn) begin
  if(!rstn) begin
    gate <= 1'b0;
  end
  else begin
    if(cmplt_pos) begin
      gate <= 1'b0;
    end
    else begin
      gate <= ext_irq || gate;  //pulse or 
    end
  end
end

endmodule

