//This confidential and proprietary software may be used only as //authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is //applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized //copies.
//-------------------------------------------------------------
//File	: de.v
//Author	: Zhurong
//Date	: 08/12/2021
//Version	: 0.4
//Description	  : This file is module for DE, the function of it is to
//decode the instrution and generate the immediate and the flag signal control
//module used.
//The de module performs the following functions:
//1. Decode the instruction according to the architecture specification.
//2. Transmit the decoded digital segment to the control module.
//3. Generate an immediate number according to the type of instruction.
//4. Read and write the GPR general register according to the decoded address of the read and write general register.
//5. Access the CSR register according to the decoded access CSR address.
//6. Support additional functions to identify that the current instruction is LS related instruction, and the identification signal is used by other modules.
//-------------------------------------------------------------
//Modification History:
//Date	By	Version	Change Description
//07/23/2021   Zhurong   0.1           Original
//07/27/2021   Zhurong   0.2           fix the bug-can not decode the srai and
//                                     the srli.delete the condition signal
//                                     and deal with the coding style.
//08/11/2021   Zhurong   0.3           sync to the mas    
//08/12/2021   Zhurong   0.4           add commit        
//08/16/2021   fengyi    0.4           add ecall             
//-------------------------------------------------------------
module de(
input  wire[31:0]  ifu_de_ins               ,//instruct
input  wire        lsu_wb_valid             ,
input  wire        br_ctrl_flush            ,
//with gpr
output wire[4:0]   de_reg1_read_addr        ,//read reg1 address
output wire[4:0]   de_reg2_read_addr        ,//read reg2 address
output wire[4:0]   de_reg3_write_addr       ,//write reg address
output wire        de_gpr_we                ,//write gpr enable signal
//with alu
output reg[31:0]   de_alu_imm               ,//generated imm
output wire        de_alu_l_flag            ,
output wire        de_alu_s_flag            ,
output wire [1:0]  de_alu_ls_size           ,
//with control
output wire        jal                      ,
output wire        jalr                     ,
output wire        de_ctrl_reg2_flag        ,//1 means reg2 is used in the operation_ Data, 0 indicates using DC_ alu_ IMM. The corresponding instructions are addi, ori, xori, SRLI, srai, slli, SLTI, sltiu, Lui, addi, auipc, Sb, SH, SW, LB, LH, LW, LHU
output wire        de_ctrl_lui_flag         ,//1 indicates that the Lui operation is valid, 0 indicates that it is invalid, and the corresponding instruction has Lui
output wire        de_ctrl_shift_flag       ,//1 indicates that the shift operation is valid, 0 indicates that it is invalid, and the corresponding instructions are SRL, SRLI, SRA, srai, SLL, slli, Lui
output wire        de_ctrl_shift_right_flag ,//1 indicates the right shift operation, 0 indicates the left shift operation, and the corresponding instructions are the same as above
output wire        de_ctrl_shift_logic      ,//1 indicates logical shift, 0 indicates arithmetic shift, and the corresponding instructions are the same as above
output wire [1:0]  de_ctrl_comparator_flag  ,//1 indicates that the comparison operation is valid, 0 indicates that the comparison operation is invalid, and the corresponding instructions are SLT, SLTI, SLTU and sltiu
output wire        de_ctrl_and_flag         ,//1 indicates that the bitwise and operation are valid, 0 indicates that the bitwise OR operation is invalid, and the corresponding instruction and, Andi
output wire        de_ctrl_or_flag          ,//1 indicates that the bitwise OR operation is valid, 0 indicates that the bitwise OR operation is invalid, and the corresponding instructions are or, ori
output wire        de_ctrl_xor_flag         ,//1 indicates that the bitwise XOR operation is valid, 0 indicates that the bitwise XOR operation is invalid, and the corresponding instructions are XOR and xori
output wire        de_ctrl_adder_flag       ,//1 indicates that the addition operation is performed, 0 indicates that the addition operation is invalid, and the corresponding instructions are add, addi, Sb, SH, SW, LB, LH, LW, LBU, LHU
output wire        de_ctrl_sub_flag         ,//1 indicates subtraction, 0 indicates invalid subtraction, and the corresponding instruction has sub
output wire        de_ctrl_auipc_flag       ,//1 indicates the operation of adding immediate number to PC, and the corresponding instruction is auipc
output reg[2:0]    de_ctrl_br_typ           ,//beq001,bne010,blt011,bge100,bltu101,bgeu110
output reg[1:0]    de_ctrl_lsu_flag         ,//load is 01 ,store is 10 ,disable is 00
output wire[1:0]   de_ctrl_lsu_size         ,
output wire        de_ctrl_lsu_unsign       ,
output wire        de_ctrl_int_ebreak       ,//ebreak instruction
output wire        de_ctrl_int_ecall        , //ecall instruction
output wire        de_ctrl_int_mret         , //mret signal flag
output wire        de_ctrl_illegal          , //illegal inst
//with csr
output wire[31:0]  de_csr_zimm       ,//Pass the Zimm after 0 in the high position to CSR for processing
output wire        de_csr_wr_1       ,
output wire        de_csr_wr_0       ,
output wire        de_csr_we         ,
output wire        de_csr_imm_en     ,//csrrwi csrrsi csrrci
output wire[11:0]  de_csr_idx        ,//Read / write CSR address
//minidecode
output wire        de_lsu_flag
);
//localparam
// I type inst
  localparam INST_TYPE_I= 7'b0010011 ;
  localparam INST_ADDI  = 3'b000     ;
  localparam INST_SLTI  = 3'b010     ;
  localparam INST_SLTIU = 3'b011     ;
  localparam INST_XORI  = 3'b100     ;
  localparam INST_ORI   = 3'b110     ;
  localparam INST_ANDI  = 3'b111     ;
  localparam INST_SLLI  = 3'b001     ;
  localparam INST_SRI   = 3'b101     ;

// l type inst
  localparam INST_TYPE_L= 7'b0000011 ;
  localparam INST_LB    = 3'b000     ;
  localparam INST_LH    = 3'b001     ;
  localparam INST_LW    = 3'b010     ;
  localparam INST_LBU   = 3'b100     ;
  localparam INST_LHU   = 3'b101     ;

// S type inst
  localparam INST_TYPE_S = 7'b0100011 ;
  localparam INST_SB     = 3'b000     ;
  localparam INST_SH     = 3'b001     ;
  localparam INST_SW     = 3'b010     ;
// R  type inst
  localparam INST_TYPE_R  = 7'b0110011 ;
  localparam INST_ADD_SUB = 3'b000     ;
  localparam INST_SLL     = 3'b001     ;
  localparam INST_SLT     = 3'b010     ;
  localparam INST_SLTU    = 3'b011     ;
  localparam INST_XOR     = 3'b100     ;
  localparam INST_SRL_SRA = 3'b101     ;
  localparam INST_OR      = 3'b110     ;
  localparam INST_AND     = 3'b111     ;

// J type inst
  localparam INST_JAL   = 7'b1101111 ;
  localparam INST_JALR  = 7'b1100111 ;
// LUI AUIPC FENCE
  localparam INST_LUI   = 7'b0110111 ;
  localparam INST_AUIPC = 7'b0010111 ;
  localparam INST_FENCE = 7'b0001111 ;
// B type inst
  localparam INST_TYPE_B= 7'b1100011 ;
  localparam INST_BEQ   = 3'b000     ;
  localparam INST_BNE   = 3'b001     ;
  localparam INST_BLT   = 3'b100     ;
  localparam INST_BGE   = 3'b101     ;
  localparam INST_BLTU  = 3'b110     ;
  localparam INST_BGEU  = 3'b111     ;
// CSR inst
  localparam INST_CSR   = 7'b1110011 ;
  localparam INST_CSRRW = 3'b001     ;
  localparam INST_CSRRS = 3'b010     ;
  localparam INST_CSRRC = 3'b011     ;
  localparam INST_CSRRWI= 3'b101     ;
  localparam INST_CSRRSI= 3'b110     ;
  localparam INST_CSRRCI= 3'b111     ;

  wire[6:0] opcode ;
  wire[2:0] funct3 ;
  wire[6:0] funct7 ;
  wire[4:0] rd     ;
  wire[4:0] rs1    ;
  wire[4:0] rs2    ;
  wire csr_cond    ;
  wire lui         ;
  wire auipc       ;
  wire beq         ;
  wire bne         ;
  wire blt         ;
  wire bge         ;
  wire bltu        ;
  wire bgeu        ;
  wire lb          ;
  wire lh          ;
  wire lw          ;
  wire lbu         ;
  wire lhu         ;
  wire sb          ;
  wire sh          ;
  wire sw          ;
  wire add         ;
  wire sub         ;
  wire sll         ;
  wire slt         ;
  wire sltu        ;
  wire inst_xor    ;
  wire inst_or     ;
  wire inst_and    ;
  wire srl         ;
  wire srai        ;
  wire sra         ;
  wire srli        ;
  wire fence       ;
  wire fence_i     ;
//  wire ebreak      ;
//  wire ecall       ;
  wire csrrw       ;
  wire csrrs       ;
  wire csrrc       ;
  wire csrrwi      ;
  wire csrrsi      ;
  wire csrrci      ;
  wire addi        ;
  wire slti        ;
  wire sltiu       ;
  wire xori        ;
  wire ori         ;
  wire andi        ;
  wire slli        ;
//first decode 
assign opcode = ifu_de_ins[6:0]   ;
assign funct3 = ifu_de_ins[14:12] ;
assign funct7 = ifu_de_ins[31:25] ;
assign rd     = ifu_de_ins[11:7]  ;
assign rs1    = ifu_de_ins[19:15] ;
assign rs2    = ifu_de_ins[24:20] ;
//decode
assign lui                = (opcode == INST_LUI    )                                                                ;
assign auipc              = (opcode == INST_AUIPC  )                                                                ;
assign jal                = (opcode == INST_JAL    )                                                                ;
assign jalr               = (opcode == INST_JALR   )                                                                ;
assign beq                = (opcode == INST_TYPE_B ) && (funct3 == INST_BEQ     )                                   ;
assign bne                = (opcode == INST_TYPE_B ) && (funct3 == INST_BNE     )                                   ;
assign blt                = (opcode == INST_TYPE_B ) && (funct3 == INST_BLT     )                                   ;
assign bge                = (opcode == INST_TYPE_B ) && (funct3 == INST_BGE     )                                   ;
assign bltu               = (opcode == INST_TYPE_B ) && (funct3 == INST_BLTU    )                                   ;
assign bgeu               = (opcode == INST_TYPE_B ) && (funct3 == INST_BGEU    )                                   ;
assign lb                 = (opcode == INST_TYPE_L ) && (funct3 == INST_LB      )                                   ;
assign lh                 = (opcode == INST_TYPE_L ) && (funct3 == INST_LH      )                                   ;
assign lw                 = (opcode == INST_TYPE_L ) && (funct3 == INST_LW      )                                   ;
assign lbu                = (opcode == INST_TYPE_L ) && (funct3 == INST_LBU     )                                   ;
assign lhu                = (opcode == INST_TYPE_L ) && (funct3 == INST_LHU     )                                   ;
assign sb                 = (opcode == INST_TYPE_S ) && (funct3 == INST_SB      )                                   ;
assign sh                 = (opcode == INST_TYPE_S ) && (funct3 == INST_SH      )                                   ;
assign sw                 = (opcode == INST_TYPE_S ) && (funct3 == INST_SW      )                                   ;
assign addi               = (opcode == INST_TYPE_I ) && (funct3 == INST_ADDI    )                                   ;
assign slti               = (opcode == INST_TYPE_I ) && (funct3 == INST_SLTI    )                                   ;
assign sltiu              = (opcode == INST_TYPE_I ) && (funct3 == INST_SLTIU   )                                   ;
assign xori               = (opcode == INST_TYPE_I ) && (funct3 == INST_XORI    )                                   ;
assign ori                = (opcode == INST_TYPE_I ) && (funct3 == INST_ORI     )                                   ;
assign andi               = (opcode == INST_TYPE_I ) && (funct3 == INST_ANDI    )                                   ;
assign slli               = (opcode == INST_TYPE_I ) && (funct3 == INST_SLLI    )                                   ;
assign srli               = (opcode == INST_TYPE_I ) && (funct3 == INST_SRI     ) && (ifu_de_ins[30] == 1'b0       );
assign srai               = (opcode == INST_TYPE_I ) && (funct3 == INST_SRI     ) && (ifu_de_ins[30] == 1'b1       );
assign add                = (opcode == INST_TYPE_R ) && (funct3 == INST_ADD_SUB ) && (funct7         == 7'b0000000 );
assign sub                = (opcode == INST_TYPE_R ) && (funct3 == INST_ADD_SUB ) && (funct7         == 7'b0100000 );
assign sll                = (opcode == INST_TYPE_R ) && (funct3 == INST_SLL     )                                   ;
assign slt                = (opcode == INST_TYPE_R ) && (funct3 == INST_SLT     )                                   ;
assign sltu               = (opcode == INST_TYPE_R ) && (funct3 == INST_SLTU    )                                   ;
assign inst_xor           = (opcode == INST_TYPE_R ) && (funct3 == INST_XOR     )                                   ;
assign inst_or            = (opcode == INST_TYPE_R ) && (funct3 == INST_OR      )                                   ;
assign inst_and           = (opcode == INST_TYPE_R ) && (funct3 == INST_AND     )                                   ;
assign srl                = (opcode == INST_TYPE_R ) && (funct3 == INST_SRL_SRA ) && (funct7        == 7'b0000000 ) ;
assign sra                = (opcode == INST_TYPE_R ) && (funct3 == INST_SRL_SRA ) && (funct7        == 7'b0100000 ) ;
assign fence              = (opcode == INST_FENCE  ) && (funct3 == 000          )                                   ;
assign fence_i            = (opcode == INST_FENCE  ) && (funct3 == 001          )                                   ;
//assign ebreak             = (opcode == INST_CSR    ) && (funct3 == 000          ) && (ifu_de_ins[20] == 1'b1       );
//assign ecall              = (opcode == INST_CSR    ) && (funct3 == 000          ) && (ifu_de_ins[20] == 1'b0       );
assign csrrw              = (opcode == INST_CSR    ) && (funct3 == INST_CSRRW   )                                   ;
assign csrrs              = (opcode == INST_CSR    ) && (funct3 == INST_CSRRS   )                                   ;
assign csrrc              = (opcode == INST_CSR    ) && (funct3 == INST_CSRRC   )                                   ;
assign csrrwi             = (opcode == INST_CSR    ) && (funct3 == INST_CSRRWI  )                                   ;
assign csrrsi             = (opcode == INST_CSR    ) && (funct3 == INST_CSRRSI  )                                   ;
assign csrrci             = (opcode == INST_CSR    ) && (funct3 == INST_CSRRCI  )                                   ;
assign de_ctrl_int_ebreak = (ifu_de_ins[31:0] == 32'h100073 )                             ;
assign de_ctrl_int_mret   = (ifu_de_ins[31:0] == 32'h30200073 )                             ;
assign de_ctrl_int_ecall  = (ifu_de_ins[31:0] == 32'h73 )                             ;
//generate control signal  
assign  de_reg1_read_addr        = rs1                                                                                                                                                                    ;
assign  de_reg2_read_addr        = rs2                                                                                                                                                                    ;
assign  de_reg3_write_addr       = rd                                                                                                                                                                     ;
assign  de_ctrl_reg2_flag        = !(addi|ori|xori|srli|srai|slli|slti|sltiu|lui|auipc|sb|sh|sw|lb|lh|lw|lhu|lbu|andi)                                                                                             ;
assign  de_ctrl_lui_flag         = lui                                                                                                                                                                    ;
assign  de_ctrl_shift_flag       = srl|srli|sra|srai|sll|slli|lui                                                                                                                                         ;
assign  de_ctrl_shift_right_flag = srl|srli|sra|srai                                                                                                                                                      ;
assign  de_ctrl_shift_logic      = srl|srli|sll|slli|lui                                                                                                                                                  ;
assign  de_ctrl_comparator_flag  = (slt|slti)?   2'b01 : 
                                   (sltu|sltiu)? 2'b10 :
                                                 2'b00 ;
assign  de_ctrl_and_flag         = inst_and|andi                                                                                                                                                          ;
assign  de_ctrl_or_flag          = inst_or|ori                                                                                                                                                            ;
assign  de_ctrl_xor_flag         = inst_xor|xori                                                                                                                                                          ;
assign  de_ctrl_adder_flag       = add|addi|sb|sh|sw|lb|lw|lhu|lbu|lh                                                                                                                                            ;
assign  de_ctrl_sub_flag         = sub                                                                                                                                                                    ;
assign  de_ctrl_auipc_flag       = auipc                                                                                                                                                                  ;
assign  de_csr_we                = csrrw | csrrwi | csrrs | csrrc | csrrsi | csrrci ;                                                                                                     
assign  de_csr_wr_1              = csrrs|csrrsi ;
assign  de_csr_wr_0              = csrrc|csrrci ;
assign  de_gpr_we                = addi|slti|sltiu|xori|ori|andi|slli|srli|srai|add|sub|sll|slt|sltu|inst_xor|sra|srl|inst_or|inst_and|
                                   lb|lh|lbu|lhu|jal|jalr|lui|auipc|csrrw|csrrs|csrrc|csrrwi|csrrsi|csrrci|lw ;
assign  de_csr_idx               = ifu_de_ins[31:20];                                                                                                                                 
assign  de_lsu_flag              = (lb|lh|lw|lbu|lhu|sb|sh|sw) & (~ br_ctrl_flush);
assign  de_csr_zimm              = {27'b0,ifu_de_ins[19:15]}                                                                                                                                              ;
assign  de_csr_imm_en            = csrrwi|csrrsi|csrrci    ;



//generate imm
always@(*)begin
  if(addi|slti|sltiu|ori|xori|andi|slli|srli) 
    de_alu_imm = {{20{ifu_de_ins[31]}}, ifu_de_ins[31:20]} ;
  else if(srai)
    de_alu_imm = {{27{ifu_de_ins[31]}}, ifu_de_ins[24:20]} ;
  else if(lb|lh|lw|lbu|lhu)
    de_alu_imm = {{20{ifu_de_ins[31]}}, ifu_de_ins[31:20]} ;
  else if(sb|sw|sh)
    de_alu_imm = {{20{ifu_de_ins[31]}}, ifu_de_ins[31:25] , ifu_de_ins[11:7]};
  else if(beq|bne|blt|bge|bgeu|bltu)
    de_alu_imm = {{20{ifu_de_ins[31]}}, ifu_de_ins[7]     , ifu_de_ins[30:25], ifu_de_ins[11:8] , 1'b0};
  else if(jal)
    de_alu_imm = {{12{ifu_de_ins[31]}}, ifu_de_ins[19:12] , ifu_de_ins[20]   , ifu_de_ins[30:21], 1'b0};
  else if(jalr)
    de_alu_imm = {{20{ifu_de_ins[31]}}, ifu_de_ins[31:20]};
  else if(lui)
    de_alu_imm = {ifu_de_ins[31:12]   , 12'b0} ;
  else if(auipc)
    de_alu_imm = {ifu_de_ins[31:12]   , 12'b0} ;
  else
    de_alu_imm = 32'b0;
end
//generate brance type signal
always@(*)begin
if(beq)
  de_ctrl_br_typ = 3'b001;
else if(bne)
  de_ctrl_br_typ = 3'b010;
else if(blt)
  de_ctrl_br_typ = 3'b011;
else if(bge)
  de_ctrl_br_typ = 3'b100;
else if(bltu)
  de_ctrl_br_typ = 3'b101;
else if(bgeu)
  de_ctrl_br_typ = 3'b110;
else 
  de_ctrl_br_typ = 3'b000;
end

//generate lsu type signal
always@(*)begin
    if(lb|lh|lw|lbu|lhu)
      de_ctrl_lsu_flag = 2'b01; 
    else if(sb|sh|sw)
      de_ctrl_lsu_flag = 2'b10;
    else 
      de_ctrl_lsu_flag = 2'b00;
end

assign de_ctrl_lsu_size = ifu_de_ins[13:12];
assign de_ctrl_lsu_unsign = ifu_de_ins[14];


assign de_alu_l_flag  = lw || lh || lhu || lb || lbu ;
assign de_alu_s_flag  = sw || sh || sb               ;
assign de_alu_ls_size = de_ctrl_lsu_size             ;

assign de_ctrl_illegal = !(de_gpr_we || jal || jalr || beq || bne || blt || bge || bltu || bgeu || sb || sh || sw ||
                         fence || fence_i || de_ctrl_int_ebreak || de_ctrl_int_ecall  || de_ctrl_int_mret || ifu_de_ins[31:0] == 32'h0);

endmodule







