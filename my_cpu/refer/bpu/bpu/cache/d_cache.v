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
module   d_cache #(
    parameter   ADW    = 64   ,
    parameter   DW     = 64   ,
    parameter   PC_DW  = 32
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
    output  reg             lsu2dcache_rsp_valid          ,//the handshake signal
    input                   lsu2dcache_rsp_ready          ,//the handshake signal
    output  reg  [DW-1:0]   lsu2dcache_rsp_rdata          ,//data returned by the slave    // TBD generate; the width diff between I_cacache and D-cache 
    output  reg             lsu2dcache_rsp_err            ,
//WITH BIU
    output                  dcache2icb_cmd_valid          ,//the handshake signal
    input                   dcache2icb_cmd_ready          ,//the handshake signal
    output  reg  [ADW-1:0]  dcache2icb_cmd_addr           ,//address from lsu
    output  reg             dcache2icb_cmd_read           ,//read enable
    output  reg  [DW-1:0]   dcache2icb_cmd_wdata          ,//data from the lsu that needs to be written
    output  reg  [7:0]      dcache2icb_cmd_wmask          ,//mask from the lsu
    input                   dcache2icb_rsp_valid          ,//the handshake signal
    output                  dcache2icb_rsp_ready          ,//the handshake signal
    input        [DW-1:0]   dcache2icb_rsp_rdata          ,//data returned by the slave
    input                   dcache2icb_rsp_err            
);

//---------------local param -----------------------//
localparam  IDLE             = 2'd0;
localparam  CACHE            = 2'd1;
localparam  UNCACHE          = 2'd2;
`ifdef DIFFTEST
localparam  UN_CACHE_BEGIN   = 64'h0000_0000;
localparam  UN_CACHE_END     = 64'h7fff_ffff;
`else
localparam  UN_CACHE_BEGIN   = 64'h9000_0000;
localparam  UN_CACHE_END     = 64'hffff_ffff;
`endif


//---------------declare ---------------------------//
wire            lsu2cache_cmd_valid          ;//the handshake signal
wire            lsu2cache_cmd_ready          ;//the handshake signal
wire [ADW-1:0]  lsu2cache_cmd_addr           ;//address from lsu
wire            lsu2cache_cmd_read           ;//read enable
wire [DW-1:0]   lsu2cache_cmd_wdata          ;//data from the lsu that needs to be written
wire [7:0]      lsu2cache_cmd_wmask          ;//mask from the lsu
wire            lsu2cache_rsp_valid          ;//the handshake signal
wire            lsu2cache_rsp_ready          ;//the handshake signal
wire [DW-1:0]   lsu2cache_rsp_rdata          ;//data returned by the slave    // TBD generate; the width diff between I_cacache and D-cache 
wire            lsu2cache_rsp_err            ;

wire            cache2icb_cmd_valid          ;//the handshake signal
wire            cache2icb_cmd_ready          ;//the handshake signal
wire [ADW-1:0]  cache2icb_cmd_addr           ;//address from lsu
wire            cache2icb_cmd_read           ;//read enable
wire [DW-1:0]   cache2icb_cmd_wdata          ;//data from the lsu that needs to be written
wire [7:0]      cache2icb_cmd_wmask          ;//mask from the lsu
wire            cache2icb_rsp_valid          ;//the handshake signal
wire            cache2icb_rsp_ready          ;//the handshake signal
wire [DW-1:0]   cache2icb_rsp_rdata          ;//data returned by the slave
wire            cache2icb_rsp_err            ;

wire            dcache2icb_cmd_valid_uncache          ;//the handshake signal
wire            dcache2icb_cmd_ready_uncache          ;//the handshake signal
wire [ADW-1:0]  dcache2icb_cmd_addr_uncache           ;//address from lsu
wire            dcache2icb_cmd_read_uncache           ;//read enable
wire [DW-1:0]   dcache2icb_cmd_wdata_uncache          ;//data from the lsu that needs to be written
wire [7:0]      dcache2icb_cmd_wmask_uncache          ;//mask from the lsu
wire            dcache2icb_rsp_valid_uncache          ;//the handshake signal
wire            dcache2icb_rsp_ready_uncache          ;//the handshake signal
wire [DW-1:0]   dcache2icb_rsp_rdata_uncache          ;//data returned by the slave
wire            dcache2icb_rsp_err_uncache            ;

reg [1:0]       cur_state;
reg [1:0]       next_state;
reg [3:0]       out_cnt;

wire            uncache_state;
wire            burst_idle_state;
wire            uncache_addr_hit;
//-------------mian code -----------------------------//

//////////////////////////////////////////////////////////
//    distinctions between cacheable and uncacheable    //
//////////////////////////////////////////////////////////

//-----------------cmd----------------//
//uncache judge
`ifdef DIFFTEST
assign   uncache_addr_hit = (lsu2dcache_cmd_addr <= UN_CACHE_END );
`else
assign   uncache_addr_hit = (lsu2dcache_cmd_addr >= UN_CACHE_BEGIN) && (lsu2dcache_cmd_addr <= UN_CACHE_END );
`endif

//CACHE fsm
wire  cache_cond;
wire  uncache_cond;

assign  cache_cond   = lsu2dcache_cmd_valid & (!uncache_addr_hit);
assign  uncache_cond = lsu2dcache_cmd_valid & uncache_addr_hit; 


always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        cur_state <= 2'h0 ;
    end
    else begin
        cur_state <= next_state ;
    end
end

always @(*) begin
    case(cur_state)
        IDLE: begin
            if (cache_cond)
                next_state = CACHE;
            else if(uncache_cond)
                next_state = UNCACHE ;
            else
                next_state = IDLE ;
        end
        CACHE: begin  //// when out_cnt=0  && cache_core_out_cnt=0,  cache state is clean
            if(cache_cond)
                next_state = CACHE;
            else if ( out_cnt == 4'd0 & burst_idle_state)
                next_state = IDLE;
            else 
                next_state = CACHE ;
        end
        UNCACHE: begin
            if(uncache_cond)
                next_state = UNCACHE ;
            else if (out_cnt == 4'd0)
                next_state = IDLE;
            else 
                next_state = UNCACHE ;
        end
        default: begin  
                next_state = IDLE  ;
        end
    endcase
end

// cache_cnt and  uncache_cnt

assign  uncache_state = ((cur_state == IDLE) & uncache_cond) || (cur_state == UNCACHE);

always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
        out_cnt <= 4'd0 ;
    end
    else if( (lsu2dcache_cmd_valid & lsu2dcache_cmd_ready) & (!lsu2dcache_rsp_valid) )begin
        out_cnt <= out_cnt + 4'd1 ;
    end
    else if( (!(lsu2dcache_cmd_valid & lsu2dcache_cmd_ready)) & lsu2dcache_rsp_valid ) begin
        out_cnt <= out_cnt - 4'd1 ;
    end
end

// when out_cnt=0  && cache_core_out_cnt=0,  cache_core_clean


/////////////////////////////////////////////////
//     uncache part
/////////////////////////////////////////////////

assign   dcache2icb_cmd_valid_uncache = uncache_state & lsu2dcache_cmd_valid & uncache_addr_hit;
assign   dcache2icb_cmd_ready_uncache = uncache_state & lsu2dcache_cmd_ready;
assign   dcache2icb_cmd_addr_uncache  = lsu2dcache_cmd_addr;
assign   dcache2icb_cmd_read_uncache  = lsu2dcache_cmd_read;
assign   dcache2icb_cmd_wdata_uncache = lsu2dcache_cmd_wdata;
assign   dcache2icb_cmd_wmask_uncache = lsu2dcache_cmd_wmask;
assign   dcache2icb_rsp_valid_uncache = uncache_state & dcache2icb_rsp_valid;
assign   dcache2icb_rsp_ready_uncache = 1'b1;
assign   dcache2icb_rsp_rdata_uncache = dcache2icb_rsp_rdata;
assign   dcache2icb_rsp_err_uncache   = dcache2icb_rsp_err;


/////////////////////////////////////////////////
//    cache part
////////////////////////////////////////////////

//LSU with CACHE_CORE
assign     lsu2cache_cmd_valid = (!uncache_state) & lsu2dcache_cmd_valid & (!uncache_addr_hit ) ;
assign     lsu2cache_cmd_addr  = lsu2dcache_cmd_addr  ; 
assign     lsu2cache_cmd_read  = lsu2dcache_cmd_read  ;
assign     lsu2cache_cmd_wdata = lsu2dcache_cmd_wdata ;
assign     lsu2cache_cmd_wmask = lsu2dcache_cmd_wmask ;
assign     lsu2cache_rsp_ready = lsu2dcache_rsp_ready; 

//CACHE_CORE with BIU
assign     cache2icb_cmd_ready  =  (!uncache_state) & dcache2icb_cmd_ready;
assign     cache2icb_rsp_valid  =  (!uncache_state) & dcache2icb_rsp_valid;  
assign     cache2icb_rsp_rdata  =  dcache2icb_rsp_rdata;
assign     cache2icb_rsp_err    =  dcache2icb_rsp_err;

dcache_core u0_dcache_core(
    .clk                      ( clk                     ), //clk 
    .rstn                     ( rstn                    ),
//WITH LSU                           
    .lsu2dcache_cmd_valid     ( lsu2cache_cmd_valid     ),//the handshake signal
    .lsu2dcache_cmd_ready     ( lsu2cache_cmd_ready     ),//the handshake signal        //OUT
    .lsu2dcache_cmd_addr      ( lsu2cache_cmd_addr      ),//address from ifu
    .lsu2dcache_cmd_read      ( lsu2cache_cmd_read      ),//read enable
    .lsu2dcache_cmd_wdata     ( lsu2cache_cmd_wdata     ),//data from the ifu that needs to be written
    .lsu2dcache_cmd_wmask     ( lsu2cache_cmd_wmask     ),//mask from the ifu
    .lsu2dcache_rsp_valid     ( lsu2cache_rsp_valid     ),//the handshake signal        //OUT 
    .lsu2dcache_rsp_ready     ( lsu2cache_rsp_ready     ),//the handshake signal  
    .lsu2dcache_rsp_rdata     ( lsu2cache_rsp_rdata     ),//data returned by the slave  //OUT
    .lsu2dcache_rsp_err       ( lsu2cache_rsp_err       ),                              //OUT
    .burst_idle_state         ( burst_idle_state        ),
//WITH BIU                      
    .dcache2icb_cmd_valid     ( cache2icb_cmd_valid     ),//the handshake signal        
    .dcache2icb_cmd_ready     ( cache2icb_cmd_ready     ),//the handshake signal        //IN
    .dcache2icb_cmd_addr      ( cache2icb_cmd_addr      ),//address from ifu      
    .dcache2icb_cmd_read      ( cache2icb_cmd_read      ),//read enable           
    .dcache2icb_cmd_wdata     ( cache2icb_cmd_wdata     ),//data from the ifu that needs to be written
    .dcache2icb_cmd_wmask     ( cache2icb_cmd_wmask     ),//mask from the ifu
    .dcache2icb_rsp_valid     ( cache2icb_rsp_valid     ),//the handshake signal        //in
    .dcache2icb_rsp_ready     ( cache2icb_rsp_ready     ),//the handshake signal     
    .dcache2icb_rsp_rdata     ( cache2icb_rsp_rdata     ),//data returned by the slave  //in
    .dcache2icb_rsp_err       ( cache2icb_rsp_err       )                               //in
);

//////////////////////////////////////////////////////
//   TOP
//////////////////////////////////////////////////////

//to LSU
always@(*)begin
    if(uncache_state)begin
        lsu2dcache_cmd_ready  = dcache2icb_cmd_ready;
        lsu2dcache_rsp_valid  = dcache2icb_rsp_valid; 
        lsu2dcache_rsp_rdata  = dcache2icb_rsp_rdata; 
        lsu2dcache_rsp_err    = dcache2icb_rsp_err  ; 
    end
    else begin //cache_able
        lsu2dcache_cmd_ready  = lsu2cache_cmd_ready;
        lsu2dcache_rsp_valid  = lsu2cache_rsp_valid; 
        lsu2dcache_rsp_rdata  = lsu2cache_rsp_rdata; 
        lsu2dcache_rsp_err    = lsu2cache_rsp_err  ; 
    end
end

//to BIU
assign   dcache2icb_cmd_valid = cache2icb_cmd_valid | dcache2icb_cmd_valid_uncache;  //OUT

always@(*)begin
    if(uncache_state)begin
        dcache2icb_cmd_addr  = dcache2icb_cmd_addr_uncache ;
        dcache2icb_cmd_read  = dcache2icb_cmd_read_uncache ;
        dcache2icb_cmd_wdata = dcache2icb_cmd_wdata_uncache;
        dcache2icb_cmd_wmask = dcache2icb_cmd_wmask_uncache;
    end
    else begin
        dcache2icb_cmd_addr  = cache2icb_cmd_addr  ;
        dcache2icb_cmd_read  = cache2icb_cmd_read  ;
        dcache2icb_cmd_wdata = cache2icb_cmd_wdata ;
        dcache2icb_cmd_wmask = cache2icb_cmd_wmask ;
    end
end

assign  dcache2icb_rsp_ready = 1'b1;





endmodule
