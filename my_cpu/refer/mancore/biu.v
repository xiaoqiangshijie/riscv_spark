//-------------------------------------------------------------
//This confidential and proprietary software may be used only as //authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is //applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized //copies.
//-------------------------------------------------------------
//File       		: biu_top.v
//Author    		: Changge
//Date     	 		: 08/27/2021
//Version 	   	: 0.1
//Description   : This file is the module for auto_man biu, which acts as a bridge
//between inner core and outer slaves.
//attachments.
//-------------------------------------------------------------
//Modification History:
//Date          By  	     Version	  change Description
//08/27/2021    Changge      0.1      Original
//-------------------------------------------------------------

module biu
#(
  parameter   ADDR_WIDTH  = 32,
  parameter   INT_BASE    = 4'b1001                              
)(
  //with control
  input                               rstn                       ,//active low
  input                               clk                        ,//clock

  //with jtag
  input                               jtag2icb_cmd_valid         ,//the handshake signal
  output                              jtag2icb_cmd_ready         ,//the handshake signal
  input        [ADDR_WIDTH-1:0]       jtag2icb_cmd_addr          ,//address from jtag
  input                               jtag2icb_cmd_read          ,//read enable
  input        [31:0]                 jtag2icb_cmd_wdata         ,//data from the jtag that needs to be written
  input        [ 3:0]                 jtag2icb_cmd_wmask         ,//mask from the jtag
  output  reg                         jtag2icb_rsp_valid         ,//the handshake signal
  input                               jtag2icb_rsp_ready         ,//the handshake signal
  output  reg  [31:0]                 jtag2icb_rsp_rdata         ,//data returned by the slave
  output  reg                         jtag2icb_rsp_err           ,//the signal of error status, 1 represents return error, 0 represents the transmission completes without errors

  //with lsu
  input                               lsu2icb_cmd_valid          ,//the handshake signal
  output                              lsu2icb_cmd_ready          ,//the handshake signal
  input        [ADDR_WIDTH-1:0]       lsu2icb_cmd_addr           ,//address from lsu
  input                               lsu2icb_cmd_read           ,//read enable
  input        [63:0]                 lsu2icb_cmd_wdata          ,//data from the lsu that needs to be written
  input        [ 7:0]                 lsu2icb_cmd_wmask          ,//mask from the lsu
  output  reg                         lsu2icb_rsp_valid          ,//the handshake signal
  input                               lsu2icb_rsp_ready          ,//the handshake signal
  output  reg  [63:0]                 lsu2icb_rsp_rdata          ,//data returned by the slave
  output  reg                         lsu2icb_rsp_err            ,//the signal of error status, 1 represents return error, 0 represents the transmission completes without errors

  //with icache
  input                               icache2icb_cmd_valid          ,//the handshake signal
  output                              icache2icb_cmd_ready          ,//the handshake signal
  input        [ADDR_WIDTH-1:0]       icache2icb_cmd_addr           ,//address from icache
  input                               icache2icb_cmd_read           ,//read enable
  input        [31:0]                 icache2icb_cmd_wdata          ,//data from the icache that needs to be written
  input        [ 3:0]                 icache2icb_cmd_wmask          ,//mask from the icache
  output  reg                         icache2icb_rsp_valid          ,//the handshake signal
  input                               icache2icb_rsp_ready          ,//the handshake signal
  output  reg  [63:0]                 icache2icb_rsp_rdata          ,//data returned by the slave
  output  reg                         icache2icb_rsp_err            ,//the signal of error status, 1 represents return error, 0 represents the transmission completes without errors

  //with int
  input                               int_biu_hreadyout          ,//the handshake signal
  input                               int_biu_hresp              ,//transfer status,1'b0 represents the transmission completes without errors, 1'b1 represents return error
  input        [63:0]                 int_biu_hrdata             ,//data from int
  output                              biu_int_hready             ,//the handshake signal
  output                              biu_int_hsel               ,//the select signal
  output       [ADDR_WIDTH-1:0]       biu_int_haddr              ,//address from biu
  output                              biu_int_hwrite             ,//write enable
  output  reg  [63:0]                 biu_int_hwdata             ,//data from the master that needs to be written
  output       [ 2:0]                 biu_int_hburst             ,//burst type
  output       [ 2:0]                 biu_int_hsize              ,//tansfer size
  output       [ 1:0]                 biu_int_htrans             ,//tansfer type, 2'b00 represents no transmission is taking place, 2'b10 represents transfer one data once

  //with pad
  //ar channel
  output                             axi_ar_valid            ,//indicates that the read address channel signals are valid
  input                              axi_ar_ready            ,//indicates that a transfer on the read address channel can be accepted
  output       [ADDR_WIDTH-1:0]      axi_ar_addr             ,//the address of the first transfer in a read transaction
  output       [1:0]                 axi_ar_burst            ,//burst type, indicates how address changes between each transfer in a read transaction
  output       [3:0]                 axi_ar_cache            ,//indicates how a read tansaction is required to progress through a system
  output       [7:0]                 axi_ar_id               ,//identification tag for a read transaction
  output       [7:0]                 axi_ar_len              ,//length, the exact number of data transfers in a read transaction 
  output                             axi_ar_lock             ,//provides information about the atomic characteristics of a read transaction
  output       [2:0]                 axi_ar_prot             ,//protection attributes of a read transaction
  output       [2:0]                 axi_ar_size             ,//size, the number of bytes in each data transfer in a read transaction
 
  //r chanel
  input                              axi_r_valid             ,//indicates that the read data channel signals are valid
  output                             axi_r_ready             ,//indicates that a transfer on the read data channel can be accepted
  input        [63:0]                axi_r_data              ,//read data
  input        [ 7:0]                axi_r_id                ,//identification tag for read data and response
  input                              axi_r_last              ,//indicates whether this is the last data transfer in a read transaction
  input        [ 1:0]                axi_r_resp              ,//read reaponse, indicates the status of a read transfer
                             
  //aw channel                 
  output                             axi_aw_valid            ,//indicates that the write address channel signals are valid
  input                              axi_aw_ready            ,//indicates that a transfer on the write address channel can be accepted
  output       [ADDR_WIDTH-1  :0]    axi_aw_addr             ,//the address of the first transfer in a write transaction
  output       [1:0]                 axi_aw_burst            ,//burst type, indicates how address changes between each transfer in a write transaction
  output       [3:0]                 axi_aw_cache            ,//indicates how a write tansaction is required to progress through a system
  output       [7:0]                 axi_aw_id               ,//identification tag for a write transaction
  output       [7:0]                 axi_aw_len              ,//length, the exact number of data transfers in a write transaction 
  output                             axi_aw_lock             ,//provides information about the atomic characteristics of a write transaction
  output       [2:0]                 axi_aw_prot             ,//protection attributes of a write transaction
  output       [2:0]                 axi_aw_size             ,//size, the number of bytes in each data transfer in a write transaction
 
  //w channel
  output                             axi_w_valid             ,//indicates that the write data channel signals are valid
  input                              axi_w_ready             ,//indicates that a transfer on the read data channel can be accepted
  output       [63:0]                axi_w_data              ,//write data
  output       [ 7:0]                axi_w_id                ,//identification tag for a write transaction
  output                             axi_w_last              ,//indicates whether this is the last data transfer in a write transaction
  output       [ 7:0]                axi_w_strb              ,//write strobes,indicate which byte lanes hold valid data
 
  //b channel
  input                              axi_b_valid             ,//indicates that the write response channel signals are valid
  output                             axi_b_ready             ,//indicates that a transfer on the write response channel can be accepted
  input        [ 7:0]                axi_b_id                ,//identification tag for a write response
  input        [ 1:0]                axi_b_resp              //write reaponse, indicates the status of a write transaction

);

//--------------  declare   -------------------------------//

// icb2pad = icb to pad
wire                             icb2pad_cmd_valid                  ;//the handshake signal
wire       [ADDR_WIDTH-1:0]      icb2pad_cmd_addr                   ;//address from arb to bridge
wire                             icb2pad_cmd_read                   ;//read enable
wire       [63:0]                icb2pad_cmd_wdata                  ;//data from the arb to bridge that needs to be written
wire       [7:0]                 icb2pad_cmd_wmask                  ;//mask from the arb to bridge
wire                             icb2pad_rsp_ready                  ;//the handshake signal
wire                             icb2pad_cmd_ready                  ;//the handshake signal
wire                             icb2pad_rsp_valid                  ;//the handshake signal
wire       [63:0]                icb2pad_rsp_rdata                  ;//returned data by the slave
wire                             icb2pad_rsp_err                    ;//the signal of error status, 1 represents return error, 0 represents the transmission completes without errors 

// icb2int = icb to ahbl
wire                             icb2int_cmd_valid                  ;//the handshake signalmcounterstop_low3bit[2:0]
reg        [ADDR_WIDTH-1:0]      icb2int_cmd_addr                   ;//address from arb to bridge
wire                             icb2int_cmd_read                   ;//read enable
reg        [63:0]                icb2int_cmd_wdata                  ;//data from the arb to bridge that needs to be written
wire       [7:0]                 icb2int_cmd_wmask                  ;//mask from the arb to bridge
wire                             icb2int_rsp_ready                  ;//the handshake signal
wire                             icb2int_cmd_ready                  ;//the handshake signal
wire                             icb2int_rsp_valid                  ;//the handshake signal
wire       [63:0]                icb2int_rsp_rdata                  ;//returned data by the slave
wire                             icb2int_rsp_err                    ;//the signal of error status, 1 represents return error, 0 represents the transmission completes without errors 

wire                             arb_cmd_ready_1p                   ;
wire                             icb2pad_rsp_read                   ;

reg                              not_idle_signal2                   ;//the response signal
wire                             icb2int_rsp_read                   ;//indicate read or write 1-read 0-write
reg                              icb2int_cmd_read_1d                ;
//=================================================================== Arbiter========================================================================
//========================cmd======================
wire                             arb_cmd_valid               ;//the handshake signal
wire       [ADDR_WIDTH-1:0]      arb_cmd_addr                ;//address from arb to bridge
wire                             arb_cmd_read                ;//read enable
wire       [63:0]                arb_cmd_wdata               ;//data from the arb to bridge that needs to be written
wire       [7:0]                 arb_cmd_wmask               ;//mask from the arb to bridge
wire                             arb_rsp_ready               ;//the handshake signal
reg        [1:0]                 returned_flag               ;//the signal that shows which master was chosen,2'b00 represents no master was chosen, 2'b01 represents jtag was chosen, 2'b10 represents lsu was chosen, 2'b11 represents icache was chosen.
wire                             arb_cmd_ready               ;//the handshake signal
wire                             arb_rsp_valid               ;//the handshake signal
wire       [63:0]                arb_rsp_rdata               ;//returned data by the slave
wire                             arb_rsp_err                 ;//the signal of error status, 1 represents return error, 0 represents the transmission completes without errors 
wire                             arb_rsp_read                ;
//reg        [3:0]                 arb_cmd_addr_h4bit_1d       ;

// valid
assign arb_cmd_valid      = jtag2icb_cmd_valid | lsu2icb_cmd_valid | icache2icb_cmd_valid ;

assign arb_cmd_ready      = (arb_cmd_addr[ADDR_WIDTH-1:ADDR_WIDTH-4] == INT_BASE) ? icb2int_cmd_ready  : icb2pad_cmd_ready     ;

//choose a master
assign arb_rsp_ready      = jtag2icb_cmd_valid ? jtag2icb_rsp_ready                    :
                            lsu2icb_cmd_valid  ? lsu2icb_rsp_ready                     :
                            icache2icb_rsp_ready                                       ;
assign arb_cmd_addr       = jtag2icb_cmd_valid ? jtag2icb_cmd_addr                     :
                            lsu2icb_cmd_valid  ? lsu2icb_cmd_addr                      :
                            icache2icb_cmd_addr                                        ;
assign arb_cmd_read       = jtag2icb_cmd_valid ? jtag2icb_cmd_read                     :
                            lsu2icb_cmd_valid  ? lsu2icb_cmd_read                      :
                            icache2icb_cmd_read                                        ;
assign arb_cmd_wdata      = jtag2icb_cmd_valid ? {32'b0,jtag2icb_cmd_wdata}            :
                            lsu2icb_cmd_valid  ? lsu2icb_cmd_wdata                     :
                            {32'b0,icache2icb_cmd_wdata}                               ;
assign arb_cmd_wmask      = jtag2icb_cmd_valid ? {4'b0, jtag2icb_cmd_wmask}            :
                            lsu2icb_cmd_valid  ? lsu2icb_cmd_wmask                     :
                            {4'b0, icache2icb_cmd_wmask}                               ;

assign jtag2icb_cmd_ready     = jtag2icb_cmd_valid & arb_cmd_ready                        ;
assign lsu2icb_cmd_ready      = lsu2icb_cmd_valid  & (!jtag2icb_cmd_valid) & arb_cmd_ready;//jtag and lsu cannot issue valid signal, cause jtag would hold pc.
assign icache2icb_cmd_ready   = !lsu2icb_cmd_valid &  !jtag2icb_cmd_valid  & arb_cmd_ready;

//=======================rsp============================
wire        jtag2icb_rsp_valid_1p; //1 cycle pre
wire [31:0] jtag2icb_rsp_rdata_1p;
wire        jtag2icb_rsp_err_1p  ;   

wire        lsu2icb_rsp_valid_1p; //1 cycle pre
wire [63:0] lsu2icb_rsp_rdata_1p;
wire        lsu2icb_rsp_err_1p  ;   

wire        icache2icb_rsp_valid_1p; //1 cycle pre
wire [63:0] icache2icb_rsp_rdata_1p;
wire        icache2icb_rsp_err_1p  ;   

//----master ARBITER
reg [1:0] master_fifo [3:0]; // 0--ifu   1--lsu  2--jtag 
reg [1:0] master_cmd_cnt;
reg [1:0] master_rsp_cnt;

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      master_cmd_cnt   <= 2'd0;
  end
  else if( arb_cmd_valid & arb_cmd_ready)begin 
      master_cmd_cnt   <= master_cmd_cnt + 2'd1;
  end
end

// 0--icache   1--lsu  2--jtag
always@(posedge clk )begin
  if(icache2icb_cmd_valid & icache2icb_cmd_ready)begin 
      master_fifo[master_cmd_cnt]  <= 2'd0   ;
  end
  else if(lsu2icb_cmd_valid & lsu2icb_cmd_ready)begin 
      master_fifo[master_cmd_cnt]  <= 2'd1   ;
  end
  else if(lsu2icb_cmd_valid & lsu2icb_cmd_ready)begin 
      master_fifo[master_cmd_cnt]  <= 2'd2   ;
  end
end

wire icache_rsp_cond;
wire lsu_rsp_cond;
wire jtag_rsp_cond;

assign  icache_rsp_cond = (arb_rsp_valid == 1'b1)  && ( master_fifo[master_rsp_cnt] == 2'd0 ); 
assign  lsu_rsp_cond    = (arb_rsp_valid == 1'b1)  && ( master_fifo[master_rsp_cnt] == 2'd1 );
assign  jtag_rsp_cond   = (arb_rsp_valid == 1'b1)  && ( master_fifo[master_rsp_cnt] == 2'd2 );


always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      master_rsp_cnt  <= 2'd0;
  end
  else if(arb_rsp_valid)begin 
      master_rsp_cnt  <= master_rsp_cnt + 2'd1;
  end
end

assign jtag2icb_rsp_valid_1p   = jtag_rsp_cond;
assign jtag2icb_rsp_rdata_1p   = jtag_rsp_cond ? arb_rsp_rdata[31:0] : 32'd0;
assign jtag2icb_rsp_err_1p     = jtag_rsp_cond ? arb_rsp_err         : 1'b0 ;

assign lsu2icb_rsp_valid_1p    = lsu_rsp_cond;
assign lsu2icb_rsp_rdata_1p    = lsu_rsp_cond ? arb_rsp_rdata  : 64'd0;
assign lsu2icb_rsp_err_1p      = lsu_rsp_cond ? arb_rsp_err    : 1'b0 ;

assign icache2icb_rsp_valid_1p = icache_rsp_cond;
assign icache2icb_rsp_rdata_1p = icache_rsp_cond ? arb_rsp_rdata  : 64'd0;
assign icache2icb_rsp_err_1p   = icache_rsp_cond ? arb_rsp_err    : 1'b0 ;



always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      jtag2icb_rsp_valid    <= 1'b0;
      lsu2icb_rsp_valid     <= 1'b0;
  end
  else begin 
      jtag2icb_rsp_valid    <= jtag2icb_rsp_valid_1p;
      lsu2icb_rsp_valid     <= lsu2icb_rsp_valid_1p ;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      jtag2icb_rsp_rdata <= 32'd0;
      jtag2icb_rsp_err   <= 1'd0;
  end
  else if(jtag2icb_rsp_valid_1p)begin 
      jtag2icb_rsp_rdata <= jtag2icb_rsp_rdata_1p;
      jtag2icb_rsp_err   <= jtag2icb_rsp_err_1p;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      lsu2icb_rsp_rdata <= 64'd0;
      lsu2icb_rsp_err   <= 1'd0;
  end
  else if(lsu2icb_rsp_valid_1p)begin 
      lsu2icb_rsp_rdata <= lsu2icb_rsp_rdata_1p;
      lsu2icb_rsp_err   <= lsu2icb_rsp_err_1p;
  end
end

//because use icache,so needn't pipe 
always@(*)begin
    icache2icb_rsp_valid = icache2icb_rsp_valid_1p; 
    icache2icb_rsp_rdata = icache2icb_rsp_rdata_1p; 
    icache2icb_rsp_err   = icache2icb_rsp_err_1p;   
end


//=================================================================== decoder========================================================================
//---pad
assign icb2pad_cmd_valid = (arb_cmd_addr[ADDR_WIDTH-1:ADDR_WIDTH-4]  != INT_BASE) ? arb_cmd_valid      : 1'b0                  ; 
assign icb2pad_cmd_addr  = (arb_cmd_addr[ADDR_WIDTH-1:ADDR_WIDTH-4]  != INT_BASE) ? arb_cmd_addr       : {ADDR_WIDTH{1'b0}}    ; 
assign icb2pad_cmd_read  = (arb_cmd_addr[ADDR_WIDTH-1:ADDR_WIDTH-4]  != INT_BASE) ? arb_cmd_read       : 1'b0                  ; 
assign icb2pad_cmd_wdata = (arb_cmd_addr[ADDR_WIDTH-1:ADDR_WIDTH-4]  != INT_BASE) ? arb_cmd_wdata      : 64'b0                 ;
assign icb2pad_cmd_wmask = (arb_cmd_addr[ADDR_WIDTH-1:ADDR_WIDTH-4]  != INT_BASE) ? arb_cmd_wmask      : 8'b0                  ;

//---int
// int module use ahb and it is 32bit, its addr low 4bit is 0/4/8/c.   but icb addr's low 4bit is 0/8 , so here should be different with pad  
assign icb2int_cmd_valid = (arb_cmd_addr[ADDR_WIDTH-1:ADDR_WIDTH-4] == INT_BASE) ? arb_cmd_valid      : 1'b0                  ;

always@(*)begin
    if(arb_cmd_addr[ADDR_WIDTH-1:ADDR_WIDTH-4] == INT_BASE)begin
         if(arb_cmd_read == 1'b0)begin
             icb2int_cmd_addr  =  arb_cmd_addr;
         end
    end
    else begin
        icb2int_cmd_addr  = {ADDR_WIDTH{1'b0}};
    end
end


always@(*)begin
    if(arb_cmd_addr[ADDR_WIDTH-1:ADDR_WIDTH-4] == INT_BASE)begin
       if(icb2int_cmd_wmask == 8'hff)
         icb2int_cmd_wdata = arb_cmd_wdata[63:0]; 
       else if(icb2int_cmd_wmask == 8'hf0)
         icb2int_cmd_wdata = {arb_cmd_wdata[63:32],32'b0};
       else if(icb2int_cmd_wmask == 8'h0f)
         icb2int_cmd_wdata = {32'b0,arb_cmd_wdata[31: 0]};
       else
         icb2int_cmd_wdata = 64'd0 ;
    end
    else begin
       icb2int_cmd_wdata = 64'd0;
    end
end

assign icb2int_cmd_read  = (arb_cmd_addr[ADDR_WIDTH-1:ADDR_WIDTH-4]  == INT_BASE) ? arb_cmd_read   : 1'b0 ;
assign icb2int_cmd_wmask = (arb_cmd_addr[ADDR_WIDTH-1:ADDR_WIDTH-4]  == INT_BASE) ? arb_cmd_wmask  : 8'b0 ;


//----SLAVE ARBITER
reg [1:0] slave_fifo[3:0]; // 0--pad_read   1--pad_write  2--int 
reg [1:0] slave_cmd_cnt;
reg [1:0] slave_rsp_cnt;

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      slave_cmd_cnt   <= 2'd0;
  end
  else if( (icb2pad_cmd_valid & icb2pad_cmd_ready) || (icb2int_cmd_valid & icb2int_cmd_ready) )begin 
      slave_cmd_cnt   <= slave_cmd_cnt + 2'd1;
  end
end

// 0--pad   1--int
always@(posedge clk )begin
  if(icb2pad_cmd_valid & icb2pad_cmd_ready & icb2pad_cmd_read)begin 
      slave_fifo[slave_cmd_cnt]  <= 2'd0   ;
  end
  else if(icb2pad_cmd_valid & icb2pad_cmd_ready & (~icb2pad_cmd_read))begin 
      slave_fifo[slave_cmd_cnt]  <= 2'd1   ;
  end
  else if(icb2int_cmd_valid & icb2int_cmd_ready)begin 
      slave_fifo[slave_cmd_cnt]  <= 2'd2   ;
  end
end

//TBD del for test
wire [1:0]  slave_fifo_0;
wire [1:0]  slave_fifo_1;
wire [1:0]  slave_fifo_2;
wire [1:0]  slave_fifo_3;

assign  slave_fifo_0 = slave_fifo[0];
assign  slave_fifo_1 = slave_fifo[1];
assign  slave_fifo_2 = slave_fifo[2];
assign  slave_fifo_3 = slave_fifo[3];

wire pad_rsp_cond;
wire pad_rsp_read_cond;
wire pad_rsp_write_cond;
wire int_rsp_cond;

assign  pad_rsp_read_cond  = (axi_r_valid == 1'b1) && ( slave_fifo[slave_rsp_cnt] == 2'd0 ); 
assign  pad_rsp_write_cond = (axi_b_valid == 1'b1) && ( slave_fifo[slave_rsp_cnt] == 2'd1 ); 
assign  pad_rsp_cond       = pad_rsp_read_cond | pad_rsp_write_cond;

//because ahb don't support rsp_ready,so,we need generate rsp_read act
reg icb2int_rsp_valid_gen;

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
     icb2int_rsp_valid_gen   <= 1'b0;
  end
  else if( icb2int_rsp_valid )begin 
     icb2int_rsp_valid_gen   <= 1'b1;
  end
  else if(int_rsp_cond)begin
     icb2int_rsp_valid_gen   <= 1'b0;
  end
end

assign  int_rsp_cond = (icb2int_rsp_valid_gen == 1'b1) && ( slave_fifo[slave_rsp_cnt] == 2'd2 ); 

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      slave_rsp_cnt  <= 2'd0;
  end
  else if( pad_rsp_cond | int_rsp_cond )begin 
      slave_rsp_cnt  <= slave_rsp_cnt + 2'd1;
  end
end

assign icb2int_rsp_ready = int_rsp_cond;

assign arb_rsp_valid = pad_rsp_cond | int_rsp_cond;

assign arb_rsp_rdata = int_rsp_cond ? icb2int_rsp_rdata   : icb2pad_rsp_rdata ;
assign arb_rsp_err   = int_rsp_cond ? icb2int_rsp_err     : icb2pad_rsp_err   ;   

//=================================================================== icb2axi Bridge========================================================================
wire [1:0] axi_resp; 
//ar channel :read address
assign   axi_ar_valid   = icb2pad_cmd_read && icb2pad_cmd_valid;
assign   axi_ar_addr    = icb2pad_cmd_addr; 
assign   axi_ar_burst   = 2'b01;
assign   axi_ar_cache   = 4'b0;
assign   axi_ar_id      = 8'd0;
assign   axi_ar_len     = 8'b0;
assign   axi_ar_lock    = 1'b0;
assign   axi_ar_prot    = 3'b0;
assign   axi_ar_size    = 3'b010;

//r chanel :read
assign   axi_r_ready    = pad_rsp_read_cond;

//aw channel :write address
assign   axi_aw_valid   = !icb2pad_cmd_read && icb2pad_cmd_valid;
assign   axi_aw_addr    = icb2pad_cmd_addr;
assign   axi_aw_burst   = 2'b01;
assign   axi_aw_cache   = 4'b0;
assign   axi_aw_id      = 8'd0;
assign   axi_aw_len     = 8'b0;
assign   axi_aw_lock    = 1'b0;
assign   axi_aw_prot    = 3'b0;
assign   axi_aw_size    = 3'b010;

assign   axi_w_valid    = axi_aw_valid      ;
assign   axi_w_id       = axi_aw_id         ;
assign   axi_w_data     = icb2pad_cmd_wdata ;
assign   axi_w_last     = 1'b1              ;
assign   axi_w_strb     = icb2pad_cmd_wmask ;

//b channel : back

assign   axi_b_ready    = pad_rsp_write_cond ;

//-------axi to icb
assign   icb2pad_cmd_ready = icb2pad_cmd_read ? axi_ar_ready : axi_aw_ready                   ;
assign   icb2pad_rsp_rdata = axi_r_data                                                          ;
assign   axi_resp          = axi_r_resp  | axi_b_resp                                         ;
assign   icb2pad_rsp_err   = axi_resp[1]                                         ;

//0914 lihua 
assign   icb2pad_rsp_read  = axi_r_valid;

//=================================================================== icb2ahblBridge========================================================================
assign biu_int_htrans  = icb2int_cmd_valid ? 2'b10 : 2'b00        ;//htrans = 2'b10 means nonseq transmission, transfer single data once; htrans = 2'b00 means idle transmission, and transfer no data.
assign biu_int_hwrite  = ~icb2int_cmd_read                        ;
assign biu_int_haddr   = icb2int_cmd_addr                         ;
assign biu_int_hburst  = 3'b000                                   ;//single transmission 
assign biu_int_hsize   = 3'b010                                   ;//the width of transmission is 32 bits
assign biu_int_hsel    = icb2int_cmd_valid                        ;

always@(*)begin
  if(icb2int_cmd_valid && !icb2pad_cmd_read)  
    biu_int_hwdata = icb2int_cmd_wdata  ;
  else
    biu_int_hwdata = 64'b0              ;
end

assign icb2int_cmd_ready = int_biu_hreadyout                                          ;

//filter the idle signal,when master donnot rise a valid signal but slave is
//ready on the rising edge of each clock,means there has no data transmission.
always@(posedge clk or negedge rstn)begin:INT_RSP
  if(rstn == 1'b0)
    not_idle_signal2   <= 1'b0                                                        ;
  else if(icb2int_cmd_valid == 1'b0 && int_biu_hreadyout == 1'b1) 
    not_idle_signal2   <= 1'b0                                                        ;
  else
    not_idle_signal2   <= 1'b1                                                        ;
end

assign biu_int_hready      = int_biu_hreadyout                                        ;
assign icb2int_rsp_valid   = not_idle_signal2 && int_biu_hreadyout                    ;
assign icb2int_rsp_rdata   = int_biu_hrdata                                           ;
assign icb2int_rsp_err     = int_biu_hresp                                            ;


endmodule
