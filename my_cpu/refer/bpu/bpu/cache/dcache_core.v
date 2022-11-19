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
module   dcache_core #(
    parameter   ADW           = 64   ,
    parameter   DW            = 64   ,
    parameter   PC_DW         = 32   ,
    parameter   SET           = 128  ,
    parameter   LINE_DW       = 256
)(  
    input                   clk                           , //clk 
    input                   rstn                          ,
//WITH lsu
    input                   lsu2dcache_cmd_valid          ,//the handshake signal
    output  reg             lsu2dcache_cmd_ready          ,//the handshake signal
    input        [ADW-1:0]  lsu2dcache_cmd_addr           ,//address from lsu
    input                   lsu2dcache_cmd_read           ,//read enable
    input        [DW-1:0]   lsu2dcache_cmd_wdata          ,//data from the lsu that needs to be written
    input        [7:0]      lsu2dcache_cmd_wmask          ,//mask from the lsu
    output                  lsu2dcache_rsp_valid          ,//the handshake signal
    input                   lsu2dcache_rsp_ready          ,//the handshake signal
    output       [DW-1:0]   lsu2dcache_rsp_rdata          ,//data returned by the slave    // TBD generate; the width diff between I_cacache and D-cache 
    output                  lsu2dcache_rsp_err            ,

    output                  burst_idle_state              ,
//WITH BIU
    output  reg             dcache2icb_cmd_valid          ,//the handshake signal
    input                   dcache2icb_cmd_ready          ,//the handshake signal
    output  reg  [ADW-1:0]  dcache2icb_cmd_addr           ,//address from lsu
    output  reg             dcache2icb_cmd_read           ,//read enable
    output  reg  [DW-1:0]   dcache2icb_cmd_wdata          ,//data from the lsu that needs to be written
    output       [7:0]      dcache2icb_cmd_wmask          ,//mask from the lsu
    input                   dcache2icb_rsp_valid          ,//the handshake signal
    output                  dcache2icb_rsp_ready          ,//the handshake signal
    input        [DW-1:0]   dcache2icb_rsp_rdata          ,//data returned by the slave
    input                   dcache2icb_rsp_err            
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
//localparam  LINE_DW = 256;
localparam  OFFSET_DW     = clog2(LINE_DW>>3);
localparam  IDX_DW        = clog2(SET);
localparam  TAG_DW        = ADW - OFFSET_DW - IDX_DW;
//localparam  SET           = 128;
localparam  WAY           = 4;
//localparam  WORD          = 32;
localparam  BLOCK_DW      = LINE_DW>>6;
localparam  BURST_DW      = clog2(BLOCK_DW);

localparam  BURST_IDLE  = 2'd0;
localparam  BURST_FETCH = 2'd1;
localparam  BURST_WB    = 2'd2;


localparam  WR_IDLE  = 2'd0;
localparam  WR_1ST   = 2'd1;
localparam  WR_2ND   = 2'd2;

reg [1:0]  burst_cur_state;
reg [1:0]  burst_next_state;

reg [1:0]  wr_cur_state;
reg [1:0]  wr_next_state;

reg  burst_fetch_2idle_cond;
reg  burst_fetch_2wb_cond;

reg   data_array_wr_1st;
reg   data_array_wr_2nd;


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
reg                           burst_read;
wire [IDX_DW-1:0]             cmd_idx;
wire [TAG_DW-1:0]             cmd_tag;
wire [OFFSET_DW-1:0]          cmd_offset;
reg  [IDX_DW-1:0]             cmd_idx_1d;
reg                           cmd_read_1d;
reg  [7:0]                    cmd_wmask_1d;
reg  [DW-1:0]                 cmd_wdata_1d;
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
reg                           rsp_burst_done_2d;
reg                           dcache2icb_rsp_valid_1d;
wire                          rsp_burst_done;
reg                           burst_pre_rsp_vld;
//reg  [WORD-1:0]               burst_pre_rsp_data;
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

reg                           dcache2icb_cmd_valid_wb;
reg                           cache_line_dirty;

reg  [SET-1:0]                cache_line_dirty_w0;
reg  [SET-1:0]                cache_line_dirty_w1;
reg  [SET-1:0]                cache_line_dirty_w2;
reg  [SET-1:0]                cache_line_dirty_w3;

reg  [LINE_DW-1:0]            victim_dirty_data;
reg  [TAG_DW-1:0]             victim_dirty_tag; 

reg                           dcache2icb_cmd_valid_rd;

wire                          tag_array_rd_cond;

reg  [31:0]                   byte_chose;
reg                           wb_cmd_burst_done;

reg                           wb_flag;

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
reg  [BURST_DW-1:0]           burst_offset_high;

//------------------------Main code -----------------------------------//

//-----------------cmd----------------//
assign   cmd_offset = lsu2dcache_cmd_addr[OFFSET_DW-1        : 0];
assign   cmd_idx    = lsu2dcache_cmd_addr[OFFSET_DW+IDX_DW-1 : OFFSET_DW];
assign   cmd_tag    = lsu2dcache_cmd_addr[ADW-1              : OFFSET_DW+IDX_DW];



//////////////////////////////////////////////////////////
//  cache_hit:  step1: ready return and read tag--------//
//////////////////////////////////////////////////////////

//return ready

assign  burst_idx_tag_hit =  (cmd_idx == burst_idx) && (cmd_tag == burst_tag);

always@(*)begin
    if( wr_cur_state == WR_IDLE )begin
        if(burst_state)begin
            lsu2dcache_cmd_ready = lsu2dcache_cmd_valid & burst_pre_go_on & burst_idx_tag_hit & lsu2dcache_cmd_read ; 
        end
        else begin
            lsu2dcache_cmd_ready = lsu2dcache_cmd_valid;
        end
    end
    else begin
        lsu2dcache_cmd_ready = 1'b0;
    end
end

//read and writetag array
 
assign tag_array_rd_cond = lsu2dcache_cmd_valid & lsu2dcache_cmd_ready & (!burst_state); 

always@(*)begin
    if( tag_array_rd_cond & tag_vld_w0[cmd_idx])begin //read
        tag_en_w0    = 1'b1;
        tag_wr_en_w0 = 1'b0;
        tag_addr_w0  = cmd_idx;
    end
    else if( (wr_cur_state == WR_1ST) & (victim_way == 2'd0) )begin //write
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
    if( tag_array_rd_cond & tag_vld_w1[cmd_idx])begin //read
        tag_en_w1    = 1'b1;
        tag_wr_en_w1 = 1'b0;
        tag_addr_w1  = cmd_idx;
    end
    else if( (wr_cur_state == WR_1ST)  & (victim_way == 2'd1) )begin //write
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
    if( tag_array_rd_cond  & tag_vld_w2[cmd_idx])begin //read
        tag_en_w2    = 1'b1;
        tag_wr_en_w2 = 1'b0;
        tag_addr_w2  = cmd_idx;
    end
    else if( (wr_cur_state == WR_1ST) & (victim_way == 2'd2))begin //write
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
    if( tag_array_rd_cond  & tag_vld_w3[cmd_idx])begin //read
        tag_en_w3    = 1'b1;
        tag_wr_en_w3 = 1'b0;
        tag_addr_w3  = cmd_idx;
    end
    else if( (wr_cur_state == WR_1ST) & (victim_way == 2'd3))begin //write
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
  else if((wr_cur_state == WR_1ST) & (victim_way == 2'd0))begin
//  else if((wr_next_state == WR_1ST) & (victim_way == 2'd0))begin  
    tag_vld_w0[burst_idx] <= 1'b1;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    tag_vld_w1 <= {SET{1'b0}};
  end
  else if((wr_cur_state == WR_1ST) & (victim_way == 2'd1))begin
//  else if((wr_next_state == WR_1ST) & (victim_way == 2'd1))begin
    tag_vld_w1[burst_idx] <= 1'b1;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    tag_vld_w2 <= {SET{1'b0}};
  end
  else if((wr_cur_state == WR_1ST) & (victim_way == 2'd2))begin
//  else if((wr_next_state == WR_1ST) & (victim_way == 2'd2))begin
    tag_vld_w2[burst_idx] <= 1'b1;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    tag_vld_w3 <= {SET{1'b0}};
  end
  else if((wr_cur_state == WR_1ST) & (victim_way == 2'd3))begin
//  else if((wr_next_state == WR_1ST) & (victim_way == 2'd3))begin
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
    tag_vld_hit_w1 <= 1'b0;
    tag_vld_hit_w2 <= 1'b0;
    tag_vld_hit_w3 <= 1'b0;
  end
  else begin  
    tag_vld_hit_w0 <= tag_vld_w0[cmd_idx];
    tag_vld_hit_w1 <= tag_vld_w1[cmd_idx];
    tag_vld_hit_w2 <= tag_vld_w2[cmd_idx];
    tag_vld_hit_w3 <= tag_vld_w3[cmd_idx];
  end
end

//pipe to step2 or store for burst_state
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      cmd_offset_1d <= {OFFSET_DW{1'b0}};
      cmd_idx_1d    <= {IDX_DW{1'b0}}; 
      cmd_tag_1d    <= {TAG_DW{1'b0}};
      cmd_read_1d   <= 1'b0; 
  end
  else if(lsu2dcache_cmd_valid & lsu2dcache_cmd_ready )begin  
      cmd_offset_1d <= cmd_offset;
      cmd_idx_1d    <= cmd_idx   ;
      cmd_tag_1d    <= cmd_tag   ;
      cmd_read_1d   <= lsu2dcache_cmd_read; 
  end
end

//wdata and wmask,only when cmd_read = 1 
always@(posedge clk or negedge rstn)begin
    if(rstn == 1'b0)begin
        cmd_wmask_1d <= 8'd0;
        cmd_wdata_1d <= {DW{1'b0}};
    end
    else if(lsu2dcache_cmd_valid & lsu2dcache_cmd_ready)begin 
        if(!lsu2dcache_cmd_read)begin
            cmd_wmask_1d <= lsu2dcache_cmd_wmask;
            cmd_wdata_1d <= lsu2dcache_cmd_wdata;
        end 
    end
end

// vld pipe to step2, only !burst_state need to read array
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      step2_vld <= 1'b0;
  end
  else begin  
      step2_vld <= lsu2dcache_cmd_valid & lsu2dcache_cmd_ready & (!burst_state) ; 
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

// align with signals such as victim_way
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      tag_miss_1d <= 1'b0;
  end
  else begin  
      tag_miss_1d <=  tag_miss; 
  end
end



//generate byte_chose
//always@(*)begin
//    if(cmd_read_1d == 1'b1 || (data_array_wr_1st) )begin  //read or     write from bus 
//        byte_chose = 32'hffff_ffff; 
//    end
//    else begin //(wr_cur_state == WR_2nd) 
//        case(cmd_offset_1d[4:3]) 
//            2'b00  :  byte_chose = {  24'd0  ,cmd_wmask_1d          };  //0~7
//            2'b01  :  byte_chose = {  16'd0  ,cmd_wmask_1d, 8'd0    };  //8~15
//            2'b10  :  byte_chose = {  8'd0   ,cmd_wmask_1d, 16'd0   };  //16~23
//            default:  byte_chose = {          cmd_wmask_1d, 24'd0   };  //2'b11  24~31 
//        endcase
//    end 
//end


//byte_chose=ffff_ffff  have 3 cond:   
//1--tag_hit & cmd_read_1d     
//2--tag_miss_1d and dirty 
//3--data_array_wr_1st ( write data from bus_burst_data)
always@(*)begin
    if( (tag_hit & cmd_read_1d) || (tag_miss_1d & cache_line_dirty) || (data_array_wr_1st) )begin  
        byte_chose = 32'hffff_ffff; 
    end
    else begin //(wr_cur_state == WR_2nd) 
        case(cmd_offset_1d[4:3]) 
            2'b00  :  byte_chose = {  24'd0  ,cmd_wmask_1d          };  //0~7
            2'b01  :  byte_chose = {  16'd0  ,cmd_wmask_1d, 8'd0    };  //8~15
            2'b10  :  byte_chose = {  8'd0   ,cmd_wmask_1d, 16'd0   };  //16~23
            default:  byte_chose = {          cmd_wmask_1d, 24'd0   };  //2'b11  24~31 
        endcase
    end 
end


//----------read data array
//way0
always@(*)begin
    if( tag_hit_w0 )begin  //HIT
        if( cmd_read_1d )begin //read
            data_en_w0    = 1'b1;
            data_wr_en_w0 = 1'b0;
            data_addr_w0  = cmd_idx_1d;
        end
        else begin
            data_en_w0    = 1'b1;
            data_wr_en_w0 = 1'b1;
            data_addr_w0  = cmd_idx_1d;
        end
    end
    else if( tag_miss_1d & cache_line_dirty_w0[cmd_idx_1d] & (victim_way == 2'd0) )begin //MISS and cache_line dirty,need read 
        data_en_w0    = 1'b1;
        data_wr_en_w0 = 1'b0;
        data_addr_w0  = cmd_idx_1d;
    end
    else if( (data_array_wr_1st || data_array_wr_2nd) & (victim_way == 2'd0))begin //write
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
    if(tag_hit_w0 & (!cmd_read_1d))begin
        data_wr_data_w0 = {4{cmd_wdata_1d}};
    end
    else if(data_array_wr_1st & (victim_way == 2'd0))begin
        data_wr_data_w0 = rsp_cache_line_buff;
    end
    else if(data_array_wr_2nd & (victim_way == 2'd0))begin
        data_wr_data_w0 = {4{cmd_wdata_1d}};
    end
    else begin
        data_wr_data_w0 = {LINE_DW{1'b0}};
    end
end

//way1
always@(*)begin
    if( tag_hit_w1 )begin  //HIT
        if( cmd_read_1d )begin //read
            data_en_w1    = 1'b1;
            data_wr_en_w1 = 1'b0;
            data_addr_w1  = cmd_idx_1d;
        end
        else begin //write
            data_en_w1    = 1'b1;
            data_wr_en_w1 = 1'b1;
            data_addr_w1  = cmd_idx_1d;
        end
    end
    else if( tag_miss_1d & cache_line_dirty_w1[cmd_idx_1d] & (victim_way == 2'd1) )begin //MISS and cache_line dirty,need read 
        data_en_w1    = 1'b1;
        data_wr_en_w1 = 1'b0;
        data_addr_w1  = cmd_idx_1d;
    end
    else if( (data_array_wr_1st || data_array_wr_2nd) & (victim_way == 2'd1))begin //write
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
    if(tag_hit_w1 & (!cmd_read_1d))begin
        data_wr_data_w1 = {4{cmd_wdata_1d}};
    end
    else if(data_array_wr_1st & (victim_way == 2'd1))begin
        data_wr_data_w1 = rsp_cache_line_buff;
    end
    else if(data_array_wr_2nd & (victim_way == 2'd1))begin
        data_wr_data_w1 = {4{cmd_wdata_1d}};
    end
    else begin
        data_wr_data_w1 = {LINE_DW{1'b0}};
    end
end

//way2
always@(*)begin
    if( tag_hit_w2 )begin  //HIT
        if( cmd_read_1d )begin //read
            data_en_w2    = 1'b1;
            data_wr_en_w2 = 1'b0;
            data_addr_w2  = cmd_idx_1d;
        end
        else begin //write
            data_en_w2    = 1'b1;
            data_wr_en_w2 = 1'b1;
            data_addr_w2  = cmd_idx_1d;
        end
    end
    else if( tag_miss_1d & cache_line_dirty_w2[cmd_idx_1d] & (victim_way == 2'd2) )begin //MISS and cache_line dirty,need read 
        data_en_w2    = 1'b1;
        data_wr_en_w2 = 1'b0;
        data_addr_w2  = cmd_idx_1d;
    end
    else if( (data_array_wr_1st || data_array_wr_2nd) & (victim_way == 2'd2))begin //write
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
    if(tag_hit_w2 & (!cmd_read_1d))begin
        data_wr_data_w2 = {4{cmd_wdata_1d}};
    end
    else if(data_array_wr_1st & (victim_way == 2'd2))begin
        data_wr_data_w2 = rsp_cache_line_buff;
    end
    else if(data_array_wr_2nd & (victim_way == 2'd2))begin
        data_wr_data_w2 = {4{cmd_wdata_1d}};
    end
    else begin
        data_wr_data_w2 = {LINE_DW{1'b0}};
    end
end

//way3
always@(*)begin
    if( tag_hit_w3 )begin  //HIT
        if( cmd_read_1d )begin //read
            data_en_w3    = 1'b1;
            data_wr_en_w3 = 1'b0;
            data_addr_w3  = cmd_idx_1d;
        end
        else begin //write
            data_en_w3    = 1'b1;
            data_wr_en_w3 = 1'b1;
            data_addr_w3  = cmd_idx_1d;
        end
    end
    else if( tag_miss_1d & cache_line_dirty_w3[cmd_idx_1d] & (victim_way == 2'd3) )begin //MISS and cache_line dirty,need read 
        data_en_w3    = 1'b1;
        data_wr_en_w3 = 1'b0;
        data_addr_w3  = cmd_idx_1d;
    end
    else if( (data_array_wr_1st || data_array_wr_2nd) & (victim_way == 2'd3))begin //write
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
    if(tag_hit_w3 & (!cmd_read_1d))begin
        data_wr_data_w3 = {4{cmd_wdata_1d}};
    end
    else if(data_array_wr_1st & (victim_way == 2'd3))begin
        data_wr_data_w3 = rsp_cache_line_buff;
    end
    else if(data_array_wr_2nd & (victim_way == 2'd3))begin
        data_wr_data_w3 = {4{cmd_wdata_1d}};
    end
    else begin
        data_wr_data_w3 = {LINE_DW{1'b0}};
    end
end

//cache_line_dirty initial and modify
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    cache_line_dirty_w0 <= {SET{1'b0}};
  end
  else if( (tag_hit_w0 & (!cmd_read_1d)) || (data_array_wr_2nd & (victim_way == 2'd0) ) )begin  
    cache_line_dirty_w0[cmd_idx_1d] <= 1'b1;
  end
  else if(data_array_wr_1st & (victim_way == 2'd0))begin 
    cache_line_dirty_w0[cmd_idx_1d] <= 1'b0;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    cache_line_dirty_w1 <= {SET{1'b0}};
  end
  else if( (tag_hit_w1 & (!cmd_read_1d)) || ( data_array_wr_2nd & (victim_way == 2'd1) ) )begin  
    cache_line_dirty_w1[cmd_idx_1d] <= 1'b1;
  end
  else if(data_array_wr_1st & (victim_way == 2'd1))begin 
    cache_line_dirty_w1[cmd_idx_1d] <= 1'b0;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    cache_line_dirty_w2 <= {SET{1'b0}};
  end
  else if( (tag_hit_w2 & (!cmd_read_1d)) || ( data_array_wr_2nd & (victim_way == 2'd2) ) )begin  
    cache_line_dirty_w2[cmd_idx_1d] <= 1'b1;
  end
  else if(data_array_wr_1st & (victim_way == 2'd2))begin 
    cache_line_dirty_w2[cmd_idx_1d] <= 1'b0;
  end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
    cache_line_dirty_w3 <= {SET{1'b0}};
  end
  else if( (tag_hit_w3 & (!cmd_read_1d)) || ( data_array_wr_2nd & (victim_way == 2'd3) ) )begin  
    cache_line_dirty_w3[cmd_idx_1d] <= 1'b1;
  end
  else if(data_array_wr_1st & (victim_way == 2'd3))begin 
    cache_line_dirty_w3[cmd_idx_1d] <= 1'b0;
  end
end

dcache_data_array #(
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
    .byte_chose     ( byte_chose      ),
    .read_data      ( data_rd_data_w0 )
);

dcache_data_array #(
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
    .byte_chose     ( byte_chose      ),
    .read_data      ( data_rd_data_w1 )
);

dcache_data_array #(
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
    .byte_chose     ( byte_chose      ),
    .read_data      ( data_rd_data_w2 )
);

dcache_data_array #(
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
    .byte_chose     ( byte_chose      ),
    .read_data      ( data_rd_data_w3 )
);


//chose victim dirty data
reg victim_dirty_data_vld_w0;
reg victim_dirty_data_vld_w1;
reg victim_dirty_data_vld_w2;
reg victim_dirty_data_vld_w3;

always@(posedge clk or negedge rstn)begin
    if(rstn == 1'b0)begin
        victim_dirty_data_vld_w0 <= 1'b0; 
        victim_dirty_data_vld_w1 <= 1'b0;
        victim_dirty_data_vld_w2 <= 1'b0;
        victim_dirty_data_vld_w3 <= 1'b0;
    end
    else begin  
        victim_dirty_data_vld_w0 <= tag_miss & cache_line_dirty_w0[cmd_idx_1d] & (victim_way == 2'd0); 
        victim_dirty_data_vld_w1 <= tag_miss & cache_line_dirty_w1[cmd_idx_1d] & (victim_way == 2'd1); 
        victim_dirty_data_vld_w2 <= tag_miss & cache_line_dirty_w2[cmd_idx_1d] & (victim_way == 2'd2); 
        victim_dirty_data_vld_w3 <= tag_miss & cache_line_dirty_w3[cmd_idx_1d] & (victim_way == 2'd3); 
    end
end

//always@(posedge clk)begin
//    case( {victim_dirty_data_vld_w3,victim_dirty_data_vld_w2,victim_dirty_data_vld_w1,victim_dirty_data_vld_w0} )
//        4'b0001: begin
//            victim_dirty_data <= data_rd_data_w0;
//            victim_dirty_tag  <=  tag_rd_data_w0;
//        end
//        4'b0010: begin 
//            victim_dirty_data <= data_rd_data_w1;
//            victim_dirty_tag  <=  tag_rd_data_w0;
//        end
//        4'b0100: begin  
//            victim_dirty_data <= data_rd_data_w2;
//            victim_dirty_tag  <=  tag_rd_data_w0;
//        end
//        4'b1000: begin 
//            victim_dirty_data <= data_rd_data_w3;
//            victim_dirty_tag  <=  tag_rd_data_w0;
//        end
//        default:;
//    endcase
//end
wire  victim_way0_hit;
wire  victim_way1_hit;
wire  victim_way2_hit;
wire  victim_way3_hit;

assign  victim_way0_hit = (victim_way == 2'd0);
assign  victim_way1_hit = (victim_way == 2'd1);
assign  victim_way2_hit = (victim_way == 2'd2);
assign  victim_way3_hit = (victim_way == 2'd3);



always@(*)begin
    case( {victim_way3_hit, victim_way2_hit, victim_way1_hit, victim_way0_hit} )
        4'b0001: begin
            victim_dirty_data  = data_rd_data_w0;
            victim_dirty_tag   =  tag_rd_data_w0;
        end
        4'b0010: begin 
            victim_dirty_data  = data_rd_data_w1;
            victim_dirty_tag   =  tag_rd_data_w1;
        end
        4'b0100: begin  
            victim_dirty_data  = data_rd_data_w2;
            victim_dirty_tag   =  tag_rd_data_w2;
        end
        default: begin  //4'b11000
            victim_dirty_data  = data_rd_data_w3;
            victim_dirty_tag   =  tag_rd_data_w3;
        end
    endcase
end

//offset pipe to step3
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      cmd_offset_2d <= {OFFSET_DW{1'b0}};
      //cmd_idx_2d    <= {IDX_DW{1'b0}}; 
      //cmd_tag_2d    <= {TAG_DW{1'b0}};
      cmd_read_2d   <= 1'b0; 
  end
  //else if(step2_vld)begin  
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

/*
//LRU_cnt initial and count
//{w3,w2,w1,w0} lru_cnt [SET-1:0]
genvar i;
generate

for(i = 0 ; i < SET ; i = i + 1 )begin:LRU_CNT
  
    always@(posedge clk or negedge rstn)begin
      if(rstn == 1'b0)begin
          lru_cnt[i] <= 8'b00_01_10_11;  //priority to replace w0
      end
      else if((tag_hit | tag_miss) && (cmd_idx_1d == i))begin
          lru_cnt[i] <= {lru_cnt_w3_next, lru_cnt_w2_next, lru_cnt_w1_next, lru_cnt_w0_next};
      end
    end

end
endgenerate

assign  lru_cnt_w3 = lru_cnt[cmd_idx_1d][7:6];
assign  lru_cnt_w2 = lru_cnt[cmd_idx_1d][5:4];
assign  lru_cnt_w1 = lru_cnt[cmd_idx_1d][3:2];
assign  lru_cnt_w0 = lru_cnt[cmd_idx_1d][1:0];


//Hit, the counter of the hit row is cleared, 
//the counter with a lower value is incremented by 1, 
//and the rest remains unchanged
always@(*)begin
  if(tag_hit)begin
    case( {tag_hit_w3,tag_hit_w2,tag_hit_w1,tag_hit_w0} )
        4'b0001: lru_cnt_w0_next = 2'd0;
        4'b0010: lru_cnt_w0_next = (lru_cnt_w0 < lru_cnt_w1) ? lru_cnt_w0 + 2'd1 : lru_cnt_w0;
        4'b0100: lru_cnt_w0_next = (lru_cnt_w0 < lru_cnt_w2) ? lru_cnt_w0 + 2'd1 : lru_cnt_w0;
        4'b1000: lru_cnt_w0_next = (lru_cnt_w0 < lru_cnt_w3) ? lru_cnt_w0 + 2'd1 : lru_cnt_w0;
        default: lru_cnt_w0_next =  lru_cnt_w0;
    endcase
  end
  else if(tag_miss)begin
    case( {lru_w3_3eq, lru_w2_3eq, lru_w1_3eq, lru_w0_3eq} )       
        4'b0001:                 lru_cnt_w0_next = 2'd0;
        4'b0010,4'b0100,4'b1000: lru_cnt_w0_next = lru_cnt_w0 + 2'd1 ;
        default:                 lru_cnt_w0_next = lru_cnt_w0;
    endcase  
  end
  else begin
    lru_cnt_w0_next = 2'd0;
  end
end

always@(*)begin
  if(tag_hit)begin
    case( {tag_hit_w3,tag_hit_w2,tag_hit_w1,tag_hit_w0} )
        4'b0001: lru_cnt_w1_next = (lru_cnt_w1 < lru_cnt_w0) ? lru_cnt_w1 + 2'd1 : lru_cnt_w1;
        4'b0010: lru_cnt_w1_next = 2'd0;
        4'b0100: lru_cnt_w1_next = (lru_cnt_w1 < lru_cnt_w2) ? lru_cnt_w1 + 2'd1 : lru_cnt_w1;
        4'b1000: lru_cnt_w1_next = (lru_cnt_w1 < lru_cnt_w3) ? lru_cnt_w1 + 2'd1 : lru_cnt_w1;
        default: lru_cnt_w1_next =  lru_cnt_w1;
    endcase
  end
  else if(tag_miss)begin
    case( {lru_w3_3eq, lru_w2_3eq, lru_w1_3eq, lru_w0_3eq} )       
        4'b0010:                 lru_cnt_w1_next = 2'd0;
        4'b0001,4'b0100,4'b1000: lru_cnt_w1_next = lru_cnt_w1 + 2'd1 ;
        default:                 lru_cnt_w1_next = lru_cnt_w1;
    endcase  
  end
  else begin
    lru_cnt_w1_next = 2'd0;
  end
end

always@(*)begin
  if(tag_hit)begin
    case( {tag_hit_w3,tag_hit_w2,tag_hit_w1,tag_hit_w0} )
        4'b0001: lru_cnt_w2_next = (lru_cnt_w2 < lru_cnt_w0) ? lru_cnt_w2 + 2'd1 : lru_cnt_w2;
        4'b0010: lru_cnt_w2_next = (lru_cnt_w2 < lru_cnt_w1) ? lru_cnt_w2 + 2'd1 : lru_cnt_w2;
        4'b0100: lru_cnt_w2_next =  2'd0;
        4'b1000: lru_cnt_w2_next = (lru_cnt_w2 < lru_cnt_w3) ? lru_cnt_w2 + 2'd1 : lru_cnt_w2;
        default: lru_cnt_w2_next =  lru_cnt_w2;
    endcase
  end
  else if(tag_miss)begin
    case( {lru_w3_3eq, lru_w2_3eq, lru_w1_3eq, lru_w0_3eq} )       
        4'b0100:                 lru_cnt_w2_next = 2'd0;
        4'b0001,4'b0010,4'b1000: lru_cnt_w2_next = lru_cnt_w2 + 2'd1 ;
        default:                 lru_cnt_w2_next = lru_cnt_w2;
    endcase  
  end
  else begin
    lru_cnt_w2_next = 2'd0;
  end
end

always@(*)begin
  if(tag_hit)begin
    case( {tag_hit_w3,tag_hit_w2,tag_hit_w1,tag_hit_w0} )
        4'b0001: lru_cnt_w3_next = (lru_cnt_w3 < lru_cnt_w0) ? lru_cnt_w3 + 2'd1 : lru_cnt_w3;
        4'b0010: lru_cnt_w3_next = (lru_cnt_w3 < lru_cnt_w1) ? lru_cnt_w3 + 2'd1 : lru_cnt_w3;
        4'b0100: lru_cnt_w3_next = (lru_cnt_w3 < lru_cnt_w2) ? lru_cnt_w3 + 2'd1 : lru_cnt_w3;
        4'b1000: lru_cnt_w3_next =  2'd0;
        default: lru_cnt_w3_next =  lru_cnt_w3;
    endcase
  end
  else if(tag_miss)begin
    case( {lru_w3_3eq, lru_w2_3eq, lru_w1_3eq, lru_w0_3eq} )       
        4'b1000:                 lru_cnt_w3_next = 2'd0;
        4'b0001,4'b0010,4'b0100: lru_cnt_w3_next = lru_cnt_w3 + 2'd1 ;
        default:                 lru_cnt_w3_next = lru_cnt_w3;
    endcase  
  end
  else begin
    lru_cnt_w3_next = 2'd0;
  end
end

//chose victim


assign  lru_w0_3eq = (lru_cnt_w0 == 2'd3);
assign  lru_w1_3eq = (lru_cnt_w1 == 2'd3);
assign  lru_w2_3eq = (lru_cnt_w2 == 2'd3);
assign  lru_w3_3eq = (lru_cnt_w3 == 2'd3);


always@(posedge clk)begin
  if(tag_miss)begin
    case( {lru_w3_3eq, lru_w2_3eq, lru_w1_3eq, lru_w0_3eq} )       
        4'b0001: victim_way <= 2'd0;
        4'b0010: victim_way <= 2'd1;
        4'b0100: victim_way <= 2'd2;
        4'b1000: victim_way <= 2'd3;
        default:;
    endcase
  end
end

*/

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

assign way_conflict = rsp_burst_done & 
                      (wr_next_state == WR_1ST) & (
                      victim_way0_hit & tag_vld_w0[cmd_idx] |
                      victim_way1_hit & tag_vld_w1[cmd_idx] |
                      victim_way2_hit & tag_vld_w2[cmd_idx] |
                      victim_way3_hit & tag_vld_w3[cmd_idx] );

//store burst idx and pc
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      burst_idx    <= {IDX_DW{1'b0}}; 
      burst_tag    <= {TAG_DW{1'b0}};
      burst_read   <= 1'b0;
      burst_offset <= {OFFSET_DW{1'b0}};
  end
  else if(tag_miss)begin  
      burst_idx    <= cmd_idx_1d  ;
      burst_tag    <= cmd_tag_1d  ;
      burst_read   <= cmd_read_1d ;
      burst_offset <= cmd_offset_1d;
  end
end

///////////////////////////////////////////////////////////////
//-- hit  step3: hit commit and miss refill-------------//
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
    .DTYPE          ( 1         ),
    .DW             ( DW        ),
    .LINE_DW        ( LINE_DW   ),
    .OFFSET_DW      ( OFFSET_DW ),
    .BURST_DW       ( BURST_DW  ),
    .BLOCK_DW       ( BLOCK_DW  ),
    .RSP_DW         ( DW        )
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
    .cache2mem_rsp_valid      ( dcache2icb_rsp_valid ),
    .rsp_burst_cnt            ( rsp_burst_cnt        ),
    .cache2mem_rsp_rdata      ( dcache2icb_rsp_rdata ),
    .offset_mux_sel           ( offset_mux_sel       ),
    .cache_fill_block         ( cache_fill_block     ),
    .rsp_burst_done_neg       ( rsp_burst_done_neg   ),
    .rsp_cache_line_buff      ( rsp_cache_line_buff  ),
    .core2cache_rsp_rdata     ( lsu2dcache_rsp_rdata )
);

//burst_pre_rsp_vld---read_MISS\      WR_2ND--write MIS
assign  lsu2dcache_rsp_valid = tag_hit_1d | burst_pre_rsp_vld |  (wr_cur_state == WR_2ND);
assign  lsu2dcache_rsp_err = dcache2icb_rsp_err;

////////////////////////////////////////////////////////////////
//   cache miss                                               //  
//   step1:  if step2 miss, into burst state                  //
//       output dcache2icb cmd  and chose victim             //  
////////////////////////////////////////////////////////////////

//-------------cache  miss machine--------------------//


//burst machine
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        burst_cur_state <= 2'h0 ;
    end
    else begin
        burst_cur_state <= burst_next_state ;
    end
end

always@(*)begin
    if(!cache_line_dirty)begin
        if( (burst_read & rsp_burst_done) || ((!burst_read ) & rsp_burst_done_1d) )begin
            burst_fetch_2idle_cond = 1'b1;
        end
        else begin
            burst_fetch_2idle_cond = 1'b0;
        end
    end
    else begin
            burst_fetch_2idle_cond = 1'b0;
    end
end

always@(*)begin
    if(cache_line_dirty & rsp_burst_done)begin
        burst_fetch_2wb_cond = 1'b1;
    end
    else begin
        burst_fetch_2wb_cond = 1'b0;
    end
end

always @(*) begin
    case(burst_cur_state)
        BURST_IDLE: begin
            if (tag_miss)
                burst_next_state = BURST_FETCH ;
            else
                burst_next_state = BURST_IDLE  ;
        end
        BURST_FETCH: begin
            if (burst_fetch_2idle_cond)
                burst_next_state = BURST_IDLE;
            else if(burst_fetch_2wb_cond)
                burst_next_state = BURST_WB;
            else 
                burst_next_state = BURST_FETCH ;
        end
        BURST_WB: begin
            if(rsp_burst_done)
                burst_next_state = BURST_IDLE;
            else 
                burst_next_state = BURST_WB;
        end
        default: begin  
                burst_next_state = BURST_IDLE  ;
        end
    endcase
end

assign  burst_idle_state = (burst_state == BURST_IDLE);


// write machine
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        wr_cur_state <= 2'h0 ;
    end
    else begin
        wr_cur_state <= wr_next_state ;
    end
end

always @(*) begin
    case(wr_cur_state)
        WR_IDLE: begin
            if (burst_cur_state == BURST_FETCH && rsp_burst_done)
                wr_next_state = WR_1ST;
            else
                wr_next_state = WR_IDLE ;
        end
        WR_1ST: begin
            if (!burst_read)
                wr_next_state = WR_2ND;
            else 
                wr_next_state = WR_IDLE ;
        end
        WR_2ND: begin
                wr_next_state = WR_IDLE;
        end
        default: begin  
                wr_next_state = WR_IDLE  ;
        end
    endcase
end

//for data array, WR pipe 1cycle because cache_line_buffer need 1cycle, 
always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
       data_array_wr_1st  <= 1'b0 ;
       data_array_wr_2nd  <= 1'b0 ;
    end
    else begin
       data_array_wr_1st  <= (wr_cur_state == WR_1ST) ;
       data_array_wr_2nd  <= (wr_cur_state == WR_2ND) ;
    end
end

//if tag miss ,into burst state 
//always@(posedge clk or negedge rstn)begin
//  if(rstn == 1'b0)begin                                          
//    burst_state_temp <= 1'b0;                                    
//  end                                                            
//  else if(tag_miss)begin //miss 
//    burst_state_temp <= 1'b1;                                    
//  end
//  else if(wb_flag == 1'b1)begin  
//    if(wb_cmd_burst_done)begin
//      burst_state_temp <= 1'b0;
//    end
//  end
//  else if(wb_flag == 1'b0)begin  
//    if( (rsp_burst_done & cmd_read_1d) || (rsp_burst_done_1d & (!cmd_read_1d)) )begin //because write miss need  to write data_array 2 times                                            
//      burst_state_temp <= 1'b0;
//    end    
//  end                                                            
//end

//assign  burst_state = tag_miss | (burst_cur_state != BURST_IDLE) | (wr_cur_state != WR_IDLE) ;
assign  burst_state = tag_miss | (burst_cur_state != BURST_IDLE) ;


always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin                  
    dcache2icb_cmd_valid_rd <= 1'b0;            
  end                                    
  else if(tag_miss)begin //miss
    dcache2icb_cmd_valid_rd <= 1'b1;            
  end                                    
  else if(cmd_burst_done)begin                    
    dcache2icb_cmd_valid_rd <= 1'b0;            
  end                                    
end


//write back burst vld
always@(*)begin
    if( ((victim_way == 2'd0) & (cache_line_dirty_w0[cmd_idx_1d] == 1'b1)) || 
        ((victim_way == 2'd1) & (cache_line_dirty_w1[cmd_idx_1d] == 1'b1)) || 
        ((victim_way == 2'd2) & (cache_line_dirty_w2[cmd_idx_1d] == 1'b1)) || 
        ((victim_way == 2'd3) & (cache_line_dirty_w3[cmd_idx_1d] == 1'b1))     )begin
        cache_line_dirty = 1'b1;
    end
    else begin
        cache_line_dirty = 1'b0;
    end
end

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin                  
    dcache2icb_cmd_valid_wb <= 1'b0;            
  end                                    
  else if( (burst_cur_state == BURST_FETCH) & burst_fetch_2wb_cond )begin //dirty wb   
    dcache2icb_cmd_valid_wb <= 1'b1;            
  end                                    
  else if( (burst_cur_state == BURST_WB) & cmd_burst_done)begin                    
    dcache2icb_cmd_valid_wb <= 1'b0;            
  end                                    
end

always@(posedge clk or negedge rstn) begin
  if(rstn == 1'b0) begin                  
    burst_offset_high <= {BURST_DW{1'b0}};            
  end
  else if(tag_miss) begin
    burst_offset_high <= cmd_offset_1d[OFFSET_DW-1:3] + 1'b1;
  end
  else if(dcache2icb_cmd_valid & dcache2icb_cmd_ready) begin
    burst_offset_high <= burst_offset_high + 1'b1;
  end                                    
  else if(!dcache2icb_cmd_valid & !tag_miss) begin                    
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
    dcache2icb_cmd_addr <= {ADW{1'b0}};            
  end                                    
  else if(tag_miss)begin //miss   
//    dcache2icb_cmd_addr <= {cmd_tag_1d,cmd_idx_1d,5'b0}; // cmd_xx_1d align with tag_miss
    dcache2icb_cmd_addr <= {cmd_tag_1d,cmd_idx_1d,cmd_offset_1d[OFFSET_DW-1:OFFSET_DW-2],3'b0};
  end
  else if( dcache2icb_cmd_valid_rd & dcache2icb_cmd_ready )begin
    case(cmd_burst_cnt) //reduse adder
      2'd0: dcache2icb_cmd_addr <= {burst_tag,burst_idx,burst_offset_high,3'b0};
      2'd1: dcache2icb_cmd_addr <= {burst_tag,burst_idx,burst_offset_high,3'b0};
      2'd2: dcache2icb_cmd_addr <= {burst_tag,burst_idx,burst_offset_high,3'b0};
      default: dcache2icb_cmd_addr <= {victim_dirty_tag,cmd_idx_1d,5'b0};
    endcase
  end                                    
  else if(cmd_burst_done & dcache2icb_cmd_valid_rd & (burst_cur_state == BURST_WB) )begin
    dcache2icb_cmd_addr <= {victim_dirty_tag,cmd_idx_1d,5'b0}; // cmd_xx_1d align with tag_miss           
  end  
  else if( dcache2icb_cmd_valid_wb & dcache2icb_cmd_ready )begin
    case(cmd_burst_cnt) //reduse adder
      2'd0: dcache2icb_cmd_addr <= {victim_dirty_tag,cmd_idx_1d,5'h8 };  
      2'd1: dcache2icb_cmd_addr <= {victim_dirty_tag,cmd_idx_1d,5'h10};
      2'd2: dcache2icb_cmd_addr <= {victim_dirty_tag,cmd_idx_1d,5'h18};
      default:;
    endcase
  end
end


always@(*)begin
    dcache2icb_cmd_valid = dcache2icb_cmd_valid_rd |  dcache2icb_cmd_valid_wb;
end



//  I-CACHE read only
//  D-CACHE : when dirty = 1,write back to mem
always@(*)begin
    if(dcache2icb_cmd_valid_wb == 1'b1)begin
        dcache2icb_cmd_read = 1'b0;  //write
    end
    else begin  //read
        dcache2icb_cmd_read = 1'b1; 
    end
end

//TBD  victime line
always@(*)begin
    if(dcache2icb_cmd_valid_wb == 1'b1)begin
        case(cmd_burst_cnt)
            2'd0:    dcache2icb_cmd_wdata = victim_dirty_data[63:0]   ;
            2'd1:    dcache2icb_cmd_wdata = victim_dirty_data[127:64] ;
            2'd2:    dcache2icb_cmd_wdata = victim_dirty_data[191:128];
            default: dcache2icb_cmd_wdata = victim_dirty_data[255:192];  //2'd3
        endcase
    end
    else begin
        dcache2icb_cmd_wdata  = {DW{1'b0}};
    end
end

assign dcache2icb_cmd_wmask  = 8'b1111_1111;
assign dcache2icb_rsp_ready  = 1'b1;

assign  cmd_burst_done = (cmd_burst_cnt == 2'd3) && ( dcache2icb_cmd_valid & dcache2icb_cmd_ready);

//burst length = 4 
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin                  
    cmd_burst_cnt <= {BURST_DW{1'b0}};            
  end                                    
  else if(cmd_burst_done)begin    
    cmd_burst_cnt <= {BURST_DW{1'b0}};            
  end                                    
  else if( dcache2icb_cmd_valid & dcache2icb_cmd_ready )begin                    
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
  else if( dcache2icb_rsp_valid )begin                    
    rsp_burst_cnt <= rsp_burst_cnt + 1'b1;            
  end                                    
end

assign rsp_burst_done = (rsp_burst_cnt == {BURST_DW{1'b1}}) & dcache2icb_rsp_valid;
assign rsp_burst_done_neg = !rsp_burst_done & rsp_burst_done_1d;

//to align with rsp_cache_line_buff
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin                  
    rsp_burst_cnt_1d        <= {BURST_DW{1'b0}};
    rsp_burst_done_1d       <= 1'b0;
    rsp_burst_done_2d       <= 1'b0;
    dcache2icb_rsp_valid_1d <= 1'b0;
  end                                    
  else begin
    rsp_burst_cnt_1d        <= rsp_burst_cnt;
    rsp_burst_done_1d       <= rsp_burst_done;
    rsp_burst_done_2d       <= rsp_burst_done_1d;
    dcache2icb_rsp_valid_1d <= dcache2icb_rsp_valid;
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
//if burst_pre_go_on = 1,but lsu_cmd_vld=0,then cmd_offset_1d contains, rsp_burst_cnt_1d continue to add 1, burst_pre_go_on will be extend unexpected;
always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      burst_rsp_flag <= 1'b0;
  end                                    
  else if(lsu2dcache_cmd_valid & lsu2dcache_cmd_ready)begin
      burst_rsp_flag <= 1'b1;
  end
  else if(burst_pre_go_on)begin
      burst_rsp_flag <= 1'b0;
  end
end

reg  burst_state_1d;
reg  burst_fetch_flag_1d;

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin
      burst_state_1d      <= 1'b0;
      burst_fetch_flag_1d <= 1'b0;
  end                                    
  else begin
      burst_state_1d      <= burst_state;
      burst_fetch_flag_1d <= (burst_cur_state == BURST_FETCH);
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

//always@(*)begin  //cnt=0 should be used with the vld , //only support continuous read pre_go_on
//    if( (cmd_offset_1d[OFFSET_DW-1:OFFSET_DW-2] <= rsp_burst_cnt_1d) & (dcache2icb_rsp_valid_1d) & burst_fetch_flag_1d  & burst_read )begin //use high 2bit
//        burst_pre_go_on = 1'b1;
//    end
//    else begin
//        burst_pre_go_on = 1'b0;
//    end 
//end
assign burst_pre_go_on = dcache2icb_rsp_valid_1d & burst_fetch_flag_1d & burst_read & !block_not_arrived;

always@(posedge clk or negedge rstn)begin
  if(rstn == 1'b0)begin                  
    burst_pre_rsp_vld <= 1'b0;
  end                                    
  else  begin
    burst_pre_rsp_vld <= burst_pre_go_on & burst_rsp_flag;
  end
end

//assign burst_idle_state = (burst_state == 1'b0);



endmodule
