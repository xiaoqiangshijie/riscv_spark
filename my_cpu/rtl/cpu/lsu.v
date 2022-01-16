module lsu(

    input [31:0] lsu_reg_wdata,     
    input        lsu_rd_reg_en,                  
    input [4:0]  lsu_rd_reg_addr,
    input [31:0] lsu_pc,
    input [31:0] lsu_inst,

    output [31:0] lsu_reg_wdata_o,     
    output        lsu_rd_reg_en_o,                  
    output [4:0]  lsu_rd_reg_addr_o,
    output [31:0] lsu_pc_o,
    output [31:0] lsu_inst_o

);

always @(*) begin

    lsu_reg_wdata_o   = lsu_reg_wdata;     
    lsu_rd_reg_en_o   = lsu_rd_reg_en;               
    lsu_rd_reg_addr_o = lsu_rd_reg_addr;
    lsu_pc_o          = lsu_pc;
    lsu_inst_o        = lsu_inst;

end

endmodule