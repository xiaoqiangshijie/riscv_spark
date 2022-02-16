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

wire [31:0] x3  = soc.u_core.u0_regs.regs[3];
wire [31:0] x26 = soc.u_core.u0_regs.regs[26];
wire [31:0] x27 = soc.u_core.u0_regs.regs[27];

initial begin
wait (x26 == 32'b1) begin
    $display("***********************");
    $display("****** TEST PASS ******");
    $display("***********************");
end
end
initial begin
wait (x27 == 32'b1) begin
    $display("***********************");
    $display("****** TEST FAIL ******");
    $display("***********************");
end
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