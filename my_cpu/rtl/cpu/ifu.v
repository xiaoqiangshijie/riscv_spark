module ifu(
    input             clk,
    input             rst_n,
    input      [31:0] inst_i,
    input      [5:0]  stall,
    input             ctrl_jump_flag,
    input      [31:0] ctrl_jump_addr,

    output reg [31:0] pc,
    output     [31:0] inst_o,
    output reg        pc_stall
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
    else if(ctrl_jump_flag) begin
        pc <= ctrl_jump_addr;
    end
    else if(stall[1] == 1'b1) begin
        pc <= pc;
    end
    else begin
        pc <= pc + 4;
    end
end

assign inst_o = inst_i;

endmodule