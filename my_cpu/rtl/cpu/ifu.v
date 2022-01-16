module ifu(
    input             clk,
    input             rst_n,
    input      [31:0] inst_i,

    output reg [31:0] pc,
    output     [31:0] inst_o,
    output reg       pc_stall
);

always @(*) begin
    if(!rst_n) begin
        pc_stall = 1'b1;
    end
    else begin
        pc_stall = 1'b0;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        pc <= 31'b0;
    end
    else begin
        pc <= pc + 4;
    end
end

assign inst_o = inst_i;

endmodule