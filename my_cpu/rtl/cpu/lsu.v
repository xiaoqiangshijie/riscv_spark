module lsu(

    input [31:0] lsu_reg_wdata,     
    input        lsu_wr_reg_en,                  
    input [4:0]  lsu_wr_reg_addr,
    input [31:0] lsu_pc,
    input [31:0] lsu_inst,

    output reg [31:0] lsu_reg_wdata_o,     
    output reg        lsu_wr_reg_en_o,                  
    output reg [4:0]  lsu_wr_reg_addr_o,
    output reg [31:0] lsu_pc_o,
    output reg [31:0] lsu_inst_o

);

always @(*) begin

    lsu_reg_wdata_o   = lsu_reg_wdata;     
    lsu_wr_reg_en_o   = lsu_wr_reg_en;               
    lsu_wr_reg_addr_o = lsu_wr_reg_addr;
    lsu_pc_o          = lsu_pc;
    lsu_inst_o        = lsu_inst;

end

endmodule