//-------------------------------------------------------------
//This confidential and proprietary software may be used only as 
//authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is
//applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized
//copies.
//-------------------------------------------------------------
//File:        i_cache
//Author:      lihua
//Date:        21-08-25 15:51:55
//Version:     0.1
//Description: TBD
//     cache_line = 8byte
//     index      = 0bit   only 1cache_line
//     offset     = 3bit 
//     tag        = 29bit
//-------------------------------------------------------------
//Modification History:
//Date                 By         Version       Change Description
//21-08-25 15:51:55   lihua         0.1             Original
//-------------------------------------------------------------
module   i_cache #(
    parameter   ADW    = 32   ,
    parameter   DW     = 64   ,
    parameter   PC_DW  = 32
)(  
    input                   clk                           , //clk 
    input                   rstn                          ,
//WITH IFU
    input                   ifu2icache_cmd_valid          ,//the handshake signal
    output  reg             ifu2icache_cmd_ready          ,//the handshake signal
    input        [ADW-1:0]  ifu2icache_cmd_addr           ,//address from ifu
    input                   ifu2icache_cmd_read           ,//read enable
    input        [PC_DW-1:0]ifu2icache_cmd_wdata          ,//data from the ifu that needs to be written
    input        [3:0]      ifu2icache_cmd_wmask          ,//mask from the ifu
    output  reg             ifu2icache_rsp_valid          ,//the handshake signal
    input                   ifu2icache_rsp_ready          ,//the handshake signal
    output  reg  [PC_DW-1:0]ifu2icache_rsp_rdata          ,//data returned by the slave
    output  reg             ifu2icache_rsp_err            ,
//WITH BIU
    output  reg             icache2icb_cmd_valid          ,//the handshake signal
    input                   icache2icb_cmd_ready          ,//the handshake signal
    output  reg  [ADW-1:0]  icache2icb_cmd_addr           ,//address from ifu
    output  reg             icache2icb_cmd_read           ,//read enable
    output  reg  [DW:0]     icache2icb_cmd_wdata          ,//data from the ifu that needs to be written
    output  reg  [3:0]      icache2icb_cmd_wmask          ,//mask from the ifu
    input                   icache2icb_rsp_valid          ,//the handshake signal
    output  reg             icache2icb_rsp_ready          ,//the handshake signal
    input        [DW-1:0]   icache2icb_rsp_rdata          ,//data returned by the slave
    input                   icache2icb_rsp_err            
);

//---------------local param -----------------------//
localparam  TAG_DW = 29 ;

//-----------------declare ------------------------//
reg  [TAG_DW-1:0]  tag    ;
reg                tag_vld;
reg                tag_vld_temp;
reg  [DW-1:0]      data   ;
reg  [DW-1:0]      data_temp;
reg                hit    ;
reg  [ADW-1:0]     cmd_addr_1d;
reg hit_ori;
reg hit_ori_1d;


//-----------------Main code -------------------------//

//tag and tag_vld
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    tag_vld_temp <= 1'b0;
  end
  else if(icache2icb_rsp_valid)begin  
    tag_vld_temp <= 1'b1;
  end
  else if(icache2icb_cmd_valid & icache2icb_cmd_ready )begin  
    tag_vld_temp <= 1'b0;
  end
end

always@(*)begin
    tag_vld = tag_vld_temp | icache2icb_rsp_valid;
end


always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    tag  <= {TAG_DW{1'b0}} ;
  end
  else if(icache2icb_cmd_valid & icache2icb_cmd_ready)begin  
    tag  <= icache2icb_cmd_addr[ADW-1:3];
  end
end


//addr pipe 1cycle
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    cmd_addr_1d  <= {ADW{1'b0}} ;
  end
  else if(ifu2icache_cmd_valid & ifu2icache_cmd_ready)begin  
    cmd_addr_1d  <= icache2icb_cmd_addr;
  end
end

//gen data 
always@(posedge clk )begin
  if(icache2icb_rsp_valid & (~icache2icb_rsp_err))begin  
    data_temp <= icache2icb_rsp_rdata;
  end
end

always@(*)begin
  if(icache2icb_rsp_valid & (~icache2icb_rsp_err))begin
    data = icache2icb_rsp_rdata;
  end 
  else begin
    data = data_temp;
  end
end

// icache2icb_cmd_valid
reg ifu2icache_cmd_valid_mask;

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    ifu2icache_cmd_valid_mask  <= 1'b1 ;
  end
  else if(icache2icb_rsp_valid)begin
    ifu2icache_cmd_valid_mask  <= 1'b1 ;
  end
  else if(icache2icb_cmd_valid &icache2icb_cmd_ready )begin   
    ifu2icache_cmd_valid_mask  <= 1'b0 ;
  end
end

always@(*)begin
    if( hit_ori == 1'b0 && ifu2icache_cmd_valid_mask)begin
       icache2icb_cmd_valid = ifu2icache_cmd_valid;
    end
    else begin
       icache2icb_cmd_valid = 1'b0 ;
    end
end

always@(*)begin
    icache2icb_cmd_addr  = ifu2icache_cmd_addr  ;
    icache2icb_cmd_read  = ifu2icache_cmd_read  ;
    icache2icb_cmd_wdata = ifu2icache_cmd_wdata ;
    icache2icb_cmd_wmask = ifu2icache_cmd_wmask ;
    icache2icb_rsp_ready = ifu2icache_rsp_ready ;
end

// ifu2icache_cmd_ready

always@(*)begin
    if((ifu2icache_cmd_addr[ADW-1:3] == tag) && (tag_vld == 1'b1) && (ifu2icache_cmd_valid))begin
        hit_ori = 1'b1;
    end
    else begin
        hit_ori = 1'b0;
    end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    hit_ori_1d <= 1'b0;
  end
  else begin
    hit_ori_1d <= hit_ori;
  end
end


always@(*)begin
    ifu2icache_cmd_ready = icache2icb_cmd_ready | hit_ori;
end

always@(*)begin
    ifu2icache_rsp_valid = icache2icb_rsp_valid | hit_ori_1d;
end

//hit data
reg [DW-1:0]  hit_data;
reg [DW-1:0]  hit_data_1d;

always@(*)begin
  if( ifu2icache_rsp_valid == 1'b1)begin
      if(cmd_addr_1d[2] == 1'b0)begin
          hit_data = data[31:0];
      end
      else begin
          hit_data = data[63:32];
      end
  end
  else begin
      hit_data = {DW{1'b0}};
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    hit_data_1d <= {DW{1'b0}} ;
  end
  else if(ifu2icache_rsp_valid) begin
    hit_data_1d <= hit_data ;
  end
end

always@(*)begin
    if(ifu2icache_rsp_valid)begin
        ifu2icache_rsp_rdata = hit_data;
    end
    else begin
        ifu2icache_rsp_rdata = hit_data_1d;
    end  
end



always@(*)begin
    ifu2icache_rsp_err = icache2icb_rsp_err;
end



endmodule
