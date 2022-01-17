module alu(

    //from de_alu
    input [31:0] alu_op1,
    input [31:0] alu_op2,
    input        alu_rd_reg_en,
    input [4:0]  alu_rd_reg_addr,

    input [31:0] alu_pc,
    input [31:0] alu_inst,

    input [2:0]  alu_inst_type,
    input        alu_or_flag,

    //alu to alu_mem
    output reg [31:0] reg_wdata_o,     
    output reg        alu_rd_reg_en_o,                  
    output reg [4:0]  alu_rd_reg_addr_o,
    output reg [31:0] alu_pc_o,
    output reg [31:0] alu_inst_o
);

// I type inst
parameter INST_TYPE_I = 7'b0010011;
parameter INST_ADDI   = 3'b000;
parameter INST_SLTI   = 3'b010;
parameter INST_SLTIU  = 3'b011;
parameter INST_XORI   = 3'b100;
parameter INST_ORI    = 3'b110;
parameter INST_ANDI   = 3'b111;
parameter INST_SLLI   = 3'b001;
parameter INST_SRI    = 3'b101;

parameter INST_TYPE_R   = 7'b0110011;
// R type inst
parameter INST_ADD_SUB  = 3'b000;
parameter INST_SLL      = 3'b001;
parameter INST_SLT      = 3'b010;
parameter INST_SLTU     = 3'b011;
parameter INST_XOR      = 3'b100;
parameter INST_SR       = 3'b101;
parameter INST_OR       = 3'b110;
parameter INST_AND      = 3'b111;



wire [6:0] opcode = alu_inst[6:0];
wire [2:0] funct3 = alu_inst[14:12];
wire [6:0] funct7 = alu_inst[31:25];
wire [4:0] rd     = alu_inst[11:7];
wire [4:0] uimm   = alu_inst[19:15];


always @ (*) begin

    alu_rd_reg_en_o   = alu_rd_reg_en;
    alu_rd_reg_addr_o = alu_rd_reg_addr;
    alu_pc_o          = alu_pc;
    alu_inst_o        = alu_inst;
    
    case (opcode)
        INST_TYPE_I: begin
            case (funct3)
                INST_ORI: begin
                    reg_wdata_o = alu_op1 | alu_op2;
                end
                default:reg_wdata_o = 32'b0;
            endcase
        end
        default:reg_wdata_o = 32'b0;
    endcase
end

endmodule