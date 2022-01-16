module alu_lsu(

    input [31:0] reg_wdata_o,     
    input        alu_rd_reg_en_o,                  
    input [4:0]  alu_rd_reg_addr_o,
    input [31:0] alu_pc_o,
    input [31:0] alu_inst_o,

    output reg [31:0] lsu_reg_wdata,     
    output reg        lsu_rd_reg_en,                  
    output reg [4:0]  lsu_rd_reg_addr,
    output reg [31:0] lsu_pc,
    output reg [31:0] lsu_inst
    
);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        lsu_reg_wdata    <= 32'b0;    
        lsu_rd_reg_en    <= 1'b0;              
        lsu_rd_reg_addr  <= 32'b0;
        lsu_pc           <= 32'b0;
        lsu_inst         <= 32'b0;
    end
    else begin
        lsu_reg_wdata    <= reg_wdata_o;    
        lsu_rd_reg_en    <= alu_rd_reg_en_o;              
        lsu_rd_reg_addr  <= alu_rd_reg_addr_o;
        lsu_pc           <= alu_pc_o;
        lsu_inst         <= alu_inst_o;
    end
end

endmodule