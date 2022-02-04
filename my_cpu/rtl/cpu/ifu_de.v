module ifu_de(
    input clk,
    input rst_n,
    
    input [31:0]inst_o,
    input [31:0]pc,
    input [5:0] stall,

    output reg [31:0] de_pc,
    output reg [31:0] de_inst
);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        de_pc <= 32'b0;
    end
    else if(stall[1] == 1'b1) begin
        de_pc <= 32'b0;
    end
    else if(stall[1] == 1'b0) begin
        de_pc <= pc;
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        de_inst <= 32'd0;
    end
    else if(stall[1] == 1'b1) begin
        de_inst <= 32'd0;
    end
    else if(stall[1] == 1'b0)begin
        de_inst <= inst_o;
    end
end

endmodule 