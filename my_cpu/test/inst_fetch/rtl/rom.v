module rom(
    input clk,
    input rst_n,
    input  [5:0] addr,
    output reg [31:0] inst
);

reg [31:0] rom [63:0];

always @(*) begin
    if(!rst_n) begin
        inst <= 32'b0;
    end
    else begin
        inst <= rom[addr];
    end
end

initial begin
    $readmemh("rom.data",rom);
end

endmodule