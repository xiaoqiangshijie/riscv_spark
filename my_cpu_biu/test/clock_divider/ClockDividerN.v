module ClockDividerN(clk_in,clk_out);
input clk_in;
output clk_out;
reg clk_out=0;
// initial DIV=10;
reg[3:0] cnt_div=0;    //分频数增加减少时，计数位宽也要相应调整
//initial cnt_div=0;
//initial clk_out=0;
parameter DIV = 20;  //待分频数,可更改分频值
if (DIV == 1) begin
            // This needs to be procedural because of the assignment on declaration
            always @(clk_in) begin
                clk_out = clk_in;
            end
end else begin
always@(posedge clk_in)
if(cnt_div == DIV/2-1)
    cnt_div <= 4'd0;
else
     cnt_div <= cnt_div + 1'b1;
     
always@(posedge clk_in)
if(cnt_div == DIV/2-1)
    clk_out <= ~clk_out;
 else
    clk_out <= clk_out;
end
endmodule
   
 
