module npc_generate(
    input        clk,
    input        rstn,
    input [63:0] rd_pc_1d_add4,
    input [2:0]  rd_type,
    input        rd_hit,
    input [63:0] rd_predict_pc,
    input        rd_predict_taken,

    output reg [63:0] next_pc,
    output            predict_taken,
    output            hit,
    output     [63:0] predict_pc
);

localparam B_CON     = 3'b001;
localparam JAL       = 3'b010;
localparam JALR      = 3'b011;
localparam CALL      = 3'b100;
localparam RET       = 3'b101;
localparam CALL_RET  = 3'b110;

wire pop;
wire push;
wire [63:0] dout;              //tbd ras_out
wire empty;

ras ras0(
    .clk(clk),
    .rstn(rstn),
    .pop(pop),
    .push(push),
    .din(rd_pc_1d_add4),
    .dout(dout),
    .empty(empty)
);

//rd_type  001:B 010:jal 011:jalr 100:call 101:ret 110:call+ret     
always @(*) begin
    if(rd_hit) begin
        case(rd_type)
            B_CON:  begin
                if(rd_predict_taken) begin
                    next_pc = rd_predict_pc;
                end    
                else begin
                    next_pc = rd_pc_1d_add4;                       // tbd zai btb module +4 rd_pc_4add
                end
            end
            JAL,JALR,CALL : begin
                next_pc = rd_predict_pc;
            end
            RET,CALL_RET:begin
                if(empty) begin
                    next_pc = rd_predict_pc;
                end
                else begin
                    next_pc = dout;
                end
            end
            default: next_pc = rd_pc_1d_add4;
        endcase
    end
    else begin
        next_pc = rd_pc_1d_add4;
    end
end

assign pop  = rd_hit? ((rd_type ==  RET)  ||  (rd_type == CALL_RET)) : 0 ;
assign push = rd_hit? ((rd_type ==  CALL) ||  (rd_type == CALL_RET)) : 0 ;

//Jump signal yes or not along with pc
assign predict_taken = rd_predict_taken;

//hit signal along with pc
assign hit = rd_hit;

//predict pc signal yes or not along with pc
assign predict_pc = rd_predict_pc;

endmodule
