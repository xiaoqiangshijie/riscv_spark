module bpu (
    input         clk,
    input         rstn,
    input         ifu_bpu_pc_valid,
    input [63:0]  ifu_bpu_pc,
    input         ifu_bpu_hit_vld,
    input         alu_bpu_wr_req,
    input [63:0]  alu_bpu_wr_pc,
    input [2:0]   alu_bpu_wr_type,
    input [63:0]  alu_bpu_wr_predict_pc,
    input         alu_bpu_wr_predict_taken,
    input         alu_bpu_jump_en,

    output [63:0] bpu_ifu_next_pc,
    output        bpu_ifu_predict_hit,
    output [63:0] bpu_ifu_predict_pc,
    output        bpu_ifu_predict_taken

);

    wire [63:0] rd_pc_1d_add4;
    wire [2:0]  rd_type;
    wire        rd_hit;
    wire [63:0] rd_predict_pc;
    wire        rd_predict_taken;

    btb u_btb(
        .clk(clk),
        .rstn(rstn),
        .rd_pc(ifu_bpu_pc),
        .rd_vld(ifu_bpu_pc_valid),
        .hit_vld(ifu_bpu_hit_vld),
        .wr_req(alu_bpu_wr_req),
        .wr_pc(alu_bpu_wr_pc),
        .wr_type(alu_bpu_wr_type),
        .wr_predict_pc(alu_bpu_wr_predict_pc),
        .wr_taken(alu_bpu_wr_predict_taken),
        .flush(alu_bpu_jump_en),

        .rd_pc_1d_add4(rd_pc_1d_add4),
        .rd_type(rd_type),
        .rd_hit(rd_hit),
        .rd_predict_pc(rd_predict_pc),
        .rd_predict_taken(rd_predict_taken)
    );

    npc_generate u_npc_generate(
        .clk(clk),
        .rstn(rstn),
        .rd_pc_1d_add4(rd_pc_1d_add4),
        .rd_type(rd_type),
        .rd_hit(rd_hit),
        .rd_predict_pc(rd_predict_pc),
        .rd_predict_taken(rd_predict_taken),

        .next_pc(bpu_ifu_next_pc),
        .predict_taken(bpu_ifu_predict_taken),
        .hit(bpu_ifu_predict_hit),
        .predict_pc(bpu_ifu_predict_pc)
    );

endmodule
