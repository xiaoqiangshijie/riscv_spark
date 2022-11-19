module ras(
    input      clk,
    input      rstn,
    input      pop,
    input      push,
    input      [63:0] din,
    output reg [63:0] dout,
    output reg        empty
);

reg [3:0]  sp;
reg [63:0] r_stack [15:0];

always @(posedge clk or negedge rstn) begin
    if(!rstn)begin
        sp <= 4'd0;
    end
    else if(push && !pop && sp < 16) begin
        sp <= sp + 1'b1;
    end
    else if(!push && pop && sp != 0) begin
        sp <= sp - 1'b1;
    end
end

genvar i;
generate
for(i = 0 ; i < 16 ; i = i + 1) begin:RAS
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            r_stack[i] <= 31'b0;
        end
        else if(push && pop && sp < 31 && (sp-1 == i)) begin
            r_stack[i] <= din;
        end
        else if(push && !pop && sp < 31 && (sp == i)) begin
            r_stack[i] <= din;
        end
    end
end
endgenerate

always @(*) begin
    if(pop && sp != 0) begin
        dout = r_stack[sp-1];
    end
    else begin
        dout = 63'b0;
    end
end

always @(*) begin
    if(sp == 0) begin
        empty = 1;
    end
    else begin
        empty = 0;
    end
end

endmodule

