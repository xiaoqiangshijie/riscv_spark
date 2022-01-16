//two reg read and  one reg write

module regs(
    input clk,
    input rst_n,
    
    //from wb
    input        wr_en,
    input [4:0]  wr_addr,
    input [31:0] wr_data,

    //from de
    input        rd_en1,
    input        rd_en2,
    input [4:0]  rd_addr1,
    input [4:0]  rd_addr2,

    //to   de
    output reg [31:0] rd_data1,
    output reg [31:0] rd_data2
);

reg [31:0] regs [31:0];


//write regs
genvar i;
generate
for (i=0 ; i<32 ; i=i+1) begin:WRITE_REG
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        regs[i] <= 32'b0;
    end
    else if(wr_en == 1'b1 && i != 1'b0 && wr_addr == i) begin
        regs[i] <= wr_data;
    end
end
endgenerate

//read data1
always @(*) begin
    if(rd_addr1 == 32'b0) begin
        rd_data1 = 32'b0;
    end
    else if(rd_addr1 == wr_addr && wr_en == 1'b1 && rd_en1 == 1'b1) begin
        rd_data1 = wr_data;
    end
    else if(rd_en1 == 1'b1) begin
        rd_data1 = regs[rd_addr1];
    end
    else begin
        rd_data1 = 32'b0;
    end
end

//read data2
always @(*) begin
    if(rd_addr2 == 32'b0) begin
        rd_data2 = 32'b0;
    end
    else if(rd_addr2 == wr_addr && wr_en == 1'b1 && rd_en2 == 1'b1) begin
        rd_data2 = wr_data;
    end
    else if(rd_en2 == 1'b1) begin
        rd_data2 = regs[rd_addr2];
    end
    else begin
        rd_data2 = 32'b0;
    end
end

endmodule