//-------------------------------------------------------------
//This confidential and proprietary software may be used only as //authorized by a licensing agreement from Orbbec Inc.
//In the event of publication, the following notice is //applicable:
//(C)COPYRIGHT 2013 ORBBEC INC. ALL RIGHTS RESERVED.
//The entire notice above must be reproduced on all authorized //copies.
//-------------------------------------------------------------
//File       		: dtcm.v
//Author    		: Changge
//Date     	 		: 08/29/2021
//Version 	   	: 0.1
//Description   : This file is the module for dtcm (data tightly
//coupled memory).
//attachments.
//-------------------------------------------------------------
//Modification History:
//Date          By  	     Version	  change Description
//08/29/2021    Changge      0.1      Original
//-------------------------------------------------------------

module dtcm #(
  parameter  DATA_WIDTH  = 64,
  parameter  ADDR_WIDTH  = 32

)(
  input                            clk                    ,
  input                            rstn                   ,
  input                            lsu2dtcm_cmd_valid     ,
  output                           lsu2dtcm_cmd_ready     ,
  input       [ADDR_WIDTH-1:0]     lsu2dtcm_cmd_addr      ,
  input                            lsu2dtcm_cmd_read      ,
  input       [DATA_WIDTH-1:0]     lsu2dtcm_cmd_wdata     ,
  input       [DATA_WIDTH/8-1:0]   lsu2dtcm_cmd_wmask     ,
  output  reg                      lsu2dtcm_rsp_valid     ,
  input                            lsu2dtcm_rsp_ready     ,
  output      [DATA_WIDTH-1:0]     lsu2dtcm_rsp_rdata     ,
  output                           lsu2dtcm_rsp_err       
);

wire [12:0] ram_addr   ;

wire        ram0_wen   ;
wire [7:0]  ram0_wdata ;
wire [7:0]  ram0_rdata ;

wire        ram1_wen   ;
wire [7:0]  ram1_wdata ;
wire [7:0]  ram1_rdata ;

wire        ram2_wen   ;
wire [7:0]  ram2_wdata ;
wire [7:0]  ram2_rdata ;

wire        ram3_wen   ;
wire [7:0]  ram3_wdata ;
wire [7:0]  ram3_rdata ;

wire        ram4_wen   ;
wire [7:0]  ram4_wdata ;
wire [7:0]  ram4_rdata ;

wire        ram5_wen   ;
wire [7:0]  ram5_wdata ;
wire [7:0]  ram5_rdata ;

wire        ram6_wen   ;
wire [7:0]  ram6_wdata ;
wire [7:0]  ram6_rdata ;

wire        ram7_wen   ;
wire [7:0]  ram7_wdata ;
wire [7:0]  ram7_rdata ;

wire chip0_en ;
wire chip1_en ;
wire chip2_en ;
wire chip3_en ;
wire chip4_en ;
wire chip5_en ;
wire chip6_en ;
wire chip7_en ;

assign chip0_en = lsu2dtcm_cmd_read ? lsu2dtcm_cmd_valid : lsu2dtcm_cmd_valid && lsu2dtcm_cmd_wmask[0] ;
assign chip1_en = lsu2dtcm_cmd_read ? lsu2dtcm_cmd_valid : lsu2dtcm_cmd_valid && lsu2dtcm_cmd_wmask[1] ;
assign chip2_en = lsu2dtcm_cmd_read ? lsu2dtcm_cmd_valid : lsu2dtcm_cmd_valid && lsu2dtcm_cmd_wmask[2] ;
assign chip3_en = lsu2dtcm_cmd_read ? lsu2dtcm_cmd_valid : lsu2dtcm_cmd_valid && lsu2dtcm_cmd_wmask[3] ;
assign chip4_en = lsu2dtcm_cmd_read ? lsu2dtcm_cmd_valid : lsu2dtcm_cmd_valid && lsu2dtcm_cmd_wmask[4] ;
assign chip5_en = lsu2dtcm_cmd_read ? lsu2dtcm_cmd_valid : lsu2dtcm_cmd_valid && lsu2dtcm_cmd_wmask[5] ;
assign chip6_en = lsu2dtcm_cmd_read ? lsu2dtcm_cmd_valid : lsu2dtcm_cmd_valid && lsu2dtcm_cmd_wmask[6] ;
assign chip7_en = lsu2dtcm_cmd_read ? lsu2dtcm_cmd_valid : lsu2dtcm_cmd_valid && lsu2dtcm_cmd_wmask[7] ;
assign lsu2dtcm_cmd_ready = 1'b1                                                                       ;
assign ram_addr = lsu2dtcm_cmd_addr[12:0]                                                              ;

assign ram0_wen   = !lsu2dtcm_cmd_read                             ;
assign ram0_wdata = lsu2dtcm_cmd_wdata[7:0]                        ;
    
assign ram1_wen   = !lsu2dtcm_cmd_read                             ;
assign ram1_wdata = lsu2dtcm_cmd_wdata[15:8]                       ;
    
assign ram2_wen   = !lsu2dtcm_cmd_read                             ;
assign ram2_wdata = lsu2dtcm_cmd_wdata[23:16]                      ;
    
assign ram3_wen   = !lsu2dtcm_cmd_read                             ;
assign ram3_wdata = lsu2dtcm_cmd_wdata[31:24]                      ;
    
assign ram4_wen   = !lsu2dtcm_cmd_read                             ;
assign ram4_wdata = lsu2dtcm_cmd_wdata[39:32]                      ;
    
assign ram5_wen   = !lsu2dtcm_cmd_read                             ;
assign ram5_wdata = lsu2dtcm_cmd_wdata[47:40]                      ;
    
assign ram6_wen   = !lsu2dtcm_cmd_read                             ;
assign ram6_wdata = lsu2dtcm_cmd_wdata[55:48]                      ;
    
assign ram7_wen   = !lsu2dtcm_cmd_read                             ;
assign ram7_wdata = lsu2dtcm_cmd_wdata[63:56]                      ;
    
always@(posedge clk or negedge rstn)begin
  if(!rstn)
    lsu2dtcm_rsp_valid <= 1'b0                   ;
  else 
    lsu2dtcm_rsp_valid <= lsu2dtcm_cmd_valid     ;
end

assign lsu2dtcm_rsp_rdata =  {ram7_rdata,ram6_rdata,ram5_rdata,ram4_rdata,ram3_rdata,ram2_rdata,ram1_rdata,ram0_rdata};
assign lsu2dtcm_rsp_err   = 1'b0; 
ram_sp #(
.DATA               (8)    ,
.ADDR               (13)   ,
.DEPTH              (8192) ,
.PIPELINE           (0)
) u0_ram_sp (
  .clk              (clk)        ,
  .rstn             (rstn)       ,
  .slp              (1'b0)       ,
  .sd               (1'b0)       ,
  .addr             (ram_addr)   ,
  .cg_bypass        (1'b0)       ,
  .chip_en          (chip0_en)   ,
  .write_en         (ram0_wen)   ,
  .write_data       (ram0_wdata) ,
  .read_data        (ram0_rdata)
);
    
ram_sp #(
.DATA               (8)    ,
.ADDR               (13)   ,
.DEPTH              (8192) ,
.PIPELINE           (0)
) u1_ram_sp (
  .clk              (clk)        ,
  .rstn             (rstn)       ,
  .slp              (1'b0)       ,
  .sd               (1'b0)       ,
  .addr             (ram_addr)   ,
  .cg_bypass        (1'b0)       ,
  .chip_en          (chip1_en)   ,
  .write_en         (ram1_wen)   ,
  .write_data       (ram1_wdata) ,
  .read_data        (ram1_rdata)
);
    
ram_sp #(
.DATA               (8)    ,
.ADDR               (13)   ,
.DEPTH              (8192) ,
.PIPELINE           (0)                             
) u2_ram_sp (                                       
  .clk              (clk)        ,
  .rstn             (rstn)       ,
  .slp              (1'b0)       ,
  .sd               (1'b0)       ,
  .addr             (ram_addr)   ,
  .cg_bypass        (1'b0)       ,
  .chip_en          (chip2_en)   ,
  .write_en         (ram2_wen)   ,
  .write_data       (ram2_wdata) ,
  .read_data        (ram2_rdata)
);
    
ram_sp #(
.DATA               (8)    ,
.ADDR               (13)   ,
.DEPTH              (8192) ,
.PIPELINE           (0)                            
) u3_ram_sp (                                      
  .clk              (clk)        ,
  .rstn             (rstn)       ,
  .slp              (1'b0)       ,
  .sd               (1'b0)       ,
  .addr             (ram_addr)   ,
  .cg_bypass        (1'b0)       ,
  .chip_en          (chip3_en)   ,
  .write_en         (ram3_wen)   ,
  .write_data       (ram3_wdata) ,
  .read_data        (ram3_rdata)
);
    
ram_sp #(
.DATA               (8)    ,
.ADDR               (13)   ,
.DEPTH              (8192) ,
.PIPELINE           (0)                            
) u4_ram_sp (                                      
  .clk              (clk)        ,
  .rstn             (rstn)       ,
  .slp              (1'b0)       ,
  .sd               (1'b0)       ,
  .addr             (ram_addr)   ,
  .cg_bypass        (1'b0)       ,
  .chip_en          (chip4_en)   ,
  .write_en         (ram4_wen)   ,
  .write_data       (ram4_wdata) ,
  .read_data        (ram4_rdata)
);
    
ram_sp #(
.DATA               (8)    ,
.ADDR               (13)   ,
.DEPTH              (8192) ,
.PIPELINE           (0)                            
) u5_ram_sp (                                      
  .clk              (clk)        ,
  .rstn             (rstn)       ,
  .slp              (1'b0)       ,
  .sd               (1'b0)       ,
  .addr             (ram_addr)   ,
  .cg_bypass        (1'b0)       ,
  .chip_en          (chip5_en)   ,
  .write_en         (ram5_wen)   ,
  .write_data       (ram5_wdata) ,
  .read_data        (ram5_rdata)
);
    
ram_sp #(
.DATA               (8)    ,
.ADDR               (13)   ,
.DEPTH              (8192) ,
.PIPELINE           (0)                            
) u6_ram_sp (                                      
  .clk              (clk)        ,
  .rstn             (rstn)       ,
  .slp              (1'b0)       ,
  .sd               (1'b0)       ,
  .addr             (ram_addr)   ,
  .cg_bypass        (1'b0)       ,
  .chip_en          (chip6_en)   ,
  .write_en         (ram6_wen)   ,
  .write_data       (ram6_wdata) ,
  .read_data        (ram6_rdata)
);
    
ram_sp #(
.DATA               (8)    ,
.ADDR               (13)   ,
.DEPTH              (8192) ,
.PIPELINE           (0)                            
) u7_ram_sp (                                      
  .clk              (clk)        ,
  .rstn             (rstn)       ,
  .slp              (1'b0)       ,
  .sd               (1'b0)       ,
  .addr             (ram_addr)   ,
  .cg_bypass        (1'b0)       ,
  .chip_en          (chip7_en)   ,
  .write_en         (ram7_wen)   ,
  .write_data       (ram7_wdata) ,
  .read_data        (ram7_rdata)
);

endmodule