//-----------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------------
//File          : compare.v
//Author        : fengyi
//Date          : 7/28/2021
//Version       : 0.1
//Description   : this file is compare module in plic module.
//-----------------------------------------------------------------------------------
//Modiication history:
//Date           By            Version           Change Description
//07/28/2021     fengyi        0.1               
//                                               
//-----------------------------------------------------------------------------------

module compare #(
  parameter WIDTH = 3
)(
  input                  clk      ,
  input      [WIDTH-1:0] prio0    ,
  input      [WIDTH-1:0] prio1    ,
  input      [7:0]       id0      ,
  input      [7:0]       id1      ,
  output     [WIDTH-1:0] prio     ,
  output     [7:0]       id
);

assign prio = (prio0 >= prio1)? prio0 : prio1 ;  
assign id   = (prio0 >= prio1)? id0   : id1   ;  

endmodule