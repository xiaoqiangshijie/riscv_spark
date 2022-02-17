module de_alu(

    input        clk,
    input        rst_n,

    input [31:0] op1,
    input [31:0] op2,
    input [31:0] op1_jump,
    input [31:0] op2_jump,
    input        wr_reg_en,
    input [4:0]  wr_reg_addr,

    input [31:0] de_pc_o,
    input [31:0] de_inst_o,
    input [31:0] rd_data1_o,
    input [31:0] rd_data2_o,

    input [2:0]  inst_type,
    input        or_flag,

    input [5:0]  stall,

    output reg [31:0] alu_op1,
    output reg [31:0] alu_op2,
    output reg [31:0] alu_reg1_data,
    output reg [31:0] alu_reg2_data,

    output reg [31:0] alu_op1_jump,
    output reg [31:0] alu_op2_jump,
    output reg        alu_wr_reg_en,
    output reg [4:0]  alu_wr_reg_addr,

    output reg [31:0] alu_pc,
    output reg [31:0] alu_inst,

    output reg [2:0]  alu_inst_type,
    output reg        alu_or_flag
);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        alu_op1         <= 32'b0;
        alu_op2         <= 32'b0;
        alu_reg1_data   <= 32'b0;
        alu_reg2_data   <= 32'b0;
        alu_op1_jump    <= 32'b0;
        alu_op2_jump    <= 32'b0;
        alu_wr_reg_en   <= 1'b0;
        alu_wr_reg_addr <= 5'b0;
        alu_pc          <= 32'b0;
        alu_inst        <= 32'b0;
        alu_inst_type   <= 3'b0;
        alu_or_flag     <= 1'b0;
    end
    else if(stall == 6'b111111) begin  //flash ifu-de de-alu
        alu_op1         <= 32'b0;
        alu_op2         <= 32'b0;
        alu_reg1_data   <= 32'b0;
        alu_reg2_data   <= 32'b0;
        alu_op1_jump    <= 32'b0;
        alu_op2_jump    <= 32'b0;
        alu_wr_reg_en   <= 1'b0;
        alu_wr_reg_addr <= 5'b0;
        alu_pc          <= 32'b0;
        alu_inst        <= 32'b0;
        alu_inst_type   <= 3'b0;
        alu_or_flag     <= 1'b0;
    end
    else if(stall[2] == 1'b1 && stall[3] == 1'b0) begin   //stall pc ifu-de de-alu alu = 0
        alu_op1         <= 32'b0;
        alu_op2         <= 32'b0;
        alu_reg1_data   <= 32'b0;
        alu_reg2_data   <= 32'b0;
        alu_op1_jump    <= 32'b0;
        alu_op2_jump    <= 32'b0;
        alu_wr_reg_en   <= 1'b0;
        alu_wr_reg_addr <= 5'b0;
        alu_pc          <= 32'b0;
        alu_inst        <= 32'b0;
        alu_inst_type   <= 3'b0;
        alu_or_flag     <= 1'b0;
    end
    else if(stall[2] == 1'b0) begin
        alu_op1         <= op1;
        alu_op2         <= op2;
        alu_reg1_data   <= rd_data1_o;
        alu_reg2_data   <= rd_data2_o;
        alu_op1_jump    <= op1_jump;
        alu_op2_jump    <= op2_jump;
        alu_wr_reg_en   <= wr_reg_en;
        alu_wr_reg_addr <= wr_reg_addr;
        alu_pc          <= de_pc_o;
        alu_inst        <= de_inst_o;
        alu_inst_type   <= inst_type;
        alu_or_flag     <= or_flag;
    end
end

endmodule