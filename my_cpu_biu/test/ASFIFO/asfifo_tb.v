`timescale 1ns/1ns
//
// Company: Xidian University
// Engineer: Xumingwei
// 
// Create Date: 2020/11/06 23:54:40
// Design Name: ASFIFO's testbench
// Module Name: ASFIFO_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 异步FIFO的激励文件
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//
 
 
module ASFIFO_tb;
 
	parameter WIDTH = 16;
	parameter PTR   = 4;
 
	// 写时钟域tb信号定义
	reg					wr_clk		;
	reg					wr_rst_n	;
	reg	[WIDTH-1:0]	wr_data		;
	reg 				   wr_en		;
	wire				   wr_full		;
 
	// 读时钟域tb信号定义
	reg					rd_clk		;
	reg					rd_rst_n	;
	wire [WIDTH-1:0]	rd_data		;
	reg					rd_en		;
	wire				   rd_empty	;
 
	// testbench自定义信号
	reg					init_done	;		// testbench初始化结束
 
 
 
	// FIFO初始化
	initial	begin
		// 输入信号初始化
		wr_rst_n  = 1	;
		rd_rst_n  = 1	;
		wr_clk 	  = 0	;
		rd_clk 	  = 0	;
		wr_en 	  = 0	;
		rd_en 	  = 0	;
		wr_data   = 'b0 ;
		init_done = 0	;
 
		// FIFO复位
		#30 wr_rst_n = 0;
			rd_rst_n = 0;
		#30 wr_rst_n = 1;
			rd_rst_n = 1;
 
		// 初始化完毕
		#30 init_done = 1;
	end
 
 
 
	// 写时钟
	always
		#2 wr_clk = ~wr_clk;
 
	// 读时钟
	always
		#4 rd_clk = ~rd_clk;
 
 
 
	// 读写控制
	always @(*) begin
		if(init_done) begin
			// 写数据
			if( wr_full == 1'b1 )begin
				wr_en = 0;
			end
			else begin
				wr_en = 1;
			end
		end
	end
 
	always @(*) begin
		if(init_done) begin
			// 读数据
			if( rd_empty == 1'b1 )begin
				rd_en = 0;
			end
			else begin
				rd_en = 1;
			end
		end
	end
 
 
 
	// 写入数据自增
	always @(posedge wr_clk) begin
		if(init_done) begin
			if( wr_full == 1'b0 )
				wr_data <= wr_data + 1;
			else
				wr_data <= wr_data;
		end
		else begin
			wr_data <= 'b0;
		end
	end
 
 
 
	// 异步fifo例化
	asfifo
		# ( .WIDTH(16), .DEEP(4) )
		U_asfifo
		(
			.wr_clk	 	(wr_clk		),
			.wr_rst_n	(wr_rst_n	),
			.wr_data	   (wr_data	   ),
			.wr_en		(wr_en		),
			.wr_full  	(wr_full	   ),
 
			.rd_clk		(rd_clk		),
			.rd_rst_n	(rd_rst_n	),
			.rd_data 	(rd_data	   ),
			.rd_en		(rd_en		),
			.rd_empty	(rd_empty	)
		);


initial begin
#250000 $finish();   //vcs simulate time finish
end

initial begin
   $fsdbDumpfile("riscv.fsdb");
   $fsdbDumpvars;
   $fsdbDumpMDA();
end
 
endmodule