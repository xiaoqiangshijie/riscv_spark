module ifu(
    input clk,
    input rst_n,
    output reg [5:0] pc,
    output reg en
);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        pc <= 31'b0;
    end
    else begin
        pc <= pc + 1;  
    end
end

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        en <= 1'b0; 
    end
    else begin
        en <= 1'b1;
    end
end

endmodule
