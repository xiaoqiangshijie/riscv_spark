module de(

    //from ifu_de
    input [31:0] de_pc,
    input [31:0] de_inst,

    //from regs
    input [31:0] rd_data1,
    input [31:0] rd_data2,

    //from bypass_alu
    input        alu_load_flag,
    input [31:0] reg_wdata_o,     
    input        alu_wr_reg_en_o,                  
    input [4:0]  alu_wr_reg_addr_o,

    //from bypass_lsu
    input [31:0] lsu_reg_wdata_o,     
    input        lsu_wr_reg_en_o,                  
    input [4:0]  lsu_wr_reg_addr_o,

    //to regs
    output reg [4:0]rd_addr1,
    output reg [4:0]rd_addr2,
    output reg      rd_reg1_flag,
    output reg      rd_reg2_flag,

    //to de_alu inst type
    output reg [2:0]  inst_type,      // 1=I 2=R 3=jump 4=Store 5=Load 
    output            or_flag,

    //to de_alu
    output reg [31:0] op1,
    output reg [31:0] op2,
    output reg [31:0] rd_data1_o,
    output reg [31:0] rd_data2_o,

    output reg [31:0] op1_jump,
    output reg [31:0] op2_jump,

    output reg        wr_reg_en,
    output reg [4:0]  wr_reg_addr,

    output reg [31:0] de_pc_o,
    output reg [31:0] de_inst_o,

    //to ctrl 
    output reg        de_stall
);

wire[6:0] opcode = de_inst[6:0];
wire[2:0] funct3 = de_inst[14:12];
wire[6:0] funct7 = de_inst[31:25];
wire[4:0] rd  = de_inst[11:7];
wire[4:0] rs1 = de_inst[19:15];
wire[4:0] rs2 = de_inst[24:20];

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

parameter INST_TYPE_R_M = 7'b0110011;

parameter INST_TYPE_M   = 7'b0110011;
//M type inst
parameter INST_MUL    = 3'b000;
parameter INST_MULH   = 3'b001;
parameter INST_MULHSU = 3'b010;
parameter INST_MULHU  = 3'b011;
parameter INST_DIV    = 3'b100;
parameter INST_DIVU   = 3'b101;
parameter INST_REM    = 3'b110;
parameter INST_REMU   = 3'b111;

// R type inst
parameter INST_ADD_SUB  = 3'b000;
parameter INST_SLL      = 3'b001;
parameter INST_SLT      = 3'b010;
parameter INST_SLTU     = 3'b011;
parameter INST_XOR      = 3'b100;
parameter INST_SR       = 3'b101;
parameter INST_OR       = 3'b110;
parameter INST_AND      = 3'b111;

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

// L type inst
parameter INST_TYPE_L   = 7'b0000011;
parameter INST_LB       = 3'b000;
parameter INST_LH       = 3'b001;
parameter INST_LW       = 3'b010;
parameter INST_LBU      = 3'b100;
parameter INST_LHU      = 3'b101;

// S type inst
parameter INST_TYPE_S   = 7'b0100011;
parameter INST_SB       = 3'b000;
parameter INST_SH       = 3'b001;
parameter INST_SW       = 3'b010;

//NOP type
parameter INST_NOP_OP   = 7'b0000001;

//LUI and AUIPC type
parameter INST_LUI      = 7'b0110111;
parameter INST_AUIPC    = 7'b0010111;



//inst type
wire ori_sign;
wire or_sign;
wire or_flag;
assign ori_sign = (opcode == INST_TYPE_I) && (funct3 == INST_ORI);
assign or_sign  = (opcode == INST_TYPE_R_M) && ((funct7 == 7'b0000000 || funct7 == 7'b0100000)) && (funct3 == INST_OR);
assign or_flag = ori_sign || or_sign;

reg [31:0] op1_in;
reg [31:0] op2_in;
reg [31:0] imm;

//rd_reg or imm and
//bypass techology

always @(*) begin
    if(rd_reg1_flag == 1'b1 && alu_wr_reg_en_o == 1'b1 && alu_wr_reg_addr_o == rd_addr1) begin
        op1_in      = reg_wdata_o;
    end
    else if(rd_reg1_flag == 1'b1 && lsu_wr_reg_en_o == 1'b1 && lsu_wr_reg_addr_o == rd_addr1) begin
        op1_in      = lsu_reg_wdata_o;
    end
    else if(rd_reg1_flag == 1'b1) begin
        op1_in      = rd_data1;
    end
    else if(rd_reg1_flag == 1'b0) begin
        op1_in      = imm;
    end
    else begin
        op1_in      = 32'b0;
    end
end

always @(*) begin
    if(rd_reg2_flag == 1'b1 && alu_wr_reg_en_o == 1'b1 && alu_wr_reg_addr_o == rd_addr2) begin
        op2_in     = reg_wdata_o;
    end
    else if(rd_reg2_flag == 1'b1 && lsu_wr_reg_en_o == 1'b1 && lsu_wr_reg_addr_o == rd_addr2) begin
        op2_in      = lsu_reg_wdata_o;
    end
    else if(rd_reg2_flag == 1'b1) begin
        op2_in      = rd_data2;
    end
    else if(rd_reg2_flag == 1'b0) begin
        op2_in      = imm;
    end
    else begin
        op2_in      = 32'b0;
    end
end

//load bypass techology
wire reg1_load_related_stall;
wire reg2_load_related_stall;

assign reg1_load_related_stall = (alu_load_flag && rd_reg1_flag == 1'b1 && rd_addr1 == alu_wr_reg_addr_o);
assign reg2_load_related_stall = (alu_load_flag && rd_reg2_flag == 1'b1 && rd_addr2 == alu_wr_reg_addr_o);

assign de_stall = reg1_load_related_stall | reg2_load_related_stall;

// decoding inst
always @(*) begin
    de_pc_o      =  de_pc;
    de_inst_o    =  de_inst;
    rd_data1_o   =  op1_in;
    rd_data2_o   =  op2_in;
    op1          =  32'b0;
    op2          =  32'b0;
    wr_reg_en    =  1'b0;
    wr_reg_addr  =  32'b0;
    inst_type    =  3'b0;
    imm          =  32'b0;
    rd_reg1_flag =  1'b0;
    rd_reg2_flag =  1'b0;
    case(opcode)
        INST_TYPE_I: begin
            case(funct3) 
                INST_ADDI, INST_SLTI, INST_SLTIU, INST_XORI, INST_ORI, INST_ANDI, INST_SLLI, INST_SRI: begin
                    wr_reg_en    = 1'b1;
                    wr_reg_addr  = rd;
                    rd_addr1     = rs1;
                    rd_addr2     = 5'b0;
                    imm          = {{20{de_inst[31]}}, de_inst[31:20]};
                    rd_reg1_flag = 1'b1;
                    rd_reg2_flag = 1'b0;
                    op1          = op1_in;
                    op2          = op2_in;
                    inst_type    = 3'd1;
                end
                default: begin
                    wr_reg_en    = 1'b0;
                    wr_reg_addr  = 5'b0;
                    rd_addr1     = 5'b0;
                    rd_addr2     = 5'b0;
                    imm          = 32'b0;
                    rd_reg1_flag = 1'b0;
                    rd_reg2_flag = 1'b0;
                    op1          = 32'b0;
                    op2          = 32'b0; 
                    inst_type    = 3'd0;
                end
            endcase
        end
        INST_TYPE_R_M: begin
            if(funct7 == 7'b0000000 || funct7 == 7'b0100000) begin
                case(funct3) 
                    INST_ADD_SUB,INST_SLL,INST_SLT,INST_SLTU,INST_XOR,INST_SR,INST_OR,INST_AND: begin
                        wr_reg_en    = 1'b1;
                        wr_reg_addr  = rd;
                        rd_addr1     = rs1;
                        rd_addr2     = rs2;
                        imm          = 32'b0;
                        rd_reg1_flag = 1'b1;
                        rd_reg2_flag = 1'b1;
                        op1          = op1_in;
                        op2          = op2_in; 
                        inst_type    = 3'd2;
                    end
                    default: begin
                        wr_reg_en    = 1'b0;
                        wr_reg_addr  = 5'b0;
                        rd_addr1     = 5'b0;
                        rd_addr2     = 5'b0;
                        imm          = 32'b0;
                        rd_reg1_flag = 1'b0;
                        rd_reg2_flag = 1'b0;
                        op1          = 32'b0;
                        op2          = 32'b0; 
                        inst_type    = 3'd0;
                    end
                endcase
            end
            else if(funct7 == 7'b0000001) begin
                case (funct3)
                    INST_MUL, INST_MULHU, INST_MULH, INST_MULHSU: begin
                        wr_reg_en    = 1'b1;
                        wr_reg_addr  = rd;
                        rd_addr1     = rs1;
                        rd_addr2     = rs2;
                        imm          = 32'b0;
                        rd_reg1_flag = 1'b1;
                        rd_reg2_flag = 1'b1;
                        op1          = op1_in;
                        op2          = op2_in; 
                        inst_type    = 3'd2;
                    end
                    // INST_DIV, INST_DIVU, INST_REM, INST_REMU: begin
                    //     reg_we_o = `WriteDisable;
                    //     reg_waddr_o = rd;
                    //     reg1_raddr_o = rs1;
                    //     reg2_raddr_o = rs2;
                    //     op1_o = reg1_rdata_i;
                    //     op2_o = reg2_rdata_i;
                    //     op1_jump_o = inst_addr_i;
                    //     op2_jump_o = 32'h4;
                    // end
                    default: begin
                        wr_reg_en    = 1'b0;
                        wr_reg_addr  = 5'b0;
                        rd_addr1     = 5'b0;
                        rd_addr2     = 5'b0;
                        imm          = 32'b0;
                        rd_reg1_flag = 1'b0;
                        rd_reg2_flag = 1'b0;
                        op1          = 32'b0;
                        op2          = 32'b0; 
                        inst_type    = 3'd0;
                    end
                endcase
            end
        end
        INST_TYPE_B: begin
            case (funct3)
                INST_BEQ, INST_BNE, INST_BLT, INST_BGE, INST_BLTU, INST_BGEU: begin
                    wr_reg_en    = 1'b0;
                    wr_reg_addr  = rd;
                    rd_addr1     = rs1;
                    rd_addr2     = rs2;
                    imm          = 32'b0;
                    rd_reg1_flag = 1'b1;
                    rd_reg2_flag = 1'b1;
                    op1          = op1_in;
                    op2          = op2_in; 
                    inst_type    = 3'd3;
                    op1_jump     = de_pc;
                    op2_jump     = {{20{de_inst[31]}}, de_inst[7], de_inst[30:25], de_inst[11:8], 1'b0};
                end
                default: begin
                    rd_addr1 = 32'b0;
                    rd_addr2 = 32'b0;
                    wr_reg_en = 1'b0;
                    wr_reg_addr = 32'b0;
                end
            endcase
        end
        INST_JAL: begin
            wr_reg_en    = 1'b1;
            wr_reg_addr  = rd;
            rd_addr1     = rs1;
            rd_addr2     = rs2;
            imm          = 32'b0;
            rd_reg1_flag = 1'b0;
            rd_reg2_flag = 1'b0;
            op1          = de_pc;
            op2          = 32'h4;
            inst_type    = 3'd3;
            op1_jump     = de_pc;
            op2_jump     = {{12{de_inst[31]}}, de_inst[19:12], de_inst[20], de_inst[30:21], 1'b0};
        end
        INST_JALR: begin
            wr_reg_en    = 1'b1;
            wr_reg_addr  = rd;
            rd_addr1     = rs1;
            rd_addr2     = rs2;
            imm          = 32'b0;
            rd_reg1_flag = 1'b1;
            rd_reg2_flag = 1'b0;
            op1          = de_pc;
            op2          = 32'h4;
            inst_type    = 3'd3;
            op1_jump     = op1_in;
            op2_jump     = {{20{de_inst[31]}}, de_inst[31:20]};
        end
        INST_NOP_OP:begin
            wr_reg_en    = 1'b0;
            wr_reg_addr  = 5'b0;
            rd_addr1     = 5'b0;
            rd_addr2     = 5'b0;
            imm          = 32'b0;
            rd_reg1_flag = 1'b0;
            rd_reg2_flag = 1'b0; 
            op1          = 32'b0;
            op2          = 32'b0; 
            inst_type    = 3'd0;
        end
        INST_TYPE_L: begin
            case (funct3)
                INST_LB, INST_LH, INST_LW, INST_LBU, INST_LHU: begin
                    wr_reg_en    = 1'b1;
                    wr_reg_addr  = rd;
                    rd_addr1     = rs1;
                    rd_addr2     = 5'b0;
                    imm          = 32'b0;
                    rd_reg1_flag = 1'b1;
                    rd_reg2_flag = 1'b0;
                    op1          = op1_in;
                    op2          = {{20{de_inst[31]}}, de_inst[31:20]}; 
                    inst_type    = 3'd5;
                end
                default: begin
                    wr_reg_en    = 1'b0;
                    wr_reg_addr  = 5'b0;
                    rd_addr1     = 5'b0;
                    rd_addr2     = 5'b0;
                    imm          = 32'b0;
                    rd_reg1_flag = 1'b0;
                    rd_reg2_flag = 1'b0; 
                    op1          = 32'b0;
                    op2          = 32'b0; 
                    inst_type    = 3'd0;
                end
            endcase
        end
        INST_TYPE_S: begin
            case (funct3)
                INST_SB, INST_SW, INST_SH: begin
                    wr_reg_en    = 1'b0;
                    wr_reg_addr  = 5'b0;
                    rd_addr1     = rs1;
                    rd_addr2     = rs2;
                    imm          = 32'b0;
                    rd_reg1_flag = 1'b1;
                    rd_reg2_flag = 1'b1; 
                    op1          = op1_in;
                    op2          = {{20{de_inst[31]}}, de_inst[31:25], de_inst[11:7]}; 
                    inst_type    = 3'd4;
                end
                default: begin
                    wr_reg_en    = 1'b0;
                    wr_reg_addr  = 5'b0;
                    rd_addr1     = 5'b0;
                    rd_addr2     = 5'b0;
                    imm          = 32'b0;
                    rd_reg1_flag = 1'b0;
                    rd_reg2_flag = 1'b0; 
                    op1          = 32'b0;
                    op2          = 32'b0; 
                    inst_type    = 3'd0;
                end
            endcase
        end
        INST_LUI: begin
                wr_reg_en    = 1'b1;
                wr_reg_addr  = rd;
                rd_addr1     = rs1;
                rd_addr2     = rs2;
                imm          = 32'b0;
                rd_reg1_flag = 1'b0;
                rd_reg2_flag = 1'b0; 
                op1          = {de_inst[31:12], 12'b0};
                op2          = 32'b0; 
                inst_type    = 3'd6;
        end
        INST_AUIPC: begin
                wr_reg_en    = 1'b1;
                wr_reg_addr  = rd;
                rd_addr1     = rs1;
                rd_addr2     = rs2;
                imm          = 32'b0;
                rd_reg1_flag = 1'b0;
                rd_reg2_flag = 1'b0; 
                op1          = de_pc;
                op2          = {de_inst[31:12], 12'b0}; 
                inst_type    = 3'd5;
        end
        default:begin
            wr_reg_en    = 1'b0;
            wr_reg_addr  = 5'b0;
            rd_addr1     = 5'b0;
            rd_addr2     = 5'b0;
            imm          = 32'b0;
            rd_reg1_flag = 1'b0;
            rd_reg2_flag = 1'b0;
            op1          = 32'b0;
            op2          = 32'b0; 
            op1_jump     = 32'b0;
            op2_jump     = 32'b0;
            inst_type    = 3'd0;
        end
    endcase
end

endmodule