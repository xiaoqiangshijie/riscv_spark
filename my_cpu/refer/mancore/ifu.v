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
  input  wire                      ctrl_pc_stall         ,//stop the pc
  input  wire [PC_WIDTH   -1:0]    ctrl_ifu_pc           ,
  input  wire                      ctrl_ifu_pc_vld       ,
  output wire                      ifu_ctrl_pc_state     ,// 0--There are no unreturned PC     1--There is an unreturned PC

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
  input                            de_real_valid         ,
//WITH ROB
  output reg  [31:0]               ifu_rob_jump_pc    

);




//------------------Main Code -----------------------//



//-------------------------------------------------------------------------------------
//Descrption:choose the pc we need (from INT / PC+4 / ALU) ,then output pc and pc_vld
//-------------------------------------------------------------------------------------


//STEP1 generate pc_ifu_addr
reg  [PC_WIDTH-1:0] pc_ifu_addr ;
wire [PC_WIDTH-1:0] pc_next     ;


always @(posedge clk or negedge rstn)begin
  if (!rstn)  //reset
      pc_ifu_addr <= 32'h0000_0000;
  else if(ctrl_ifu_pc_vld) 
      pc_ifu_addr <= ctrl_ifu_pc ;
  else if(alu_ifu_pc_vld) 
      pc_ifu_addr <= alu_ifu_pc ;
  else if (ifu2icache_cmd_ready & (!ctrl_pc_stall))
      pc_ifu_addr <= pc_ifu_addr + 32'h4;
end



//STEP2 Generate real_valid

//STEP 2.1 generate vld_extend
reg  rsp_vld_extend;  

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
wire  ifu_real_valid;
assign  ifu_real_valid = (ifu2icache_rsp_valid| rsp_vld_extend) & (!ctrl_ifu_stall);



//STEP 3 generate pc 
reg [PC_WIDTH-1:0] pc_1d ;
always @(posedge clk) begin
  if(ifu2icache_cmd_ready && ifu2icache_cmd_valid)
    pc_1d <= pc_ifu_addr ;
end

always @(posedge clk) begin
  if(ifu_real_valid)
    ifu_de_pc <= pc_1d ;
end





//-------------------------------------------------------------------------------------
//Descrption:generate cmd  signal
//-------------------------------------------------------------------------------------


//STEP 1.1 get icb_addr
assign ifu2icache_cmd_addr  =  pc_ifu_addr ;  


//STEP 1.2 get cmd_valid and other signal
assign ifu2icache_cmd_read  =  1'b1         ;
assign ifu2icache_rsp_ready =  1'b1         ;
assign ifu2icache_cmd_wmask =  4'b1111      ;
assign ifu2icache_cmd_valid = !ctrl_pc_stall ;



//-------------------------------------------------------------------------------------
//Descrption:generate inst & inst_vld
//-------------------------------------------------------------------------------------

always @(posedge clk or negedge rstn)begin
  if(!rstn) 
    ifu_de_inst <= 32'b0 ;
  else if( ifu_real_valid )
    ifu_de_inst <= ifu2icache_rsp_rdata ;   
end


always @(posedge clk or negedge rstn)begin
  if (!rstn) 
    ifu_de_inst_vld <= 1'b0 ;
  else 
    ifu_de_inst_vld <= ifu_real_valid;
end

//-------------------------------------------------------------------------------------
//Descrption:Write channel is useless
//------------------------------------------------------------------------------------
 
 assign  ifu2icache_cmd_wdata = {INS_WIDTH{1'b0}};


//-------------------------------------------------------------------------------------
//Descrption:generate ROB PC
//------------------------------------------------------------------------------------

reg [31:0]  ifu_rob_jump_pc_temp;

always @(posedge clk or negedge rstn)begin
  if (!rstn)  //reset
      ifu_rob_jump_pc_temp <= 32'hffff_ffff;
  else if(ctrl_ifu_pc_vld) 
      ifu_rob_jump_pc_temp <= ctrl_ifu_pc ;
  else if(alu_ifu_pc_vld) 
      ifu_rob_jump_pc_temp <= alu_ifu_pc;
end

always@(*)begin
  if(ctrl_ifu_pc_vld) 
      ifu_rob_jump_pc = ctrl_ifu_pc ;
  else if(alu_ifu_pc_vld) 
      ifu_rob_jump_pc = alu_ifu_pc;
  else   
      ifu_rob_jump_pc = ifu_rob_jump_pc_temp;
end



//-------------------------------------------------------------------------------------
//Descrption:   Check whether all instructions corresponding to PC are returned
//   reset: ifu_ctrl_pc_state = 0
//   cmd_vld  ifu_ctrl_pc_state + 1
//   rsp_vld  ifu_ctrl_pc_state - 1
//------------------------------------------------------------------------------------
wire  pc_cmd_vld;
assign pc_cmd_vld = ifu2icache_cmd_valid  & ifu2icache_cmd_ready ;


reg [2:0]  ifu_ctrl_pc_state_temp;

always @(posedge clk or negedge rstn)begin
  if (!rstn) 
    ifu_ctrl_pc_state_temp <= 3'd0 ;
  else if( ( pc_cmd_vld) & (~de_real_valid) )
    ifu_ctrl_pc_state_temp <= ifu_ctrl_pc_state_temp + 3'd1 ;
  else if( (~pc_cmd_vld) & ( de_real_valid) )
    ifu_ctrl_pc_state_temp <= ifu_ctrl_pc_state_temp - 3'd1 ;
end

assign  ifu_ctrl_pc_state = (ifu_ctrl_pc_state_temp == 3'd0); //align with oitf_empty

endmodule                                                 
