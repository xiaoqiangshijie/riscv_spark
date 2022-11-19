//-------------------------------------------------------------
//This confidential and proprietary software may be used only as //authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is //applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized //copies.
//-------------------------------------------------------------
//File	: lsu.v
//Author	: xiaobo
//Date	: 08/05/2021
//Version	: 0.2
//Description	  : This file is the module for 1. Pass the memory access address given by the alu calculation to the biu bus2. The loaded data is passed to the write-back module
//-------------------------------------------------------------
//Modification History:
//Date	By	Version	Change Description
//08/05/2021   xiaobo   0.2           Original
//-------------------------------------------------------------




module lsu
#(	parameter STORE		= 2'b10,
	parameter LOAD		= 2'b01,
	parameter NULL		= 2'b00,
	parameter WDATA_WID = 32,
	parameter RDATA_WID = 32,
	parameter ADDR_WID  = 32,
	parameter CTRL_WID  = 2,
	parameter MASK_WID  = 32
)
(
	input	 wire         						 clk,
	input	 wire         						 rst_n, 
        input    wire                        ctrl_ifu_flush,
	input  wire	  [WDATA_WID-1:0]    store_data, 
	input  wire   [ADDR_WID-1:0]     alu_lsu_addr,
	input  wire   [RDATA_WID-1:0]    lsu2icb_rsp_rdata,
	input  wire   [CTRL_WID-1:0]     ctrl_lsu_size,
  input  wire                      ctrl_lsu_unsign,
  input  wire   [CTRL_WID-1:0]     ctrl_lsu_load_typ,
  input  wire   [CTRL_WID-1:0]     ctrl_lsu_typ,
	input  wire						 lsu2icb_cmd_ready,
	input  wire						 lsu2icb_rsp_valid,
	input  wire						 lsu2icb_rsp_err,

	output reg    [RDATA_WID-1:0]	 lsu_wb_data,
	output wire   [WDATA_WID-1:0]	 lsu2icb_cmd_wdata,
	output wire   [ADDR_WID-1:0]	 lsu2icb_cmd_addr,
	output wire	  [MASK_WID-1:0]	 lsu2icb_cmd_wmask,
	output wire						 lsu_wb_valid,
	output wire						 lsu2icb_cmd_valid,
	output reg						 lsu2icb_cmd_read,
	output wire						 lsu2icb_rsp_ready,
	output wire						 lsu_ctrl_ready	
);
reg	   lsu2icb_read_differ;
reg lsu_phase; //0:address phase 1:data phase

assign lsu2icb_cmd_wdata = store_data;
assign lsu2icb_rsp_ready = 1'b1;
assign lsu2icb_cmd_addr  = alu_lsu_addr;
assign lsu_ctrl_ready = lsu2icb_cmd_ready;
//assign lsu_wb_data = lsu2icb_rsp_rdata;

wire [31:0] lsu2icb_rsp_rdata_shift;

assign lsu2icb_rsp_rdata_shift = (lsu2icb_cmd_addr[1:0]==2'b01) ? { 8'h0,lsu2icb_rsp_rdata[31:8]} :
                                 (lsu2icb_cmd_addr[1:0]==2'b10) ? {16'h0,lsu2icb_rsp_rdata[31:16]} :
                                 (lsu2icb_cmd_addr[1:0]==2'b11) ? {24'h0,lsu2icb_rsp_rdata[31:24]} :
                                                                         lsu2icb_rsp_rdata[31:0];

always@(*) begin
  if(ctrl_lsu_unsign)begin
    if(ctrl_lsu_size == 2'b00)
      lsu_wb_data = {24'b0,lsu2icb_rsp_rdata_shift[7:0]};
    else if(ctrl_lsu_size == 2'b01)
      lsu_wb_data = {16'b0,lsu2icb_rsp_rdata_shift[15:0]};
    else
      lsu_wb_data = lsu2icb_rsp_rdata_shift;
  end
  else begin
    if(ctrl_lsu_size == 2'b00)
      lsu_wb_data = {{24{lsu2icb_rsp_rdata_shift[7]}},lsu2icb_rsp_rdata_shift[7:0]};
    else if(ctrl_lsu_size == 2'b01)
      lsu_wb_data = {{16{lsu2icb_rsp_rdata_shift[15]}},lsu2icb_rsp_rdata_shift[15:0]};
    else
      lsu_wb_data = lsu2icb_rsp_rdata_shift;
  end
end

;
assign lsu2icb_cmd_wmask = {2'b00,ctrl_lsu_size}; //not a real mask, is size

always@(posedge clk or negedge rst_n) begin	
	if(!rst_n)
		lsu2icb_read_differ <= 0;
	else if(ctrl_lsu_typ == LOAD)
		lsu2icb_read_differ <= 1'b1;
	else
		lsu2icb_read_differ <= 0;
end

assign lsu_wb_valid = lsu2icb_read_differ & lsu2icb_rsp_valid;


always@(posedge clk or negedge rst_n)begin	
  if(!rst_n)
    lsu_phase <= 1'b0;
  else if (lsu2icb_cmd_valid & lsu2icb_cmd_ready)
    lsu_phase <= 1'b1;
  else if (lsu2icb_rsp_valid & lsu2icb_rsp_ready)
    lsu_phase <= 1'b0;
end

assign lsu2icb_cmd_valid = (ctrl_lsu_typ!=2'b00) & ~lsu_phase & ~ctrl_ifu_flush;

always@(*) begin
	if(ctrl_lsu_typ == STORE)
		lsu2icb_cmd_read = 1'b0;
	else
		lsu2icb_cmd_read = 1'b1;
end




endmodule
