//-------------------------------------------------------------
//This confidential and proprietary software may be used only as //authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is //applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized //copies.
//-------------------------------------------------------------
//File	: inst_fetch.v
//Author	: Zhurong
//Date	: 08/12/2021
//Version	: 0.6
//Description	  : This file is module for IF,it can recive the point from
//pc,and use it to catch the instruction from biu,after that, it can save the
//instruction and the point for a cycle.It also can deal with the flush
//signal by clearing the register.Also it can deal with the ctrl_ifu_stall signal to
//stop the pipeline by registing the data(instruction and the
//point).Finally,it output the pc point to alu and instruction to decode
//module.
//The IFU module performs the following functions:
//1. According to the PC address output from the PC register, follow the ICB protocol and BIU bus communication to retrieve the instruction and write it into the pipeline register.
//2. Process pipeline flushing and reset the register after receiving pipeline flushing signal.
//3. Send the data in the pipeline register to the next pipeline.
//4. Send the PC value of the currently executed command to ALU and control module.
//5. Pre decode the flag bit of LSU to BIU for processing.
//6. Only when BIU_ ifu_ icb_ rsp_'s valid is 1 and there is no halt, the fetched instruction and the executing PC can be written to the pipeline register.
//7. The decode module is instantiated. The current beat is pre decoded to generate a flag of the LSU instruction. When this flag is valid, the LSU will seize the BIU. The BIU will not give the IFU ready signal, but the data is transmitted normally.
//-------------------------------------------------------------
//Modification History:
//Date          	By	    Version	        Change Description
//08/12/2021   yingzheng    1.0           add pc, delete flush,add itcm
//09/06/2021   yingzheng    1.1           add real_valid 
//09/08/2021   yingzheng    1.2           add comments
//09/08/2021   yingzheng    1.3           delete itcm
//-------------------------------------------------------------

module ifu #(
  parameter PC_WIDTH    = 32                             ,
  parameter INS_WIDTH   = 32
)(

//WITH TOP  
  input  wire                      clk                   ,//clock
  input  wire                      rstn                  ,
//WITH CTRL
  input  wire                      ctrl_ifu_stall        ,//stop the pipeline,inst can not be trans to the de module 
  input  wire                      ctrl_ifu_flush        ,
  input  wire                      ctrl_pc_stall         ,//stop the pc
  input  wire [PC_WIDTH   -1:0]    ctrl_ifu_pc           ,
  input  wire                      ctrl_ifu_pc_vld       ,
  output                           ifu_ctrl_cmd_valid    ,
  output                           ifu_ctrl_cmd_ready    ,
  output      [PC_WIDTH   -1:0]    ifu_ctrl_cmd_addr     ,
  output      [PC_WIDTH   -1:0]    ifu_ctrl_jump_pc      ,
//WITH ALU
  input  wire [PC_WIDTH   -1:0]    alu_ifu_pc            ,
  input  wire                      alu_ifu_pc_vld        ,
// WITH ICB
  output wire                      ifu2icache_cmd_valid  ,
  input  wire                      ifu2icache_cmd_ready  ,
  output wire [INS_WIDTH  -1:0]    ifu2icache_cmd_addr   ,
  output wire                      ifu2icache_cmd_read   ,//1'b1
  output wire [INS_WIDTH  -1:0]    ifu2icache_cmd_wdata  ,//useless 
  output wire [INS_WIDTH/8-1:0]    ifu2icache_cmd_wmask  ,//4'b1111
  input  wire                      ifu2icache_rsp_valid  ,
  output wire                      ifu2icache_rsp_ready  ,//1'b1
  input  wire [INS_WIDTH  -1:0]    ifu2icache_rsp_rdata  ,
  input  wire                      ifu2icache_rsp_err    ,//useless
//WITH DE
  output reg  [INS_WIDTH  -1:0]    ifu_de_inst           ,
  output reg                       ifu_de_inst_vld       ,
  output reg  [INS_WIDTH  -1:0]    ifu_de_pc             ,
  output reg  [INS_WIDTH  -1:0]    ifu_de_npc            ,
//WITH BPU
  output      [31:0]               ifu_bpu_addr          ,
  output                           ifu_bpu_vaild         ,
  input       [31:0]               bpu_ifu_npc           
//WITH ROB
//  output reg  [31:0]               ifu_rob_jump_pc             


);

//reg
reg [2:0]              ins_in_cnt;
reg [2:0]              ins_out_cnt;
reg [PC_WIDTH-1:0]     ins_fifo [7:0]; 
reg                    rsp_vld_extend;  
reg [PC_WIDTH-1:0]     pc_ifu_addr ;
reg [2:0]              pc_in_cnt;
reg [2:0]              pc_out_cnt;
reg [PC_WIDTH-1:0]     pc_fifo [7:0]; 
reg [2:0]              npc_in_cnt;
reg [2:0]              npc_out_cnt;
reg [PC_WIDTH-1:0]     npc_fifo [7:0]; 
reg                    ifu2icache_cmd_valid_temp; 
reg [PC_WIDTH-1:0]     ifu_rob_jump_pc_temp;

//wire 
wire  ins_fifo_empty;
wire  ifu_real_valid_no_flush ;
wire  ifu_real_valid;

//------------------Main Code -----------------------//



//-------------------------------------------------------------------------------------
//Descrption:choose the pc we need (from INT / PC+4 / ALU) ,then output pc and pc_vld
//-------------------------------------------------------------------------------------

//generate bpu sequence signal

//STEP1 generate pc_ifu_addr
reg [31:0] ctrl_ifu_pc_1d;
always @(posedge clk or negedge rstn)begin
  if (!rstn)  //reset
      ctrl_ifu_pc_1d <= 32'h0000_0000;
  else if(ctrl_ifu_pc_vld) 
      ctrl_ifu_pc_1d <= ctrl_ifu_pc ;
end

reg [31:0] alu_ifu_pc_1d;
always @(posedge clk or negedge rstn)begin
  if (!rstn)  //reset
      alu_ifu_pc_1d <= 32'h0000_0000;
  else if(alu_ifu_pc_vld) 
      alu_ifu_pc_1d <= alu_ifu_pc ;
end

reg ctrl_ifu_pc_vld_1d;
always @(posedge clk or negedge rstn)begin
  if (!rstn)  //reset
    ctrl_ifu_pc_vld_1d <= 1'b0;
  else
    ctrl_ifu_pc_vld_1d <= ctrl_ifu_pc_vld;
end

reg alu_ifu_pc_vld_1d;
always @(posedge clk or negedge rstn)begin
  if (!rstn)  
    alu_ifu_pc_vld_1d <= 1'b0;
  else
    alu_ifu_pc_vld_1d <= alu_ifu_pc_vld;
end

assign ifu_bpu_vaild = ifu2icache_cmd_ready & ifu2icache_cmd_valid;

reg ifu_bpu_vaild_1d;
always @(posedge clk or negedge rstn)begin
  if(!rstn)
    ifu_bpu_vaild_1d <= 1'b0;
  else 
    ifu_bpu_vaild_1d <= ifu_bpu_vaild;
end

reg  [31:0] pc_ifu_addr_temp;
always @(*)begin
  if(ctrl_ifu_pc_vld_1d)
    pc_ifu_addr_temp = ctrl_ifu_pc_1d;
  else if(alu_ifu_pc_vld_1d)
    pc_ifu_addr_temp = alu_ifu_pc_1d;
  else
    pc_ifu_addr_temp = bpu_ifu_npc;
end

wire bpu_addr_vld;
assign bpu_addr_vld = ifu_bpu_vaild_1d || ctrl_ifu_pc_vld_1d || alu_ifu_pc_vld_1d;

reg [31:0] pc_ifu_addr_temp_1d;
always @(posedge clk or negedge rstn)begin
  if(!rstn)
    pc_ifu_addr_temp_1d <= 32'b0;
  else if(bpu_addr_vld)
    pc_ifu_addr_temp_1d <= pc_ifu_addr_temp;
end

assign pc_ifu_addr = bpu_addr_vld ? pc_ifu_addr_temp : pc_ifu_addr_temp_1d;

//STEP2 Generate bpu addr signal

assign ifu_bpu_addr = pc_ifu_addr;

// npc fifo generate 

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      npc_in_cnt <= 3'd0;
  end
  else if(ifu_bpu_vaild_1d)begin 
      npc_in_cnt <= npc_in_cnt + 3'd1;
  end
end

always@(posedge clk )begin
  if(ifu_bpu_vaild_1d)begin 
      npc_fifo[npc_in_cnt] <= pc_ifu_addr;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      npc_out_cnt <= 3'd0;
  end
  else if(ifu_real_valid_no_flush )begin 
      npc_out_cnt <= npc_out_cnt + 3'd1;
  end
end

always@(posedge clk) begin
  if(ifu_real_valid)
    ifu_de_npc <= npc_fifo[npc_out_cnt];
end




//STEP 2.1 generate vld_extend
always @(posedge clk or negedge rstn) begin
  if(!rstn)
    rsp_vld_extend <= 1'b0 ;
  else if( ifu2icache_rsp_valid & ctrl_ifu_stall )
    rsp_vld_extend <= 1'b1 ;
  else if( !ctrl_ifu_stall )begin
    rsp_vld_extend <= 1'b0 ;
  end
end


//STEP 2.2  generate ifu_real_valid
assign ifu_real_valid_no_flush = (ifu2icache_rsp_valid| rsp_vld_extend | (!ins_fifo_empty) ) & (!ctrl_ifu_stall)  ;
assign ifu_real_valid = ifu_real_valid_no_flush  &(!ctrl_ifu_flush);


//STEP 3 generate pc 
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      pc_in_cnt <= 3'd0;
  end
  else if(ifu2icache_cmd_ready && ifu2icache_cmd_valid)begin 
      pc_in_cnt <= pc_in_cnt + 3'd1;
  end
end


always@(posedge clk )begin
  if(ifu2icache_cmd_ready && ifu2icache_cmd_valid)begin 
      pc_fifo[pc_in_cnt] <= pc_ifu_addr;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      pc_out_cnt <= 3'd0;
  end
  else if(ifu_real_valid_no_flush )begin 
      pc_out_cnt <= pc_out_cnt + 3'd1;
  end
end

always@(posedge clk) begin
  if(ifu_real_valid)
    ifu_de_pc <= pc_fifo[pc_out_cnt];
end

//-------------------------------------------------------------------------------------
//Descrption:generate cmd  signal
//-------------------------------------------------------------------------------------

//STEP 1.1 get icb_addr
assign ifu2icache_cmd_addr  =  pc_ifu_addr ;  


//STEP 1.2 get cmd_valid and other signal
assign ifu2icache_cmd_read  =  1'b1        ;
assign ifu2icache_rsp_ready =  1'b1        ;
assign ifu2icache_cmd_wmask =  4'b1111     ;


always @(posedge clk or negedge rstn) begin
  if(!rstn)
    ifu2icache_cmd_valid_temp <= 1'b0;
  else 
    ifu2icache_cmd_valid_temp <= 1'b1;
end

assign ifu2icache_cmd_valid = (!ctrl_pc_stall) && ifu2icache_cmd_valid_temp ;




//-------------------------------------------------------------------------------------
//Descrption:generate inst & inst_vld
//-------------------------------------------------------------------------------------

//STEP 1.1 generate ins_fifo

assign  ins_fifo_empty = (ins_out_cnt == ins_in_cnt);



always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      ins_in_cnt <= 3'd0;
  end
  else if( (ctrl_ifu_stall | (!ins_fifo_empty) )  & ifu2icache_rsp_valid )begin // the ins should be stored into the fifo when the fifo is not empty,that means the fifo still stores serveral ins,thos ins is waiting for launched.
      ins_in_cnt <= ins_in_cnt + 3'd1;
  end
end


always@(posedge clk )begin
  if( ( (ctrl_ifu_stall | (!ins_fifo_empty) ) ) & ifu2icache_rsp_valid )begin 
      ins_fifo[ins_in_cnt] <= ifu2icache_rsp_rdata;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      ins_out_cnt <= 3'd0;
  end
  else if(ifu_real_valid_no_flush & (!ins_fifo_empty ))begin 
      ins_out_cnt <= ins_out_cnt + 3'd1;
  end
end
//STEP 1.2  generate ins & vld

always @(posedge clk or negedge rstn) begin
  if(rstn == 1'b0)begin
      ifu_de_inst <= 32'd0;
  end
  else if(ifu_real_valid) begin
    if(!ins_fifo_empty )
      ifu_de_inst <= ins_fifo[ins_out_cnt] ;
    else 
      ifu_de_inst <= ifu2icache_rsp_rdata ;
  end
end

always @(posedge clk or negedge rstn)begin
  if (!rstn) 
    ifu_de_inst_vld <= 1'b0 ;
  else 
    ifu_de_inst_vld <= ifu_real_valid;
end

//-------------------------------------------------------------------------------------
//Descrption:generate CTRL signal
//------------------------------------------------------------------------------------
assign ifu_ctrl_cmd_valid = ifu2icache_cmd_valid ;
assign ifu_ctrl_cmd_ready = ifu2icache_cmd_ready ;
assign ifu_ctrl_cmd_addr  = ifu2icache_cmd_addr  ;
assign ifu_ctrl_jump_pc   = alu_ifu_pc           ;




//-------------------------------------------------------------------------------------
//Descrption:Write channel is useless
//------------------------------------------------------------------------------------
 
assign  ifu2icache_cmd_wdata = {INS_WIDTH{1'b0}};

endmodule                                                 
