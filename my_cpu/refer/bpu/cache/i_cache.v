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
module   i_cache #(
    parameter   ADW    = 64   ,
    parameter   DW     = 64   ,
    parameter   PC_DW  = 32
)(  
    input                   clk                           , //clk 
    input                   rstn                          ,
//WITH ifu
    input                   ifu2icache_cmd_valid          ,//the handshake signal
    output  reg             ifu2icache_cmd_ready          ,//the handshake signal
    input        [ADW-1:0]  ifu2icache_cmd_addr           ,//address from ifu
    input                   ifu2icache_cmd_read           ,//read enable
    input        [PC_DW-1:0]ifu2icache_cmd_wdata          ,//data from the ifu that needs to be writtenA
    input        [      3:0]ifu2icache_cmd_wmask          ,//mask from the ifu
    output  reg             ifu2icache_rsp_valid          ,//the handshake signal
    input                   ifu2icache_rsp_ready          ,//the handshake signal
    output  reg  [PC_DW-1:0]ifu2icache_rsp_rdata          ,//data returned by the slave    // TBD generate; the width diff between I_cacache and D-cache 
    output  reg             ifu2icache_rsp_err            ,
//WITH BIU
    output                  icache2icb_cmd_valid          ,//the handshake signal
    input                   icache2icb_cmd_ready          ,//the handshake signal
    output  reg  [ADW-1:0]  icache2icb_cmd_addr           ,//address from ifu
    output  reg             icache2icb_cmd_read           ,//read enable
    output  reg  [DW-1:0]   icache2icb_cmd_wdata          ,//data from the ifu that needs to be written
    output  reg  [   3:0]   icache2icb_cmd_wmask          ,//mask from the ifu
    input                   icache2icb_rsp_valid          ,//the handshake signal
    output                  icache2icb_rsp_ready          ,//the handshake signal
    input        [DW-1:0]   icache2icb_rsp_rdata          ,//data returned by the slave
    input                   icache2icb_rsp_err            
);

//---------------local param -----------------------//
localparam  IDLE             = 2'd0;
localparam  CACHE            = 2'd1;
localparam  UNCACHE          = 2'd2;
`ifdef DIFFTEST
localparam  UN_CACHE_BEGIN   = 64'h0000_0000;
localparam  UN_CACHE_END     = 64'h7fff_ffff;
`else
localparam  UN_CACHE_BEGIN   = 64'h0000_0000;
localparam  UN_CACHE_END     = 64'h0000_0014;
`endif


//---------------declare ---------------------------//
wire            ifu2cache_cmd_valid          ;//the handshake signal
wire            ifu2cache_cmd_ready          ;//the handshake signal
wire [ADW-1:0]  ifu2cache_cmd_addr           ;//address from ifu
wire            ifu2cache_cmd_read           ;//read enable
wire [PC_DW-1:0]ifu2cache_cmd_wdata          ;//data from the ifu that needs to be written
wire [      3:0]ifu2cache_cmd_wmask          ;//mask from the ifu
wire            ifu2cache_rsp_valid          ;//the handshake signal
wire            ifu2cache_rsp_ready          ;//the handshake signal
wire [PC_DW-1:0]ifu2cache_rsp_rdata          ;//data returned by the slave    // TBD generate; the width diff between I_cacache and D-cache 
wire            ifu2cache_rsp_err            ;

wire            cache2icb_cmd_valid          ;//the handshake signal
wire            cache2icb_cmd_ready          ;//the handshake signal
wire [ADW-1:0]  cache2icb_cmd_addr           ;//address from ifu
wire            cache2icb_cmd_read           ;//read enable
wire [DW-1:0]   cache2icb_cmd_wdata          ;//data from the ifu that needs to be written
wire [   3:0]   cache2icb_cmd_wmask          ;//mask from the ifu
wire            cache2icb_rsp_valid          ;//the handshake signal
wire            cache2icb_rsp_ready          ;//the handshake signal
wire [DW-1:0]   cache2icb_rsp_rdata          ;//data returned by the slave
wire            cache2icb_rsp_err            ;

wire            icache2icb_cmd_valid_uncache          ;//the handshake signal
wire            icache2icb_cmd_ready_uncache          ;//the handshake signal
wire [ADW-1:0]  icache2icb_cmd_addr_uncache           ;//address from ifu
wire            icache2icb_cmd_read_uncache           ;//read enable
wire [DW-1:0]   icache2icb_cmd_wdata_uncache          ;//data from the ifu that needs to be written
wire [   3:0]   icache2icb_cmd_wmask_uncache          ;//mask from the ifu
reg             icache2icb_rsp_valid_uncache          ;//the handshake signal
wire            icache2icb_rsp_ready_uncache          ;//the handshake signal
reg  [DW-1:0]   icache2icb_rsp_rdata_uncache          ;//data returned by the slave
wire            icache2icb_rsp_err_uncache            ;

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
assign   uncache_addr_hit = (ifu2icache_cmd_addr <= UN_CACHE_END );
`else
assign   uncache_addr_hit = (ifu2icache_cmd_addr >= UN_CACHE_BEGIN) && (ifu2icache_cmd_addr <= UN_CACHE_END );
`endif

//CACHE fsm
wire  cache_cond;
wire  uncache_cond;

assign  cache_cond   = ifu2icache_cmd_valid & (!uncache_addr_hit);
assign  uncache_cond = ifu2icache_cmd_valid & uncache_addr_hit; 


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
    else if( (ifu2icache_cmd_valid & ifu2icache_cmd_ready) & (!ifu2icache_rsp_valid) )begin
        out_cnt <= out_cnt + 4'd1 ;
    end
    else if( (!(ifu2icache_cmd_valid & ifu2icache_cmd_ready)) & ifu2icache_rsp_valid ) begin
        out_cnt <= out_cnt - 4'd1 ;
    end
end

// when out_cnt=0  && cache_core_out_cnt=0,  cache_core_clean


/////////////////////////////////////////////////
//     uncache part
/////////////////////////////////////////////////

assign   icache2icb_cmd_valid_uncache = uncache_state & ifu2icache_cmd_valid & uncache_addr_hit;
assign   icache2icb_cmd_ready_uncache = uncache_state & ifu2icache_cmd_ready;
assign   icache2icb_cmd_addr_uncache  = ifu2icache_cmd_addr;
assign   icache2icb_cmd_read_uncache  = ifu2icache_cmd_read;
assign   icache2icb_cmd_wdata_uncache = {32'd0,ifu2icache_cmd_wdata};
assign   icache2icb_cmd_wmask_uncache = ifu2icache_cmd_wmask;
assign   icache2icb_rsp_ready_uncache = 1'b1;
assign   icache2icb_rsp_err_uncache   = icache2icb_rsp_err;


/////////////////////////////////////////////////
//    cache part
////////////////////////////////////////////////

//ifu with CACHE_CORE
assign     ifu2cache_cmd_valid = (!uncache_state) & ifu2icache_cmd_valid & (!uncache_addr_hit ) ;
assign     ifu2cache_cmd_addr  = ifu2icache_cmd_addr  ; 
assign     ifu2cache_cmd_read  = ifu2icache_cmd_read  ;
assign     ifu2cache_cmd_wdata = ifu2icache_cmd_wdata ;
assign     ifu2cache_cmd_wmask = ifu2icache_cmd_wmask ;
assign     ifu2cache_rsp_ready = ifu2icache_rsp_ready; 

//CACHE_CORE with BIU
assign     cache2icb_cmd_ready  =  (!uncache_state) & icache2icb_cmd_ready;
assign     cache2icb_rsp_valid  =  (!uncache_state) & icache2icb_rsp_valid;  
assign     cache2icb_rsp_rdata  =  icache2icb_rsp_rdata;
assign     cache2icb_rsp_err    =  icache2icb_rsp_err;

icache_core u0_icache_core(
    .clk                      ( clk                     ), //clk 
    .rstn                     ( rstn                    ),
//WITH ifu                           
    .ifu2icache_cmd_valid     ( ifu2cache_cmd_valid     ),//the handshake signal
    .ifu2icache_cmd_ready     ( ifu2cache_cmd_ready     ),//the handshake signal        //OUT
    .ifu2icache_cmd_addr      ( ifu2cache_cmd_addr      ),//address from ifu
    .ifu2icache_cmd_read      ( ifu2cache_cmd_read      ),//read enable
    .ifu2icache_cmd_wdata     ( ifu2cache_cmd_wdata     ),//data from the ifu that needs to be written
    .ifu2icache_cmd_wmask     ( ifu2cache_cmd_wmask     ),//mask from the ifu
    .ifu2icache_rsp_valid     ( ifu2cache_rsp_valid     ),//the handshake signal        //OUT 
    .ifu2icache_rsp_ready     ( ifu2cache_rsp_ready     ),//the handshake signal  
    .ifu2icache_rsp_rdata     ( ifu2cache_rsp_rdata     ),//data returned by the slave  //OUT
    .ifu2icache_rsp_err       ( ifu2cache_rsp_err       ),                              //OUT
    .burst_idle_state         ( burst_idle_state        ),
//WITH BIU                      
    .icache2icb_cmd_valid     ( cache2icb_cmd_valid     ),//the handshake signal        
    .icache2icb_cmd_ready     ( cache2icb_cmd_ready     ),//the handshake signal        //IN
    .icache2icb_cmd_addr      ( cache2icb_cmd_addr      ),//address from ifu      
    .icache2icb_cmd_read      ( cache2icb_cmd_read      ),//read enable           
    .icache2icb_cmd_wdata     ( cache2icb_cmd_wdata     ),//data from the ifu that needs to be written
    .icache2icb_cmd_wmask     ( cache2icb_cmd_wmask     ),//mask from the ifu
    .icache2icb_rsp_valid     ( cache2icb_rsp_valid     ),//the handshake signal        //in
    .icache2icb_rsp_ready     ( cache2icb_rsp_ready     ),//the handshake signal     
    .icache2icb_rsp_rdata     ( cache2icb_rsp_rdata     ),//data returned by the slave  //in
    .icache2icb_rsp_err       ( cache2icb_rsp_err       )                               //in
);

//////////////////////////////////////////////////////
//   TOP
//////////////////////////////////////////////////////

reg [15:0] addr_bit2_fifo;
reg [3:0]  addr_bit2_fifo_in_cnt;
reg [3:0]  addr_bit2_fifo_out_cnt;
 
always@(posedge clk or negedge rstn) begin	
    if(!rstn)begin
        addr_bit2_fifo_in_cnt <= 4'd0;
    end
    else if(uncache_state && ifu2icache_cmd_valid && ifu2icache_cmd_ready)begin 
        addr_bit2_fifo_in_cnt <= addr_bit2_fifo_in_cnt + 4'd1;
    end
end

always@(posedge clk or negedge rstn) begin	
    if(!rstn)begin
        addr_bit2_fifo <= 16'd0;
    end
    else if(uncache_state && ifu2icache_cmd_valid && ifu2icache_cmd_ready )begin
         addr_bit2_fifo[addr_bit2_fifo_in_cnt] <= ifu2icache_cmd_addr[2];
    end
end

always@(posedge clk or negedge rstn) begin	
    if(!rstn)begin
        addr_bit2_fifo_out_cnt <= 4'd0;
    end
    else if( uncache_state && ifu2icache_rsp_valid)begin 
        addr_bit2_fifo_out_cnt <= addr_bit2_fifo_out_cnt + 4'd1;
    end
end

//to ifu

always@(posedge clk or negedge rstn) begin	
    if(!rstn)begin
        icache2icb_rsp_valid_uncache <= 1'd0;
    end
    else begin
        icache2icb_rsp_valid_uncache <= icache2icb_rsp_valid & uncache_state;
    end
end

always@(posedge clk) begin	
    if(uncache_state & icache2icb_rsp_valid) begin
        icache2icb_rsp_rdata_uncache <= icache2icb_rsp_rdata;
    end
end



always@(*)begin
    if(uncache_state)begin
        ifu2icache_cmd_ready  = icache2icb_cmd_ready & icache2icb_cmd_valid; //TBD
        ifu2icache_rsp_valid  = icache2icb_rsp_valid_uncache; 
        ifu2icache_rsp_err    = icache2icb_rsp_err  ; 
    end
    else begin //cache_able
        ifu2icache_cmd_ready  = ifu2cache_cmd_ready;
        ifu2icache_rsp_valid  = ifu2cache_rsp_valid; 
        ifu2icache_rsp_err    = ifu2cache_rsp_err  ; 
    end
end





always@(*)begin
    if(uncache_state)begin
        if(addr_bit2_fifo[addr_bit2_fifo_out_cnt])begin
            ifu2icache_rsp_rdata = icache2icb_rsp_rdata_uncache[63:32]; 
        end
        else begin
            ifu2icache_rsp_rdata = icache2icb_rsp_rdata_uncache[31:0]; 
        end
    end
    else begin //cache_able
        ifu2icache_rsp_rdata  = ifu2cache_rsp_rdata; 
    end
end

//to BIU
assign   icache2icb_cmd_valid = cache2icb_cmd_valid | icache2icb_cmd_valid_uncache;  //OUT

always@(*)begin
    if(uncache_state)begin
        icache2icb_cmd_addr  = icache2icb_cmd_addr_uncache ;
        icache2icb_cmd_read  = icache2icb_cmd_read_uncache ;
        icache2icb_cmd_wdata = icache2icb_cmd_wdata_uncache;
        icache2icb_cmd_wmask = icache2icb_cmd_wmask_uncache;
    end
    else begin
        icache2icb_cmd_addr  = cache2icb_cmd_addr  ;
        icache2icb_cmd_read  = cache2icb_cmd_read  ;
        icache2icb_cmd_wdata = cache2icb_cmd_wdata ;
        icache2icb_cmd_wmask = cache2icb_cmd_wmask ;
    end
end

assign  icache2icb_rsp_ready = 1'b1;





endmodule
