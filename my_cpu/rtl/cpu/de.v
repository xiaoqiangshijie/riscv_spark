module de(
    input clk,
    input rst_n,

    //from ifu_de
    input [31:0] de_pc,
    input [31:0] de_inst,

    //from regs

    input [31:0] rd_data1,
    input [31:0] rd_data2,

    //to regs
    output  rd_en1,
    output  rd_en2,
    output  [31:0]rd_addr1,
    output  [31:0]rd_addr2,

    //to de_alu inst type
    output reg [2:0]  inst_type,
    output            or_flag,

    //to de_alu
    output reg [31:0] op1,
    output reg [31:0] op2,
    output reg        rd_reg_en,
    output reg [4:0]  rd_reg_addr,

    output     [31:0] de_pc_o,
    output     [31:0] de_inst_o
);

wire[6:0] opcode = de_inst[6:0];
wire[2:0] funct3 = de_inst[14:12];
wire[6:0] funct7 = de_inst[31:25];
wire[4:0] rd  = de_inst[11:7];
wire[4:0] rs1 = de_inst[19:15];
wire[4:0] rs2 = de_inst[24:20];

// I type inst
parameter INST_TYPE_I 7'b0010011
parameter INST_ADDI   3'b000
parameter INST_SLTI   3'b010
parameter INST_SLTIU  3'b011
parameter INST_XORI   3'b100
parameter INST_ORI    3'b110
parameter INST_ANDI   3'b111
parameter INST_SLLI   3'b001
parameter INST_SRI    3'b101


`define INST_TYPE_R 7'b0110011
// R type inst
`define INST_ADD_SUB 3'b000
`define INST_SLL    3'b001
`define INST_SLT    3'b010
`define INST_SLTU   3'b011
`define INST_XOR    3'b100
`define INST_SR     3'b101
`define INST_OR     3'b110
`define INST_AND    3'b111




//inst type
wire ori_sign;
wire or_sign;
wire or_flag;
assign ori_sign = (opcode == INST_TYPE_I) && (funct3 == INST_ORI);
assign or_sign  = (opcode == INST_TYPE_R) && ((funct7 == 7'b0000000 || funct7 == 7'b0100000)) && (funct3 == INST_OR);
assign or_flag = ori_sign || or_sign;

always @(*) begin
    de_pc_o   = de_pc;
    de_inst_o = de_inst;
    case(opcode)
        INST_TYPE_I: begin
            case(funct3) 
                INST_ORI: begin
                    rd_reg_en   = 1'b1;
                    rd_reg_addr = rd;
                    rd_addr1    = rs1;
                    rd_addr2    = 5'b0;
                    op1         = rd_data1;
                    op2         = {{20{inst_i[31]}}, inst_i[31:20]};; 
                    inst_type   = 3'd1;
                end
                default: begin
                    rd_reg_en   = 1'b0;
                    rd_reg_addr = 5'b0;
                    rd_addr1    = 5'b0;
                    rd_addr2    = 5'b0;
                    op1         = 32'b0;
                    op2         = 32'b0; 
                    inst_type   = 3'd0;
                end
            endcase
        end
        INST_TYPE_R: begin
            if(funct7 == 7'b0000000 || funct7 == 7'b0100000) begin
                case(funct3) 
                    INST_OR: begin
                        rd_reg_en   = 1'b1;
                        rd_reg_addr = rd;
                        rd_addr1    = rs1;
                        rd_addr2    = rs2;
                        op1         = rd_data1;
                        op2         = rd_data2; 
                        inst_type   = 3'd2;
                    end
                    default: begin
                        rd_reg_en   = 1'b0;
                        rd_reg_addr = 5'b0;
                        rd_addr1    = 5'b0;
                        rd_addr2    = 5'b0;
                        op1         = 32'b0;
                        op2         = 32'b0; 
                        inst_type   = 3'd0;
                    end
                endcase
            end
        end

    endcase
end

endmodule