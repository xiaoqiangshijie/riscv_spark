//This confidential and proprietary software may be used only as //authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is //applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized //copies.
//-------------------------------------------------------------
//File	: pc.v
//Author	: Zhurong
//Date	: 08/12/2021
//Version	: 0.3
//Description	  : This file is module for PC,The PC module performs the following functions:
//1. Process the PC address of direct jump and indirect jump（ 00 select Ctrl_ PC, 01 check ALU_ pc_ result_ pc,ctrl_ PC includes the reset PC of JTAG and the PC value of interrupt recovery site).
//2. Send the registered PC value to the IFU module.
//3. The pipeline is suspended, and the PC value remains unchanged.
//4. Only when the last instruction comes back can we perform PC + 4, which is controlled by the ready sent by IFU.
//-------------------------------------------------------------
//Modification History:
//Date	By	Version	Change Description
//07/23/2021   Zhurong   0.1           Original
//07/27/2021   Zhurong   0.2           add comment
//08/12/2021   Zhurong   0.3           add ifu_pc_icb_cmd_ready
//-------------------------------------------------------------

module pc(
  input wire       rstn                   ,//active low
  input wire       clk                    ,//clock
//with control
  input wire       ctrl_pc_stall          , //stop the pipeline
  input wire[1:0]  ctrl_pc_jump_sel       , //select pc
  input wire[31:0] ctrl_pc                , //pc came from the controifu_pc_icb_cmd_readyl
//with alu
//with if
  input  wire      ifu_pc_icb_cmd_ready   ,
  output reg[31:0] pc_ifu_addr            , // pc for catching instruction
  input wire[31:0] jump_pc                
);
wire[31:0] pc_next;

always @(posedge clk or negedge rstn)begin
  if (rstn==0)begin  //reset
    pc_ifu_addr   <= 32'b0;
  end
  else if (!ctrl_pc_stall)begin
    if(ctrl_pc_jump_sel==2'b00)begin // if ctrl_pc_jump_sel equal 00 ,it means we select the pc from control, 01 means we select the pc from alu.
      pc_ifu_addr <= ctrl_pc;
    end
    else if(ctrl_pc_jump_sel==2'b01)begin
      pc_ifu_addr <= jump_pc;
    end
    else begin
      pc_ifu_addr <= pc_next;
    end
  end
end

assign pc_next= ifu_pc_icb_cmd_ready?pc_ifu_addr+4:pc_ifu_addr;//Only after the previous instruction is retrieved can the PC module generate the sequential fetch address of the next instruction




endmodule

