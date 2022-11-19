module btb (

    input             clk,
    input             rstn,
    input [63:0]      rd_pc,
    input             rd_vld,
    input             hit_vld,
    input             wr_req,
    input [63:0]      wr_pc,
    input [2:0]       wr_type,
    input [63:0]      wr_predict_pc,
    input             wr_taken,
    input             flush,

    output     [63:0] rd_pc_1d_add4,
    output     [2:0]  rd_type,
    output reg        rd_hit,
    output     [63:0] rd_predict_pc,
    output            rd_predict_taken

);

//  ----------------------- declare ------------------------------------

//BTB include 3bit type,16bit tag,16bit tat

//PARAMETER
parameter GHR_LEN           = 9                             ;
parameter BUFFER_SIZE       = 1 << GHR_LEN                  ;          //BUFFER_SIZE = 512
parameter BRANCH            = 1'b1                          ;
parameter BTB_DEEP          = 16                            ;

//BTB signal
reg   [              15:0] tag [BTB_DEEP-1:0]       ;
reg   [              15:0] tat [BTB_DEEP-1:0]       ;
reg   [               2:0] typ [BTB_DEEP-1:0]       ;
wire  [              15:0] lru_old                  ;
wire  [              15:0] rd_tag                   ;
wire  [              15:0] wr_tag                   ;
wire  [              15:0] wr_tat                   ;
wire  [               2:0] wr_typ                   ;
wire                       wr_hit_hot_flag          ;
wire                       rd_hit_hot_flag          ;
wire  [               2:0] rd_type                  ;
wire  [              63:0] rd_predict_pc            ;

reg                        rd_hit_flag              ;
reg   [               2:0] rd_typ                   ;
reg   [               2:0] rd_typ_1d                ;
reg   [              15:0] rd_tat                   ;
reg   [              15:0] rd_tat_1d                ;
reg   [              15:0] rd_hit_num               ;
reg                        rd_hit                   ;
reg                        wr_hit_flag              ;
reg                        wr_miss_flag             ;
reg   [              15:0] wr_hit_num               ;


//PHT GHR signal 
reg  [                1:0] pht  [BUFFER_SIZE-1:0]   ;
reg  [                1:0] pht_r[BUFFER_SIZE-1:0]   ;
reg  [                1:0] pht0 [BUFFER_SIZE-1:0]   ;
reg  [                1:0] pht1 [BUFFER_SIZE-1:0]   ;
reg  [                1:0] pht2 [BUFFER_SIZE-1:0]   ;
reg  [                1:0] pht3 [BUFFER_SIZE-1:0]   ;
reg  [                1:0] pht4 [BUFFER_SIZE-1:0]   ;
reg  [                1:0] pht5 [BUFFER_SIZE-1:0]   ;
reg  [                1:0] pht6 [BUFFER_SIZE-1:0]   ;
reg  [                1:0] pht7 [BUFFER_SIZE-1:0]   ;

reg  [          GHR_LEN:0] revise_ghr               ;
reg  [          GHR_LEN:0] ghr                      ;
reg  [                1:0] add_ina                  ;
reg  [                1:0] add_inb                  ;
reg  [               63:0] rd_pc_1d                 ;

wire                       pht_wr_en                ;
wire [                1:0] pht_rd_current           ;
wire [                1:0] add_out                  ;
wire                       pht_wr_en_cond           ;
wire [          GHR_LEN:0] ghr_addr              ;
wire [          GHR_LEN:0] revise_ghr_addr              ;

//------------------------------Main Code --------------------------------

//define pht reg interface

assign  pht_wr_en_cond = (wr_taken && pht[revise_ghr_addr] != 2'b11) || (!wr_taken && pht[revise_ghr_addr] != 2'b00);
assign  pht_wr_en   = wr_req && pht_wr_en_cond && wr_type == 3'd1; 

//initial wr_data

assign wr_tag = wr_pc[15:0];
assign wr_tat = wr_predict_pc[15:0];
assign wr_typ = wr_type;

//initial rd_tag

assign rd_tag = rd_pc[15:0];


//generate wr_hit_num

genvar i;
generate
for(i=0 ; i<BTB_DEEP ; i=i+1) begin:WR_COMPARE
    always@(*)begin
        if(wr_req == 1'b1) begin
            if(wr_tag == tag[i]) begin
                wr_hit_num[i]   = 1'b1;
            end
            else begin
                wr_hit_num[i]   = 1'b0;
            end
        end
        else begin
            wr_hit_num[i]   = 1'b0;
        end
    end
end
endgenerate


//generate wr_hit_flag wr_miss_flag

always@(*)begin
    if(wr_req == 1'b1 && |wr_hit_num == 1'b1)begin
        wr_hit_flag  = 1'b1;
        wr_miss_flag = 1'b0;
    end
    else if(wr_req == 1'b1 && |wr_hit_num == 1'b0) begin
        wr_hit_flag  = 1'b0;
        wr_miss_flag = 1'b1;
    end
    else begin
        wr_hit_flag  = 1'b0;
        wr_miss_flag = 1'b0;
    end
end

//write btb
genvar i;
generate
for(i=0 ; i<BTB_DEEP ; i=i+1) begin:WR_BTB
    always@(posedge clk or negedge rstn)begin
        if(!rstn) begin
            tag[i]   <=   16'b0;
            tat[i]   <=   16'b0;
            typ[i]   <=   3'b0;
        end
        else if(wr_miss_flag && lru_old[i] == 1'b1) begin
            tag[i]   <=   wr_tag;
            tat[i]   <=   wr_tat;
            typ[i]   <=   wr_typ;
        end
    end
end
endgenerate

//generate rd_hit_num number

genvar i;
generate
for(i=0 ; i<BTB_DEEP ; i=i+1) begin:RD_COMPARE
    always@(*)begin
        if(rd_vld == 1'b1) begin
            if(rd_tag == tag[i]) begin
                rd_hit_num[i]   = 1'b1;
            end
            else begin
                rd_hit_num[i]   = 1'b0;
            end
        end
        else begin
            rd_hit_num[i]   = 1'b0;
        end
    end
end
endgenerate

always@(*) begin
    if(|rd_hit_num == 1'b1 && flush != 1'b1) begin
        rd_hit_flag  = 1'b1;
    end
    else begin
        rd_hit_flag  = 1'b0;
    end
end

//read btb

always@(*) begin
    if(rd_hit_flag) begin
        case(rd_hit_num[15:0])
            16'b0000_0000_0000_0001: rd_typ = typ[0];
            16'b0000_0000_0000_0010: rd_typ = typ[1];
            16'b0000_0000_0000_0100: rd_typ = typ[2];
            16'b0000_0000_0000_1000: rd_typ = typ[3];
            16'b0000_0000_0001_0000: rd_typ = typ[4];
            16'b0000_0000_0010_0000: rd_typ = typ[5];
            16'b0000_0000_0100_0000: rd_typ = typ[6];
            16'b0000_0000_1000_0000: rd_typ = typ[7];
            16'b0000_0001_0000_0000: rd_typ = typ[8];
            16'b0000_0010_0000_0000: rd_typ = typ[9];
            16'b0000_0100_0000_0000: rd_typ = typ[10];
            16'b0000_1000_0000_0000: rd_typ = typ[11];
            16'b0001_0000_0000_0000: rd_typ = typ[12];
            16'b0010_0000_0000_0000: rd_typ = typ[13];
            16'b0100_0000_0000_0000: rd_typ = typ[14];
            16'b1000_0000_0000_0000: rd_typ = typ[15];
            default:                 rd_typ = 3'b0;
        endcase
    end
    else begin
        rd_typ = 3'b0;
    end
end

always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
        rd_typ_1d <= 3'b0;
    end
    else begin
        rd_typ_1d <= rd_typ;
    end
end

//read rd_tat

always@(*) begin
    if(rd_hit_flag) begin
        case(rd_hit_num[15:0])
            16'b0000_0000_0000_0001: rd_tat = tat[0];
            16'b0000_0000_0000_0010: rd_tat = tat[1];
            16'b0000_0000_0000_0100: rd_tat = tat[2];
            16'b0000_0000_0000_1000: rd_tat = tat[3];
            16'b0000_0000_0001_0000: rd_tat = tat[4];
            16'b0000_0000_0010_0000: rd_tat = tat[5];
            16'b0000_0000_0100_0000: rd_tat = tat[6];
            16'b0000_0000_1000_0000: rd_tat = tat[7];
            16'b0000_0001_0000_0000: rd_tat = tat[8];
            16'b0000_0010_0000_0000: rd_tat = tat[9];
            16'b0000_0100_0000_0000: rd_tat = tat[10];
            16'b0000_1000_0000_0000: rd_tat = tat[11];
            16'b0001_0000_0000_0000: rd_tat = tat[12];
            16'b0010_0000_0000_0000: rd_tat = tat[13];
            16'b0100_0000_0000_0000: rd_tat = tat[14];
            16'b1000_0000_0000_0000: rd_tat = tat[15];
            default:                 rd_tat = 16'b0;
        endcase
    end
    else begin
        rd_tat = 16'b0;
    end
end

always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
        rd_tat_1d <= 16'b0;
    end
    else begin
        rd_tat_1d <= rd_tat;
    end
end

//output npc signal

assign rd_type         = rd_typ_1d;
assign rd_predict_pc   = {rd_pc[63:16],rd_tat_1d};

always@(posedge clk or negedge rstn) begin
    if(!rstn) begin
        rd_hit <= 1'b0;
    end
    else begin
        rd_hit <= rd_hit_flag;
    end
end

//////////replace strategy////////

lru u_lru(

   .clk(clk),
   .rstn(rstn),

   .wr_hit_flag(wr_hit_flag),
   .wr_miss_flag(wr_miss_flag),
   .wr_hit_num(wr_hit_num),

   .lru_old(lru_old)

);

////////////////PHT////////////////


//pht divide page
//genvar i;
//generate
//for(i=0 ; i<BUFFER_SIZE ; i=i+1) begin:INITIAL
//    always@(posedge clk or negedge rstn) begin
//        if(!rstn) begin
//            pht0[i] <= 2'b00;
//            pht1[i] <= 2'b00;
//            pht2[i] <= 2'b00;
//            pht3[i] <= 2'b00;
//            pht4[i] <= 2'b00;
//            pht5[i] <= 2'b00;
//            pht6[i] <= 2'b00;
//            pht7[i] <= 2'b00;
//        end
//    end
//end
//endgenerate
//
//always@(*) begin
//    case(rd_pc[13:11])
//        3'b000:   pht_r = pht0;
//        3'b001:   pht_r = pht1;
//        3'b010:   pht_r = pht2;
//        3'b011:   pht_r = pht3;
//        3'b100:   pht_r = pht4;
//        3'b101:   pht_r = pht5;
//        3'b110:   pht_r = pht6;
//        3'b111:   pht_r = pht7;
//        default:  pht_r = pht0;
//    endcase
//end

always @(*) begin
    if(wr_taken && pht[revise_ghr_addr] != 2'b11)begin
        add_inb = 2'b01;
        add_ina = pht[revise_ghr_addr];
    end
    else if (!wr_taken && pht[revise_ghr_addr] != 2'b00) begin
        add_inb = -2'b01;
        add_ina = pht[revise_ghr_addr];
    end
    else if(wr_taken && pht[revise_ghr_addr] == 2'b11) begin
        add_inb = 2'b00;
        add_ina = pht[revise_ghr_addr];
    end
    else if(!wr_taken && pht[revise_ghr_addr] == 2'b00) begin
        add_inb = 2'b00;
        add_ina = pht[revise_ghr_addr];
    end
    else begin
        add_inb = 2'b0;
        add_ina = 2'b0;
    end
end

assign add_out = add_ina + add_inb;

genvar i;
generate
for( i = 0; i < BUFFER_SIZE; i = i + 1) begin:WR_PHT
    always @ (posedge clk or negedge rstn) begin//写入buffer
        if(!rstn) begin
            pht[i] <= 2'b01;
        end
        else if(pht_wr_en) begin
            if(revise_ghr_addr == i) begin
                pht[i] <= add_out;
            end
        end
    end
end
endgenerate

////////////////GHR////////////////

//write revise_ghr
always@(posedge clk or negedge rstn)begin
    if(!rstn) begin
        revise_ghr <= 'b0;
    end
    else if(wr_type == BRANCH) begin
        revise_ghr <= {revise_ghr[GHR_LEN-2:0],wr_taken};
    end
end

assign revise_ghr_addr = revise_ghr;// ^ wr_pc[10:2];

//generate ghr
assign pht_rd_current = pht[ghr_addr];

reg [GHR_LEN-1:0] ghr;
always @ (posedge clk or negedge rstn) begin
    if(!rstn) begin
        ghr <= 'b0;
    end
    else if(flush) begin
        ghr <= {revise_ghr[GHR_LEN-2:0],wr_taken};
    end
    else if(pht_rd_current[1] == 1'b1  && rd_type == 3'b1) begin
        ghr <= {ghr[GHR_LEN-2:0],1'b1};
    end
    else if(pht_rd_current[1] == 1'b0  && rd_type == 3'b1) begin
        ghr <= {ghr[GHR_LEN-2:0],1'b0};
    end
end


assign ghr_addr = ghr;// ^ rd_pc_1d[10:2];
assign rd_predict_taken = pht_rd_current[1];

//generate rd_pc_1d
always @(posedge clk or negedge rstn) begin
    if(!rstn) begin
        rd_pc_1d <= 64'b0;
    end
    else if(rd_vld) begin
        rd_pc_1d <= rd_pc;
    end
end

assign rd_pc_1d_add4 = rd_pc_1d + 4;

endmodule