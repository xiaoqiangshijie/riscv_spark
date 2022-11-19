module cache_rsp_reorder #(
    parameter DTYPE     = 0   ,
    parameter DW        = 64  ,
    parameter LINE_DW   = 256 ,
    parameter OFFSET_DW = 5   ,
    parameter BURST_DW  = 2   ,
    parameter BLOCK_DW  = 4   ,
    parameter RSP_DW    = 32
) (
    input  clk,
    input  rstn,
    
    input                     tag_hit_1d,
    input  [OFFSET_DW-1:0]    cmd_offset_1d,
    input  [OFFSET_DW-1:0]    cmd_offset_2d,
    input                     cmd_read_1d,
    input                     cmd_read_2d,
    input  [LINE_DW-1:0]      array_cache_line,
    
    input                     burst_pre_go_on,
    input                     burst_pre_rsp_vld,
    input                     cache2mem_rsp_valid,
    input  [BURST_DW-1:0]     rsp_burst_cnt,
    input  [DW-1:0]           cache2mem_rsp_rdata,
    input  [BLOCK_DW-1:0]     offset_mux_sel,
    input                     rsp_burst_done_neg,

    output reg [BLOCK_DW-1:0] cache_fill_block,
    output reg [LINE_DW-1:0]  rsp_cache_line_buff,
    output reg [RSP_DW-1:0]   core2cache_rsp_rdata
);

localparam  WORD = 32;

reg  [RSP_DW-1:0]            burst_pre_rsp_data;

//generate if(LINE_DW == 512) begin: hit_rsp_mux16
  always@(*)begin
    if(tag_hit_1d & cmd_read_2d)begin
        case(cmd_offset_2d[OFFSET_DW-1:2])  //because it doesn't support RV64C 
           0 : core2cache_rsp_rdata = array_cache_line[WORD*( 1+DTYPE)-1 -: RSP_DW];
           1 : core2cache_rsp_rdata = array_cache_line[WORD*2-1          -: RSP_DW];
           2 : core2cache_rsp_rdata = array_cache_line[WORD*( 3+DTYPE)-1 -: RSP_DW]; 
           3 : core2cache_rsp_rdata = array_cache_line[WORD*4-1          -: RSP_DW];
           4 : core2cache_rsp_rdata = array_cache_line[WORD*( 5+DTYPE)-1 -: RSP_DW];
           5 : core2cache_rsp_rdata = array_cache_line[WORD*6-1          -: RSP_DW];
           6 : core2cache_rsp_rdata = array_cache_line[WORD*( 7+DTYPE)-1 -: RSP_DW];
           7 : core2cache_rsp_rdata = array_cache_line[WORD*8-1          -: RSP_DW];
           8 : core2cache_rsp_rdata = array_cache_line[WORD*( 9+DTYPE)-1 -: RSP_DW];
           9 : core2cache_rsp_rdata = array_cache_line[WORD*10-1         -: RSP_DW];
          10 : core2cache_rsp_rdata = array_cache_line[WORD*(11+DTYPE)-1 -: RSP_DW]; 
          11 : core2cache_rsp_rdata = array_cache_line[WORD*12-1         -: RSP_DW];
          12 : core2cache_rsp_rdata = array_cache_line[WORD*(13+DTYPE)-1 -: RSP_DW];
          13 : core2cache_rsp_rdata = array_cache_line[WORD*14-1         -: RSP_DW];
          14 : core2cache_rsp_rdata = array_cache_line[WORD*(15+DTYPE)-1 -: RSP_DW];
          15 : core2cache_rsp_rdata = array_cache_line[WORD*16-1         -: RSP_DW];
          default: core2cache_rsp_rdata = {RSP_DW{1'b0}}; 
        endcase
    end
    else if(burst_pre_rsp_vld)begin //burst_state = 1
        core2cache_rsp_rdata = burst_pre_rsp_data;        
    end
    else begin
        core2cache_rsp_rdata = {RSP_DW{1'b0}}; 
    end
  end
//end else begin: hit_rsp_mux8
//  always@(*)begin
//    if(tag_hit_1d)begin
//        case(cmd_offset_2d)  //because it doesn't support RV64C 
//          5'h0   : core2cache_rsp_rdata = array_cache_line[RSP_DW*1-1 -: RSP_DW];
//          5'h4   : core2cache_rsp_rdata = array_cache_line[RSP_DW*2-1 -: RSP_DW];
//          5'h8   : core2cache_rsp_rdata = array_cache_line[RSP_DW*3-1 -: RSP_DW]; 
//          5'hC   : core2cache_rsp_rdata = array_cache_line[RSP_DW*4-1 -: RSP_DW];
//          5'h10  : core2cache_rsp_rdata = array_cache_line[RSP_DW*5-1 -: RSP_DW];
//          5'h14  : core2cache_rsp_rdata = array_cache_line[RSP_DW*6-1 -: RSP_DW];
//          5'h18  : core2cache_rsp_rdata = array_cache_line[RSP_DW*7-1 -: RSP_DW];
//          5'h1C  : core2cache_rsp_rdata = array_cache_line[RSP_DW*8-1 -: RSP_DW];
//          default: core2cache_rsp_rdata = {RSP_DW{1'b0}}; 
//        endcase
//    end
//    else if(burst_pre_rsp_vld)begin //burst_state = 1
//        core2cache_rsp_rdata = burst_pre_rsp_data;        
//    end
//    else begin
//        core2cache_rsp_rdata = {RSP_DW{1'b0}}; 
//    end
//  end
//end endgenerate

//generate
  integer i;
//  for(i = 0; i < BLOCK_DW; i = i + 1) begin: fill_block
    always @(posedge clk or negedge rstn) begin
      if(rstn == 1'b0) begin                  
        rsp_cache_line_buff   <= {LINE_DW{1'b0}};
        for(i = 0; i < BLOCK_DW; i = i + 1) begin
          cache_fill_block[i] <= 1'b0;
        end
      end                                    
      else if(rsp_burst_done_neg) begin
        for(i = 0; i < BLOCK_DW; i = i + 1)
          cache_fill_block[i] <= 1'b0;
      end
      else if(cache2mem_rsp_valid) begin
        case( rsp_burst_cnt )
          0: begin
            for(i = 0; i < BLOCK_DW; i = i + 1)
              if(offset_mux_sel[i]) begin
                rsp_cache_line_buff[(i+1)*64-1-:64] <= cache2mem_rsp_rdata;
                cache_fill_block[i]                 <= 1'b1;
              end
          end
          1: begin
            for(i = 0; i < BLOCK_DW; i = i + 1)
              if(offset_mux_sel[i]) begin
                if(i<(BLOCK_DW-1)) begin
                  rsp_cache_line_buff[(i+2)*64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[i+1] <= 1'b1;
                end
                else begin
                  rsp_cache_line_buff[64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[0] <= 1'b1;
                end
              end
          end
          2: begin
            for(i = 0; i < BLOCK_DW; i = i + 1)
              if(offset_mux_sel[i]) begin
                if(i<(BLOCK_DW-2)) begin
                  rsp_cache_line_buff[(i+3)*64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[i+2] <= 1'b1;
                end
                else begin
                  rsp_cache_line_buff[(i-(BLOCK_DW-3))*64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[i-(BLOCK_DW-2)] <= 1'b1;
                end
              end
          end
          3: begin
            for(i = 0; i < BLOCK_DW; i = i + 1)
              if(offset_mux_sel[i]) begin
                if(i<(BLOCK_DW-3)) begin
                  rsp_cache_line_buff[(i+4)*64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[i+3] <= 1'b1;
                end
                else begin
                  rsp_cache_line_buff[(i-(BLOCK_DW-4))*64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[i-(BLOCK_DW-3)] <= 1'b1;
                end
              end
          end
          4: begin
            for(i = 0; i < BLOCK_DW; i = i + 1)
              if(offset_mux_sel[i]) begin
                if(i<(BLOCK_DW-4)) begin
                  rsp_cache_line_buff[(i+5)*64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[i+4] <= 1'b1;
                end
                else begin
                  rsp_cache_line_buff[(i-(BLOCK_DW-5))*64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[i-(BLOCK_DW-4)] <= 1'b1;
                end
              end
          end
          5: begin
            for(i = 0; i < BLOCK_DW; i = i + 1)
              if(offset_mux_sel[i]) begin
                if(i<(BLOCK_DW-5)) begin
                  rsp_cache_line_buff[(i+6)*64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[i+5] <= 1'b1;
                end
                else begin
                  rsp_cache_line_buff[(i-(BLOCK_DW-6))*64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[i-(BLOCK_DW-5)] <= 1'b1;
                end
              end
          end
          6: begin
            for(i = 0; i < BLOCK_DW; i = i + 1)
              if(offset_mux_sel[i]) begin
                if(i<(BLOCK_DW-6)) begin
                  rsp_cache_line_buff[(i+7)*64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[i+6] <= 1'b1;
                end
                else begin
                  rsp_cache_line_buff[(i-(BLOCK_DW-7))*64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[i-(BLOCK_DW-6)] <= 1'b1;
                end
              end
          end
          7: begin
            for(i = 0; i < BLOCK_DW; i = i + 1)
              if(offset_mux_sel[i]) begin
                if(i<(BLOCK_DW-7)) begin
                  rsp_cache_line_buff[(i+8)*64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[i+7] <= 1'b1;
                end
                else begin
                  rsp_cache_line_buff[(i-(BLOCK_DW-8))*64-1-:64] <= cache2mem_rsp_rdata;
                  cache_fill_block[i-(BLOCK_DW-7)] <= 1'b1;
                end
              end
          end
          default: ;
        endcase
      end
    end
//  end
//endgenerate

//generate if(LINE_DW == 512) begin: pre_rsp_mux16
  always@(posedge clk or negedge rstn)begin
    if(rstn == 1'b0)begin                  
      burst_pre_rsp_data <= {RSP_DW{1'b0}};
    end
    else if(burst_pre_go_on & cmd_read_1d) begin
//    else if(burst_pre_go_on | pre_go_on_extend) begin
      case(cmd_offset_1d[OFFSET_DW-1:2])  //because it doesn't support RV64C 
         0 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*( 1+DTYPE)-1 -: RSP_DW];
         1 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*2-1          -: RSP_DW];
         2 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*( 3+DTYPE)-1 -: RSP_DW]; 
         3 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*4-1          -: RSP_DW];
         4 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*( 5+DTYPE)-1 -: RSP_DW];
         5 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*6-1          -: RSP_DW];
         6 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*( 7+DTYPE)-1 -: RSP_DW];
         7 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*8-1          -: RSP_DW];
         8 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*( 9+DTYPE)-1 -: RSP_DW];
         9 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*10-1         -: RSP_DW];
        10 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*(11+DTYPE)-1 -: RSP_DW]; 
        11 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*12-1         -: RSP_DW];
        12 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*(13+DTYPE)-1 -: RSP_DW];
        13 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*14-1         -: RSP_DW];
        14 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*(15+DTYPE)-1 -: RSP_DW];
        15 : burst_pre_rsp_data <= rsp_cache_line_buff[WORD*16-1         -: RSP_DW];
        default: burst_pre_rsp_data <= {RSP_DW{1'b0}}; 
      endcase
    end
  end
//end else begin: pre_rsp_mux8
//  always@(posedge clk or negedge rstn)begin
//    if(rstn == 1'b0)begin                  
//      burst_pre_rsp_data <= {RSP_DW{1'b0}};
//    end
//    else if(burst_pre_go_on) begin
////    else if(burst_pre_go_on | pre_go_on_extend) begin
//      case(cmd_offset_1d)  //because it doesn't support RV64C 
//        5'h0   : burst_pre_rsp_data <= rsp_cache_line_buff[RSP_DW*1-1 -: RSP_DW];
//        5'h4   : burst_pre_rsp_data <= rsp_cache_line_buff[RSP_DW*2-1 -: RSP_DW];
//        5'h8   : burst_pre_rsp_data <= rsp_cache_line_buff[RSP_DW*3-1 -: RSP_DW]; 
//        5'hC   : burst_pre_rsp_data <= rsp_cache_line_buff[RSP_DW*4-1 -: RSP_DW];
//        5'h10  : burst_pre_rsp_data <= rsp_cache_line_buff[RSP_DW*5-1 -: RSP_DW];
//        5'h14  : burst_pre_rsp_data <= rsp_cache_line_buff[RSP_DW*6-1 -: RSP_DW];
//        5'h18  : burst_pre_rsp_data <= rsp_cache_line_buff[RSP_DW*7-1 -: RSP_DW];
//        5'h1C  : burst_pre_rsp_data <= rsp_cache_line_buff[RSP_DW*8-1 -: RSP_DW];
//        default: burst_pre_rsp_data <= {RSP_DW{1'b0}}; 
//      endcase
//    end
//  end
//end endgenerate


endmodule