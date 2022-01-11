`timescale 1ns/1ns
module ClockDividerN_tb;
reg clk_in;
wire clk_out;

ClockDividerN #(.DIV(4)) ClockDividerN0(
   .clk_in(clk_in),
   .clk_out(clk_out)
);

initial clk_in = 1'b0;
always #5 clk_in = ~clk_in;


initial begin
#250000 $finish();   //vcs simulate time finish
end

initial begin
   $fsdbDumpfile("riscv.fsdb");
   $fsdbDumpvars;
   $fsdbDumpMDA();
end

endmodule
