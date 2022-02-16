module alu_lsu(

    input clk,
    input rst_n,

    input [31:0] reg_wdata_o,     
    input        alu_wr_reg_en_o,                  
    input [4:0]  alu_wr_reg_addr_o,

    input            alu_wr_mem_en_o,
    input     [31:0] alu_mem_addr_o,
    input     [1:0]  alu_wr_addr_index_o,
    input     [1:0]  alu_rd_addr_index_o,
    input     [31:0] alu_wr_mem_data_o,

    input [31:0] alu_pc_o,
    input [31:0] alu_inst_o,
    input [5:0]  stall,

    output reg        lsu_wr_mem_en,
    output reg [31:0] lsu_mem_addr,
    output reg [1:0]  lsu_wr_addr_index,
    output reg [1:0]  lsu_rd_addr_index,
    output reg [31:0] lsu_wr_mem_data,

    output reg [31:0] lsu_reg_wdata,     
    output reg        lsu_wr_reg_en,                  
    output reg [4:0]  lsu_wr_reg_addr,
    output reg [31:0] lsu_pc,
    output reg [31:0] lsu_inst
    
);

always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
        lsu_reg_wdata     <= 32'b0;    
        lsu_wr_reg_en     <= 1'b0;              
        lsu_wr_reg_addr   <= 32'b0;
        lsu_pc            <= 32'b0;
        lsu_inst          <= 32'b0;
        lsu_wr_mem_en     <= 1'b0;
        lsu_mem_addr      <= 32'b0;
        lsu_wr_addr_index <= 2'b0;
        lsu_rd_addr_index <= 2'b0;
        lsu_wr_mem_data   <= 32'b0;
    end
    else if(stall[3] == 1'b1 && stall[4] == 1'b0) begin
        lsu_reg_wdata     <= 32'b0;    
        lsu_wr_reg_en     <= 1'b0;              
        lsu_wr_reg_addr   <= 32'b0;
        lsu_pc            <= 32'b0;
        lsu_inst          <= 32'b0;
        lsu_wr_mem_en     <= 1'b0;
        lsu_mem_addr      <= 32'b0;
        lsu_wr_addr_index <= 2'b0;
        lsu_rd_addr_index <= 2'b0;
        lsu_wr_mem_data   <= 32'b0;
    end
    else if(stall[3] == 1'b0) begin
        lsu_reg_wdata     <= reg_wdata_o;    
        lsu_wr_reg_en     <= alu_wr_reg_en_o;              
        lsu_wr_reg_addr   <= alu_wr_reg_addr_o;
        lsu_pc            <= alu_pc_o;
        lsu_inst          <= alu_inst_o;
        lsu_wr_mem_en     <= alu_wr_mem_en_o;
        lsu_mem_addr      <= alu_mem_addr_o;
        lsu_wr_addr_index <= alu_wr_addr_index_o;
        lsu_rd_addr_index <= alu_rd_addr_index_o;
        lsu_wr_mem_data   <= alu_wr_mem_data_o;
    end
end

endmodule