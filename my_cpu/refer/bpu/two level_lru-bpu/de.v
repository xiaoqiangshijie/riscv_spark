//This confidential and proprietary software may be used only as 
//authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is //applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized copies.
//-------------------------------------------------------------------
//File          : de.v
//Author	      : yingzheng
//Date	        : 08/23/2021
//Version	      : 0.1
//Description	  : This file is a DE module for 64bits risc-v cpu, 
//-------------------------------------------------------------
//Modification History:
//Date	          By	     Version	      Change Description
//08/26/2021    yingzheng   0.1             ori: RV64IM  
//09/07/2021    yingzheng   0.2             add real_vald
//09/08/2021    yingzheng   0.3             add fence , fence_i flag 
//09/08/2021    yingzheng   0.4             add comments
//-------------------------------------------------------------
//`include "defines.v"
module de#(
  parameter INS_WIDTH    = 32 ,
  parameter DATA_WIDTH   = 64 ,
  parameter PC_WIDTH     = 64 ,
  parameter GPR_WIDTH    = 5  ,
  parameter CSR_WIDTH    = 12 
)(
  //WITH TOP                  
  input  wire                    clk                       ,
  input  wire                    rstn                      ,
  //WITH CONTROL                 
  input  wire                    ctrl_de_stall             ,//stop the pipe line 
  input  wire                    ctrl_de_flush             ,//stop the pipe line 
  //WITH IFU
  input  wire [INS_WIDTH -1:0]   ifu_de_inst               ,//instruction 
  input  wire                    ifu_de_inst_vld           ,//instruction valid
  input  wire [PC_WIDTH  -1:0]   ifu_de_pc                 ,//pc
  input  wire [PC_WIDTH  -1:0]   ifu_de_npc                ,//npc
  //WITH ALU
  output reg                     de_alu_inst_vld           ,//instruction valid
  output reg                     de_alu_wb_vld             ,//the instruction need write back
  output reg                     de_alu_reg2_flag          ,//1 represetns operation is x[rs2]
  output reg                     de_alu_lui_flag           ,//lui operation valid
  output reg                     de_alu_shift_flag         ,//shift operation valid
  output reg                     de_alu_shift_right_flag   ,//1:shift right,0:shift left
  output reg                     de_alu_shift_logic_flag   ,//1 is logic shift,0 is arithemetic shift
  output reg                     de_alu_iw_en_flag         ,//1 represents truncation operation is valid
  output reg  [           1:0]   de_alu_comp_flag          ,//1 represents comparator operation is valid 
  output reg                     de_alu_and_flag           ,//1 represents and operation is valid 
  output reg                     de_alu_or_flag            ,//1 represents or operation is valid 
  output reg                     de_alu_xor_flag           ,//1 represents xor operation is valid 
  output reg                     de_alu_adder_flag         ,//1 represents adder operation is valid 
  output reg                     de_alu_sub_flag           ,//1 represents substraction operation is valid
  output reg                     de_alu_auipc_flag         ,//1 represents auipc operation is valid
  output reg  [           3:0]   de_alu_ls_type            ,//lb,lbu,lh,lhu,lw,lwu,ld,sb,sh,sw,sd:4'd1~4'd11  
  output wire [DATA_WIDTH-1:0]   de_alu_imm                ,//immediate data
  output reg  [           2:0]   de_alu_con_jmp_type       ,//beq,bne,blt,bge,bltu,bgeu :3'd1~3'd6
  output reg  [           1:0]   de_alu_ucon_jmp_type      ,//jal,jalr : 2'd1 2'd2
  output reg  [           2:0]   de_alu_csr_type           ,//rw rs rc rwi rsi rci :3'd1~3'd6
  output reg  [PC_WIDTH  -1:0]   de_alu_pc                 ,//pc
  output reg  [PC_WIDTH  -1:0]   de_alu_npc                ,//npc
  output reg  [           1:0]   de_alu_fence_type         ,// 1 represent fence_i instruction is valid
  output reg  [GPR_WIDTH -1:0]   de_alu_rd_idx             ,
  output reg  [CSR_WIDTH -1:0]   de_alu_csr_idx            ,
  output reg  [           2:0]   de_alu_predict_jmp_type   ,
  //WITH CSR 
  output wire [CSR_WIDTH -1:0]   de_csr_rd_idx             ,
  output wire                    de_csr_rd_vld             ,

  //WITH OITF
  output wire                    de_oitf_inst_vld_ori      ,// valid without stall
  output wire                    de_oitf_inst_vld          ,// valid without stall
  output wire                    de_oitf_csr               ,
  output wire                    de_oitf_special           ,
  output wire                    de_oitf_mul               ,// mul instruction 
  output wire                    de_oitf_div               ,// div instruction
  output wire                    de_oitf_load              ,// Loadinstruction
  output wire [GPR_WIDTH -1:0]   de_oitf_rs1_idx           ,
  output wire [GPR_WIDTH -1:0]   de_oitf_rs2_idx           ,
  output wire [GPR_WIDTH -1:0]   de_oitf_rd_idx            ,
  output wire                    de_oitf_rs1en             ,// need rs1
  output wire                    de_oitf_rs2en             ,// need rs2
  output wire                    de_oitf_wen               ,// need rd
  output wire [CSR_WIDTH -1:0]   de_oitf_csr_idx           ,
  
  //WITH GPR 
  output wire [GPR_WIDTH -1:0]   de_gpr_reg1_raddr         ,
  output wire [GPR_WIDTH -1:0]   de_gpr_reg2_raddr         ,
  output wire                    de_gpr_reg1_rdvld         ,
  output wire                    de_gpr_reg2_rdvld         ,

  // WITH MUL
  output reg                     de_mul_inst_vld           ,
  output reg  [           2:0]   de_mul_type               ,
  output reg  [           4:0]   de_mul_rd_idx             ,

  //WITH DIV
  output reg                     de_div_inst_vld           ,
  output reg  [           3:0]   de_div_type               ,
  output reg  [           4:0]   de_div_rd_idx             ,
  output reg                     de_div_b2b                ,
  //WITH BYPASS
  output reg  [GPR_WIDTH -1:0]   de_bypass_rs1_idx         ,
  output reg  [GPR_WIDTH -1:0]   de_bypass_rs2_idx         ,

  //WITH ROB
  output wire [INS_WIDTH -1:0]   de_rob_inst               ,//instruction 
  output wire                    de_rob_inst_vld           ,//instruction valid
  output wire [PC_WIDTH  -1:0]   de_rob_pc                 ,//pc
  output wire [GPR_WIDTH -1:0]   de_rob_gpr_idx            ,
  output wire [CSR_WIDTH -1:0]   de_rob_csr_idx            ,
  output wire                    de_rob_alu                ,// alu instruction
  output wire                    de_rob_csr                ,// csr instruction
  output wire                    de_rob_mul                ,// mul instruction 
  output wire                    de_rob_div                ,// div instruction
  output wire                    de_rob_load               ,// L&S instructio 
  
  output wire                    de_rob_mret_alu_specail_cmt,// to ROB, for alu specail cmt

  //WITH INT
  output reg                     de_int_ebreak             ,
  output reg                     de_int_ecall              ,
  output reg                     de_int_mret               ,
  output                         de_int_misa               ,
  output                         de_int_memerr             ,
  output wire                    de_int_illegal            ,   
  output reg  [INS_WIDTH -1:0]   de_int_illegal_inst       
);

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Description : Decode the instruction
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//--OPCODE DEFINES
localparam  OP_R_TYPE       = 7'h33   ;
localparam  OP_R_TYPE_64    = 7'h3b   ;
localparam  OP_I_TYPE_LOAD  = 7'h03   ;
localparam  OP_I_TYPE_OTHER = 7'h13   ;
localparam  OP_I_TYPE_64    = 7'h1b   ;
localparam  OP_I_TYPE_JUMP  = 7'h6f   ;
localparam  OP_S_TYPE       = 7'h23   ; 
localparam  OP_B_TYPE       = 7'h63   ;
localparam  OP_U_TYPE_LOAD  = 7'h37   ;
localparam  OP_U_TYPE_JUMP  = 7'h67   ;
localparam  OP_U_TYPE_AUIPC = 7'h17   ;
localparam  OP_CSR_TYPE     = 7'h73   ;
localparam  OP_FENCE_TYPE   = 7'h0f   ;

//WIRE DEFINES
wire[6:0]     opcode                    ;
wire[2:0]     funct3                    ;
wire[6:0]     funct7                    ;
wire[4:0]     rs1                       ;
wire[4:0]     rs2                       ;
wire[4:0]     rd                        ;

assign        opcode =  ifu_de_inst[ 6: 0]   ;
assign        funct3 =  ifu_de_inst[14:12]   ;
assign        funct7 =  ifu_de_inst[31:25]   ;
assign        rs1    =  ifu_de_inst[19:15]   ;
assign        rs2    =  ifu_de_inst[24:20]   ;
assign        rd     =  ifu_de_inst[11: 7]   ;

//TYPE DEFINES
wire          r_type        = (opcode == OP_R_TYPE        );
wire          r_type_64     = (opcode == OP_R_TYPE_64     );
wire          i_type_load   = (opcode == OP_I_TYPE_LOAD   );
wire          i_type_other  = (opcode == OP_I_TYPE_OTHER  );
wire          i_type_64     = (opcode == OP_I_TYPE_64     );
wire          i_type_jump   = (opcode == OP_I_TYPE_JUMP   );
wire          u_type_load   = (opcode == OP_U_TYPE_LOAD   );
wire          u_type_jump   = (opcode == OP_U_TYPE_JUMP   );
wire          u_type_auipc  = (opcode == OP_U_TYPE_AUIPC  );
wire          s_type        = (opcode == OP_S_TYPE        );
wire          b_type        = (opcode == OP_B_TYPE        );
wire          csr_type      = (opcode == OP_CSR_TYPE      );
wire          fence_type    = (opcode == OP_FENCE_TYPE    );

//Register-Register Types (R-Type)
//----RV32I
wire          r_add  = (r_type && (funct3 == 3'h0) && (funct7 == 7'h00));
wire          r_sub  = (r_type && (funct3 == 3'h0) && (funct7 == 7'h20));
wire          r_sll  = (r_type && (funct3 == 3'h1) && (funct7 == 7'h00));
wire          r_slt  = (r_type && (funct3 == 3'h2) && (funct7 == 7'h00)); 
wire          r_sltu = (r_type && (funct3 == 3'h3) && (funct7 == 7'h00)); 
wire          r_xor  = (r_type && (funct3 == 3'h4) && (funct7 == 7'h00)); 
wire          r_srl  = (r_type && (funct3 == 3'h5) && (funct7 == 7'h00)); 
wire          r_sra  = (r_type && (funct3 == 3'h5) && (funct7 == 7'h20)); 
wire          r_or   = (r_type && (funct3 == 3'h6) && (funct7 == 7'h00)); 
wire          r_and  = (r_type && (funct3 == 3'h7) && (funct7 == 7'h00));
wire          rv32i  = r_add | r_sub | r_sll | r_slt | r_sltu | r_xor | r_srl | r_sra | r_or | r_and ;


//----RV32M
wire          r_mul  = (r_type && (funct3 == 3'h0) && (funct7 == 7'h01)); 
wire          r_mulh = (r_type && (funct3 == 3'h1) && (funct7 == 7'h01)); 
wire          r_rem  = (r_type && (funct3 == 3'h6) && (funct7 == 7'h01)); 
wire          r_div  = (r_type && (funct3 == 3'h4) && (funct7 == 7'h01));
wire          r_mulhu  = (r_type && (funct3 == 3'h3) && (funct7 == 7'h01)); 
wire          r_mulhsu = (r_type && (funct3 == 3'h2) && (funct7 == 7'h01)); 
wire          r_remu   = (r_type && (funct3 == 3'h7) && (funct7 == 7'h01));
wire          r_divu   = (r_type && (funct3 == 3'h5) && (funct7 == 7'h01));
wire          rv32m    = r_mul | r_mulh | r_rem | r_div | r_mulhu | r_mulhsu | r_remu | r_divu ;

//----RV64I
wire          r_addw = (r_type_64 && (funct3 == 3'h0) && (funct7 == 7'h00)); 
wire          r_subw = (r_type_64 && (funct3 == 3'h0) && (funct7 == 7'h20)); 
wire          r_sllw = (r_type_64 && (funct3 == 3'h1) && (funct7 == 7'h00)); 
wire          r_srlw = (r_type_64 && (funct3 == 3'h5) && (funct7 == 7'h00)); 
wire          r_sraw = (r_type_64 && (funct3 == 3'h5) && (funct7 == 7'h20));
wire          rv64i  = r_addw | r_subw |r_sllw | r_srlw | r_sraw ;

//----RV64M
wire          r_mulw = (r_type_64 && (funct3 == 3'h0) && (funct7 == 7'h01)); 
wire          r_divw = (r_type_64 && (funct3 == 3'h4) && (funct7 == 7'h01)); 
wire          r_divuw= (r_type_64 && (funct3 == 3'h5) && (funct7 == 7'h01)); 
wire          r_remw = (r_type_64 && (funct3 == 3'h6) && (funct7 == 7'h01)); 
wire          r_remuw= (r_type_64 && (funct3 == 3'h7) && (funct7 == 7'h01));
wire          rv64m  = r_mulw | r_divw | r_divuw | r_remw | r_remuw ;  

wire          mul = r_mul | r_mulh | r_mulhu | r_mulhsu | r_mulw ;
wire          div = r_rem | r_div  | r_remu  | r_divu   | r_divw | r_divuw | r_remw | r_remuw ;

//Immediate-Types (I-Type)
//----RV32I
wire          i_addi = (i_type_other && (funct3 == 3'h0));
wire          i_slli = (i_type_other && (funct3 == 3'h1) && funct7[6:1] == 6'h00);
wire          i_slti = (i_type_other && (funct3 == 3'h2));
wire          i_sltiu= (i_type_other && (funct3 == 3'h3));
wire          i_xori = (i_type_other && (funct3 == 3'h4));
wire          i_srli = (i_type_other && (funct3 == 3'h5) && funct7[6:1] == 6'h00);
wire          i_srai = (i_type_other && (funct3 == 3'h5) && funct7[6:1] == 6'h10);
wire          i_ori  = (i_type_other && (funct3 == 3'h6));
wire          i_andi = (i_type_other && (funct3 == 3'h7));   
wire          i_32   = i_addi | i_slli | i_slti | i_sltiu | i_xori | i_srli | i_srai | i_ori | i_andi ;


//----RV64I
wire          i_addiw= (i_type_64 && (funct3 == 3'h0)); 
wire          i_slliw= (i_type_64 && (funct3 == 3'h1) && (funct7 == 7'h00)); 
wire          i_srliw= (i_type_64 && (funct3 == 3'h5) && (funct7 == 7'h00)); 
wire          i_sraiw= (i_type_64 && (funct3 == 3'h5) && (funct7 == 7'h20));
wire          i_64   =  i_addiw | i_slliw | i_srliw | i_sraiw ;
//----Load
wire          i_lb   = (i_type_load && (funct3 == 3'h0));
wire          i_lh   = (i_type_load && (funct3 == 3'h1));
wire          i_lw   = (i_type_load && (funct3 == 3'h2));
wire          i_ld   = (i_type_load && (funct3 == 3'h3));
wire          i_lbu  = (i_type_load && (funct3 == 3'h4));
wire          i_lhu  = (i_type_load && (funct3 == 3'h5));
wire          i_lwu  = (i_type_load && (funct3 == 3'h6));
wire          load   = i_lb | i_lh | i_lw | i_ld | i_lbu | i_lhu | i_lwu ;

//----Jump
wire          i_jal  = i_type_jump  ;
//----Upper Immediate Types (U-Type)
wire          u_lui  = u_type_load  ;
wire          u_auipc= u_type_auipc ;
wire          u_jalr = u_type_jump  ;

wire          jump   = i_jal | u_jalr ;

//Store Types(S-Type)
wire          s_sb   = (s_type && (funct3 == 3'h0));
wire          s_sh   = (s_type && (funct3 == 3'h1));
wire          s_sw   = (s_type && (funct3 == 3'h2));
wire          s_sd   = (s_type && (funct3 == 3'h3));
wire          store  = s_sb | s_sh | s_sw | s_sd ;

//Branch Types(B-Type)
wire          b_beq  = (b_type && (funct3 == 3'h0)); 
wire          b_bne  = (b_type && (funct3 == 3'h1)); 
wire          b_blt  = (b_type && (funct3 == 3'h4)); 
wire          b_bge  = (b_type && (funct3 == 3'h5)); 
wire          b_bltu = (b_type && (funct3 == 3'h6)); 
wire          b_bgeu = (b_type && (funct3 == 3'h7)); 
wire          branch = b_beq | b_bne | b_blt | b_bge | b_bltu | b_bgeu ;

//CSR Types(CSR-Type)
wire          csr_rw = (csr_type && (funct3 == 3'h1));
wire          csr_rwi= (csr_type && (funct3 == 3'h5));
wire          csr_rs = (csr_type && (funct3 == 3'h2));
wire          csr_rsi= (csr_type && (funct3 == 3'h6));
wire          csr_rc = (csr_type && (funct3 == 3'h3));
wire          csr_rci= (csr_type && (funct3 == 3'h7));
wire          csr    = csr_rw | csr_rwi | csr_rs | csr_rsi | csr_rc | csr_rci ;


//Fence types(Fencs_type)
wire          fence  = (fence_type && (funct3 == 3'h0));
wire          fence_i= (fence_type && (funct3 == 3'h1));
//Ebreak,Ecall and Mret Instruction
wire          ebreak = (ifu_de_inst == 32'h10_0073  );
wire          ecall  = (ifu_de_inst == 32'h73       );
wire          mret   = (ifu_de_inst == 32'h3020_0073);










// ----------------------------------------------------------------------------------------------------------------------------
//                        Declare
// ----------------------------------------------------------------------------------------------------------------------------

//localparameter
//csr
localparam   CSRRW   =   3'd1  ;
localparam   CSRRS   =   3'd2  ;
localparam   CSRRC   =   3'd3  ;
localparam   CSRRWI  =   3'd4  ;
localparam   CSRRSI  =   3'd5  ;
localparam   CSRRCI  =   3'd6  ;
//load store
localparam   LB      =   4'h1  ;
localparam   LBU     =   4'h2  ;
localparam   LH      =   4'h3  ;
localparam   LHU     =   4'h4  ;
localparam   LW      =   4'h5  ;
localparam   LWU     =   4'h6  ;
localparam   LD      =   4'h7  ;
localparam   SB      =   4'h8  ;
localparam   SH      =   4'h9  ;
localparam   SW      =   4'ha  ;
localparam   SD      =   4'hb  ;

//branch
localparam   BEQ     =   3'h1  ;
localparam   BNE     =   3'h2  ;
localparam   BLT     =   3'h3  ;
localparam   BGE     =   3'h4  ;
localparam   BLTU    =   3'h5  ;
localparam   BGEU    =   3'h6  ;

//fence
localparam   FENCE   =   2'h1  ;
localparam   FENCE_I =   2'h2  ;

//predict_type
localparam   BRANCH  =   3'h1  ;
localparam   JAL     =   3'h2  ;
localparam   JALR    =   3'h3  ;
localparam   CALL    =   3'h4  ;
localparam   RET     =   3'h5  ;
localparam   CR      =   3'h6  ;

//mul
localparam   MUL     = 3'b001  ;
localparam   MULH    = 3'b010  ;
localparam   MULHU   = 3'b011  ;
localparam   MULHSU  = 3'b100  ;
localparam   MULW    = 3'b101  ;

//div
localparam   DIV     = 4'b0001 ;
localparam   DIVU    = 4'b0010 ;
localparam   REM     = 4'b0011 ;
localparam   REMU    = 4'b0100 ;
localparam   DIVW    = 4'b0101 ;
localparam   DIVUW   = 4'b0110 ;
localparam   REMW    = 4'b0111 ;
localparam   REMUW   = 4'b1000 ;


// wire
wire                  b_cond                ;
wire                  jal_cond              ;
wire                  jalr_cond             ;
wire                  call_1cond            ;
wire                  call_2cond            ;
wire                  call_3cond            ;
wire                  call_cond             ;
wire                  ret_cond              ;
wire                  call_ret_cond         ;
wire                  de_real_valid         ;
wire                  shift_flag            ; 
wire                  shift_right_flag      ;
wire                  shift_logic           ;
wire                  iw_en_flag            ;
wire                  and_flag              ;
wire                  or_flag               ;
wire                  xor_flag              ;
wire                  adder_flag            ;
wire                  sub_flag              ;
wire                  alu_wb_vld            ;
wire                  illegal_occur         ;
wire [         14:0]  b2b_info_in           ;
wire                  b2b_type              ;
wire [          3:0]  b2b_inst_type         ;
wire                  b2b_write_en          ;
wire                  current_type          ;
wire [          3:0]  current_inst_type     ;
wire [GPR_WIDTH-1:0]  current_rs1           ;
wire [GPR_WIDTH-1:0]  current_rs2           ;
wire                  rs_equal              ;
wire                  div_b2b_con1          ;
wire                  div_b2b_con2          ;
wire                  div_b2b_con3          ;
wire                  div_b2b_con4          ;
wire                  div_b2b_con5          ;
wire                  div_b2b_con6          ;
wire                  div_b2b_con7          ;
wire                  div_b2b_con8          ;
wire                  div_b2b               ;
wire                  alu_inst_valid        ; 
wire                  common_inst_valid     ;

//reg 
reg  [           2:0] predict_type          ;
reg                   ifu_de_inst_vld_extend;
reg  [           1:0] comp_flag             ;
reg  [           1:0] ucon_jmp              ;
reg  [           2:0] con_jmp               ;
reg  [           3:0] lsu_type              ;
reg  [           2:0] inst_csr_type         ;
reg  [DATA_WIDTH-1:0] imm                   ;
reg                   de_int_illegal_temp   ;
reg  [           2:0] mul_type              ;
reg  [           3:0] div_type              ;
reg                   de_int_ebreak_temp    ;
reg                   de_int_ecall_temp     ;
reg                   de_int_mret_temp      ;
reg  [          14:0] b2b_fifo              ;
reg                   b2b_compare           ;










////////////////////////////////////////////////////////////////////////////////////
// Description : generate predict_type
////////////////////////////////////////////////////////////////////////////////////
assign     b_cond        = branch;
assign     jal_cond      = i_jal   && rd != 5'd1 && rd != 5'd5;
assign     jalr_cond     = u_jalr  && (rd != 5'd1 && rd != 5'd5) && (rs1 != 5'd1 && rs1 != 5'd5);
assign     call_1cond    = (i_jal  && (rd == 5'd1 || rd == 5'd5));
assign     call_2cond    = (u_jalr && (rd == 5'd1 || rd == 5'd5) && (rs1 != 5'd1 && rs1 != 5'd5));
assign     call_3cond    = (u_jalr && ((rd == rs1 == 5'd1) || (rd == rs1 == 5'd5)));
assign     call_cond     = call_1cond || call_2cond || call_3cond;
assign     ret_cond      = (u_jalr && (rd != 5'd1 && rd != 5'd5) && (rs1 == 5'd1 || rs1 == 5'd5));
assign     call_ret_cond = (u_jalr && ((rd == 5'd1) || (rs1 == 5'd5)) && ((rd == 5'd5) || (rs1 == 5'd1)));

always @(*)begin
  case({b_cond,jal_cond,jalr_cond,call_cond,ret_cond,call_ret_cond}) 
    6'b100000:predict_type = BRANCH;//b
    6'b010000:predict_type = JAL   ;//jal
    6'b001000:predict_type = JALR  ;//jalr
    6'b000100:predict_type = CALL  ;//call
    6'b000010:predict_type = RET   ;//ret
    6'b000001:predict_type = CR    ;//call and ret
    default:  predict_type = 3'b000;
  endcase
end

always @(posedge clk or negedge rstn) begin
  if(!rstn)  
    de_alu_predict_jmp_type <= 3'b0 ;
  else if(de_real_valid)
    de_alu_predict_jmp_type <= predict_type ;
end




////////////////////////////////////////////////////////////////////////////////////
// Description : generate real_flag
////////////////////////////////////////////////////////////////////////////////////
assign  alu_inst_valid  = rv32i | rv64i | i_32 | i_64 | load | jump | u_lui | u_auipc | store | branch | csr | fence | fence_i ; 
assign  common_inst_valid = alu_inst_valid | rv32m | rv64m ;

//extend vld
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    ifu_de_inst_vld_extend <= 1'b0 ;
  else if( ifu_de_inst_vld & ctrl_de_stall )
    ifu_de_inst_vld_extend <= 1'b1 ;
  else if( !ctrl_de_stall)begin
    ifu_de_inst_vld_extend <= 1'b0 ;
  end
end

//gen  de_real_valid 
assign  de_real_valid =   ( ifu_de_inst_vld | ifu_de_inst_vld_extend) & (!ctrl_de_stall)  &(!ctrl_de_flush);



////////////////////////////////////////////////////////////////////////////////////
// Description : generate flag (alu)
////////////////////////////////////////////////////////////////////////////////////

//de_alu_inst_vld 
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_inst_vld <= 1'b0 ;
  else  if(de_real_valid) 
    de_alu_inst_vld <= alu_inst_valid ;
  else
    de_alu_inst_vld <= 1'b0 ;
end

//de_alu_fence_type 
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_fence_type <= 2'b00 ;
  else if( de_real_valid ) begin
    if(fence)
      de_alu_fence_type <= FENCE;
    else if(fence_i)
      de_alu_fence_type <= FENCE_I;
    else
      de_alu_fence_type <= 2'b00;
  end
end


//reg2_flag
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_reg2_flag <= 1'b0 ;
  else if(de_real_valid)
    de_alu_reg2_flag <= de_oitf_rs2en ;
end


//lui_flag 
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_lui_flag <= 1'b0 ;
  else if(de_real_valid)
    de_alu_lui_flag <= u_lui ;
end


//auipc_flag 
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_auipc_flag <= 1'b0 ;
  else if(de_real_valid)
    de_alu_auipc_flag <= u_auipc;
end

//shift_flag
assign shift_flag = (r_sll | i_slli | i_slliw | r_sllw | r_srl  | i_srli | i_srliw| r_srlw | r_sra  | i_srai | i_sraiw| r_sraw );

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_shift_flag <= 1'b0 ;
  else if(de_real_valid)
    de_alu_shift_flag <= shift_flag ;
end

//shift_right
assign shift_right_flag  = (r_srl  | i_srli | i_srliw| r_srlw | r_sra  | i_srai | i_sraiw| r_sraw );

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_shift_right_flag <= 1'b0 ;
  else if(de_real_valid)
    de_alu_shift_right_flag <= shift_right_flag ;
end


//shift_logic

assign shift_logic = (r_sll | i_slli | i_slliw | r_sllw | r_srl  | i_srli | i_srliw| r_srlw );

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_shift_logic_flag <= 1'b0 ;
  else if(de_real_valid)
    de_alu_shift_logic_flag <= shift_logic ;
end

//iw_en_flag;
assign iw_en_flag = (r_addw | r_subw | r_sllw | r_srlw | r_sraw | i_addiw | i_slliw | i_srliw | i_sraiw);

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_iw_en_flag <= 1'b0 ;
  else if(de_real_valid)
    de_alu_iw_en_flag <= iw_en_flag ;
end

// comp_flag 
always @(*) begin
  if(r_slt | i_slti)
    comp_flag = 2'b01 ;
  else if(r_sltu | i_sltiu)
    comp_flag = 2'b10 ;
  else
    comp_flag = 2'b00 ;
end

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_comp_flag <= 2'b00 ;
  else if(de_real_valid)
    de_alu_comp_flag <= comp_flag ;
end

// and_flag
assign  and_flag = (r_and  | i_andi );

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_and_flag <= 1'b0 ;
  else if(de_real_valid)
    de_alu_and_flag <= and_flag ;
end

// or_flag
assign or_flag = ( r_or | i_ori );

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_or_flag <= 1'b0 ;
  else if(de_real_valid)
    de_alu_or_flag <= or_flag ;
end

// xor_flag 
assign xor_flag = (r_xor | i_xori );

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_xor_flag <= 1'b0 ;
  else if(de_real_valid)
    de_alu_xor_flag <= xor_flag ;
end


// adder_flag
assign adder_flag = (r_add  | i_addi | r_addw | i_addiw);

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_adder_flag <= 1'b0 ;
  else if(de_real_valid)
    de_alu_adder_flag <= adder_flag ;
end


// sub_flag
assign sub_flag = (r_sub | r_subw );

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_sub_flag <= 1'b0 ;
  else if(de_real_valid)
    de_alu_sub_flag <= sub_flag ;
end


// con_jmp

always@ (*) begin
  if(i_jal)
      ucon_jmp = 2'b01 ;
  else if(u_jalr)
      ucon_jmp = 2'b10 ;
  else
      ucon_jmp = 2'b00 ;
end

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_ucon_jmp_type <= 2'b0 ;
  else if(de_real_valid)
    de_alu_ucon_jmp_type <= ucon_jmp ;
end

//con_jmp_type

always@(*)begin 
  case({b_beq,b_bne,b_blt,b_bge,b_bltu,b_bgeu})
    6'b100000:con_jmp = BEQ   ;//x[rs1] == x[rs2],jump
    6'b010000:con_jmp = BNE   ;//x[rs1] != x[rs2],jump
    6'b001000:con_jmp = BLT   ;//x[rs1] <  x[rs2],signed,jump
    6'b000100:con_jmp = BGE   ;//x[rs1] <  x[rs2],unsigned,jump
    6'b000010:con_jmp = BLTU  ;//x[rs1] >  x[rs2],signed,jump
    6'b000001:con_jmp = BGEU  ;//x[rs1] >  x[rs2],unsigned,jump
    default:  con_jmp = 3'h0  ;
  endcase
end 

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_con_jmp_type <= 3'b0 ;
  else if(de_real_valid)
    de_alu_con_jmp_type <= con_jmp ;
end

//lsu_type
 
always@(*)begin
  case({i_lb,i_lbu,i_lh,i_lhu,i_lw,i_lwu,i_ld,s_sb,s_sh,s_sw,s_sd})
    11'b10000000000:lsu_type = LB; //x[rd] = {56'{load_data[7],load_data[7:0]}
    11'b01000000000:lsu_type = LBU ;//x[rd] = {56'd0,load_data[7:0]}
    11'b00100000000:lsu_type = LH  ;//x[rd] = {48'{load_data[15],load_data[15:0]}
    11'b00010000000:lsu_type = LHU ;//x[rd] = {48'd0,load_data[15:0]}
    11'b00001000000:lsu_type = LW  ;//x[rd] = {32'{load_data[31],load_data[31:0]}
    11'b00000100000:lsu_type = LWU ;//x[rd] = {32'd0,load_data[31:0]}
    11'b00000010000:lsu_type = LD  ;//x[rd] = load_data
    11'b00000001000:lsu_type = SB  ;//store data == x[rs2][7:0]
    11'b00000000100:lsu_type = SH  ;//store data == x[rs2]15:0]
    11'b00000000010:lsu_type = SW  ;//store data == x[rs2][31:0]
    11'b00000000001:lsu_type = SD  ;//store data == x[rs2][63:0]
    default:lsu_type = 4'h0;
  endcase
end 

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_ls_type <= 4'b0 ;
  else if(de_real_valid)
    de_alu_ls_type <= lsu_type ;
end

// inst_csr_type

always@(*) begin
  if(csr_rw)
    inst_csr_type = CSRRW  ;
  else if(csr_rs)
    inst_csr_type = CSRRS  ;
  else if(csr_rc)
    inst_csr_type = CSRRC  ;
  else if(csr_rwi)
    inst_csr_type = CSRRWI ;
  else if(csr_rsi)
    inst_csr_type = CSRRSI ;
  else if(csr_rci)
    inst_csr_type = CSRRCI ;
  else 
    inst_csr_type = 3'd0   ;
end

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_csr_type <= 3'b0 ;
  else if(de_real_valid)
    de_alu_csr_type <= inst_csr_type ;
end

assign de_csr_rd_vld = ( |inst_csr_type ) & (de_real_valid)  ;
assign de_csr_rd_idx = ifu_de_inst[INS_WIDTH-1 : INS_WIDTH-12] ;
//alu_rd_idx
always@(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_rd_idx <= {GPR_WIDTH{1'b0}};
  else if(de_real_valid )
    de_alu_rd_idx <= rd ;
end


always@(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_csr_idx <= {CSR_WIDTH{1'b0}} ;
  else if(de_real_valid )
    de_alu_csr_idx <= de_csr_rd_idx;
end

//alu_wb_vld
assign alu_wb_vld =  rv32i | rv64i | i_64 | i_32 | u_lui | u_auipc | jump | csr ;//no need load

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_alu_wb_vld <= 1'b0 ;
  else if(de_real_valid)
    de_alu_wb_vld <= alu_wb_vld  ;
  else
    de_alu_wb_vld <= 1'b0 ;
end

//Immidate 

always@(posedge clk)begin
  if(de_real_valid) begin
    if(i_addi | i_slti | i_sltiu | i_xori | i_ori | i_andi | i_addiw | load | u_jalr)       
      imm <= {{52{ifu_de_inst[31]}}, ifu_de_inst[31:20]} ;    
    else if(i_slli | i_srli | i_srai )
      imm <= {58'd0,ifu_de_inst[25:20]};
    else if(i_slliw | i_sraiw | i_srliw)
      imm <= {59'd0,ifu_de_inst[24:20]};
    else if(s_sb | s_sh | s_sw | s_sd)
      imm <= {{52{ifu_de_inst[31]}},ifu_de_inst[31:25], ifu_de_inst[11:7]};
    else if(b_type == 1'b1)
      imm <= {{52{ifu_de_inst[31]}},ifu_de_inst[7],ifu_de_inst[30:25],ifu_de_inst[11:8],1'b0};
    else if(i_jal)
      imm <= {{44{ifu_de_inst[31]}},ifu_de_inst[19:12],ifu_de_inst[20],ifu_de_inst[30:21],1'b0};
    else if(u_auipc | u_lui)
      imm <= {{32{ifu_de_inst[31]}},ifu_de_inst[31:12],12'b0};
    else if(csr_rwi | csr_rsi | csr_rci)
      imm <= {59'b0,ifu_de_inst[19:15]};
  end  
end 

assign de_alu_imm = imm ;

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_int_ebreak_temp <= 1'b0 ;
  else 
    de_int_ebreak_temp <= ebreak & de_real_valid ;
end

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_int_ecall_temp <= 1'b0 ;
  else
    de_int_ecall_temp <= ecall & de_real_valid;
end

 always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_int_mret_temp <= 1'b0 ;
  else
    de_int_mret_temp <= mret & de_real_valid ;
end

//ebreak ecall mret signals 
always@(*)begin
    de_int_ebreak = de_int_ebreak_temp ;
    de_int_ecall  = de_int_ecall_temp  ;
    de_int_mret   = de_int_mret_temp   ;
end

assign de_int_misa     = 1'b0;
assign de_int_memerr   = 1'b0;


assign illegal_occur =  (!(common_inst_valid | ebreak | ecall | mret)) & de_real_valid ; 


always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_int_illegal_temp <= 1'b0 ;
  else  
    de_int_illegal_temp <= illegal_occur;
end

assign de_int_illegal = de_int_illegal_temp & (!ctrl_de_flush ) ;


always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_int_illegal_inst <= {INS_WIDTH{1'b0}} ;
  else if(illegal_occur) 
    de_int_illegal_inst <= ifu_de_inst ;
end

//Generate oitf signal
assign de_oitf_inst_vld_ori   = ifu_de_inst_vld                                                                     ;
assign de_oitf_inst_vld       = de_real_valid                                                                       ;
assign de_oitf_mul            = mul                                                                                 ;
assign de_oitf_div            = div  &(!div_b2b)                                                                 ;
assign de_oitf_load           = load                                                                                ;
assign de_oitf_csr            = csr                                                                                 ;
assign de_oitf_special        = mret || ebreak || ecall                                                             ;
assign de_oitf_rs1_idx        = rs1                                                                                 ;
assign de_oitf_rs2_idx        = rs2                                                                                 ;
assign de_oitf_rd_idx         = rd                                                                                  ;
assign de_oitf_rs1en          = (rv32i|rv32m|rv64i|rv64m|i_32|i_64|load|u_jalr|store| branch|csr_rw|csr_rs|csr_rc)&& (!ctrl_de_flush) ;
assign de_oitf_rs2en          = (rv32i|rv32m|rv64i|rv64m|store|branch ) && (!ctrl_de_flush)                         ;
assign de_oitf_wen            = (rv32i|rv32m|rv64i|rv64m|i_32|i_64|load|jump|u_lui|u_auipc|csr) && (!ctrl_de_flush) ;
assign de_oitf_csr_idx        =  de_csr_rd_idx                                                                      ;


//Generate gpr signal
assign de_gpr_reg1_raddr  = rs1              ;
assign de_gpr_reg2_raddr  = rs2              ;
assign de_gpr_reg1_rdvld  = de_oitf_rs1en & de_real_valid  ;  
assign de_gpr_reg2_rdvld  = de_oitf_rs2en & de_real_valid  ;  

//Generate bypass signal
always@(posedge clk or negedge rstn) begin
  if(!rstn)
    de_bypass_rs1_idx <= {GPR_WIDTH{1'b0}} ;
  else if(de_real_valid)
    de_bypass_rs1_idx <= rs1  ;
end

always@(posedge clk or negedge rstn) begin
  if(!rstn)
    de_bypass_rs2_idx <= {GPR_WIDTH{1'b0}} ;
  else if(de_real_valid)
    de_bypass_rs2_idx <= rs2  ;
end



//Generate mdu signal



always @(*) begin
  if(r_mul)
    mul_type = MUL    ;
  else if(r_mulh)
    mul_type = MULH   ;
  else if(r_mulhu)
    mul_type = MULHU  ;
  else if(r_mulhsu)
    mul_type = MULHSU ;
  else if(r_mulw)
    mul_type = MULW   ; 
  else 
    mul_type = 3'b000 ;
end

always@(posedge clk or negedge rstn) begin
  if(!rstn)
    de_mul_type <= 3'b00;
  else if(de_real_valid & mul)
    de_mul_type <= mul_type ;
end


always @(*) begin
  if(r_div)
    div_type = DIV   ;
  else if(r_divu)
    div_type = DIVU  ;
  else if(r_rem)
    div_type = REM   ;
  else if(r_remu)
    div_type = REMU  ;
  else if(r_divw)
    div_type = DIVW  ;
  else if(r_divuw)
    div_type = DIVUW ;
  else if(r_remw)
    div_type = REMW  ;
  else if(r_remuw)
    div_type = REMUW ;
  else 
    div_type = 4'd0  ;
end

always@(posedge clk or negedge rstn) begin
  if(!rstn)
    de_div_type <= 4'b00;
  else if(de_real_valid & div )
    de_div_type <= div_type ;
end


always@(posedge clk or negedge rstn) begin
  if(!rstn)
    de_mul_rd_idx <= 5'b0 ;
  else if(de_real_valid & mul)
    de_mul_rd_idx <= rd  ;
end
always@(posedge clk or negedge rstn) begin
  if(!rstn)
    de_div_rd_idx <= 5'b0 ;
  else if(de_real_valid & div)
    de_div_rd_idx <= rd ;
end

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_mul_inst_vld <= 1'b0 ;
  else  
    de_mul_inst_vld <= de_real_valid && mul ;
end

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_div_inst_vld <= 1'b0 ;
  else  
    de_div_inst_vld <= de_real_valid && div &&(!div_b2b);
end


//OUTPUT PC

always @(posedge clk) begin
  if(de_real_valid)
    de_alu_pc <= ifu_de_pc ;
end

always @(posedge clk) begin
  if(de_real_valid)
    de_alu_npc <= ifu_de_npc ;
end


//with ROB
assign     de_rob_inst       =  ifu_de_inst                        ;
assign     de_rob_inst_vld   =  de_real_valid & (!illegal_occur)   ;
assign     de_rob_pc         =  ifu_de_pc                          ;
assign     de_rob_gpr_idx    =  de_oitf_rd_idx                     ;
assign     de_rob_csr_idx    =  de_csr_rd_idx                      ;
assign     de_rob_alu        =  alu_wb_vld | branch |fence_type | mret ;        
assign     de_rob_csr        =  de_oitf_csr                        ;        
assign     de_rob_mul        =  de_oitf_mul                        ;        
assign     de_rob_div        =  div                                ;        
assign     de_rob_load       =  load  | store                      ;         
assign     de_rob_mret_alu_specail_cmt = de_int_mret               ;

//mul div b2b
assign b2b_write_en  =  div & de_real_valid          ;
assign b2b_inst_type =  div_type                     ;
assign b2b_info_in   = { b2b_inst_type , rs1 , rs2 } ;

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    b2b_fifo <= 14'b0 ;
  else if(b2b_write_en)
    b2b_fifo <= b2b_info_in ;
end

assign current_inst_type     = b2b_fifo[13:10] ;
assign current_rs1           = b2b_fifo[ 9: 5] ;
assign current_rs2           = b2b_fifo[ 4: 0] ;

always@(posedge clk or negedge rstn)begin
  if(!rstn)
    b2b_compare <= 1'b0;
  else if(b2b_write_en)
    b2b_compare <= 1'b1;
  else if(de_real_valid)
    b2b_compare <= 1'b0;
end

assign rs_equal     = (rs1 == current_rs1) && (rs2 == current_rs2)  ;


assign div_b2b_con1 = current_inst_type == DIV   && div_type == REM  ;
assign div_b2b_con2 = current_inst_type == DIVU  && div_type == REMU ;
assign div_b2b_con3 = current_inst_type == DIVW  && div_type == REMW ;
assign div_b2b_con4 = current_inst_type == DIVUW && div_type == REMUW;
assign div_b2b_con5 = current_inst_type == REM   && div_type == DIV  ;
assign div_b2b_con6 = current_inst_type == REMU  && div_type == DIVU ;
assign div_b2b_con7 = current_inst_type == REMW  && div_type == DIVW ;
assign div_b2b_con8 = current_inst_type == REMUW && div_type == DIVUW;

/*
assign div_b2b =  ( div_b2b_con1 |div_b2b_con2 |div_b2b_con3 |div_b2b_con4 |
                    div_b2b_con5 |div_b2b_con6 |div_b2b_con7 |div_b2b_con8 ) & rs_equal & b2b_compare ;
*/

assign  div_b2b = 1'b0;

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    de_div_b2b <= 1'b0 ;
  else if(de_real_valid)
    de_div_b2b <= div_b2b ;
end

endmodule
