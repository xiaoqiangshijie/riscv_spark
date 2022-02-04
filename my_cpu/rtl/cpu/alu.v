module alu(

    //from de_alu
    input [31:0] alu_op1,
    input [31:0] alu_op2,
    input [31:0] alu_op1_jump,
    input [31:0] alu_op2_jump,
    input        alu_wr_reg_en,
    input [4:0]  alu_wr_reg_addr,

    input [31:0] alu_pc,
    input [31:0] alu_inst,

    input [2:0]  alu_inst_type,
    input        alu_or_flag,

    //alu to ctrl
    output reg          jump_flag,
    output reg [31:0]   jump_addr,

    //alu to alu_mem
    output reg [31:0] reg_wdata_o,     
    output reg        alu_wr_reg_en_o,                  
    output reg [4:0]  alu_wr_reg_addr_o,
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

parameter INST_TYPE_R_M   = 7'b0110011;
// R type inst
parameter INST_ADD_SUB  = 3'b000;
parameter INST_SLL      = 3'b001;
parameter INST_SLT      = 3'b010;
parameter INST_SLTU     = 3'b011;
parameter INST_XOR      = 3'b100;
parameter INST_SR       = 3'b101;
parameter INST_OR       = 3'b110;
parameter INST_AND      = 3'b111;

//M type inst
parameter INST_MUL    = 3'b000;
parameter INST_MULH   = 3'b001;
parameter INST_MULHSU = 3'b010;
parameter INST_MULHU  = 3'b011;
parameter INST_DIV    = 3'b100;
parameter INST_DIVU   = 3'b101;
parameter INST_REM    = 3'b110;
parameter INST_REMU   = 3'b111;

//Jal type
parameter INST_JAL      = 7'b1101111;
parameter INST_JALR     = 7'b1100111;

// J type inst
parameter INST_TYPE_B   = 7'b1100011;
parameter INST_BEQ      = 3'b000;
parameter INST_BNE      = 3'b001;
parameter INST_BLT      = 3'b100;
parameter INST_BGE      = 3'b101;
parameter INST_BLTU     = 3'b110;
parameter INST_BGEU     = 3'b111;

// NOP type inst
parameter INST_NOP_OP   = 7'b0000001;


wire [6:0] opcode = alu_inst[6:0];
wire [2:0] funct3 = alu_inst[14:12];
wire [6:0] funct7 = alu_inst[31:25];
wire [4:0] rd     = alu_inst[11:7];
wire [4:0] uimm   = alu_inst[19:15];



///////////////////////operate data///////////////////////

wire op1_ge_op2_signed;
wire op1_ge_op2_unsigned;
wire [31:0] sri_shift_mask;
wire [31:0] sr_shift_mask;
wire [31:0] sri_shift;
wire [31:0] sr_shift;

//mul wire
reg [31:0] mul_op1;
reg [31:0] mul_op2;
wire [31:0] reg1_data_invert;
wire [31:0] reg2_data_invert;
wire [63:0] mul_temp;
wire [63:0] mul_temp_invert;
wire [31:0] op1_add_op2_res;
wire [31:0] op1_jump_add_op2_jump_res;
wire        op1_eq_op2;


assign op1_add_op2_res               = alu_op1 + alu_op2;
assign op1_jump_add_op2_jump_res     = alu_op1_jump + alu_op2_jump;

assign op1_eq_op2 = (alu_op1 == alu_op2);

assign op1_ge_op2_signed   = $signed(alu_op1) >= $signed(alu_op2);
assign op1_ge_op2_unsigned = alu_op1 >= alu_op2;
assign sri_shift_mask      = 32'hffffffff >> alu_inst[24:20];
assign sr_shift_mask       = 32'hffffffff >> alu_op2[4:0];
assign sri_shift           = alu_op1 >> alu_inst[24:20];
assign sr_shift            = alu_op1 >> alu_op2[4:0];
assign reg1_data_invert    = ~alu_op1 + 1;
assign reg2_data_invert    = ~alu_op2 + 1;
assign mul_temp            = mul_op1 * mul_op2;
assign mul_temp_invert     = ~mul_temp + 1;

always @ (*) begin

    alu_wr_reg_en_o   = alu_wr_reg_en;
    alu_wr_reg_addr_o = alu_wr_reg_addr;
    alu_pc_o          = alu_pc;
    alu_inst_o        = alu_inst;
    
    case (opcode)
        INST_TYPE_I: begin
            case (funct3)
                INST_ADDI: begin
                    reg_wdata_o = alu_op1 + alu_op2;
                    jump_flag = 1'b0;
                    jump_addr = 32'b0;
                end
                INST_SLTI: begin
                    reg_wdata_o = {32{(~op1_ge_op2_signed)}} & 32'h1;
                    jump_flag = 1'b0;
                    jump_addr = 32'b0;
                end
                INST_SLTIU: begin
                    reg_wdata_o = {32{(~op1_ge_op2_unsigned)}} & 32'h1;
                    jump_flag = 1'b0;
                    jump_addr = 32'b0;
                end
                INST_XORI: begin
                    reg_wdata_o = alu_op1 ^ alu_op2;
                    jump_flag = 1'b0;
                end
                INST_ORI: begin
                    reg_wdata_o = alu_op1 | alu_op2;
                    jump_flag = 1'b0;
                    jump_addr = 32'b0;
                end
                INST_ANDI: begin
                    reg_wdata_o = alu_op1 & alu_op2;
                    jump_flag = 1'b0;
                    jump_addr = 32'b0;
                end
                INST_SLLI: begin
                    reg_wdata_o = alu_op1 << alu_inst[24:20];
                    jump_flag = 1'b0;
                    jump_addr = 32'b0;
                end
                INST_SRI: begin
                    if (alu_inst[30] == 1'b1) begin
                        reg_wdata_o = (sri_shift & sri_shift_mask) | ({32{alu_op1[31]}} & (~sri_shift_mask));
                    end else begin
                        reg_wdata_o = alu_op1 >> alu_inst[24:20];
                    end
                    jump_flag = 1'b0;
                    jump_addr = 32'b0;
                end
                default: begin
                    reg_wdata_o = 32'b0;
                    jump_flag = 1'b0;
                    jump_addr = 32'b0;
                end
            endcase
        end
        INST_TYPE_R_M:begin
            if ((funct7 == 7'b0000000) || (funct7 == 7'b0100000)) begin
                case (funct3)
                    INST_ADD_SUB:begin
                        if (alu_inst[30] == 1'b0) begin
                            reg_wdata_o = alu_op1 + alu_op2;
                        end else begin
                            reg_wdata_o = alu_op1 - alu_op2;
                        end
                        jump_flag = 1'b0;
                        jump_addr = 32'b0;
                    end
                    INST_SLL:begin
                        reg_wdata_o = alu_op1 << alu_op2[4:0];
                        jump_flag = 1'b0;
                        jump_addr = 32'b0;
                    end
                    INST_SLT:begin
                        reg_wdata_o = {32{(~op1_ge_op2_signed)}} & 32'h1;
                        jump_flag = 1'b0;
                        jump_addr = 32'b0;
                    end
                    INST_SLTU:begin
                        reg_wdata_o = {32{(~op1_ge_op2_unsigned)}} & 32'h1;
                        jump_flag = 1'b0;
                        jump_addr = 32'b0;
                    end
                    INST_XOR:begin
                        reg_wdata_o = alu_op1 ^ alu_op2;
                        jump_flag = 1'b0;
                        jump_addr = 32'b0;
                    end
                    INST_SR:begin    //SRA_SRL
                        if (alu_inst[30] == 1'b1) begin
                            reg_wdata_o = (sr_shift & sr_shift_mask) | ({32{alu_op1[31]}} & (~sr_shift_mask));
                        end else begin
                            reg_wdata_o = alu_op1 >> alu_op2[4:0];
                        end
                        jump_flag = 1'b0;
                        jump_addr = 32'b0;
                    end
                    INST_OR:begin
                        reg_wdata_o = alu_op1 | alu_op2;
                        jump_flag = 1'b0;
                        jump_addr = 32'b0;
                    end
                    INST_AND:begin
                        reg_wdata_o = alu_op1 & alu_op2;
                        jump_flag = 1'b0;
                        jump_addr = 32'b0;
                    end
            
                    default:begin
                        reg_wdata_o = 32'b0;
                        jump_flag = 1'b0;
                        jump_addr = 32'b0;
                    end
                endcase
            end
            //MUL type inst
            else if(funct7 == 7'b0000001) begin
                case(funct3)
                    INST_MUL:begin
                        mul_op1     = (alu_op1[31] == 1'b1)? reg1_data_invert: alu_op1;
                        mul_op2     = (alu_op2[31] == 1'b1)? reg2_data_invert: alu_op2;
                        jump_flag = 1'b0;
                        jump_addr = 32'b0;
                        case ({alu_op1[31], alu_op2[31]})
                            2'b00: begin
                                reg_wdata_o = mul_temp[31:0];
                            end
                            2'b11: begin
                                reg_wdata_o = mul_temp[31:0];
                            end
                            2'b10: begin
                                reg_wdata_o = mul_temp_invert[31:0];
                            end
                            default: begin
                                reg_wdata_o = mul_temp_invert[31:0];
                            end
                        endcase
                    end
                    INST_MULHU:begin
                        mul_op1     = alu_op1;
                        mul_op2     = alu_op2;
                        reg_wdata_o = mul_temp[63:32];
                        jump_flag   = 1'b0;
                        jump_addr   = 32'b0;
                    end
                    INST_MULH:begin
                        mul_op1     = (alu_op1[31] == 1'b1)? reg1_data_invert: alu_op1;
                        mul_op2     = (alu_op2[31] == 1'b1)? reg2_data_invert: alu_op2;
                        jump_flag   = 1'b0;
                        jump_addr   = 32'b0;
                        case ({alu_op1[31], alu_op2[31]})
                            2'b00: begin
                                reg_wdata_o = mul_temp[63:32];
                            end
                            2'b11: begin
                                reg_wdata_o = mul_temp[63:32];
                            end
                            2'b10: begin
                                reg_wdata_o = mul_temp_invert[63:32];
                            end
                            default: begin
                                reg_wdata_o = mul_temp_invert[63:32];
                            end
                        endcase
                    end
                    INST_MULHSU:begin
                        mul_op1     = (alu_op1[31] == 1'b1)? reg1_data_invert: alu_op1;
                        mul_op2     =  alu_op2;
                        jump_flag   = 1'b0;
                        jump_addr   = 32'b0;
                        if (alu_op1[31] == 1'b1) begin
                            reg_wdata_o = mul_temp_invert[63:32];
                        end else begin
                            reg_wdata_o = mul_temp[63:32];
                        end
                    end
                    default:begin
                        mul_op1     = 32'b0;
                        mul_op2     = 32'b0;
                        reg_wdata_o = 32'b0;
                        jump_flag   = 1'b0;
                        jump_addr   = 32'b0;
                    end
                endcase
            end
            else begin
                mul_op1     = 32'b0;
                mul_op2     = 32'b0;
                reg_wdata_o = 32'b0;
                jump_flag   = 1'b0;
                jump_addr   = 32'b0;
            end
        end
        INST_TYPE_B: begin
            case (funct3)
                INST_BEQ: begin
                    reg_wdata_o = 32'b0;
                    jump_flag = op1_eq_op2;
                    jump_addr = {32{op1_eq_op2}} & op1_jump_add_op2_jump_res;
                end
                INST_BNE: begin
                    reg_wdata_o = 32'b0;
                    jump_flag = (~op1_eq_op2);
                    jump_addr = {32{(~op1_eq_op2)}} & op1_jump_add_op2_jump_res;
                end
                INST_BLT: begin
                    reg_wdata_o = 32'b0;
                    jump_flag = (~op1_ge_op2_signed);
                    jump_addr = {32{(~op1_ge_op2_signed)}} & op1_jump_add_op2_jump_res;
                end
                INST_BGE: begin
                    reg_wdata_o = 32'b0;
                    jump_flag = (op1_ge_op2_signed);
                    jump_addr = {32{(op1_ge_op2_signed)}} & op1_jump_add_op2_jump_res;
                end
                INST_BLTU: begin
                    reg_wdata_o = 32'b0;
                    jump_flag = (~op1_ge_op2_unsigned);
                    jump_addr = {32{(~op1_ge_op2_unsigned)}} & op1_jump_add_op2_jump_res;
                end
                INST_BGEU: begin
                    reg_wdata_o = 32'b0;
                    jump_flag = (op1_ge_op2_unsigned);
                    jump_addr = {32{(op1_ge_op2_unsigned)}} & op1_jump_add_op2_jump_res;
                end
                default: begin
                    reg_wdata_o = 32'b0;
                    jump_flag   = 1'b0;
                    jump_addr   = 32'b0;
                end
            endcase
        end
        INST_JAL, INST_JALR: begin
                jump_flag = 1'b1;
                jump_addr = op1_jump_add_op2_jump_res;
                reg_wdata_o = op1_add_op2_res;
        end
        INST_NOP_OP: begin
            reg_wdata_o = 32'b0;
            jump_flag   = 1'b0;
            jump_addr = 32'b0;
        end
        default: begin
            jump_flag   = 1'b0;
            jump_addr   = 32'b0;
            reg_wdata_o = 32'b0;
        end







    endcase
end

endmodule