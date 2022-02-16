module soc(

    input clk,
    input rst_n

);

//core -> rom
wire        rom_en_o;
wire [31:0] rom_addr_o;
wire [31:0] inst_o;

//core -> ram
wire        ram_ce;
wire        ram_wr_en;
wire [31:0] ram_addr;
wire [3:0]  ram_addr_sel;
wire [31:0] ram_wr_data;

//ram -> core
wire [31:0] ram_data_in;


core u_core(

    .clk(clk),
    .rst_n(rst_n),
    .inst_i(inst_o),
    .ram_data_in(ram_data_in),
    
    .rom_addr_o(rom_addr_o),
    .rom_en_o(rom_en_o),
    .ram_ce(ram_ce),
    .ram_wr_en(ram_wr_en),
    .ram_addr(ram_addr),
    .ram_addr_sel(ram_addr_sel),
    .ram_wr_data(ram_wr_data)

);

rom u_rom(

    .clk(clk),
    .rst_n(rst_n),
    .rom_en(rom_en_o),
    .rom_addr(rom_addr_o),

    .inst_o(inst_o)

);

ram u_ram(

    .clk(clk),
    .rst_n(rst_n),

    .ram_ce(ram_ce),
    .ram_wr_en(ram_wr_en),
    .ram_addr(ram_addr),
    .ram_addr_sel(ram_addr_sel),
    .ram_wr_data(ram_wr_data),

    .ram_data_in(ram_data_in)

);


endmodule