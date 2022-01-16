module de_alu(

    input        clk,
    input        rst_n,

    input [31:0] op1,
    input [31:0] op2,
    input        rd_reg_en,
    input [4:0]  rd_reg_addr,

    input [31:0] de_pc_o,
    input [31:0] de_inst_o,

    input [2:0]  inst_type,
    input        or_flag,

    output reg [31:0] alu_op1,
    output reg [31:0] alu_op2,
    output reg        alu_rd_reg_en,
    output reg [4:0]  alu_rd_reg_addr,

    output reg [31:0] alu_pc,
    output reg [31:0] alu_inst,

    output reg [2:0]  alu_inst_type,
    output reg        alu_or_flag
);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        alu_op1         <= 32'b0;
        alu_op2         <= 32'b0;
        alu_rd_reg_en   <= 1'b0;
        alu_rd_reg_addr <= 5'b0;
        alu_pc          <= 32'b0;
        alu_inst        <= 32'b0;
        alu_inst_type   <= 3'b0;
        alu_or_flag     <= 1'b0;
    end
    else begin
        alu_op1         <= op1;
        alu_op2         <= op2;
        alu_rd_reg_en   <= rd_reg_en;
        alu_rd_reg_addr <= rd_reg_addr;
        alu_pc          <= de_pc_o;
        alu_inst        <= de_inst_o;
        alu_inst_type   <= inst_type;
        alu_or_flag     <= or_flag;
    end
end

endmodule