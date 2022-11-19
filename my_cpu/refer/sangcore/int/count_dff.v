//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
//File          : count_dff.v
//Author        : fengyi
//Date          : 7/29/2021
//Version       : 0.1
//Description   : this file is counter RO registers.
//-----------------------------------------------------------------------------------
//Modiication history:
//Date           By            Version           Change Description
//07/27/2021     fengyi        0.1               
//                                               
//-----------------------------------------------------------------------------------

module count_dff(
  input            clk      ,
  input            rstn     ,
//  input            reg_en   ,
//  input      [31:0]reg_addr ,
//  input            reg_wr   ,
//  input            reg_wdata,
  output reg [31:0]reg_rdata  ,
  input            counterstop, 
  input            trigger    
  );

always@(posedge clk or negedge rstn) begin
  if(!rstn) begin
    reg_rdata <= 0;
  end
  else begin
    if(trigger && !counterstop) begin
      reg_rdata <= reg_rdata + 1;
    end
    else begin
      reg_rdata <= reg_rdata;
    end
  end
end

endmodule
