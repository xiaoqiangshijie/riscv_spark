module soc(

    input clk,
    input rst_n

);

//core -> rom
wire        rom_en_o;
wire [31:0] rom_addr_o;
wire [31:0] inst_o;


core u_core(

    .clk(clk),
    .rst_n(rst_n),
    .inst_i(inst_o),

    .rom_addr_o(rom_addr_o),
    .rom_en_o(rom_en_o)
);

rom u_rom(

    .clk(clk),
    .rst_n(rst_n),
    .rom_en(rom_en_o),
    .rom_addr(rom_addr_o),

    .inst_o(inst_o)

);

endmodule