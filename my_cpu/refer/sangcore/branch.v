//-------------------------------------------------------------
//This confidential and proprietary software may be used only as //authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is //applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized //copies.
//-------------------------------------------------------------
//File       		: branch.v
//Author    		: jingjing
//Date     	 		: 08/14/2021
//Version 	   	: 0.1
//Description   : This file is the module for biu, which acts as a bridge
//between inner core and outer slaves.
//attachments.
//-------------------------------------------------------------
//Modification History:
//Date          By  	     Version	  change Description
//08/14/2021    jingjing      0.1      Original
//08/23/2021    jingjing      0.2      change jump    
//------------------------------------------------------------
module branch(
    input clk,
    input rstn,
    input ctrl_br_valid,
    input jal,
    input jalr,
    input [31:0] current_pc,
    input [2:0] ctrl_br_typ,
    input [31:0] reg1_data,
    input [31:0] reg2_data,
    input [31:0] de_alu_imm,
    output br_ctrl_jump_en,
    output br_ctrl_flush,
    output reg[31:0] jump_pc
);

reg jump;
reg jump_valid;
reg cnt;
always@(*)begin
  if(jump == 1'b1 || jal)
    jump_pc = current_pc + de_alu_imm;
  else if(jalr)
//    jump_pc = (reg1_data + de_alu_imm) & ( 32'hffff_fffe);
    jump_pc = (reg1_data + de_alu_imm);
end 
//jump
always@(*)begin
  case(ctrl_br_typ)
      3'b001 : jump = (reg1_data == reg2_data)? 1 : 0;//beq
      3'b010 : jump = (reg1_data != reg2_data)? 1 : 0;//bne
      3'b101 : jump = (reg1_data <  reg2_data)? 1 : 0;//bltu unsigned
      3'b110 : jump = (reg1_data >= reg2_data)? 1 : 0;//bgeu unsigned
      3'b011 : jump = ({~reg1_data[31],reg1_data[30:0]} <  {~reg2_data[31],reg2_data[30:0]}) ? 1 : 0;//blt
      3'b100 : jump = ({~reg1_data[31],reg1_data[30:0]} >= {~reg2_data[31],reg2_data[30:0]}) ? 1 : 0;//bge
      default : jump = 1'b0;
  endcase
end

//jump_valid
always@(*)begin
    jump_valid = (jump | jal | jalr) & ctrl_br_valid;
end

//cnt
always@(posedge clk or negedge rstn)begin
  if(!rstn)
      cnt <= 0;
 else if(jump_valid)
      cnt <= 1;
  else if(cnt & ctrl_br_valid)
      cnt <= 0;
end

assign br_ctrl_jump_en = jump_valid;
//assign br_ctrl_flush = jump_valid | cnt ;
assign br_ctrl_flush = jump_valid;

endmodule


