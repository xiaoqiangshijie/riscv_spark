//-------------------------------------------------------------
//This confidential and proprietary software may be used only as 
//authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is
//applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized
//copies.
//-------------------------------------------------------------
//File:        ctrl
//Author:      lihua
//Date:        21-08-25 15:51:55
//Version:     0.1
//Description: 
//1. When OITF module issues OITF_CTRL_RELATED as high, it indicates that the instructions translated by DE module have data correlation. 
//   In this case, the pipeline needs to be suspended for IFU and DE module.
//2. When WB_CTRL_ALU_STALL is sent by the WB module, it indicates that the ALU related write recycle is blocked. 
//   In this case, the pipeline of IFU, DE, and ALU modules needs to be suspended.
//3. When the Jump_en sent by the ALU module is high, it indicates that jump is required.
//   At this time, it is necessary to suspend the PC module pipeline and stop the source of the pipeline.
//   If oitF_CTRl_empty is high, all commands have been executed.
//   Can be PC module pipeline pause signal down.
//4. When the Jump_en sent by the ALU module is high, it indicates that it needs to jump. 
//   At this time, the instruction before BEQ is valid, and the instruction after BEQ is invalid, 
//   so it needs to send fake_gen_flag signal to the ALU, DE and MDU modules.If these modules receive input in_vLD during faKE_GEN_flag =1,
//   a FAKE_OUT_VLD is generated immediately to clear entries.

//-------------------------------------------------------------
//Modification History:
//Date                 By         Version       Change Description
//21-08-25 15:51:55   lihua         0.1             Original
//-------------------------------------------------------------
module   control #(
    parameter   PC_DW = 32


)(  
    input                  clk                    , //clk
    input                  rstn                   ,
//WITH OITF
    input                  oitf_ctrl_related      , //Indicating data related
    input                  oitf_ctrl_empty        , //Indicating OITF empty.All instructions are executed
    output                 ctrl_oitf_fake_gen_flag,  
//WITH WB
    input                  wb_ctrl_alu_stall      , //The ALU datapath requests to suspend the pipeline
//WITH IFU
    output                 ctrl_pc_stall          , //Suspend the PC module pipeline
    output                 ctrl_ifu_stall         , //Suspend the IFU module pipeline
    output                 ctrl_ifu_pc_vld        ,
    output reg[PC_DW-1:0]  ctrl_ifu_pc            ,
    input                  ifu_ctrl_pc_state      ,
//WITH DE 
    output                 ctrl_de_stall          , //Suspend the DE  module pipeline 
    output                 ctrl_de_fake_gen_flag  , // fake flag 
//WITH ALU 
    input                  alu_ctrl_jump_en       , //BEQ ins jump_en
    input                  alu_ctrl_fence_i_flag  , //BEQ ins jump_en
    output                 ctrl_alu_stall         , //Suspend the ALU  module pipeline
    output                 ctrl_alu_fake_gen_flag , //fake output vld gen_flag 
//WITH LSU 
    output                 ctrl_lsu_fake_gen_flag , //fake output vld gen_flag
//WITH MDU 
    output                 ctrl_mdu_fake_gen_flag , //fake output vld gen_flag
//WITH ROB
    output                 ctrl_rob_flush_start   ,
//WITH INT 
    input     [PC_DW-1:0]  int_ctrl_mtvec         ,
    input     [PC_DW-1:0]  int_ctrl_epc           ,
    input                  int_ctrl_req           ,
    input                  int_ctrl_mret
); 

//--------------------LOCAL_PAMETER----------------------------


//--------------------reg -------------------------------------
reg  fake_gen_flag;
reg  alu_ctrl_fence_i_flag_1d;
reg  empty_1d;
reg  mret_temp;

//--------------------wire -- ---------------------------------
wire empty_pos;
wire real_mret;

//--------------------Main Code--------------------------------

//-------------------------------------------------------------
//Description: Generate stall and fake_flag
//-------------------------------------------------------------


//STEP 1.1 generate fake_gen_flag
always@(posedge clk or negedge rstn)begin
    if(rstn == 1'b0)begin
        fake_gen_flag <= 1'b0;
    end
    else if(alu_ctrl_jump_en == 1'b1 || int_ctrl_req == 1'b1 || alu_ctrl_fence_i_flag || int_ctrl_mret )begin
        fake_gen_flag <= 1'b1;
    end
    else if((oitf_ctrl_empty == 1'b1) && (ifu_ctrl_pc_state == 1'b1))begin
        fake_gen_flag <= 1'b0;
    end
end


//STEP 1.2 generate stall
assign  ctrl_pc_stall           = oitf_ctrl_related | wb_ctrl_alu_stall  | fake_gen_flag        ;
assign  ctrl_ifu_stall          = oitf_ctrl_related | wb_ctrl_alu_stall                         ;
assign  ctrl_de_stall           = ctrl_ifu_stall     ;
assign  ctrl_alu_stall          = wb_ctrl_alu_stall  ;

//STEP 1.3 generate different_fake_gen_flag
assign  ctrl_alu_fake_gen_flag  = fake_gen_flag                                         ;
assign  ctrl_mdu_fake_gen_flag  = fake_gen_flag                                         ;
assign  ctrl_lsu_fake_gen_flag  = fake_gen_flag                                         ;
assign  ctrl_oitf_fake_gen_flag = fake_gen_flag                                         ;
assign  ctrl_de_fake_gen_flag   = fake_gen_flag                                         ;


assign  ctrl_rob_flush_start = alu_ctrl_jump_en || int_ctrl_req || alu_ctrl_fence_i_flag || int_ctrl_mret;

//-------------------------------------------------------------
//Description: Generate pc & pc_vld
//-------------------------------------------------------------

//STEP 1.1 generate pc_vld
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    empty_1d <= 1'b0 ;
  else
    empty_1d <= oitf_ctrl_empty ;
end

assign empty_pos = (!empty_1d) & oitf_ctrl_empty ;

always @(posedge clk or negedge rstn) begin
  if(!rstn)
    mret_temp <= 1'b0 ;
  else if(int_ctrl_mret)
    mret_temp <= 1'b1 ;
  else if(oitf_ctrl_empty)
    mret_temp <= 1'b0 ;
end

assign real_mret = (mret_temp & empty_pos) | (oitf_ctrl_empty & int_ctrl_mret) ;

assign  ctrl_ifu_pc_vld = int_ctrl_req | real_mret;

//STEP 1.2 generate pc
always@(*)begin
    if(int_ctrl_req == 1'b1)begin
       ctrl_ifu_pc = int_ctrl_mtvec;
    end
    else  
       ctrl_ifu_pc = int_ctrl_epc;
end
endmodule
