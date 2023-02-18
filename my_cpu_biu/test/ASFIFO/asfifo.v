
`timescale 1ns / 1ns

module asfifo#(
    parameter WIDTH = 16,
    parameter DEEP  = 4
)
(
    input  wr_clk,
    input  wr_rst_n,
    input  wr_en,
    input [WIDTH-1:0] wr_data,
    output reg wr_full,

    input  rd_clk,
    input  rd_rst_n,
    input  rd_en,
    output [WIDTH-1:0] rd_data,
    output reg rd_empty
);

//wr_sp signal
reg [DEEP:0] wr_bin;

always @(posedge wr_clk or negedge wr_rst_n) begin
    if(!wr_rst_n) begin
        wr_bin <= {DEEP{1'b0}};
    end
    else if(wr_en && !wr_full) begin
        wr_bin <= wr_bin + 1'b1;
    end
end

//rd_sp signal
reg [DEEP:0] rd_bin;

always @(posedge rd_clk or negedge rd_rst_n) begin
    if(!rd_rst_n) begin
        rd_bin <= {DEEP{1'b0}};
    end
    else if(rd_en && !rd_empty) begin
        rd_bin <= rd_bin + 1'b1;
    end
end

//wr_sp to wr_gray
reg [DEEP:0] wr_gray;

always @(posedge wr_clk or negedge wr_rst_n) begin
    if(!wr_rst_n) begin
        wr_gray <= {DEEP{1'b0}};
    end
    else if(wr_en && !wr_full) begin
        wr_gray <= {wr_bin[DEEP],wr_bin[DEEP:1] ^ wr_bin[DEEP-1:0]};
    end
end

//rd_sp to rd_gray
reg [DEEP:0] rd_gray;

always @(posedge rd_clk or negedge rd_rst_n) begin
    if(!rd_rst_n) begin
        rd_gray <= {DEEP{1'b0}};
    end
    else if(rd_en && !rd_empty) begin
        rd_gray <= {rd_bin[DEEP],rd_bin[DEEP:1] ^ rd_bin[DEEP-1:0]};
    end
end

//wr_gray ---> rd_gray
reg [DEEP:0] rd_gray_1d;
reg [DEEP:0] rd_gray_2d;

always @(posedge rd_clk or negedge rd_rst_n) begin
    if(!rd_rst_n) begin
        rd_gray_1d <= {DEEP{1'b0}};
        rd_gray_2d <= {DEEP{1'b0}};
    end
    else begin
        rd_gray_1d <= rd_gray;
        rd_gray_2d <= rd_gray_1d;
    end
end

//rd_gray ---> wr_gray
reg [DEEP:0] wr_gray_1d;
reg [DEEP:0] wr_gray_2d;

always @(posedge wr_clk or negedge wr_rst_n) begin
    if(!wr_rst_n) begin
        wr_gray_1d <= {DEEP{1'b0}};
        wr_gray_2d <= {DEEP{1'b0}};
    end
    else begin
        wr_gray_1d <= wr_gray;
        wr_gray_2d <= wr_gray_1d;
    end
end

//decode wr_gray
integer i ;
integer j ;

reg [DEEP:0] wr_bin_rd;
reg [DEEP:0] rd_bin_wr;

always @(*) begin
	wr_bin_rd[DEEP] = wr_gray_2d[DEEP];
	for (j=DEEP-1; j>=0; j=j-1)
		wr_bin_rd[j] = wr_bin_rd[j+1] ^ wr_gray_2d[j];
end

always @(*) begin
	rd_bin_wr[DEEP] = rd_gray_2d[DEEP];
	for ( i=DEEP-1; i>=0; i=i-1 )
		rd_bin_wr[i] = rd_bin_wr[i+1] ^ rd_gray_2d[i];
end

//generate wr_full signal
always @(*) begin
    if((wr_bin[DEEP] != rd_bin_wr[DEEP]) && wr_bin[DEEP-1:0] == rd_bin_wr[DEEP-1:0]) begin
        wr_full = 1'b1;
    end
    else begin
        wr_full = 1'b0;
    end
end

//generate rd_empty signal
always @(*) begin
    if(rd_bin == wr_bin_rd) begin
        rd_empty = 1'b1;
    end
    else begin
        rd_empty = 1'b0;
    end
end

// DPRAM control signal
wire  				dpram_wr_en		 ;
wire [DEEP-1:0]		dpram_wr_addr    ;
wire [WIDTH-1:0] 	dpram_wr_data	 ;
wire  				dpram_rd_en		 ;
wire [DEEP-1:0]		dpram_rd_addr    ;
wire [WIDTH-1:0] 	dpram_rd_data	 ;


// DPRAM signal generate
assign dpram_wr_en   = ( wr_en == 1'b1 && wr_full == 1'b0 )? 1'b1 : 1'b0;
assign dpram_wr_data = wr_data;
assign dpram_wr_addr = wr_bin[DEEP-1:0];

assign dpram_rd_en   = ( rd_en == 1'b1 && rd_empty == 1'b0 )? 1'b1 : 1'b0;
assign rd_data = dpram_rd_data;
assign dpram_rd_addr = rd_bin[DEEP-1:0];

// RTL双口RAM例化
DPRAM
	# ( .WIDTH(16), .DEPTH(16), .ADDR(4) )
	U_DPRAM
	(
		.wrclk		(wr_clk		 	),
		.rdclk		(rd_clk			),
		.rd_rst_n   (rd_rst_n		),
		.wr_en 		(dpram_wr_en	),
		.rd_en 		(dpram_rd_en	),
		.wr_data 	(dpram_wr_data	),
		.rd_data 	(dpram_rd_data	),
		.wr_addr 	(dpram_wr_addr	),
		.rd_addr 	(dpram_rd_addr	)
	);

endmodule