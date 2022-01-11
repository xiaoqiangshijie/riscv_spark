module inst_fetch(
    input clk,
    input rst_n,
    output reg [31:0] inst
);

wire [5:0] pc_addr;

ifu u_ifu(
    .clk(clk),
    .rst_n(rst_n),

    .pc(pc_addr),
    .en(en)
);

rom u_rom(
    .clk(clk),
    .rst_n(rst_n),
    .addr(pc_addr),

    .inst(inst)
);

endmodule