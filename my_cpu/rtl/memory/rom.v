module rom(

    input  clk,
    input  rst_n,

    input  rom_en,
    input  [31:0] rom_addr,

    output reg [31:0] inst_o

);

reg [31:0] _rom [4095:0];

initial begin
    $readmemh("/home/host/riscv_soc1/tests/s_tests/s_test.mem",_rom);
end

always @(*) begin
    if(rom_en) begin
        inst_o = _rom[rom_addr[31:2]];
    end
    else begin
        inst_o = 32'b0;
    end
end

endmodule