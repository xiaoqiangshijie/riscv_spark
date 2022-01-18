module lsu_wb(

    input        clk,
    input        rst_n,

    input [31:0] lsu_reg_wdata_o,     
    input        lsu_wr_reg_en_o,                  
    input [4:0]  lsu_wr_reg_addr_o,
    input [31:0] lsu_pc_o,
    input [31:0] lsu_inst_o,

    output reg [31:0] wb_reg_wdata,     
    output reg        wb_wr_reg_en,                  
    output reg [4:0]  wb_wr_reg_addr,
    output reg [31:0] wb_pc,
    output reg [31:0] wb_inst
);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        wb_reg_wdata   <= 32'b0;    
        wb_wr_reg_en   <= 1'b0;              
        wb_wr_reg_addr <= 5'b0;
        wb_pc          <= 32'b0;
        wb_inst        <= 32'b0;
    end
    else begin
        wb_reg_wdata   <= lsu_reg_wdata_o;    
        wb_wr_reg_en   <= lsu_wr_reg_en_o;              
        wb_wr_reg_addr <= lsu_wr_reg_addr_o;
        wb_pc          <= lsu_pc_o;
        wb_inst        <= lsu_inst_o;
    end
end

endmodule