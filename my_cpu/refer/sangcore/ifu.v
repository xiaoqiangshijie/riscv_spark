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
//Date	By	Version	Change Description
//07/23/2021   Zhurong   0.1           Original
//07/27/2001   Zhurong   0.2           delete the rstn signal
//08/04/2021   Zhurong   0.3           add icb interface for ifu
//08/10/2021   Zhurong   0.4           add minidecode
//08/11/2021   Zhurong   0.5           change the drive of the signal-ifu_biu_icb_cmd_valid to the filp of ctrl_ifu_stall.  
//08/12/2021   Zhurong   0.6           add commit
//-------------------------------------------------------------

module ifu(
  input  wire      clk                   , //clock
  input  wire      rstn                  ,
//with control
  input  wire      ctrl_ifu_flush        ,//flushing the pipeline
  input  wire      br_ctrl_flush         ,
  input  wire      ctrl_ifu_stall        ,//stop the pipeline
  output reg[31:0]       ifu_ctrl_int_epc      ,//pc of the current instruction before interrupt
  output wire      ifu_ctrl_ready        ,//Pass the ready given by BIU to control.
  output wire      ifu_ctrl_valid        ,//Pass the valid given by BIU to control.
//with pc
  input  wire[31:0]pc_ifu_addr           ,// pc's pointer
  output wire      ifu_pc_icb_cmd_ready  ,//The PC module uses this signal to observe whether the previous instruction is retieved normally. Only after the previous instruction is retrieved will the PC change of sequential retrieval be carried out.
//with biu
  input  wire[31:0]biu_ifu_icb_rsp_rdata ,//instruct caught from biu
  input  wire      biu_ifu_icb_cmd_ready ,//ICB handshake protocol, indicating that the next PC can be read.
  input  wire      biu_ifu_icb_rsp_valid ,//ICB handshake protocol indicates that the retrieved instruction content data is valid.
  output wire      ifu_biu_icb_rsp_ready ,//ICB handshake protocol indicates that the instruction content retrieved by the BIU is accepted, which is always one in this design.
  output wire      ifu_biu_icb_cmd_valid ,//ICB handshake protocol shows that the current PC value is valid, and the design is to suspend the pipeline signal and reverse it.
  output wire[31:0]ifu_biu_icb_cmd_addr  ,//pc's pointer
  output           ifu_biu_icb_cmd_read  ,//READ ENABLE
//with alu
  output reg [31:0]ifu_alu_current_pc    ,//when alu deal with B/J instrution , it need this signal
//with de
  output reg [31:0]ifu_de_ins             //Beat and output the instruction content retrieved by BIU.
);

//
assign ifu_biu_icb_cmd_read = 1'b1 ;
//                                                    ;
reg [31:0] pc_filp                                       ;
assign ifu_biu_icb_cmd_addr  = pc_ifu_addr           ; //use this signal to catch the instrution
assign ifu_ctrl_valid        = biu_ifu_icb_rsp_valid ;
assign ifu_ctrl_ready        = biu_ifu_icb_cmd_ready ;
assign ifu_pc_icb_cmd_ready  = biu_ifu_icb_cmd_ready ;
assign ifu_biu_icb_cmd_valid = ~ctrl_ifu_stall & ~ctrl_ifu_flush;
assign ifu_biu_icb_rsp_ready = 1'b1                  ;

reg [31:0] biu_ifu_icb_rsp_rdata_reg; //save the read back instruction data when pipeline stall
wire [31:0] biu_ifu_rdata;

always @(posedge clk or negedge rstn)begin
  if(!rstn)
    ifu_de_ins         <= 32'b0 ;
  else  if (ctrl_ifu_flush)begin  //flush the pipeline
    ifu_de_ins         <= 32'b0 ;
  end
  else if (!ctrl_ifu_stall)begin//Only when the pipeline is not suspended and the instruction content is retrieved from the BIU can the instruction PC value and instruction content be written to the pipeline register. 
    ifu_de_ins         <= biu_ifu_rdata;
  end
end

always @(posedge clk or negedge rstn)begin
  if(!rstn)
    biu_ifu_icb_rsp_rdata_reg      <= 32'b0 ;
  else  if (ctrl_ifu_flush)  //flush the pipeline
    biu_ifu_icb_rsp_rdata_reg         <= 32'b0 ;
  else if (biu_ifu_icb_rsp_valid)//Only when the pipeline is not suspended and the instruction content is retrieved from the BIU can the instruction PC value and instruction content be written to the pipeline register. 
    biu_ifu_icb_rsp_rdata_reg      <= biu_ifu_icb_rsp_rdata ;
end

//Only when the pipeline is not suspended and the instruction content is retrieved from the BIU can the instruction PC value and instruction content be written to the pipeline register.
assign biu_ifu_rdata = biu_ifu_icb_rsp_valid ? biu_ifu_icb_rsp_rdata : biu_ifu_icb_rsp_rdata_reg;


/////////////use handshake signal to sync the pc and the instruction
always @(posedge clk)begin
//  if (ctrl_ifu_flush)begin  //flush the pipeline
//    pc_filp   <= 32'b0 ;
//  end
  if (!ctrl_ifu_stall)begin 
      pc_filp   <= pc_ifu_addr;
  end
end

always @(posedge clk)begin  // the second filpflop for pc, use biu_ifu_icb_rsp_valid as control signal to make sure the instruction we needed has been catched from biu at the same time.
//  if (ctrl_ifu_flush)begin  //flush the pipeline
//    ifu_alu_current_pc <= 32'b0 ;
//    ifu_ctrl_int_epc   <= 32'b0 ;
//  end
  if (!ctrl_ifu_stall)begin 
    ifu_alu_current_pc <= pc_filp;
    ifu_ctrl_int_epc   <= pc_filp;
  end
end

endmodule                                                 
