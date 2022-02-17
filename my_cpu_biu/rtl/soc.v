module soc(

    input clk,
    input rst_n

);

//core -> rom
wire        rom_en_o;
wire [31:0] rom_addr_o;
wire [31:0] rom_inst_o;

//core -> ram
wire        ram_ce;
wire        ram_wr_en;
wire [31:0] ram_addr;
wire [3:0]  ram_addr_sel;
wire [31:0] ram_wr_data;

//ram -> core
wire [31:0] ram_data_in;


core u_core(

    //clk and rst_n
    .clk(clk),
    .rst_n(rst_n),

    // slave 0 interface            //rom
    .s0_we(rom_en_o),        
    .s0_addr(rom_addr_o),    
    .s0_addr_sel(4'b1111),
    .s0_wdata(32'b0),      
    .s0_rdata(rom_inst_o),

    // slave 1 interface            //ram
    .s1_we(ram_wr_en),        
    .s1_addr(ram_addr),    
    .s1_addr_sel(ram_addr_sel),
    .s1_wdata(ram_wr_data),      
    .s1_rdata(ram_data_in)

);

rom u_rom(

    .clk(clk),
    .rst_n(rst_n),
    .rom_en(rom_en_o),
    .rom_addr(rom_addr_o),

    .rom_inst_o(rom_inst_o)

);

ram u_ram(

    .clk(clk),
    .rst_n(rst_n),

    .ram_wr_en(ram_wr_en),
    .ram_addr(ram_addr),
    .ram_addr_sel(ram_addr_sel),
    .ram_wr_data(ram_wr_data),

    .ram_data_in(ram_data_in)

);


endmodule