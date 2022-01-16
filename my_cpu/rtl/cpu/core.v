module core(

    input clk,
    input rst_n,

    input  [31:0] inst_i,
    
    output [31:0] rom_addr_o,
    output        rom_en_o
);

//ifu -> rom
wire pc_stall;

//ifu -> ifu_de
wire [31:0] pc;
wire [31:0] inst_o;


assign rom_addr_o = pc;
assign rom_en_o   = ~pc_stall;

ifu u1_ifu(
    .clk(clk),
    .rst_n(rst_n),
    .inst_i(inst_i),

    .pc(pc),
    .inst_o(inst_o),
    .pc_stall(pc_stall)
);

ifu_de u1_ifu_de(
    .clk(clk),
    .rst_n(rst_n),
    .inst_o(inst_o),
    .pc(pc),

    .de_pc(de_pc),
    .de_inst(de_inst)
);

endmodule