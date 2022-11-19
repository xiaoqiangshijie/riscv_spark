//-------------------------------------------------------------
//This confidential and proprietary software may be used only as //authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is //applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized //copies.
//-------------------------------------------------------------
//File       		: biu_top.v
//Author    		: Changge
//Date     	 		: 08/12/2021
//Version 	   	: 0.1
//Description   : This file is the module for biu, which acts as a bridge
//between inner core and outer slaves.
//attachments.
//-------------------------------------------------------------
//Modification History:
//Date          By  	     Version	  change Description
//08/06/2021    Changge      0.1      Original
//08/12/2021    Changge      0.2      add description 
//09/10/2021    jingjing     0.3      add lsu size   
//-------------------------------------------------------------

module biu
#(
  parameter   DATA_WIDTH  = 32,
  parameter   INT_BASE    = 15                              //tbd
)(
  //with control
  input                        rstn                          ,//active low
  input                        clk                           ,//clock

  //with jtag
  input                           jtag2icb_cmd_valid         ,//the handshake signal
  output                          jtag2icb_cmd_ready         ,//the handshake signal
  input    [DATA_WIDTH-1:0]       jtag2icb_cmd_addr          ,//address from jtag
  input                           jtag2icb_cmd_read          ,//read enable
  input    [DATA_WIDTH-1:0]       jtag2icb_cmd_wdata         ,//data from the jtag that needs to be written
  input    [DATA_WIDTH/8-1:0]     jtag2icb_cmd_wmask         ,//mask from the jtag
  output                          jtag2icb_rsp_valid         ,//the handshake signal
  input                           jtag2icb_rsp_ready         ,//the handshake signal
  output   [DATA_WIDTH-1:0]       jtag2icb_rsp_rdata         ,//data returned by the slave
  output                          jtag2icb_rsp_err           ,//the signal of error status, 1 represents return error, 0 represents the transmission completes without errors

  //with lsu
  input                           lsu2icb_cmd_valid          ,//the handshake signal
  output                          lsu2icb_cmd_ready          ,//the handshake signal
  input    [DATA_WIDTH-1:0]       lsu2icb_cmd_addr           ,//address from lsu
  input                           lsu2icb_cmd_read           ,//read enable
  input    [DATA_WIDTH-1:0]       lsu2icb_cmd_wdata          ,//data from the lsu that needs to be written
  input    [DATA_WIDTH/8-1:0]     lsu2icb_cmd_wmask          ,//mask from the lsu
  output                          lsu2icb_rsp_valid          ,//the handshake signal
  input                           lsu2icb_rsp_ready          ,//the handshake signal
  output   [DATA_WIDTH-1:0]       lsu2icb_rsp_rdata          ,//data returned by the slave
  output                          lsu2icb_rsp_err            ,//the signal of error status, 1 represents return error, 0 represents the transmission completes without errors

  output                          biu_ctrl_stall             ,//stall signal to stall the pipeline            

  //with if
  input                           if2icb_cmd_valid           ,//the handshake signal
  output                          if2icb_cmd_ready           ,//the handshake signal
  input    [DATA_WIDTH-1:0]       if2icb_cmd_addr            ,//address from if
  input                           if2icb_cmd_read            ,//read enable
  input    [DATA_WIDTH-1:0]       if2icb_cmd_wdata           ,//data from the if that needs to be written
  input    [DATA_WIDTH/8-1:0]     if2icb_cmd_wmask           ,//mask from the if
  output                          if2icb_rsp_valid           ,//the handshake signal
  input                           if2icb_rsp_ready           ,//the handshake signal
  output   [DATA_WIDTH-1:0]       if2icb_rsp_rdata           ,//data returned by the slave
  output                          if2icb_rsp_err             ,//the signal of error status, 1 represents return error, 0 represents the transmission completes without errors

  //with int
  input                        int_biu_hready                ,//the handshake signal
  input                        int_biu_hresp                 ,//transfer status,1'b0 represents the transmission completes without errors, 1'b1 represents return error
  input    [DATA_WIDTH-1:0]    int_biu_hrdata                ,//data from int
  output                       biu_int_hready                ,//the handshake signal
  output                       biu_int_hsel                  ,//the select signal
  output   [DATA_WIDTH-1:0]    biu_int_haddr                 ,//address from biu
  output                       biu_int_hwrite                ,//write enable
  output   [DATA_WIDTH-1:0]    biu_int_hwdata                ,//data from the master that needs to be written
  output   [2:0]               biu_int_hburst                ,//burst type
  output   [2:0]               biu_int_hsize                 ,//tansfer size
  output   [1:0]               biu_int_htrans                ,//tansfer type, 2'b00 represents no transmission is taking place, 2'b10 represents transfer one data once

  //with other
  input                        other_biu_hready              ,//the handshake signal
  input                        other_biu_hresp               ,//transfer status,1'b0 represents the transmission completes without errors, 1'b1 represents return error
  input    [DATA_WIDTH-1:0]    other_biu_hrdata              ,//data from other
  output                       biu_other_hready              ,//the handshake signal
  output                       biu_other_hsel                ,//the select signal
  output   [DATA_WIDTH-1:0]    biu_other_haddr               ,//address from biu
  output                       biu_other_hwrite              ,//write enable
  output   [DATA_WIDTH-1:0]    biu_other_hwdata              ,//data from the master that needs to be written
  output   [2:0]               biu_other_hburst              ,//burst type
  output   [2:0]               biu_other_hsize               ,//tansfer size
  output   [1:0]               biu_other_htrans              ,//tansfer type, 2'b00 represents no transmission is taking place, 2'b10 represents transfer one data once
  output   [3:0]               biu_other_hprot                //protect bits, 
);


//=================================================================== Arbiter========================================================================
//========================cmd======================
wire                             arb_cmd_valid                  ;//the handshake signal
wire       [DATA_WIDTH-1:0]      arb_cmd_addr                   ;//address from arb to bridge
wire                             arb_cmd_read                   ;//read enable
wire       [DATA_WIDTH-1:0]      arb_cmd_wdata                  ;//data from the arb to bridge that needs to be written
wire       [DATA_WIDTH/8-1:0]    arb_cmd_wmask                  ;//mask from the arb to bridge
wire                             arb_rsp_ready                  ;//the handshake signal
reg       [1:0]                  returned_flag                  ;//the signal that shows which master was chosen,2'b00 represents no master was chosen, 2'b01 represents jtag was chosen, 2'b10 represents lsu was chosen, 2'b11 represents ifu was chosen.
wire                             arb_cmd_ready                  ;//the handshake signal
wire                             arb_rsp_valid                  ;//the handshake signal
wire      [DATA_WIDTH-1:0]       arb_rsp_rdata                  ;//returned data by the slave
wire                             arb_rsp_err                    ;//the signal of error status, 1 represents return error, 0 represents the transmission completes without errors 

reg       [DATA_WIDTH-1:0]    biu_other_hwdata               ;//data from the master that needs to be written


assign biu_ctrl_stall = lsu2icb_cmd_valid | //lsu command address phase
                        ~arb_cmd_ready    ; //bus busy

//tbd valid
assign arb_cmd_valid = jtag2icb_cmd_valid | lsu2icb_cmd_valid | if2icb_cmd_valid;
//choose a master
assign arb_cmd_addr  = jtag2icb_cmd_valid ? jtag2icb_cmd_addr  :
                       lsu2icb_cmd_valid  ? lsu2icb_cmd_addr   :
                       if2icb_cmd_addr                         ;
assign arb_cmd_read  = jtag2icb_cmd_valid ? jtag2icb_cmd_read  :
                       lsu2icb_cmd_valid  ? lsu2icb_cmd_read   :
                       if2icb_cmd_read                        ;
assign arb_cmd_wdata = jtag2icb_cmd_valid ? jtag2icb_cmd_wdata :
                       lsu2icb_cmd_valid  ? lsu2icb_cmd_wdata  :
                       if2icb_cmd_wdata                        ;
assign arb_cmd_wmask = jtag2icb_cmd_valid ? jtag2icb_cmd_wmask :
                       lsu2icb_cmd_valid  ? lsu2icb_cmd_wmask  :
                       if2icb_cmd_wmask                        ;
assign jtag2icb_cmd_ready = jtag2icb_cmd_valid ? arb_cmd_ready : 1'b0               ;
assign lsu2icb_cmd_ready  = lsu2icb_cmd_valid  ? arb_cmd_ready : 1'b0               ;
assign if2icb_cmd_ready   = !lsu2icb_cmd_valid & !jtag2icb_cmd_valid & arb_cmd_ready;

//always@(*)begin:ARBITER TO BRIDGE
//if(jtag2icb_cmd_valid == 1'b1)begin
//  jtag2icb_cmd_ready = arb_cmd_ready                          ;
//end 
//else if(lsu2icb_cmd_valid == 1'b1)begin
//   lsu2icb_cmd_ready  = arb_cmd_ready                         ;
//end 
//else begin 
//   if2icb_cmd_ready   = arb_cmd_ready                         ;
//end
//end

// flag of returned data
always@(posedge clk or negedge rstn)begin:MASTER_CHOSEN_FLAG//tbd rst
  if(rstn == 1'b0)
    returned_flag <= 2'b00                                      ;
  else if(jtag2icb_cmd_valid == 1'b1 && jtag2icb_cmd_ready == 1'b1)
    returned_flag <= 2'b01                                      ;
  else if(lsu2icb_cmd_valid == 1'b1 && lsu2icb_cmd_ready == 1'b1)
    returned_flag <= 2'b10                                      ;
  else if(if2icb_cmd_valid == 1'b1 && if2icb_cmd_ready == 1'b1)
    returned_flag <= 2'b11                                      ;
end

//=======================rsp============================
assign  jtag2icb_rsp_valid = (returned_flag == 2'b01) ? arb_rsp_valid : 1'b0 ;
assign  jtag2icb_rsp_rdata = arb_rsp_rdata                                   ;
assign  jtag2icb_rsp_err   = arb_rsp_err                                     ;

assign  lsu2icb_rsp_valid  = (returned_flag == 2'b10) ? arb_rsp_valid : 1'b0 ;
assign  lsu2icb_rsp_rdata  = arb_rsp_rdata                                   ;
assign  lsu2icb_rsp_err    = arb_rsp_err                                     ;

assign  if2icb_rsp_valid  = (returned_flag == 2'b11) ? arb_rsp_valid : 1'b0  ;
assign  if2icb_rsp_rdata  = arb_rsp_rdata                                    ;
assign  if2icb_rsp_err    = arb_rsp_err                                      ;

assign arb_rsp_ready = (returned_flag == 2'b01) ? jtag2icb_rsp_ready :
                       (returned_flag == 2'b10) ? lsu2icb_rsp_ready  :
                                                  if2icb_rsp_ready   ;
//tbd type wire

//=================================================================== Bridge========================================================================
wire         [1:0]                       bdg_ts_htrans                       ;//the type of transmission,"ts" means to slave
wire                                     ts_bdg_hready                       ;//the handshake signal
wire                                     bdg_ts_hwrite                       ;//the write enable
wire         [DATA_WIDTH-1:0]            bdg_ts_haddr                        ;//the address from master to slave
reg          [DATA_WIDTH-1:0]            bdg_ts_hwdata                       ;//the write data from master to slave
wire         [2:0]                       bdg_ts_hburst                       ;//the type of burst transmission
wire         [2:0]                       bdg_ts_hsize                        ;//the width of the data transmission
wire                                     ts_bdg_hresp                        ;//the response signal
wire         [DATA_WIDTH-1:0]            ts_bdg_hrdata                       ;//the read data from slave to master
reg                                      not_idle_signal                         ;//the response signal
assign bdg_ts_htrans   = arb_cmd_valid ? 2'b10 : 2'b00                       ;//htrans = 2'b10 means nonseq transmission, transfer single data once; htrans = 2'b00 means idle transmission, and transfer no data.
assign bdg_ts_haddr    = arb_cmd_addr                                        ;
assign bdg_ts_hburst   = 3'b000                                              ;//single transmission 


assign bdg_ts_hsize = arb_cmd_wmask[2:0]; //lsu send size not mask


always@(posedge clk)begin:WRITE_DATA
  if(arb_cmd_valid && bdg_ts_hwrite)//tbd
    bdg_ts_hwdata       <= arb_cmd_wdata                                     ;
end



assign  bdg_ts_hwrite = ~arb_cmd_read;

assign arb_cmd_ready   = ts_bdg_hready             ;

//tbd description
//filter the idle signal,when master donnot rise a valid signal but slave is
//ready on the rising edge of each clock,means there has no data transmission.
always@(posedge clk or negedge rstn)begin:RSP_valid
  if(rstn == 1'b0)
    not_idle_signal     <= 1'b0                                              ;
  else if(arb_cmd_valid == 1'b0 && ts_bdg_hready == 1'b1) 
    not_idle_signal     <= 1'b0                                              ;
  else
    not_idle_signal     <= 1'b1                                              ;//tbd rst
end

assign arb_rsp_valid     = not_idle_signal && ts_bdg_hready                  ;
assign arb_rsp_rdata     = ts_bdg_hrdata                                     ;
assign arb_rsp_err       = ts_bdg_hresp                                      ;
 
//=============================================================== Fench and return====================================================================

assign ts_bdg_hready     = int_biu_hready && other_biu_hready                                                  ;
assign biu_int_hready    = ts_bdg_hready                                                                       ;
assign biu_other_hready  = ts_bdg_hready                                                                       ;

assign biu_int_hsel      = (bdg_ts_htrans == 2'b10) && (bdg_ts_haddr[31:28] == INT_BASE)                       ;
assign biu_int_haddr     =  bdg_ts_haddr                                                                       ;
assign biu_int_hwrite    = (ts_bdg_hready == 1'b1 && biu_int_hsel == 1'b1) ? bdg_ts_hwrite :1'b0               ;              //tbd                                         
assign biu_int_hwdata    =  bdg_ts_hwdata                                                ;
assign biu_int_hburst    = (ts_bdg_hready == 1'b1 && biu_int_hsel == 1'b1) ? bdg_ts_hburst : 3'b000            ;//if else :?
assign biu_int_hsize     = (ts_bdg_hready == 1'b1 && biu_int_hsel == 1'b1) ? bdg_ts_hsize : 3'b010             ;
assign biu_int_htrans    = bdg_ts_htrans                                                                       ;

assign biu_other_hsel    = ~biu_int_hsel                                                                       ;
assign biu_other_haddr   = bdg_ts_haddr                                                                        ;
assign biu_other_hwrite  = (ts_bdg_hready == 1'b1 && biu_other_hsel == 1'b1) ? bdg_ts_hwrite :1'b0             ;                  //tbd                                         
//assign biu_other_hwdata  = bdg_ts_hwdata

reg [2:0] bdg_ts_haddr_reg;
reg       biu_int_hsel_reg;

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0) begin
    bdg_ts_haddr_reg    <= 2'b00;
    biu_int_hsel_reg    <= 1'b0;
  end else if(ts_bdg_hready) begin
    bdg_ts_haddr_reg    <= bdg_ts_haddr[1:0];
    biu_int_hsel_reg    <= biu_int_hsel;
  end
end

always@(*)begin
  case(bdg_ts_haddr_reg)
    2'b00 : biu_other_hwdata = bdg_ts_hwdata;
    2'b01 : biu_other_hwdata = {bdg_ts_hwdata[23:0],8'h00};
    2'b10 : biu_other_hwdata = {bdg_ts_hwdata[15:0],16'h00};
    2'b11 : biu_other_hwdata = {bdg_ts_hwdata[7:0],24'h00};
  endcase
end
      



assign biu_other_hburst  = (ts_bdg_hready == 1'b1 && biu_other_hsel == 1'b1) ? bdg_ts_hburst : 3'b000          ;//if else
assign biu_other_hsize   = (ts_bdg_hready == 1'b1 && biu_other_hsel == 1'b1) ? bdg_ts_hsize : 3'b010           ;
assign biu_other_htrans  = bdg_ts_htrans                                                                       ;
assign biu_other_hprot   = 4'b0000;

assign ts_bdg_hrdata     = biu_int_hsel_reg ? int_biu_hrdata : other_biu_hrdata                                        ;
assign ts_bdg_hresp      = biu_int_hsel_reg ? int_biu_hresp  : other_biu_hresp                                          ;

endmodule
