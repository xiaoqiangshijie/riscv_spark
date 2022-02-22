`timescale 1ns/1ns
module div_tb;

    reg clk;
    reg rst_n;
    reg [31:0] op1_data;
    reg [31:0] op2_data;
    reg start_flag;
    reg annul;
    reg signed_div;

    wire [63:0] div_result;
    wire        div_ready;

    div div(

        .clk(clk),
        .rst_n(rst_n),

        .op1_data(op1_data),
        .op2_data(op2_data),
        .start_flag(start_flag),
        .annul(annul),
        .signed_div(signed_div),

        .div_result(div_result),
        .div_ready(div_ready)

    );

initial clk = 1'b0;
always #10 clk = ~clk;

initial begin
    rst_n      = 1'b0;
    op1_data   = 32'd8;
    op2_data   = 32'd2;
    start_flag = 1'b1;
    annul      = 1'b0;
    signed_div = 1'b0;
    #40;
    rst_n      = 1'b1;
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



