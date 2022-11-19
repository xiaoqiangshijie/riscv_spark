
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
//Description: 
//     cache_size = 16KB
//     4way
//     cache_line = 32byte = 4ins = 256bit
//     offset     = 5bit chose 32byte 
//     index      = 7bit  (16KB/4way = 4KB/way,  4KB/32Byte=128set)
//     tag        = 32-5-7=20bit
//-------------------------------------------------------------
//Modification History:
//Date                 By         Version       Change Description
//21-08-25 15:51:55   lihua         0.1             Original
//-------------------------------------------------------------
module icache_core #(
    parameter   ADW           = 64   ,
    parameter   DW            = 64   ,
    parameter   PC_DW         = 32   ,
    parameter   SET           = 128  ,
    parameter   LINE_DW       = 512  
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
    output                  ifu2icache_rsp_valid          ,//the handshake signal
    input                   ifu2icache_rsp_ready          ,//the handshake signal
    output       [PC_DW-1:0]ifu2icache_rsp_rdata          ,//data returned by the slave
    output                  ifu2icache_rsp_err            ,
    output                  burst_idle_state              ,
//WITH BIU
    output  reg             icache2icb_cmd_valid          ,//the handshake signal
    input                   icache2icb_cmd_ready          ,//the handshake signal
    output  reg  [ADW-1:0]  icache2icb_cmd_addr           ,//address from ifu
    output                  icache2icb_cmd_read           ,//read enable
    output       [DW-1:0]   icache2icb_cmd_wdata          ,//data from the ifu that needs to be written
    output       [3:0]      icache2icb_cmd_wmask          ,//mask from the ifu
    input                   icache2icb_rsp_valid          ,//the handshake signal
    output                  icache2icb_rsp_ready          ,//the handshake signal
    input        [DW-1:0]   icache2icb_rsp_rdata          ,//data returned by the slave
    input                   icache2icb_rsp_err            
);



function integer clog2;
  input integer value;
  begin
    value = value - 1;
    for (clog2=0; value>0; clog2=clog2+1)
      value = value>>1;
  end
endfunction

//---------------local param -----------------------//
//localparam  LINE_DW       = 256;
localparam  OFFSET_DW     = clog2(LINE_DW>>3);
localparam  IDX_DW        = clog2(SET);
localparam  TAG_DW        = ADW - OFFSET_DW - IDX_DW;
//localparam  SET           = 128;
localparam  WAY           = 4;
//localparam  WORD          = 32;
localparam  BLOCK_DW      = LINE_DW>>6;
localparam  BURST_DW      = clog2(BLOCK_DW);

//-----------------declare ------------------------//
reg  [SET-1:0]                tag_vld_w0;
reg  [SET-1:0]                tag_vld_w1;
reg  [SET-1:0]                tag_vld_w2;
reg  [SET-1:0]                tag_vld_w3;
reg                           tag_vld_miss;
reg  [7:0]                    lru_cnt [SET-1:0];  //W3 W2 W1 W0                
reg  [LINE_DW-1:0]            array_cache_line;
reg  [LINE_DW-1:0]            rsp_cache_line_buff;
//reg                           tag_hit;
wire                          tag_hit;
reg                           tag_hit_1d;
//reg                           tag_miss;
wire                          tag_miss;
reg                           tag_miss_1d;
reg                           burst_state_temp;
wire                          burst_state;
//reg                           burst_pre_go_on;
wire                          burst_pre_go_on;
wire                          burst_idx_tag_hit;
reg  [IDX_DW-1:0]             burst_idx;
reg  [TAG_DW-1:0]             burst_tag;
reg  [OFFSET_DW-1:0]          burst_offset;
wire [IDX_DW-1:0]             cmd_idx;
wire [TAG_DW-1:0]             cmd_tag;
wire [OFFSET_DW-1:0]          cmd_offset;
reg  [IDX_DW-1:0]             cmd_idx_1d;
reg                           cmd_read_1d;
reg  [TAG_DW-1:0]             cmd_tag_1d;
reg  [OFFSET_DW-1:0]          cmd_offset_1d;
reg  [IDX_DW-1:0]             cmd_idx_2d;
reg                           cmd_read_2d;
reg  [TAG_DW-1:0]             cmd_tag_2d;
reg  [OFFSET_DW-1:0]          cmd_offset_2d;
wire                          tag_rd_en;

reg                           tag_wr_en_w0;
reg                           tag_en_w0;
reg  [IDX_DW-1:0]             tag_addr_w0;
reg  [TAG_DW-1:0]             tag_wr_data_w0;
wire [TAG_DW-1:0]             tag_rd_data_w0;

reg                           tag_wr_en_w1;
reg                           tag_en_w1;
reg  [IDX_DW-1:0]             tag_addr_w1;
reg  [TAG_DW-1:0]             tag_wr_data_w1;
wire [TAG_DW-1:0]             tag_rd_data_w1;

reg                           tag_wr_en_w2;
reg                           tag_en_w2;
reg  [IDX_DW-1:0]             tag_addr_w2;
reg  [TAG_DW-1:0]             tag_wr_data_w2;
wire [TAG_DW-1:0]             tag_rd_data_w2;

reg                           tag_wr_en_w3;
reg                           tag_en_w3;
reg  [IDX_DW-1:0]             tag_addr_w3;
reg  [TAG_DW-1:0]             tag_wr_data_w3;
wire [TAG_DW-1:0]             tag_rd_data_w3;

reg                           data_wr_en_w0;
reg                           data_en_w0;
reg  [IDX_DW-1:0]             data_addr_w0;
reg  [LINE_DW-1:0]            data_wr_data_w0;
reg  [LINE_DW/8-1:0]          byte_chose_w0;
wire [LINE_DW-1:0]            data_rd_data_w0;

reg                           data_wr_en_w1;
reg                           data_en_w1;
reg  [IDX_DW-1:0]             data_addr_w1;
reg  [LINE_DW-1:0]            data_wr_data_w1;
reg  [LINE_DW/8-1:0]          byte_chose_w1;
wire [LINE_DW-1:0]            data_rd_data_w1;

reg                           data_wr_en_w2;
reg                           data_en_w2;
reg  [IDX_DW-1:0]             data_addr_w2;
reg  [LINE_DW-1:0]            data_wr_data_w2;
reg  [LINE_DW/8-1:0]          byte_chose_w2;
wire [LINE_DW-1:0]            data_rd_data_w2;

reg                           data_wr_en_w3;
reg                           data_en_w3;
reg  [IDX_DW-1:0]             data_addr_w3;
reg  [LINE_DW-1:0]            data_wr_data_w3;
reg  [LINE_DW/8-1:0]          byte_chose_w3;
wire [LINE_DW-1:0]            data_rd_data_w3;

wire [1:0]                    lru_cnt_w3;
wire [1:0]                    lru_cnt_w2;
wire [1:0]                    lru_cnt_w1;
wire [1:0]                    lru_cnt_w0;

reg  [1:0]                    lru_cnt_w3_next;
reg  [1:0]                    lru_cnt_w2_next;
reg  [1:0]                    lru_cnt_w1_next;
reg  [1:0]                    lru_cnt_w0_next;

wire                          tag_hit_w0;
wire                          tag_hit_w1;
wire                          tag_hit_w2;
wire                          tag_hit_w3;

wire                          lru_w0_3eq;
wire                          lru_w1_3eq;
wire                          lru_w2_3eq;
wire                          lru_w3_3eq;

reg  [BURST_DW-1:0]           cmd_burst_cnt;
wire                          cmd_burst_done;

reg  [BURST_DW-1:0]           rsp_burst_cnt;
reg  [BURST_DW-1:0]           rsp_burst_cnt_1d;
reg                           rsp_burst_done_1d;
reg                           icache2icb_rsp_valid_1d;
wire                          rsp_burst_done;
reg                           burst_pre_rsp_vld;
//reg  [WORD-1:0]                 burst_pre_rsp_data;
wire                          burst_pre_hit;

reg                           tag_vld_hit_w0;
reg                           tag_vld_hit_w1;
reg                           tag_vld_hit_w2;
reg                           tag_vld_hit_w3;

reg                           step2_vld;
reg                           tag_hit_w0_1d;
reg                           tag_hit_w1_1d;
reg                           tag_hit_w2_1d;
reg                           tag_hit_w3_1d;

reg  [1:0]                    victim_way;  //00-w0    01-w1    10-w2  11-w3

reg  [OFFSET_DW-1:0]          burst_offset_mux;
wire [OFFSET_DW-1:0]          burst_offset_mux0;
wire [OFFSET_DW-1:0]          burst_offset_mux1;
wire [OFFSET_DW-1:0]          burst_offset_mux2;
wire [OFFSET_DW-1:0]          burst_offset_mux3;

wire                          offset_mux0_sel;
//reg  [OFFSET_DW-1:0]          burst_offset_sel;
//reg  [OFFSET_DW-1:0]          burst_offset_mux[BLOCK_DW-1:0];
wire [BLOCK_DW-1:0]           offset_mux_sel;

wire                          way_conflict;

wire [BLOCK_DW-1:0]           cache_fill_block;

wire                          block_not_arrived;
wire                          rsp_burst_done_neg;
reg                           pre_go_on_extend;
reg  [BURST_DW-1:0]           burst_offset_high;

//------------------------Main code -----------------------------------//

assign   cmd_offset = ifu2icache_cmd_addr[OFFSET_DW-1        : 0];
assign   cmd_idx    = ifu2icache_cmd_addr[OFFSET_DW+IDX_DW-1 : OFFSET_DW];
assign   cmd_tag    = ifu2icache_cmd_addr[ADW-1              : OFFSET_DW+IDX_DW];

//////////////////////////////////////////////////////////
//  cache_hit:  step1: ready return and read tag--------//
//////////////////////////////////////////////////////////

//return ready

assign  burst_idx_tag_hit =  (cmd_idx == burst_idx) && (cmd_tag == burst_tag);

always@(*)begin
    if(burst_state)begin
        ifu2icache_cmd_ready = ifu2icache_cmd_valid & burst_pre_go_on & burst_idx_tag_hit;
//        ifu2icache_cmd_ready = ifu2icache_cmd_valid & (burst_pre_go_on | pre_go_on_extend) & burst_idx_tag_hit; 
    end
    else begin
        ifu2icache_cmd_ready = ifu2icache_cmd_valid;
    end
end

//read and writetag array
always@(*)begin
    if( ifu2icache_cmd_valid & ifu2icache_cmd_ready & (!burst_state)  )begin //read
        tag_en_w0    = 1'b1;
        tag_wr_en_w0 = 1'b0;
        tag_addr_w0  = cmd_idx;
    end
    else if(rsp_burst_done & (victim_way == 2'd0))begin //write
        tag_en_w0    = 1'b1;
        tag_wr_en_w0 = 1'b1;
        tag_addr_w0  = burst_idx;
    end
    else begin
        tag_en_w0    = 1'b0;
        tag_wr_en_w0 = 1'b0;
        tag_addr_w0  = {IDX_DW{1'b0}};
    end
end

always@(*)begin
    if( ifu2icache_cmd_valid & ifu2icache_cmd_ready & (!burst_state) )begin //read
        tag_en_w1    = 1'b1;
        tag_wr_en_w1 = 1'b0;
        tag_addr_w1  = cmd_idx;
    end
    else if(rsp_burst_done & (victim_way == 2'd1))begin //write
        tag_en_w1    = 1'b1;
        tag_wr_en_w1 = 1'b1;
        tag_addr_w1  = burst_idx;
    end
    else begin
        tag_en_w1    = 1'b0;
        tag_wr_en_w1 = 1'b0;
        tag_addr_w1  = {IDX_DW{1'b0}};
    end
end

always@(*)begin
    if( ifu2icache_cmd_valid & ifu2icache_cmd_ready & (!burst_state) )begin //read
        tag_en_w2    = 1'b1;
        tag_wr_en_w2 = 1'b0;
        tag_addr_w2  = cmd_idx;
    end
    else if(rsp_burst_done & (victim_way == 2'd2))begin //write
        tag_en_w2    = 1'b1;
        tag_wr_en_w2 = 1'b1;
        tag_addr_w2  = burst_idx;
    end
    else begin
        tag_en_w2    = 1'b0;
        tag_wr_en_w2 = 1'b0;
        tag_addr_w2  = {IDX_DW{1'b0}};
    end
end

always@(*)begin
    if( ifu2icache_cmd_valid & ifu2icache_cmd_ready & (!burst_state) )begin //read
        tag_en_w3    = 1'b1;
        tag_wr_en_w3 = 1'b0;
        tag_addr_w3  = cmd_idx;
    end
    else if(rsp_burst_done & (victim_way == 2'd3))begin //write
        tag_en_w3    = 1'b1;
        tag_wr_en_w3 = 1'b1;
        tag_addr_w3  = burst_idx;
    end
    else begin
        tag_en_w3    = 1'b0;
        tag_wr_en_w3 = 1'b0;
        tag_addr_w3  = {IDX_DW{1'b0}};
    end
end

always@(*)begin
    tag_wr_data_w0 = burst_tag;
    tag_wr_data_w1 = burst_tag;
    tag_wr_data_w2 = burst_tag;
    tag_wr_data_w3 = burst_tag;
end

//tag_vld initial and modify
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    tag_vld_w0 <= {SET{1'b0}};
  end
  else if(rsp_burst_done & (victim_way == 2'd0))begin  
    tag_vld_w0[burst_idx] <= 1'b1;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    tag_vld_w1 <= {SET{1'b0}};
  end
  else if(rsp_burst_done & (victim_way == 2'd1))begin  
    tag_vld_w1[burst_idx] <= 1'b1;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    tag_vld_w2 <= {SET{1'b0}};
  end
  else if(rsp_burst_done & (victim_way == 2'd2))begin  
    tag_vld_w2[burst_idx] <= 1'b1;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    tag_vld_w3 <= {SET{1'b0}};
  end
  else if(rsp_burst_done & (victim_way == 2'd3))begin  
    tag_vld_w3[burst_idx] <= 1'b1;
  end
end

//inst tag array
ram_sp #(
    .DATA               ( TAG_DW   ),
    .ADDR               ( IDX_DW   ),
    .DEPTH              ( SET      ),
    .PIPELINE           ( 0        )
)  
w0_tag_array(
    .clk            ( clk             ),
    .rstn           ( rstn            ),
    .slp            ( 1'b0            ),
    .sd             ( 1'b0            ),
    .addr           ( tag_addr_w0     ),
    .cg_bypass      ( 1'b1            ),    
    .chip_en        ( tag_en_w0       ),
    .write_en       ( tag_wr_en_w0    ),
    .write_data     ( tag_wr_data_w0  ),
    .read_data      ( tag_rd_data_w0  )
);

ram_sp #(
    .DATA               ( TAG_DW   ),
    .ADDR               ( IDX_DW   ),
    .DEPTH              ( SET      ),
    .PIPELINE           ( 0        )
)  
w1_tag_array(
    .clk            ( clk             ),
    .rstn           ( rstn            ),
    .slp            ( 1'b0            ),
    .sd             ( 1'b0            ),
    .addr           ( tag_addr_w1     ),
    .cg_bypass      ( 1'b1            ),    
    .chip_en        ( tag_en_w1       ),
    .write_en       ( tag_wr_en_w1    ),
    .write_data     ( tag_wr_data_w1  ),
    .read_data      ( tag_rd_data_w1  )
);

ram_sp #(
    .DATA               ( TAG_DW   ),
    .ADDR               ( IDX_DW   ),
    .DEPTH              ( SET      ),
    .PIPELINE           ( 0        )
) 
w2_tag_array (
    .clk            ( clk             ),
    .rstn           ( rstn            ),
    .slp            ( 1'b0            ),
    .sd             ( 1'b0            ),
    .addr           ( tag_addr_w2     ),
    .cg_bypass      ( 1'b1            ),    
    .chip_en        ( tag_en_w2       ),
    .write_en       ( tag_wr_en_w2    ),
    .write_data     ( tag_wr_data_w2  ),
    .read_data      ( tag_rd_data_w2  )
);

ram_sp #(
    .DATA               ( TAG_DW   ),
    .ADDR               ( IDX_DW   ),
    .DEPTH              ( SET      ),
    .PIPELINE           ( 0        )
)  
w3_tag_array(
    .clk            ( clk             ),
    .rstn           ( rstn            ),
    .slp            ( 1'b0            ),
    .sd             ( 1'b0            ),
    .addr           ( tag_addr_w3     ),
    .cg_bypass      ( 1'b1            ),    
    .chip_en        ( tag_en_w3       ),
    .write_en       ( tag_wr_en_w3    ),
    .write_data     ( tag_wr_data_w3  ),
    .read_data      ( tag_rd_data_w3  )
);

//tag_vld_hit pipe to step2
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    tag_vld_hit_w0 <= 1'b0;
  end
  else begin  
    tag_vld_hit_w0 <= tag_vld_w0[cmd_idx];
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    tag_vld_hit_w1 <= 1'b0;
  end
  else begin  
    tag_vld_hit_w1 <= tag_vld_w1[cmd_idx];
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    tag_vld_hit_w2 <= 1'b0;
  end
  else begin  
    tag_vld_hit_w2 <= tag_vld_w2[cmd_idx];
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    tag_vld_hit_w3 <= 1'b0;
  end
  else begin  
    tag_vld_hit_w3 <= tag_vld_w3[cmd_idx];
  end
end

//tag \ offset \ idx  pipe to step2
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      cmd_offset_1d <= {OFFSET_DW{1'b0}};
      cmd_idx_1d    <= {IDX_DW{1'b0}}; 
      cmd_tag_1d    <= {TAG_DW{1'b0}};
      cmd_read_1d   <= 1'b0; 
  end
  else if(ifu2icache_cmd_valid & ifu2icache_cmd_ready)begin  
      cmd_offset_1d <= cmd_offset;
      cmd_idx_1d    <= cmd_idx   ;
      cmd_tag_1d    <= cmd_tag   ;
      cmd_read_1d   <= ifu2icache_cmd_read; 
  end
end

// vld pipe to step2
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      step2_vld <= 1'b0;
  end
  else begin  
      step2_vld <= ifu2icache_cmd_valid & ifu2icache_cmd_ready & (!burst_state); //only !burst_state need to read array
  end
end

////////////////////////////////////////////////////////////////
//-- step2: tag hit check and read data_array ----------------//
//-  if tag hit,read data_array and modify LRU-cnt
//-  if tag miss , chose victim and into burst state          //
////////////////////////////////////////////////////////////////

//tag_hit check
assign tag_hit_w0 = step2_vld & tag_vld_hit_w0 & (tag_rd_data_w0 == cmd_tag_1d);
assign tag_hit_w1 = step2_vld & tag_vld_hit_w1 & (tag_rd_data_w1 == cmd_tag_1d);
assign tag_hit_w2 = step2_vld & tag_vld_hit_w2 & (tag_rd_data_w2 == cmd_tag_1d);
assign tag_hit_w3 = step2_vld & tag_vld_hit_w3 & (tag_rd_data_w3 == cmd_tag_1d);

assign tag_hit  = tag_hit_w0 | tag_hit_w1 | tag_hit_w2 | tag_hit_w3;
assign tag_miss = step2_vld & (tag_hit == 1'b0);

//read data array
always@(*)begin
    if( tag_hit_w0 )begin //read
        data_en_w0    = 1'b1;
        data_wr_en_w0 = 1'b0;
        data_addr_w0  = cmd_idx_1d;
    end
    else if(rsp_burst_done_1d & (victim_way == 2'd0))begin //write
        data_en_w0    = 1'b1;
        data_wr_en_w0 = 1'b1;
        data_addr_w0  = burst_idx;
    end
    else begin
        data_en_w0    = 1'b0;
        data_wr_en_w0 = 1'b0;
        data_addr_w0  = {IDX_DW{1'b0}};
    end
end

always@(*)begin
    if( tag_hit_w1 )begin //read
        data_en_w1    = 1'b1;
        data_wr_en_w1 = 1'b0;
        data_addr_w1  = cmd_idx_1d;
    end
    else if(rsp_burst_done_1d & (victim_way == 2'd1))begin //write
        data_en_w1    = 1'b1;
        data_wr_en_w1 = 1'b1;
        data_addr_w1  = burst_idx;
    end
    else begin
        data_en_w1    = 1'b0;
        data_wr_en_w1 = 1'b0;
        data_addr_w1  = {IDX_DW{1'b0}};
    end
end

always@(*)begin
    if( tag_hit_w2 )begin //read
        data_en_w2    = 1'b1;
        data_wr_en_w2 = 1'b0;
        data_addr_w2  = cmd_idx_1d;
    end
    else if(rsp_burst_done_1d & (victim_way == 2'd2))begin //write
        data_en_w2    = 1'b1;
        data_wr_en_w2 = 1'b1;
        data_addr_w2  = burst_idx;
    end
    else begin
        data_en_w2    = 1'b0;
        data_wr_en_w2 = 1'b0;
        data_addr_w2  = {IDX_DW{1'b0}};
    end
end

always@(*)begin
    if( tag_hit_w3 )begin //read
        data_en_w3    = 1'b1;
        data_wr_en_w3 = 1'b0;
        data_addr_w3  = cmd_idx_1d;
    end
    else if(rsp_burst_done_1d & (victim_way == 2'd3))begin //write
        data_en_w3    = 1'b1;
        data_wr_en_w3 = 1'b1;
        data_addr_w3  = burst_idx;
    end
    else begin
        data_en_w3    = 1'b0;
        data_wr_en_w3 = 1'b0;
        data_addr_w3  = {IDX_DW{1'b0}};
    end
end

always@(*)begin
    data_wr_data_w0 = rsp_cache_line_buff;
    data_wr_data_w1 = rsp_cache_line_buff;
    data_wr_data_w2 = rsp_cache_line_buff;
    data_wr_data_w3 = rsp_cache_line_buff;
end

ram_sp #(
    .DATA               ( LINE_DW  ),
    .ADDR               ( IDX_DW   ),
    .DEPTH              ( SET      ),
    .PIPELINE           ( 0        )
)  
w0_data_array(
    .clk            ( clk             ),
    .rstn           ( rstn            ),
    .slp            ( 1'b0            ),
    .sd             ( 1'b0            ),
    .addr           ( data_addr_w0    ),
    .cg_bypass      ( 1'b1            ),    
    .chip_en        ( data_en_w0      ),
    .write_en       ( data_wr_en_w0   ),
    .write_data     ( data_wr_data_w0 ),
    .read_data      ( data_rd_data_w0 )
);

ram_sp #(
    .DATA               ( LINE_DW  ),
    .ADDR               ( IDX_DW   ),
    .DEPTH              ( SET      ),
    .PIPELINE           ( 0        )
)  
w1_data_array(
    .clk            ( clk             ),
    .rstn           ( rstn            ),
    .slp            ( 1'b0            ),
    .sd             ( 1'b0            ),
    .addr           ( data_addr_w1    ),
    .cg_bypass      ( 1'b1            ),    
    .chip_en        ( data_en_w1      ),
    .write_en       ( data_wr_en_w1   ),
    .write_data     ( data_wr_data_w1 ),
    .read_data      ( data_rd_data_w1 )
);

ram_sp #(
    .DATA               ( LINE_DW  ),
    .ADDR               ( IDX_DW   ),
    .DEPTH              ( SET      ),
    .PIPELINE           ( 0        )
)
w2_data_array(
    .clk            ( clk             ),
    .rstn           ( rstn            ),
    .slp            ( 1'b0            ),
    .sd             ( 1'b0            ),
    .addr           ( data_addr_w2    ),
    .cg_bypass      ( 1'b1            ),    
    .chip_en        ( data_en_w2      ),
    .write_en       ( data_wr_en_w2   ),
    .write_data     ( data_wr_data_w2 ),
    .read_data      ( data_rd_data_w2 )
);

ram_sp #(
    .DATA               ( LINE_DW  ),
    .ADDR               ( IDX_DW   ),
    .DEPTH              ( SET      ),
    .PIPELINE           ( 0        )
) 
w3_data_array(
    .clk            ( clk             ),
    .rstn           ( rstn            ),
    .slp            ( 1'b0            ),
    .sd             ( 1'b0            ),
    .addr           ( data_addr_w3    ),
    .cg_bypass      ( 1'b1            ),    
    .chip_en        ( data_en_w3      ),
    .write_en       ( data_wr_en_w3   ),
    .write_data     ( data_wr_data_w3 ),
    .read_data      ( data_rd_data_w3 )
);



//offset pipe to step3
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      cmd_offset_2d <= {OFFSET_DW{1'b0}};
      //cmd_idx_2d    <= {IDX_DW{1'b0}}; 
      //cmd_tag_2d    <= {TAG_DW{1'b0}};
      cmd_read_2d   <= 1'b0; 
  end
  else begin  
      cmd_offset_2d <= cmd_offset_1d;
      //cmd_idx_2d    <= cmd_idx_1d   ;
      //cmd_tag_2d    <= cmd_tag_1d   ;
      cmd_read_2d   <= cmd_read_1d; 
  end
end

//hit state pipe to step3;  use as data_vld
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      tag_hit_w0_1d <= 1'b0;
      tag_hit_w1_1d <= 1'b0; 
      tag_hit_w2_1d <= 1'b0;
      tag_hit_w3_1d <= 1'b0;
      tag_hit_1d    <= 1'b0;
  end
  else begin  
      tag_hit_w0_1d <= tag_hit_w0;
      tag_hit_w1_1d <= tag_hit_w1; 
      tag_hit_w2_1d <= tag_hit_w2;
      tag_hit_w3_1d <= tag_hit_w3;
      tag_hit_1d    <= tag_hit;
  end
end

reg [1:0]  randon_cnt;

always@(posedge clk or negedge rstn)begin
  if(!rstn)begin
    randon_cnt <= 2'd0;
  end
  else begin
    randon_cnt <= randon_cnt + 2'd1;
  end
end

always@(posedge clk)begin
  if(tag_miss) begin
    if(!tag_vld_w0[cmd_idx]) begin
      victim_way <= 2'd0;
    end
    else if(!tag_vld_w1[cmd_idx]) begin
      victim_way <= 2'd1;
    end
    else if(!tag_vld_w2[cmd_idx]) begin
      victim_way <= 2'd2;
    end
    else if(!tag_vld_w3[cmd_idx]) begin
      victim_way <= 2'd3;
    end
    else begin
      victim_way <= randon_cnt;
    end
  end
end

assign way_conflict = rsp_burst_done & (
                      (victim_way == 0) & tag_vld_w0[cmd_idx] |
                      (victim_way == 1) & tag_vld_w1[cmd_idx] |
                      (victim_way == 2) & tag_vld_w2[cmd_idx] |
                      (victim_way == 3) & tag_vld_w3[cmd_idx] );

//store burst idx and pc
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      burst_idx    <= {IDX_DW{1'b0}}; 
      burst_tag    <= {TAG_DW{1'b0}};
      burst_offset <= {OFFSET_DW{1'b0}};
  end
  else if(tag_miss)begin  
      burst_idx    <= cmd_idx_1d  ;
      burst_tag    <= cmd_tag_1d  ;
      burst_offset <= cmd_offset_1d;
  end
end

///////////////////////////////////////////////////////////////
//--cache hit  step3: hit commit and miss refill-------------//
///////////////////////////////////////////////////////////////

//chose cache line from 4 ways
always@(*)begin
    case({ tag_hit_w3_1d, tag_hit_w2_1d, tag_hit_w1_1d, tag_hit_w0_1d})
        4'b0001: array_cache_line = data_rd_data_w0; 
        4'b0010: array_cache_line = data_rd_data_w1; 
        4'b0100: array_cache_line = data_rd_data_w2; 
        4'b1000: array_cache_line = data_rd_data_w3; 
        default: array_cache_line = {LINE_DW{1'b0}};
    endcase
end

cache_rsp_reorder #(
    .DTYPE          ( 0         ),
    .DW             ( DW        ),
    .LINE_DW        ( LINE_DW   ),
    .OFFSET_DW      ( OFFSET_DW ),
    .BURST_DW       ( BURST_DW  ),
    .BLOCK_DW       ( BLOCK_DW  ),
    .RSP_DW         ( PC_DW     )
) u0_cache_rsp_reorder (
    .clk                      ( clk                  ), 
    .rstn                     ( rstn                 ),
    .tag_hit_1d               ( tag_hit_1d           ),
    .cmd_offset_1d            ( cmd_offset_1d        ),
    .cmd_offset_2d            ( cmd_offset_2d        ),
    .cmd_read_1d              ( cmd_read_1d          ),
    .cmd_read_2d              ( cmd_read_2d          ),
    .array_cache_line         ( array_cache_line     ),
    .burst_pre_go_on          ( burst_pre_go_on      ),
    .burst_pre_rsp_vld        ( burst_pre_rsp_vld    ),
    .cache2mem_rsp_valid      ( icache2icb_rsp_valid ),
    .rsp_burst_cnt            ( rsp_burst_cnt        ),
    .cache2mem_rsp_rdata      ( icache2icb_rsp_rdata ),
    .offset_mux_sel           ( offset_mux_sel       ),
    .rsp_burst_done_neg       ( rsp_burst_done_neg   ),
    .cache_fill_block         ( cache_fill_block     ),
    .rsp_cache_line_buff      ( rsp_cache_line_buff  ),
    .core2cache_rsp_rdata     ( ifu2icache_rsp_rdata )
);

assign  ifu2icache_rsp_valid = tag_hit_1d | burst_pre_rsp_vld;
assign  ifu2icache_rsp_err   = icache2icb_rsp_err;

////////////////////////////////////////////////////////////////
//   cache miss                                               //  
//   step1:  if step2 miss, into burst state                  //
//       output icache2icb cmd  and chose victim             //  
////////////////////////////////////////////////////////////////

//if tag miss ,into burst state 
always@(posedge clk or negedge rstn)begin                         
  if(rstn == 1'b0)begin                                          
    burst_state_temp <= 1'b0;                                    
  end                                                            
  else if(tag_miss)begin //miss 
    burst_state_temp <= 1'b1;                                    
  end                                                            
  else if(rsp_burst_done)begin                                             
    burst_state_temp <= 1'b0;                                    
  end                                                            
end

assign  burst_state = tag_miss | burst_state_temp;

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin                  
    icache2icb_cmd_valid <= 1'b0;            
  end                                    
  else if(tag_miss)begin //miss   
    icache2icb_cmd_valid <= 1'b1;            
  end                                    
  else if(cmd_burst_done)begin                    
    icache2icb_cmd_valid <= 1'b0;            
  end                                    
end

always@(posedge clk or negedge rstn) begin
  if(rstn == 1'b0) begin                  
    burst_offset_high <= {BURST_DW{1'b0}};            
  end
  else if(tag_miss) begin
    burst_offset_high <= cmd_offset_1d[OFFSET_DW-1:3] + 1'b1;
  end
  else if(icache2icb_cmd_valid & icache2icb_cmd_ready) begin
    burst_offset_high <= burst_offset_high + 1'b1;
  end                                    
  else if(!icache2icb_cmd_valid & !tag_miss) begin                    
    burst_offset_high <= cmd_offset_1d[OFFSET_DW-1:3];            
  end                                    
end

generate
  genvar j;
  for(j = 0; j < BLOCK_DW; j = j + 1) begin: mux_sel
    assign offset_mux_sel[j] = (j == burst_offset[OFFSET_DW-1:3]);    
  end
endgenerate

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin                  
    icache2icb_cmd_addr <= {ADW{1'b0}};
  end                                    
  else if(tag_miss)begin //miss   
//    icache2icb_cmd_addr <= {cmd_tag_1d,cmd_idx_1d,5'b0}; // cmd_xx_1d align with tag_miss 
    icache2icb_cmd_addr <= {cmd_tag_1d,cmd_idx_1d,cmd_offset_1d[OFFSET_DW-1:3],3'b0};
  end                                    
  else if(icache2icb_cmd_valid & icache2icb_cmd_ready & (cmd_burst_cnt != {BURST_DW{1'b1}}))begin
//    case(cmd_burst_cnt) //reduse adder
//      2'd0: icache2icb_cmd_addr <= {burst_tag,burst_idx,5'h8};  
//      2'd1: icache2icb_cmd_addr <= {burst_tag,burst_idx,5'h10};
//      2'd2: icache2icb_cmd_addr <= {burst_tag,burst_idx,5'h18};
//      2'd0: icache2icb_cmd_addr <= {burst_tag,burst_idx,burst_offset_high,3'b0};
//      2'd1: icache2icb_cmd_addr <= {burst_tag,burst_idx,burst_offset_high,3'b0};
//      2'd2: icache2icb_cmd_addr <= {burst_tag,burst_idx,burst_offset_high,3'b0};
//      default:;
//    endcase
    icache2icb_cmd_addr <= {burst_tag,burst_idx,burst_offset_high,3'b0};
  end                                    
end

//  I-CACHE read only
assign icache2icb_cmd_read   = 1'b1;
assign icache2icb_cmd_wdata  = {DW{1'b0}};
assign icache2icb_cmd_wmask  = 4'd0;
assign icache2icb_rsp_ready  = 1'b1;

assign  cmd_burst_done = (cmd_burst_cnt == {BURST_DW{1'b1}}) && (icache2icb_cmd_valid & icache2icb_cmd_ready);

//burst length = 4 
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin                  
    cmd_burst_cnt <= {BURST_DW{1'b0}};            
  end                                    
  else if(cmd_burst_done)begin    
    cmd_burst_cnt <= {BURST_DW{1'b0}};            
  end                                    
  else if( icache2icb_cmd_valid & icache2icb_cmd_ready )begin                    
    cmd_burst_cnt <= cmd_burst_cnt + 1'b1;            
  end                                    
end

////////////////////////////////////////////////////////////////////
//   cache miss:  step2:  BIU rsp data, update rsp_cache_line_buff//
//                        burst pre hit check                     //
////////////////////////////////////////////////////////////////////

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin                  
    rsp_burst_cnt <= {BURST_DW{1'b0}};            
  end                                    
  else if(rsp_burst_done)begin    
    rsp_burst_cnt <= {BURST_DW{1'b0}};            
  end                                    
  else if( icache2icb_rsp_valid )begin                    
    rsp_burst_cnt <= rsp_burst_cnt + 1'b1;            
  end                                    
end

assign rsp_burst_done = (rsp_burst_cnt == {BURST_DW{1'b1}}) & icache2icb_rsp_valid;
assign rsp_burst_done_neg = !rsp_burst_done & rsp_burst_done_1d;

//to align with rsp_cache_line_buff
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin                  
    rsp_burst_cnt_1d        <= {BURST_DW{1'b0}};
    rsp_burst_done_1d       <= 1'b0;
    icache2icb_rsp_valid_1d <= 1'b0;
  end                                    
  else begin
    rsp_burst_cnt_1d        <= rsp_burst_cnt;
    rsp_burst_done_1d       <= rsp_burst_done;
    icache2icb_rsp_valid_1d <= icache2icb_rsp_valid;
  end
end

//---------burst pre hit check
//reg [OFFSET_DW : 0]  burst_compare_offset;   //extend 1 bit to indicate unvaild
//
//always@(posedge clk or negedge rstn)begin
//  if(rstn == 1'b0)begin
//      burst_compare_offset <= {(OFFSET_DW+1){1'b0}};
//  end                                    
//  else if(step1_vld)begin
//      burst_compare_offset <= {1'b0,cmd_offset};
//  end
//  else if()begin
//
//  end
//end

reg  burst_rsp_flag;   
//if burst_pre_go_on = 1,but ifu_cmd_vld=0,then cmd_offset_1d contains, rsp_burst_cnt_1d continue to add 1, burst_pre_go_on will be extend unexpected;
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      burst_rsp_flag <= 1'b0;
  end                                    
  else if(ifu2icache_cmd_valid & ifu2icache_cmd_ready)begin
      burst_rsp_flag <= 1'b1;
  end
  else if(burst_pre_go_on)begin
      burst_rsp_flag <= 1'b0;
  end
end

generate if(LINE_DW == 256) begin: block_4
  assign block_not_arrived =   ((cmd_offset_1d[OFFSET_DW-1:3] == 0) & !cache_fill_block[0])
                             | ((cmd_offset_1d[OFFSET_DW-1:3] == 1) & !cache_fill_block[1])
                             | ((cmd_offset_1d[OFFSET_DW-1:3] == 2) & !cache_fill_block[2])
                             | ((cmd_offset_1d[OFFSET_DW-1:3] == 3) & !cache_fill_block[3]);
end else begin: block_8
  assign block_not_arrived =   ((cmd_offset_1d[OFFSET_DW-1:3] == 0) & !cache_fill_block[0])
                             | ((cmd_offset_1d[OFFSET_DW-1:3] == 1) & !cache_fill_block[1])
                             | ((cmd_offset_1d[OFFSET_DW-1:3] == 2) & !cache_fill_block[2])
                             | ((cmd_offset_1d[OFFSET_DW-1:3] == 3) & !cache_fill_block[3])
                             | ((cmd_offset_1d[OFFSET_DW-1:3] == 4) & !cache_fill_block[4])
                             | ((cmd_offset_1d[OFFSET_DW-1:3] == 5) & !cache_fill_block[5])
                             | ((cmd_offset_1d[OFFSET_DW-1:3] == 6) & !cache_fill_block[6])
                             | ((cmd_offset_1d[OFFSET_DW-1:3] == 7) & !cache_fill_block[7]);
end endgenerate

//always@(*)begin  //cnt=0 should be used with the vld
//    if( (cmd_offset_1d[OFFSET_DW-1:OFFSET_DW-2] <= rsp_burst_cnt_1d) && (icache2icb_rsp_valid_1d) )begin //use high 2bit
//        burst_pre_go_on = 1'b1;
//    end
//    else begin
//        burst_pre_go_on = 1'b0;
//    end 
//end
//assign burst_pre_go_on = icache2icb_rsp_valid_1d & !block_not_arrived;
assign burst_pre_go_on = !block_not_arrived;

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin                  
    burst_pre_rsp_vld <= 1'b0;
  end                                    
  else  begin
    burst_pre_rsp_vld <= burst_pre_go_on & burst_rsp_flag;
//    burst_pre_rsp_vld <= (burst_pre_go_on | pre_go_on_extend) & burst_rsp_flag;
  end
end

//burst pre output rsp data
assign burst_idle_state = (burst_state == 1'b0);



endmodule
