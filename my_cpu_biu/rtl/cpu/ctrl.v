module ctrl(

    input         rst_n,
    //from de
    input         de_stall,
    //from alu
    input         jump_flag,
    input [31:0]  jump_addr,

    output        ctrl_jump_flag,
    output [31:0] ctrl_jump_addr,

    output reg [5:0] stall
);

assign ctrl_jump_flag = jump_flag;
assign ctrl_jump_addr = jump_addr;

always @(*) begin
    if(!rst_n) begin
        stall = 6'b000000;
    end
    else if(jump_flag == 1'b1) begin
        stall = 6'b001111;
    end
    else if(de_stall == 1'b1)begin
        stall = 6'b000111;
    end
    else begin
        stall = 6'b000000;
    end
end

endmodule