module lru(

    input clk,
    input rstn,

    input wr_hit_flag,
    input wr_miss_flag,
    input [15:0] wr_hit_num,

    output reg [15:0] lru_old

);

wire [3:0]                    lru15;
wire [3:0]                    lru14;
wire [3:0]                    lru13;
wire [3:0]                    lru12;
wire [3:0]                    lru11;
wire [3:0]                    lru10;
wire [3:0]                    lru9;
wire [3:0]                    lru8;
wire [3:0]                    lru7;
wire [3:0]                    lru6;
wire [3:0]                    lru5;
wire [3:0]                    lru4;
wire [3:0]                    lru3;
wire [3:0]                    lru2;
wire [3:0]                    lru1;
wire [3:0]                    lru0;
reg  [3:0]                    lru_sel;

wire                          lru15_old;
wire                          lru14_old;
wire                          lru13_old;
wire                          lru12_old;
wire                          lru11_old;
wire                          lru10_old;
wire                          lru9_old ;
wire                          lru8_old ;
wire                          lru7_old ;
wire                          lru6_old ;
wire                          lru5_old ;
wire                          lru4_old ;
wire                          lru3_old ;
wire                          lru2_old ;
wire                          lru1_old ;
wire                          lru0_old ;

reg [3:0]                    lru15_next;
reg [3:0]                    lru14_next;
reg [3:0]                    lru13_next;
reg [3:0]                    lru12_next;
reg [3:0]                    lru11_next;
reg [3:0]                    lru10_next;
reg [3:0]                    lru9_next;
reg [3:0]                    lru8_next;
reg [3:0]                    lru7_next;
reg [3:0]                    lru6_next;
reg [3:0]                    lru5_next;
reg [3:0]                    lru4_next;
reg [3:0]                    lru3_next;
reg [3:0]                    lru2_next;
reg [3:0]                    lru1_next;
reg [3:0]                    lru0_next;

reg [63:0] lru_cnt;

assign      lru15 = lru_cnt[63:60];
assign      lru14 = lru_cnt[59:56];
assign      lru13 = lru_cnt[55:52];
assign      lru12 = lru_cnt[51:48];
assign      lru11 = lru_cnt[47:44];
assign      lru10 = lru_cnt[43:40];
assign      lru9  = lru_cnt[39:36];
assign      lru8  = lru_cnt[35:32];
assign      lru7  = lru_cnt[31:28];
assign      lru6  = lru_cnt[27:24];
assign      lru5  = lru_cnt[23:20];
assign      lru4  = lru_cnt[19:16];
assign      lru3  = lru_cnt[15:12];
assign      lru2  = lru_cnt[11:8];
assign      lru1  = lru_cnt[7:4];
assign      lru0  = lru_cnt[3:0];

assign      lru15_old = (lru15 == 4'd15);
assign      lru14_old = (lru14 == 4'd15);
assign      lru13_old = (lru13 == 4'd15);
assign      lru12_old = (lru12 == 4'd15);
assign      lru11_old = (lru11 == 4'd15);
assign      lru10_old = (lru10 == 4'd15);
assign      lru9_old  = (lru9  == 4'd15);
assign      lru8_old  = (lru8  == 4'd15);
assign      lru7_old  = (lru7  == 4'd15);
assign      lru6_old  = (lru6  == 4'd15);
assign      lru5_old  = (lru5  == 4'd15);
assign      lru4_old  = (lru4  == 4'd15);
assign      lru3_old  = (lru3  == 4'd15);
assign      lru2_old  = (lru2  == 4'd15);
assign      lru1_old  = (lru1  == 4'd15);
assign      lru0_old  = (lru0  == 4'd15);

assign lru_old = {lru15_old,lru14_old,lru13_old,lru12_old,lru11_old,lru10_old,lru9_old,lru8_old,lru7_old,lru6_old,lru5_old,lru4_old,lru3_old,lru2_old,lru1_old,lru0_old};


//write lru_cnt reg
always@(posedge clk or negedge rstn)begin
    if(rstn == 1'b0) begin
        lru_cnt <= 64'h0123456789abcdef;
    end
    else if(wr_hit_flag | wr_miss_flag) begin
        lru_cnt  <= {lru15_next,
                     lru14_next,
                     lru13_next,
                     lru12_next,
                     lru11_next,
                     lru10_next,
                     lru9_next,
                     lru8_next,
                     lru7_next,
                     lru6_next,
                     lru5_next,
                     lru4_next,
                     lru3_next,
                     lru2_next,
                     lru1_next,
                     lru0_next};
    end
end

//select hit number

always @(*) begin
    case (wr_hit_num[15:0])
        16'b0000_0000_0000_0001: lru_sel = lru0 ;
        16'b0000_0000_0000_0010: lru_sel = lru1 ;
        16'b0000_0000_0000_0100: lru_sel = lru2 ;
        16'b0000_0000_0000_1000: lru_sel = lru3 ;
        16'b0000_0000_0001_0000: lru_sel = lru4 ;
        16'b0000_0000_0010_0000: lru_sel = lru5 ;
        16'b0000_0000_0100_0000: lru_sel = lru6 ;
        16'b0000_0000_1000_0000: lru_sel = lru7 ;
        16'b0000_0001_0000_0000: lru_sel = lru8 ;
        16'b0000_0010_0000_0000: lru_sel = lru9 ;
        16'b0000_0100_0000_0000: lru_sel = lru10 ;
        16'b0000_1000_0000_0000: lru_sel = lru11 ;
        16'b0001_0000_0000_0000: lru_sel = lru12 ;
        16'b0010_0000_0000_0000: lru_sel = lru13 ;
        16'b0100_0000_0000_0000: lru_sel = lru14 ;
        16'b1000_0000_0000_0000: lru_sel = lru15 ;
        default :                lru_sel = 4'b0 ;
    endcase
end

//lru0_next signal

wire [3:0] lru0_add_1;
assign lru0_add_1 = lru0+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0000_0000_0000_0001) begin
            lru0_next = 4'b0;
        end
        else begin
            if(lru0 < lru_sel) begin
                lru0_next = lru0_add_1;
            end
            else begin
                lru0_next = lru0;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0000_0000_0000_0001) begin
            lru0_next = 4'b0;
        end
        else begin
            lru0_next = lru0_add_1;
        end
    end
    else begin
        lru0_next = 4'b0;
    end
end


//lru1_next signal
wire [3:0] lru1_add_1;
assign lru1_add_1 = lru1+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0000_0000_0000_0010) begin
            lru1_next = 4'b0;
        end
        else begin
            if(lru1 < lru_sel) begin
                lru1_next = lru1_add_1;
            end
            else begin
                lru1_next = lru1;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0000_0000_0000_0010) begin
            lru1_next = 4'b0;
        end
        else begin
            lru1_next = lru1_add_1;
        end
    end
    else begin
        lru1_next = 4'b0;
    end
end

//lru2_next signal

wire [3:0] lru2_add_1;
assign lru2_add_1 = lru2+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0000_0000_0000_0100) begin
            lru2_next = 4'b0;
        end
        else begin
            if(lru2 < lru_sel) begin
                lru2_next = lru2_add_1;
            end
            else begin
                lru2_next = lru2;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0000_0000_0000_0100) begin
            lru2_next = 4'b0;
        end
        else begin
            lru2_next = lru2_add_1;
        end
    end
    else begin
        lru2_next = 4'b0;
    end
end

//lru3_next signal

wire [3:0] lru3_add_1;
assign lru3_add_1 = lru3+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0000_0000_0000_1000) begin
            lru3_next = 4'b0;
        end
        else begin
            if(lru3 < lru_sel) begin
                lru3_next = lru3_add_1;
            end
            else begin
                lru3_next = lru3;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0000_0000_0000_1000) begin
            lru3_next = 4'b0;
        end
        else begin
            lru3_next = lru3_add_1;
        end
    end
    else begin
        lru3_next = 4'b0;
    end
end

//lru4_next signal

wire [3:0] lru4_add_1;
assign lru4_add_1 = lru4+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0000_0000_0001_0000) begin
            lru4_next = 4'b0;
        end
        else begin
            if(lru4 < lru_sel) begin
                lru4_next = lru4_add_1;
            end
            else begin
                lru4_next = lru4;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0000_0000_0001_0000) begin
            lru4_next = 4'b0;
        end
        else begin
            lru4_next = lru4_add_1;
        end
    end
    else begin
        lru4_next = 4'b0;
    end
end

//lru5_next signal

wire [3:0] lru5_add_1;
assign lru5_add_1 = lru5+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0000_0000_0010_0000) begin
            lru5_next = 4'b0;
        end
        else begin
            if(lru5 < lru_sel) begin
                lru5_next = lru5_add_1;
            end
            else begin
                lru5_next = lru5;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0000_0000_0010_0000) begin
            lru5_next = 4'b0;
        end
        else begin
            lru5_next = lru5_add_1;
        end
    end
    else begin
        lru5_next = 4'b0;
    end
end

//lru6_next signal

wire [3:0] lru6_add_1;
assign lru6_add_1 = lru6+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0000_0000_0100_0000) begin
            lru6_next = 4'b0;
        end
        else begin
            if(lru6 < lru_sel) begin
                lru6_next = lru6_add_1;
            end
            else begin
                lru6_next = lru6;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0000_0000_0100_0000) begin
            lru6_next = 4'b0;
        end
        else begin
            lru6_next = lru6_add_1;
        end
    end
    else begin
        lru6_next = 4'b0;
    end
end

//lru7_next signal

wire [3:0] lru7_add_1;
assign lru7_add_1 = lru7+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0000_0000_1000_0000) begin
            lru7_next = 4'b0;
        end
        else begin
            if(lru7 < lru_sel) begin
                lru7_next = lru7_add_1;
            end
            else begin
                lru7_next = lru7;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0000_0000_1000_0000) begin
            lru7_next = 4'b0;
        end
        else begin
            lru7_next = lru7_add_1;
        end
    end
    else begin
        lru7_next = 4'b0;
    end
end


//lru8_next signal

wire [3:0] lru8_add_1;
assign lru8_add_1 = lru8+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0000_0001_0000_0000) begin
            lru8_next = 4'b0;
        end
        else begin
            if(lru8 < lru_sel) begin
                lru8_next = lru8_add_1;
            end
            else begin
                lru8_next = lru8;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0000_0001_0000_0000) begin
            lru8_next = 4'b0;
        end
        else begin
            lru8_next = lru8_add_1;
        end
    end
    else begin
        lru8_next = 4'b0;
    end
end

//lru9_next signal

wire [3:0] lru9_add_1;
assign lru9_add_1 = lru9+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0000_0010_0000_0000) begin
            lru9_next = 4'b0;
        end
        else begin
            if(lru9 < lru_sel) begin
                lru9_next = lru9_add_1;
            end
            else begin
                lru9_next = lru9;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0000_0010_0000_0000) begin
            lru9_next = 4'b0;
        end
        else begin
            lru9_next = lru9_add_1;
        end
    end
    else begin
        lru9_next = 4'b0;
    end
end

//lru10_next signal

wire [3:0] lru10_add_1;
assign lru10_add_1 = lru10+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0000_0100_0000_0000) begin
            lru10_next = 4'b0;
        end
        else begin
            if(lru10 < lru_sel) begin
                lru10_next = lru10_add_1;
            end
            else begin
                lru10_next = lru10;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0000_0100_0000_0000) begin
            lru10_next = 4'b0;
        end
        else begin
            lru10_next = lru10_add_1;
        end
    end
    else begin
        lru10_next = 4'b0;
    end
end

//lru11_next signal

wire [3:0] lru11_add_1;
assign lru11_add_1 = lru11+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0000_1000_0000_0000) begin
            lru11_next = 4'b0;
        end
        else begin
            if(lru11 < lru_sel) begin
                lru11_next = lru11_add_1;
            end
            else begin
                lru11_next = lru11;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0000_1000_0000_0000) begin
            lru11_next = 4'b0;
        end
        else begin
            lru11_next = lru11_add_1;
        end
    end
    else begin
        lru11_next = 4'b0;
    end
end

//lru12_next signal

wire [3:0] lru12_add_1;
assign lru12_add_1 = lru12+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0001_0000_0000_0000) begin
            lru12_next = 4'b0;
        end
        else begin
            if(lru12 < lru_sel) begin
                lru12_next = lru12_add_1;
            end
            else begin
                lru12_next = lru12;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0001_0000_0000_0000) begin
            lru12_next = 4'b0;
        end
        else begin
            lru12_next = lru12_add_1;
        end
    end
    else begin
        lru12_next = 4'b0;
    end
end

//lru13_next signal

wire [3:0] lru13_add_1;
assign lru13_add_1 = lru13+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0010_0000_0000_0000) begin
            lru13_next = 4'b0;
        end
        else begin
            if(lru13 < lru_sel) begin
                lru13_next = lru13_add_1;
            end
            else begin
                lru13_next = lru13;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0010_0000_0000_0000) begin
            lru13_next = 4'b0;
        end
        else begin
            lru13_next = lru13_add_1;
        end
    end
    else begin
        lru13_next = 4'b0;
    end
end


//lru14_next signal

wire [3:0] lru14_add_1;
assign lru14_add_1 = lru14+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b0100_0000_0000_0000) begin
            lru14_next = 4'b0;
        end
        else begin
            if(lru14 < lru_sel) begin
                lru14_next = lru14_add_1;
            end
            else begin
                lru14_next = lru14;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b0100_0000_0000_0000) begin
            lru14_next = 4'b0;
        end
        else begin
            lru14_next = lru14_add_1;
        end
    end
    else begin
        lru14_next = 4'b0;
    end
end

//lru15_next signal

wire [3:0] lru15_add_1;
assign lru15_add_1 = lru15+1 ; 

always@(*) begin
    if(wr_hit_flag) begin
        if(wr_hit_num == 16'b1000_0000_0000_0000) begin
            lru15_next = 4'b0;
        end
        else begin
            if(lru15 < lru_sel) begin
                lru15_next = lru15_add_1;
            end
            else begin
                lru15_next = lru15;
            end
        end
    end
    else if(wr_miss_flag) begin
        if(lru_old[15:0] == 16'b1000_0000_0000_0000) begin
            lru15_next = 4'b0;
        end
        else begin
            lru15_next = lru15_add_1;
        end
    end
    else begin
        lru15_next = 4'b0;
    end
end

endmodule