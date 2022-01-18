module core(

    input clk,
    input rst_n,

    input  [31:0] inst_i,
    
    output [31:0] rom_addr_o,
    output        rom_en_o
);

//ifu -> rom
wire pc_stall;

//ifu -> ifu_de
wire [31:0] pc;
wire [31:0] inst_o;

//ifu_de -> de
wire [31:0] de_pc;
wire [31:0] de_inst;

//de -> regs
wire [4:0]  rd_addr1;  
wire [4:0]  rd_addr2;

//regs -> de
wire [31:0] rd_data1;
wire [31:0] rd_data2;

//de   ->  de_alu
wire [31:0] op1;
wire [31:0] op2;
wire        wr_reg_en;
wire [4:0]  wr_reg_addr;
wire [31:0] de_pc_o;
wire [31:0] de_inst_o;
wire [2:0]  inst_type;
wire        or_flag;

//de_alu -> alu

wire [31:0] alu_op1;
wire [31:0] alu_op2;
wire        alu_wr_reg_en;
wire [4:0]  alu_wr_reg_addr;
wire [31:0] alu_pc;
wire [31:0] alu_inst;
wire [2:0]  alu_inst_type;
wire        alu_or_flag;

//alu -> alu_lsu
wire [31:0] reg_wdata_o;
wire        alu_wr_reg_en_o;                  
wire [4:0]  alu_wr_reg_addr_o;
wire [31:0] alu_pc_o;
wire [31:0] alu_inst_o;

//alu_lsu -> lsu
wire [31:0] lsu_reg_wdata;   
wire        lsu_wr_reg_en;                  
wire [4:0]  lsu_wr_reg_addr;
wire [31:0] lsu_pc;
wire [31:0] lsu_inst;

//lsu -> lsu_wb
wire [31:0] lsu_reg_wdata_o;   
wire        lsu_wr_reg_en_o;                  
wire [4:0]  lsu_wr_reg_addr_o;
wire [31:0] lsu_pc_o;
wire [31:0] lsu_inst_o;

//lsu_wb -> wb
wire [31:0] wb_reg_wdata;
wire        wb_wr_reg_en;                  
wire [4:0]  wb_wr_reg_addr;
wire [31:0] wb_pc;
wire [31:0] wb_inst;

//wb -> regs

wire        wr_en;
wire [4:0]  wr_addr;
wire [31:0] wr_data;


assign rom_addr_o = pc;
assign rom_en_o   = ~pc_stall;

ifu u1_ifu(
    .clk(clk),
    .rst_n(rst_n),
    .inst_i(inst_i),

    .pc(pc),
    .inst_o(inst_o),
    .pc_stall(pc_stall)
);

ifu_de u1_ifu_de(
    .clk(clk),
    .rst_n(rst_n),
    .inst_o(inst_o),
    .pc(pc),

    .de_pc(de_pc),
    .de_inst(de_inst)
);

de u2_de(

    //from ifu_de
    .de_pc(de_pc),
    .de_inst(de_inst),

    //from regs
    .rd_data1(rd_data1),
    .rd_data2(rd_data2),

    //to regs
    .rd_addr1(rd_addr1),
    .rd_addr2(rd_addr2),

    //to de_alu inst type
    .inst_type(inst_type),
    .or_flag(or_flag),

    //to de_alu
    .op1(op1),
    .op2(op2),
    .wr_reg_en(wr_reg_en),
    .wr_reg_addr(wr_reg_addr),

    .de_pc_o(de_pc_o),
    .de_inst_o(de_inst_o)
);

de_alu u2_de_alu(

    .clk(clk),
    .rst_n(rst_n),

    .op1(op1),
    .op2(op2),
    .wr_reg_en(wr_reg_en),
    .wr_reg_addr(wr_reg_addr),

    .de_pc_o(de_pc_o),
    .de_inst_o(de_inst_o),

    .inst_type(inst_type),
    .or_flag(or_flag),

    .alu_op1(alu_op1),
    .alu_op2(alu_op2),
    .alu_wr_reg_en(alu_wr_reg_en),
    .alu_wr_reg_addr(alu_wr_reg_addr),

    .alu_pc(alu_pc),
    .alu_inst(alu_inst),

    .alu_inst_type(alu_inst_type),
    .alu_or_flag(alu_or_flag)
);

alu u3_alu(

    //from de_alu
    .alu_op1(alu_op1),
    .alu_op2(alu_op2),
    .alu_wr_reg_en(alu_wr_reg_en),
    .alu_wr_reg_addr(alu_wr_reg_addr),

    .alu_pc(alu_pc),
    .alu_inst(alu_inst),

    .alu_inst_type(alu_inst_type),
    .alu_or_flag(alu_or_flag),

    //alu to alu_mem
    .reg_wdata_o(reg_wdata_o),     
    .alu_wr_reg_en_o(alu_wr_reg_en_o),                  
    .alu_wr_reg_addr_o(alu_wr_reg_addr_o),
    .alu_pc_o(alu_pc_o),
    .alu_inst_o(alu_inst_o)
);

alu_lsu u3_alu_lsu(
    
    .clk(clk),
    .rst_n(rst_n),
    .reg_wdata_o(reg_wdata_o),     
    .alu_wr_reg_en_o(alu_wr_reg_en_o),                  
    .alu_wr_reg_addr_o(alu_wr_reg_addr_o),
    .alu_pc_o(alu_pc_o),
    .alu_inst_o(alu_inst_o),

    .lsu_reg_wdata(lsu_reg_wdata),     
    .lsu_wr_reg_en(lsu_wr_reg_en),                  
    .lsu_wr_reg_addr(lsu_wr_reg_addr),
    .lsu_pc(lsu_pc),
    .lsu_inst(lsu_inst)
    
);

lsu u4_lsu(

    .lsu_reg_wdata(lsu_reg_wdata),     
    .lsu_wr_reg_en(lsu_wr_reg_en),                  
    .lsu_wr_reg_addr(lsu_wr_reg_addr),
    .lsu_pc(lsu_pc),
    .lsu_inst(lsu_inst),

    .lsu_reg_wdata_o(lsu_reg_wdata_o),     
    .lsu_wr_reg_en_o(lsu_wr_reg_en_o),                  
    .lsu_wr_reg_addr_o(lsu_wr_reg_addr_o),
    .lsu_pc_o(lsu_pc_o),
    .lsu_inst_o(lsu_inst_o)

);

lsu_wb u4_lsu_wb(

    .clk(clk),
    .rst_n(rst_n),

    .lsu_reg_wdata_o(lsu_reg_wdata_o),     
    .lsu_wr_reg_en_o(lsu_wr_reg_en_o),                  
    .lsu_wr_reg_addr_o(lsu_wr_reg_addr_o),
    .lsu_pc_o(lsu_pc_o),
    .lsu_inst_o(lsu_inst_o),

    .wb_reg_wdata(wb_reg_wdata),     
    .wb_wr_reg_en(wb_wr_reg_en),                  
    .wb_wr_reg_addr(wb_wr_reg_addr),
    .wb_pc(wb_pc),
    .wb_inst(wb_inst)
);

wb u5_wb(

    .wb_reg_wdata(wb_reg_wdata),     
    .wb_wr_reg_en(wb_wr_reg_en),                  
    .wb_wr_reg_addr(wb_wr_reg_addr),
    .wb_pc(wb_pc),
    .wb_inst(wb_inst),

    .wr_en(wr_en),
    .wr_addr(wr_addr),
    .wr_data(wr_data)

);

regs u0_regs(

    .clk(clk),
    .rst_n(rst_n),

    //from wb
    .wr_en(wr_en),
    .wr_addr(wr_addr),
    .wr_data(wr_data),

    //from de
    .rd_addr1(rd_addr1),
    .rd_addr2(rd_addr2),

    //to   de
    .rd_data1(rd_data1),
    .rd_data2(rd_data2)
);



endmodule