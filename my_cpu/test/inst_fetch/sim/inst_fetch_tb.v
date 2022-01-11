module inst_fetch_tb;

reg clk;
reg rst_n;
wire [31:0] inst;

inst_fetch inst_fetch( 
    .clk(clk),
    .rst_n(rst_n),
    .inst(inst)
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