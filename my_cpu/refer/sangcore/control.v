//-------------------------------------------------------------
//This confidential and proprietary software may be used only as //authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is //applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized //copies.
//-------------------------------------------------------------
//File	: control.v
//Author	: Zhurong
//Date	: 08/12/2021
//Version	: 0.3
//Description: This file is module for control,The control module performs the following functions:
//1. Transmit JTAG pipeline pause signal
//2. The reset priority of JTAG is higher than that of the interrupt module, so it is necessary to use the reset of PC_ Req is used as the selection signal of MUX to generate Ctrl_ PC signal.
//3. The interrupt module will input two different PC values, and the specific PC needs to be selected according to the different processor instructions currently executed. In the implementation process, a data selector is used and mret is used as the control signal.
//4. If the interrupt module submits the interrupt PC valid signal or JTAG submits the reset, the control output PC valid signal is generated. This signal and the jump PC valid signal of the jump module are sent to the encoder for coding. The generated signal is the MUX selection signal of the PC in the PC.
//5. Send the transmitted signal to the corresponding module.
//6. Generate FLUSH signal, which comes from jump module and interrupt module.
//7. Generate PC selection signal, and the selection logic 00 represents Ctrl_ PC, 01 represents branch jump PC. Where Ctrl_ PC contains JTAG's reset PC and jump PC from interrupt.
//-------------------------------------------------------------
//Modification History:
//Date	By	Version	Change Description
//07/30/2021   Zhurong   0.1           Original
//08/11/2021   Zhurong   0.2           sync to the mas
//08/12/2021   Zhurong   0.3           add commit
//08/19/2021   fengyi    0.3           add ecall and valid ready
//09/10/2021   jingjing  0.4           add lsu size
//-------------------------------------------------------------
module control(

//input  wire [31:0] de_ctrl_imm               , //with de
input  wire        de_ctrl_reg2_flag          ,
input  wire        de_ctrl_lui_flag           ,
input  wire        de_ctrl_shift_flag         ,
input  wire        de_ctrl_shift_right_flag   ,
input  wire        de_ctrl_shift_logic       ,
input  wire [1:0]  de_ctrl_comparator_flag    ,
input  wire        de_ctrl_and_flag           ,
input  wire        de_ctrl_or_flag            ,
input  wire        de_ctrl_xor_flag           ,
input  wire        de_ctrl_adder_flag         ,
input  wire        de_ctrl_sub_flag           ,
input  wire        de_ctrl_auipc_flag         ,
input  wire [1:0]  de_ctrl_lsu_flag           ,
input  wire [1:0]  de_ctrl_lsu_size           ,
input  wire        de_ctrl_lsu_unsign         ,
input  wire [2:0]  de_ctrl_br_typ            ,
input  wire        de_ctrl_int_ebreak        , //ebreak instruction in IFU
input  wire        de_ctrl_int_ecall         ,
input  wire        de_ctrl_int_mret          , //mret signal flag
input  wire        de_ctrl_illegal           ,
input  wire [31:0] ifu_ctrl_int_epc          , //with ifu//pc of the current instruction before interrupt
input  wire        ifu_control_ready         ,
input  wire        ifu_control_valid         ,
input  wire        biu_ctrl_stall         ,
output wire        ctrl_ifu_flush            ,
output wire        ctrl_ifu_stall            ,
output wire [1:0]  ctrl_lsu_typ              , //With lsu
output wire [1:0]  ctrl_lsu_size             ,
output wire        ctrl_lsu_unsign           ,
input  wire        br_ctrl_jump_en           , //With branch
input  wire        br_ctrl_flush             ,
output wire [2:0]  ctrl_br_typ               ,
output wire        ctrl_br_valid             ,
output wire        ctrl_alu_reg2_flag        , //With alu
output wire        ctrl_alu_lui_flag         ,
output wire        ctrl_alu_shift_flag       ,
output wire        ctrl_alu_shift_right_flag ,
output wire        ctrl_alu_shift_logic      ,
output wire [1:0]  ctrl_alu_comparator_flag  ,
output wire        ctrl_alu_and_flag         ,
output wire        ctrl_alu_or_flag          ,
output wire        ctrl_alu_xor_flag         ,
output wire        ctrl_alu_adder_flag       ,
output wire        ctrl_alu_sub_flag         ,
output wire        ctrl_alu_auipc_flag       ,
output reg  [1:0]  ctrl_pc_jump_sel          , //With pc
output wire [31:0] ctrl_pc                   ,
output wire        ctrl_pc_stall             ,
input  wire        jtag_ctrl_halt_req        ,//With jtag
input  wire        jtag_ctrl_reset_req       ,
input  wire [31:0] int_ctrl_mtvec            , //With int//interrupt service program pc transferred to control module
input  wire [31:0] int_ctrl_epc              , //pc of the next instruction transfer to IFU
input  wire        int_ctrl_flush_req        , //flush require
input  wire        int_ctrl_pcen             , //enable signal of mtecv
input  wire        excp_pcen             , //enable signal of mtecv
output wire        ctrl_int_valid            , //flag of instruction last has been completely finished
output wire        ctrl_int_ready            ,
output wire [31:0] ctrl_int_epc              , //pc of the current instruction before interrupt
output wire        ctrl_int_ebreak           , //ebreak instruction in IFU
output wire        ctrl_int_ecall            ,
output wire        ctrl_int_mret             , //mret signal flag
output wire        ctrl_int_illegal              
//output wire        ctrl_int_minidecode
);
wire   [31:0] int_pc                                              ;
assign ctrl_alu_reg2_flag        = de_ctrl_reg2_flag        ;
assign ctrl_alu_lui_flag         = de_ctrl_lui_flag         ;
assign ctrl_alu_shift_flag       = de_ctrl_shift_flag       ;
assign ctrl_alu_shift_right_flag = de_ctrl_shift_right_flag ;
assign ctrl_alu_shift_logic      = de_ctrl_shift_logic     ;
assign ctrl_alu_comparator_flag  = de_ctrl_comparator_flag  ;
assign ctrl_alu_and_flag         = de_ctrl_and_flag         ;
assign ctrl_alu_or_flag          = de_ctrl_or_flag          ;
assign ctrl_alu_xor_flag         = de_ctrl_xor_flag         ;
assign ctrl_alu_adder_flag       = de_ctrl_adder_flag       ;
assign ctrl_alu_sub_flag         = de_ctrl_sub_flag         ;
assign ctrl_alu_auipc_flag       = de_ctrl_auipc_flag       ;

//assign csr_addr            = de_ctrl_imm                               ;
assign ctrl_lsu_typ        = de_ctrl_lsu_flag                          ;
assign ctrl_lsu_size       = de_ctrl_lsu_size                          ;
assign ctrl_lsu_unsign     = de_ctrl_lsu_unsign                        ;
assign ctrl_br_typ         = de_ctrl_br_typ                            ;
assign ctrl_br_valid       = ctrl_int_valid                            ;
assign ctrl_int_ebreak     = de_ctrl_int_ebreak                        ;
assign ctrl_int_mret       = de_ctrl_int_mret                          ;
assign ctrl_int_epc        = ifu_ctrl_int_epc                          ;
assign ctrl_int_lsu_size   = de_ctrl_lsu_size                          ;
assign ctrl_ifu_flush      = br_ctrl_flush   | int_ctrl_flush_req      ;
assign ctrl_ifu_stall      = jtag_ctrl_halt_req | (biu_ctrl_stall & ~excp_pcen)    ;  //when excecption, should not stall, flash the pipeline
assign ctrl_pc_stall       = jtag_ctrl_halt_req | (biu_ctrl_stall & ~excp_pcen)    ;
assign ctrl_pc             = jtag_ctrl_reset_req ? 0 : int_pc          ;//Reset PC from JTAG has higher priority
assign int_pc              = ctrl_int_mret?int_ctrl_epc:int_ctrl_mtvec ;//Select which PC from the interrupt to use through the mret signal
//assign ctrl_int_minidecode = ifu_ctrl_minidecode                       ;

always@(*)begin
if(jtag_ctrl_reset_req|int_ctrl_pcen)
  ctrl_pc_jump_sel=2'b00;
else if(br_ctrl_jump_en)
  ctrl_pc_jump_sel=2'b01;
else
  ctrl_pc_jump_sel=2'b10;
end

assign ctrl_int_valid = ifu_control_valid;
assign ctrl_int_ready = ifu_control_ready;
assign ctrl_int_ecall = de_ctrl_int_ecall;

assign ctrl_br_valid  = ifu_control_valid;
assign ctrl_int_illegal = de_ctrl_illegal;



endmodule
