`timescale 1ns/1ns
module soc_tb;

reg clk;
reg rst_n;

soc soc(
    .clk(clk),
    .rst_n(rst_n)
);

initial clk = 1'b0;
always #10 clk = ~clk;

initial begin
    rst_n = 1'b0;
    #40 rst_n = 1'b1;
end

initial begin
#250000 $finish();   //vcs simulate time finish
end

initial begin
   $fsdbDumpfile("riscv.fsdb");
   $fsdbDumpvars;
   $fsdbDumpMDA();
end

endmodule