module de(

    //from ifu_de
    input [31:0] de_pc,
    input [31:0] de_inst,

    //from regs

    input [31:0] rd_data1,
    input [31:0] rd_data2,

    //from bypass_alu
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
    output reg [2:0]  inst_type,
    output            or_flag,

    //to de_alu
    output reg [31:0] op1,
    output reg [31:0] op2,
    output reg        wr_reg_en,
    output reg [4:0]  wr_reg_addr,

    output reg [31:0] de_pc_o,
    output reg [31:0] de_inst_o
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


//inst type
wire ori_sign;
wire or_sign;
wire or_flag;
assign ori_sign = (opcode == INST_TYPE_I) && (funct3 == INST_ORI);
assign or_sign  = (opcode == INST_TYPE_R) && ((funct7 == 7'b0000000 || funct7 == 7'b0100000)) && (funct3 == INST_OR);
assign or_flag = ori_sign || or_sign;

reg [31:0] op1_in;
reg [31:0] op2_in;
reg [31:0] imm;

//rd_reg or imm and
//bypass techology

always @(*) begin
    if(rd_reg1_flag == 1'b1 && alu_wr_reg_en_o == 1'b1 && alu_wr_reg_addr_o == rd_addr1) begin
        op1_in = reg_wdata_o;
    end
    else if(rd_reg1_flag == 1'b1 && lsu_wr_reg_en_o == 1'b1 && lsu_wr_reg_addr_o == rd_addr1) begin
        op1_in = lsu_reg_wdata_o;
    end
    else if(rd_reg1_flag == 1'b1) begin
        op1_in = rd_data1;
    end
    else if(rd_reg1_flag == 1'b0) begin
        op1_in = imm;
    end
    else begin
        op1_in = 32'b0;
    end
end

always @(*) begin
    if(rd_reg2_flag == 1'b1 && alu_wr_reg_en_o == 1'b1 && alu_wr_reg_addr_o == rd_addr2) begin
        op2_in = reg_wdata_o;
    end
    else if(rd_reg2_flag == 1'b1 && lsu_wr_reg_en_o == 1'b1 && lsu_wr_reg_addr_o == rd_addr2) begin
        op2_in = lsu_reg_wdata_o;
    end
    else if(rd_reg2_flag == 1'b1) begin
        op2_in = rd_data2;
    end
    else if(rd_reg2_flag == 1'b0) begin
        op2_in = imm;
    end
    else begin
        op2_in = 32'b0;
    end
end

always @(*) begin
    de_pc_o      =  de_pc;
    de_inst_o    =  de_inst;
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
                INST_ORI: begin
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
        INST_TYPE_R: begin
            if(funct7 == 7'b0000000 || funct7 == 7'b0100000) begin
                case(funct3) 
                    INST_OR: begin
                        wr_reg_en    = 1'b1;
                        wr_reg_addr  = rd;
                        rd_addr1     = rs1;
                        rd_addr2     = rs2;
                        imm          = 32'b0;
                        rd_reg1_flag = 1'b1;
                        rd_reg2_flag = 1'b1;
                        op1         = op1_in;
                        op2         = op2_in; 
                        inst_type   = 3'd2;
                    end
                    default: begin
                        wr_reg_en   = 1'b0;
                        wr_reg_addr = 5'b0;
                        rd_addr1    = 5'b0;
                        rd_addr2    = 5'b0;
                        imm          = 32'b0;
                        rd_reg1_flag = 1'b0;
                        rd_reg2_flag = 1'b0;
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