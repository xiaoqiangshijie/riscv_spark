module wb(

    input [31:0] wb_reg_wdata,     
    input        wb_wr_reg_en,                  
    input [4:0]  wb_wr_reg_addr,
    input [31:0] wb_pc,
    input [31:0] wb_inst,

    output reg        wr_en,
    output reg [4:0]  wr_addr,
    output reg [31:0] wr_data

);

always @(*) begin
    wr_en   =  wb_wr_reg_en;
    wr_addr =  wb_wr_reg_addr;
    wr_data =  wb_reg_wdata;
end

endmodule