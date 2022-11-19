module cache_top #(
    parameter   DTYPE        = 0             ,
    parameter   ADW          = 64            ,
    parameter   DW           = 64            ,
    parameter   CORE_DW      = 32*(1+DTYPE)  ,
    parameter   MASK_DW      = 4*(1+DTYPE)   ,
    parameter   UNCACHE_B    = 64'h0000_0000 ,
    parameter   UNCACHE_B_DT = 64'h0000_0000 ,
    parameter   UNCACHE_E    = 64'h0000_0014 ,
    parameter   UNCACHE_E_DT = 64'h7fff_ffff
)(  
    input                   clk                           , //clk 
    input                   rstn                          ,
//WITH ifu
    input                      core2cache_cmd_valid          ,//the handshake signal
    output  reg                core2cache_cmd_ready          ,//the handshake signal
    input        [ADW-1:0]     core2cache_cmd_addr           ,//address from ifu
    input                      core2cache_cmd_read           ,//read enable
    input        [CORE_DW-1:0] core2cache_cmd_wdata          ,//data from the ifu that needs to be writtenA
    input        [MASK_DW-1:0] core2cache_cmd_wmask          ,//mask from the ifu
    output  reg                core2cache_rsp_valid          ,//the handshake signal
    input                      core2cache_rsp_ready          ,//the handshake signal
    output  reg  [CORE_DW-1:0] core2cache_rsp_rdata          ,//data returned by the slave    // TBD generate; the width diff between I_cacache and D-cache 
    output  reg                core2cache_rsp_err            ,
//WITH BIU
    output                     cache2mem_cmd_valid          ,//the handshake signal
    input                      cache2mem_cmd_ready          ,//the handshake signal
    output  reg  [ADW-1:0]     cache2mem_cmd_addr           ,//address from ifu
    output  reg                cache2mem_cmd_read           ,//read enable
    output  reg  [DW-1:0]      cache2mem_cmd_wdata          ,//data from the ifu that needs to be written
    output  reg  [MASK_DW-1:0] cache2mem_cmd_wmask          ,//mask from the ifu
    input                      cache2mem_rsp_valid          ,//the handshake signal
    output                     cache2mem_rsp_ready          ,//the handshake signal
    input        [DW-1:0]      cache2mem_rsp_rdata          ,//data returned by the slave
    input                      cache2mem_rsp_err            
);

//---------------local param -----------------------//
localparam  IDLE             = 2'd0;
localparam  CACHE            = 2'd1;
localparam  UNCACHE          = 2'd2;
`ifdef DIFFTEST
localparam  UN_CACHE_BEGIN   = UNCACHE_B_DT;
localparam  UN_CACHE_END     = UNCACHE_E_DT;
`else
localparam  UN_CACHE_BEGIN   = UNCACHE_B;
localparam  UN_CACHE_END     = UNCACHE_E;
`endif

//---------------declare ---------------------------//
wire               to_cache_cmd_valid          ;//the handshake signal
wire               to_cache_cmd_ready          ;//the handshake signal
wire [ADW-1:0]     to_cache_cmd_addr           ;//address from ifu
wire               to_cache_cmd_read           ;//read enable
wire [CORE_DW-1:0] to_cache_cmd_wdata          ;//data from the ifu that needs to be written
wire [MASK_DW-1:0] to_cache_cmd_wmask          ;//mask from the ifu
wire               to_cache_rsp_valid          ;//the handshake signal
wire               to_cache_rsp_ready          ;//the handshake signal
wire [CORE_DW-1:0] to_cache_rsp_rdata          ;//data returned by the slave    // TBD generate; the width diff between I_cacache and D-cache 
wire               to_cache_rsp_err            ;

wire               from_cache_cmd_valid          ;//the handshake signal
wire               from_cache_cmd_ready          ;//the handshake signal
wire [ADW-1:0]     from_cache_cmd_addr           ;//address from ifu
wire               from_cache_cmd_read           ;//read enable
wire [DW-1:0]      from_cache_cmd_wdata          ;//data from the ifu that needs to be written
wire [MASK_DW-1:0] from_cache_cmd_wmask          ;//mask from the ifu
wire               from_cache_rsp_valid          ;//the handshake signal
wire               from_cache_rsp_ready          ;//the handshake signal
wire [DW-1:0]      from_cache_rsp_rdata          ;//data returned by the slave
wire               from_cache_rsp_err            ;

wire               cache2mem_cmd_valid_uncache          ;//the handshake signal
wire               cache2mem_cmd_ready_uncache          ;//the handshake signal
wire [ADW-1:0]     cache2mem_cmd_addr_uncache           ;//address from ifu
wire               cache2mem_cmd_read_uncache           ;//read enable
wire [DW-1:0]      cache2mem_cmd_wdata_uncache          ;//data from the ifu that needs to be written
wire [MASK_DW-1:0] cache2mem_cmd_wmask_uncache          ;//mask from the ifu
reg                cache2mem_rsp_valid_uncache          ;//the handshake signal
wire               cache2mem_rsp_ready_uncache          ;//the handshake signal
reg  [DW-1:0]      cache2mem_rsp_rdata_uncache          ;//data returned by the slave
wire               cache2mem_rsp_err_uncache            ;

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
assign   uncache_addr_hit = (core2cache_cmd_addr <= UN_CACHE_END );
`else
assign   uncache_addr_hit = (core2cache_cmd_addr >= UN_CACHE_BEGIN) && (core2cache_cmd_addr <= UN_CACHE_END );
`endif

//CACHE fsm
wire  cache_cond;
wire  uncache_cond;

assign  cache_cond   = core2cache_cmd_valid & (!uncache_addr_hit);
assign  uncache_cond = core2cache_cmd_valid & uncache_addr_hit; 

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
    else if( (core2cache_cmd_valid & core2cache_cmd_ready) & (!core2cache_rsp_valid) )begin
        out_cnt <= out_cnt + 4'd1 ;
    end
    else if( (!(core2cache_cmd_valid & core2cache_cmd_ready)) & core2cache_rsp_valid ) begin
        out_cnt <= out_cnt - 4'd1 ;
    end
end

// when out_cnt=0  && cache_core_out_cnt=0,  cache_core_clean

/////////////////////////////////////////////////
//     uncache part
/////////////////////////////////////////////////

assign cache2mem_cmd_valid_uncache = uncache_state & core2cache_cmd_valid & uncache_addr_hit;
assign cache2mem_cmd_ready_uncache = uncache_state & core2cache_cmd_ready;
assign cache2mem_cmd_addr_uncache  = core2cache_cmd_addr;
assign cache2mem_cmd_read_uncache  = core2cache_cmd_read;
//assign cache2mem_cmd_wdata_uncache = core2cache_cmd_wdata;
assign cache2mem_cmd_wmask_uncache = core2cache_cmd_wmask;
assign cache2mem_rsp_ready_uncache = 1'b1;
assign cache2mem_rsp_err_uncache   = cache2mem_rsp_err;

/////////////////////////////////////////////////
//    cache part
////////////////////////////////////////////////

//ifu/lsu with CACHE_CORE
assign to_cache_cmd_valid = (!uncache_state) & core2cache_cmd_valid & (!uncache_addr_hit ) ;
assign to_cache_cmd_addr  = core2cache_cmd_addr  ; 
assign to_cache_cmd_read  = core2cache_cmd_read  ;
assign to_cache_cmd_wdata = core2cache_cmd_wdata ;
assign to_cache_cmd_wmask = core2cache_cmd_wmask ;
assign to_cache_rsp_ready = core2cache_rsp_ready; 

//CACHE_CORE with BIU
assign from_cache_cmd_ready  =  (!uncache_state) & cache2mem_cmd_ready;
assign from_cache_rsp_valid  =  (!uncache_state) & cache2mem_rsp_valid;  
assign from_cache_rsp_rdata  =  cache2mem_rsp_rdata;
assign from_cache_rsp_err    =  cache2mem_rsp_err;

generate if(!DTYPE) begin: gen_icache_core

icache_core u0_icache_core(
    .clk                      ( clk                     ), //clk 
    .rstn                     ( rstn                    ),
//WITH ifu                           
    .ifu2icache_cmd_valid     ( to_cache_cmd_valid     ),//the handshake signal
    .ifu2icache_cmd_ready     ( to_cache_cmd_ready     ),//the handshake signal        //OUT
    .ifu2icache_cmd_addr      ( to_cache_cmd_addr      ),//address from ifu
    .ifu2icache_cmd_read      ( to_cache_cmd_read      ),//read enable
    .ifu2icache_cmd_wdata     ( to_cache_cmd_wdata     ),//data from the ifu that needs to be written
    .ifu2icache_cmd_wmask     ( to_cache_cmd_wmask     ),//mask from the ifu
    .ifu2icache_rsp_valid     ( to_cache_rsp_valid     ),//the handshake signal        //OUT 
    .ifu2icache_rsp_ready     ( to_cache_rsp_ready     ),//the handshake signal  
    .ifu2icache_rsp_rdata     ( to_cache_rsp_rdata     ),//data returned by the slave  //OUT
    .ifu2icache_rsp_err       ( to_cache_rsp_err       ),                              //OUT
    .burst_idle_state         ( burst_idle_state       ),
//WITH BIU                      
    .icache2icb_cmd_valid     ( from_cache_cmd_valid     ),//the handshake signal        
    .icache2icb_cmd_ready     ( from_cache_cmd_ready     ),//the handshake signal        //IN
    .icache2icb_cmd_addr      ( from_cache_cmd_addr      ),//address from ifu      
    .icache2icb_cmd_read      ( from_cache_cmd_read      ),//read enable           
    .icache2icb_cmd_wdata     ( from_cache_cmd_wdata     ),//data from the ifu that needs to be written
    .icache2icb_cmd_wmask     ( from_cache_cmd_wmask     ),//mask from the ifu
    .icache2icb_rsp_valid     ( from_cache_rsp_valid     ),//the handshake signal        //in
    .icache2icb_rsp_ready     ( from_cache_rsp_ready     ),//the handshake signal     
    .icache2icb_rsp_rdata     ( from_cache_rsp_rdata     ),//data returned by the slave  //in
    .icache2icb_rsp_err       ( from_cache_rsp_err       )                               //in
);

end else begin: gen_dcache_core

dcache_core u0_dcache_core(
    .clk                      ( clk                     ), //clk 
    .rstn                     ( rstn                    ),
//WITH LSU                           
    .lsu2dcache_cmd_valid     ( to_cache_cmd_valid     ),//the handshake signal
    .lsu2dcache_cmd_ready     ( to_cache_cmd_ready     ),//the handshake signal        //OUT
    .lsu2dcache_cmd_addr      ( to_cache_cmd_addr      ),//address from ifu
    .lsu2dcache_cmd_read      ( to_cache_cmd_read      ),//read enable
    .lsu2dcache_cmd_wdata     ( to_cache_cmd_wdata     ),//data from the ifu that needs to be written
    .lsu2dcache_cmd_wmask     ( to_cache_cmd_wmask     ),//mask from the ifu
    .lsu2dcache_rsp_valid     ( to_cache_rsp_valid     ),//the handshake signal        //OUT 
    .lsu2dcache_rsp_ready     ( to_cache_rsp_ready     ),//the handshake signal  
    .lsu2dcache_rsp_rdata     ( to_cache_rsp_rdata     ),//data returned by the slave  //OUT
    .lsu2dcache_rsp_err       ( to_cache_rsp_err       ),                              //OUT
    .burst_idle_state         ( burst_idle_state       ),
//WITH BIU                      
    .dcache2icb_cmd_valid     ( from_cache_cmd_valid     ),//the handshake signal        
    .dcache2icb_cmd_ready     ( from_cache_cmd_ready     ),//the handshake signal        //IN
    .dcache2icb_cmd_addr      ( from_cache_cmd_addr      ),//address from ifu      
    .dcache2icb_cmd_read      ( from_cache_cmd_read      ),//read enable           
    .dcache2icb_cmd_wdata     ( from_cache_cmd_wdata     ),//data from the ifu that needs to be written
    .dcache2icb_cmd_wmask     ( from_cache_cmd_wmask     ),//mask from the ifu
    .dcache2icb_rsp_valid     ( from_cache_rsp_valid     ),//the handshake signal        //in
    .dcache2icb_rsp_ready     ( from_cache_rsp_ready     ),//the handshake signal     
    .dcache2icb_rsp_rdata     ( from_cache_rsp_rdata     ),//data returned by the slave  //in
    .dcache2icb_rsp_err       ( from_cache_rsp_err       )                               //in
);

end endgenerate

generate if(!DTYPE) begin: gen_icache_uncache

reg [15:0] addr_bit2_fifo;
reg [3:0]  addr_bit2_fifo_in_cnt;
reg [3:0]  addr_bit2_fifo_out_cnt;
 
always@(posedge clk or negedge rstn) begin	
    if(!rstn)begin
        addr_bit2_fifo_in_cnt <= 4'd0;
    end
    else if(uncache_state && core2cache_cmd_valid && core2cache_cmd_ready)begin 
        addr_bit2_fifo_in_cnt <= addr_bit2_fifo_in_cnt + 4'd1;
    end
end

always@(posedge clk or negedge rstn) begin	
    if(!rstn)begin
        addr_bit2_fifo <= 16'd0;
    end
    else if(uncache_state && core2cache_cmd_valid && core2cache_cmd_ready )begin
         addr_bit2_fifo[addr_bit2_fifo_in_cnt] <= core2cache_cmd_addr[2];
    end
end

always@(posedge clk or negedge rstn) begin	
    if(!rstn)begin
        addr_bit2_fifo_out_cnt <= 4'd0;
    end
    else if( uncache_state && core2cache_rsp_valid)begin 
        addr_bit2_fifo_out_cnt <= addr_bit2_fifo_out_cnt + 4'd1;
    end
end

always@(posedge clk or negedge rstn) begin	
    if(!rstn)begin
        cache2mem_rsp_valid_uncache <= 1'd0;
    end
    else begin
        cache2mem_rsp_valid_uncache <= cache2mem_rsp_valid & uncache_state;
    end
end

always@(posedge clk) begin	
    if(uncache_state & cache2mem_rsp_valid) begin
        cache2mem_rsp_rdata_uncache <= cache2mem_rsp_rdata;
    end
end

assign cache2mem_cmd_wdata_uncache = {32'd0,core2cache_cmd_wdata};

always@(*)begin
    if(uncache_state)begin
        core2cache_cmd_ready  = cache2mem_cmd_ready & cache2mem_cmd_valid; //TBD
        core2cache_rsp_valid  = cache2mem_rsp_valid_uncache; 
        core2cache_rsp_err    = cache2mem_rsp_err  ; 
    end
    else begin //cache_able
        core2cache_cmd_ready  = to_cache_cmd_ready;
        core2cache_rsp_valid  = to_cache_rsp_valid; 
        core2cache_rsp_err    = to_cache_rsp_err  ; 
    end
end

always@(*)begin
    if(uncache_state)begin
        if(addr_bit2_fifo[addr_bit2_fifo_out_cnt])begin
            core2cache_rsp_rdata = cache2mem_rsp_rdata_uncache[63:32]; 
        end
        else begin
            core2cache_rsp_rdata = cache2mem_rsp_rdata_uncache[31:0]; 
        end
    end
    else begin //cache_able
        core2cache_rsp_rdata  = to_cache_rsp_rdata; 
    end
end

end else begin: gen_dcache_uncache

assign cache2mem_rsp_valid_uncache = uncache_state & cache2mem_rsp_valid;
assign cache2mem_rsp_rdata_uncache = cache2mem_rsp_rdata;
assign cache2mem_cmd_wdata_uncache = core2cache_cmd_wdata;

always@(*)begin
    if(uncache_state)begin
        core2cache_cmd_ready  = cache2mem_cmd_ready;
        core2cache_rsp_valid  = cache2mem_rsp_valid; 
        core2cache_rsp_rdata  = cache2mem_rsp_rdata; 
        core2cache_rsp_err    = cache2mem_rsp_err  ; 
    end
    else begin //cache_able
        core2cache_cmd_ready  = to_cache_cmd_ready;
        core2cache_rsp_valid  = to_cache_rsp_valid; 
        core2cache_rsp_rdata  = to_cache_rsp_rdata; 
        core2cache_rsp_err    = to_cache_rsp_err  ; 
    end
end

end endgenerate

//to BIU
assign   cache2mem_cmd_valid = from_cache_cmd_valid | cache2mem_cmd_valid_uncache;  //OUT

always@(*)begin
    if(uncache_state)begin
        cache2mem_cmd_addr  = cache2mem_cmd_addr_uncache ;
        cache2mem_cmd_read  = cache2mem_cmd_read_uncache ;
        cache2mem_cmd_wdata = cache2mem_cmd_wdata_uncache;
        cache2mem_cmd_wmask = cache2mem_cmd_wmask_uncache;
    end
    else begin
        cache2mem_cmd_addr  = from_cache_cmd_addr  ;
        cache2mem_cmd_read  = from_cache_cmd_read  ;
        cache2mem_cmd_wdata = from_cache_cmd_wdata ;
        cache2mem_cmd_wmask = from_cache_cmd_wmask ;
    end
end

assign  cache2mem_rsp_ready = 1'b1;



endmodule