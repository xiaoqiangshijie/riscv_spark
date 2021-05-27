`timescale 1ns/1ps

module div_test;

reg clk;
reg rst;

reg [31:0] dividend_i = 32'd14;
reg [31:0] divisor_i = 32'd2;
reg start_i = 1'b1;
reg [2:0] op_i = 3'b101;
reg [4:0] reg_waddr_i = 5'b00001;

wire [31:0] result_o;
wire ready_o;
wire busy_o;
wire [4:0] reg_waddr_o;

div u_div(
    .clk(clk),
    .rst(rst),

    .dividend_i(dividend_i),
    .divisor_i(divisor_i),
    .start_i(start_i),
    .op_i(op_i),
    .reg_waddr_i(reg_waddr_i),

    .result_o(result_o),
    .ready_o(ready_o),
    .busy_o(busy_o),
    .reg_waddr_o(reg_waddr_o)
);

always begin
    #10 clk=~clk;
end

initial begin
    clk=1'b0;
    rst=1'b0;
    #15;
    rst=1'b1;
    #800;
    $stop;
end

`ifdef VCS_WAVE  //VCS加载波形
initial begin
    $vcdpluson;
    $vcdplusmemon;
end
`endif

endmodule