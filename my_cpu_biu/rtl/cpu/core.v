module core(

    input clk,
    input rst_n,

    // slave 0 interface            //rom
    output s0_we,        
    output [31:0] s0_addr,    
    output [3:0]  s0_addr_sel,
    output [31:0] s0_wdata,      
    input  [31:0] s0_rdata,

    // slave 1 interface            //ram
    output s1_we,        
    output [31:0] s1_addr,    
    output [3:0]  s1_addr_sel,
    output [31:0] s1_wdata,      
    input  [31:0] s1_rdata
);

//core -> biu
wire        ram_ce;
wire        ram_wr_en;
wire [31:0] ram_addr;
wire [3:0]  ram_addr_sel;
wire [31:0] ram_wr_data;
wire [31:0] ram_data_in;

wire [31:0] pc;
wire [31:0] inst_i;

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
wire [31:0] rd_data1_o;
wire [31:0] rd_data2_o;
wire [31:0] op1_jump;
wire [31:0] op2_jump;
wire        wr_reg_en;
wire [4:0]  wr_reg_addr;
wire [31:0] de_pc_o;
wire [31:0] de_inst_o;
wire [2:0]  inst_type;
wire        or_flag;

//de   ->    ctrl
wire        de_stall;

//biu  ->    biu
wire        biu_hold_flag;

//de_alu -> alu

wire [31:0] alu_op1;
wire [31:0] alu_op2;
wire [31:0] alu_reg1_data;
wire [31:0] alu_reg2_data;

wire [31:0] alu_op1_jump;
wire [31:0] alu_op2_jump;
wire        alu_wr_reg_en;
wire [4:0]  alu_wr_reg_addr;
wire [31:0] alu_pc;
wire [31:0] alu_inst;
wire [2:0]  alu_inst_type;
wire        alu_or_flag;

//alu -> de
wire alu_load_flag;

//alu -> alu_lsu
wire [31:0] reg_wdata_o;
wire        alu_wr_reg_en_o;                  
wire [4:0]  alu_wr_reg_addr_o;
wire [31:0] alu_pc_o;
wire [31:0] alu_inst_o;

wire        alu_wr_mem_en_o;
wire [31:0] alu_mem_addr_o;
wire [1:0]  alu_wr_addr_index_o;
wire [1:0]  alu_rd_addr_index_o;
wire [31:0] alu_wr_mem_data_o;

//alu -> ctrl
wire          jump_flag;
wire [31:0]   jump_addr;

//alu_lsu -> lsu
wire [31:0] lsu_reg_wdata;   
wire        lsu_wr_reg_en;                  
wire [4:0]  lsu_wr_reg_addr;
wire [31:0] lsu_pc;
wire [31:0] lsu_inst;

wire        lsu_wr_mem_en;
wire [31:0] lsu_mem_addr;
wire [1:0]  lsu_wr_addr_index;
wire [1:0]  lsu_rd_addr_index;
wire [31:0] lsu_wr_mem_data;


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

//crtl -> ifu ifu_de de_alu 
wire [5:0]  stall;
wire        ctrl_jump_flag;
wire [31:0] ctrl_jump_addr;


assign rom_en_o   = ~pc_stall;

ctrl u_ctrl(
    .rst_n(rst_n),
    .de_stall(de_stall),
    .jump_flag(jump_flag),
    .biu_hold_flag(biu_hold_flag),
    .jump_addr(jump_addr),

    .stall(stall),
    .ctrl_jump_flag(ctrl_jump_flag),
    .ctrl_jump_addr(ctrl_jump_addr)
);

ifu u1_ifu(
    .clk(clk),
    .rst_n(rst_n),
    .inst_i(inst_i),
    .stall(stall),
    .ctrl_jump_flag(ctrl_jump_flag),
    .ctrl_jump_addr(ctrl_jump_addr),

    .pc(pc),
    .inst_o(inst_o),
    .pc_stall(pc_stall)
);

ifu_de u1_ifu_de(
    .clk(clk),
    .rst_n(rst_n),
    .inst_o(inst_o),
    .pc(pc),
    .stall(stall),

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

    //from bypass_alu
    .alu_load_flag(alu_load_flag),

    .reg_wdata_o(reg_wdata_o),     
    .alu_wr_reg_en_o(alu_wr_reg_en_o),                  
    .alu_wr_reg_addr_o(alu_wr_reg_addr_o),

    //from bypass_lsu
    .lsu_reg_wdata_o(lsu_reg_wdata_o),     
    .lsu_wr_reg_en_o(lsu_wr_reg_en_o),                  
    .lsu_wr_reg_addr_o(lsu_wr_reg_addr_o),

    //to regs
    .rd_addr1(rd_addr1),
    .rd_addr2(rd_addr2),

    //to de_alu inst type
    .inst_type(inst_type),
    .or_flag(or_flag),

    //to de_alu
    .op1(op1),
    .op2(op2),
    .rd_data1_o(rd_data1_o),
    .rd_data2_o(rd_data2_o),
    .op1_jump(op1_jump),
    .op2_jump(op2_jump),
    .wr_reg_en(wr_reg_en),
    .wr_reg_addr(wr_reg_addr),

    .de_pc_o(de_pc_o),
    .de_inst_o(de_inst_o),

    .de_stall(de_stall)
);

de_alu u2_de_alu(

    .clk(clk),
    .rst_n(rst_n),

    .op1(op1),
    .op2(op2),
    .rd_data1_o(rd_data1_o),
    .rd_data2_o(rd_data2_o),
    .op1_jump(op1_jump),
    .op2_jump(op2_jump),
    .wr_reg_en(wr_reg_en),
    .wr_reg_addr(wr_reg_addr),

    .de_pc_o(de_pc_o),
    .de_inst_o(de_inst_o),

    .inst_type(inst_type),
    .or_flag(or_flag),
    .stall(stall),

    .alu_op1(alu_op1),
    .alu_op2(alu_op2),
    .alu_reg1_data(alu_reg1_data),
    .alu_reg2_data(alu_reg2_data),
    .alu_op1_jump(alu_op1_jump),
    .alu_op2_jump(alu_op2_jump),
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
    .alu_reg1_data(alu_reg1_data),
    .alu_reg2_data(alu_reg2_data),
    .alu_op1_jump(alu_op1_jump),
    .alu_op2_jump(alu_op2_jump),
    .alu_wr_reg_en(alu_wr_reg_en),
    .alu_wr_reg_addr(alu_wr_reg_addr),

    .alu_pc(alu_pc),
    .alu_inst(alu_inst),

    .alu_inst_type(alu_inst_type),
    .alu_or_flag(alu_or_flag),

    //alu to de
    .alu_load_flag(alu_load_flag),

    //alu to alu_ctrl
    .jump_flag(jump_flag),
    .jump_addr(jump_addr),

    //alu to alu_mem
    .reg_wdata_o(reg_wdata_o),     
    .alu_wr_reg_en_o(alu_wr_reg_en_o),                  
    .alu_wr_reg_addr_o(alu_wr_reg_addr_o),
    .alu_pc_o(alu_pc_o),
    .alu_inst_o(alu_inst_o),

    .alu_wr_mem_en_o(alu_wr_mem_en_o),
    .alu_mem_addr_o(alu_mem_addr_o),
    .alu_wr_addr_index_o(alu_wr_addr_index_o),
    .alu_rd_addr_index_o(alu_rd_addr_index_o),
    .alu_wr_mem_data_o(alu_wr_mem_data_o)

);

alu_lsu u3_alu_lsu(
    
    .clk(clk),
    .rst_n(rst_n),
    .reg_wdata_o(reg_wdata_o),     
    .alu_wr_reg_en_o(alu_wr_reg_en_o),                  
    .alu_wr_reg_addr_o(alu_wr_reg_addr_o),
    // pc and inst
    .alu_pc_o(alu_pc_o),
    .alu_inst_o(alu_inst_o),
    // alu to mem
    .alu_wr_mem_en_o(alu_wr_mem_en_o),
    .alu_mem_addr_o(alu_mem_addr_o),
    .alu_wr_addr_index_o(alu_wr_addr_index_o),
    .alu_rd_addr_index_o(alu_rd_addr_index_o),
    .alu_wr_mem_data_o(alu_wr_mem_data_o),

    .stall(stall),

    .lsu_reg_wdata(lsu_reg_wdata),     
    .lsu_wr_reg_en(lsu_wr_reg_en),                  
    .lsu_wr_reg_addr(lsu_wr_reg_addr),
    .lsu_pc(lsu_pc),
    .lsu_inst(lsu_inst),

    //req mem signal
    .lsu_wr_mem_en(lsu_wr_mem_en),
    .lsu_mem_addr(lsu_mem_addr),
    .lsu_wr_addr_index(lsu_wr_addr_index),
    .lsu_rd_addr_index(lsu_rd_addr_index),
    .lsu_wr_mem_data(lsu_wr_mem_data)

    
);

lsu u4_lsu(

    .lsu_reg_wdata(lsu_reg_wdata),     
    .lsu_wr_reg_en(lsu_wr_reg_en),                  
    .lsu_wr_reg_addr(lsu_wr_reg_addr),
    .lsu_pc(lsu_pc),
    .lsu_inst(lsu_inst),
    //ram -> lsu rd data
    .mem_lsu_rd_data(ram_data_in),

    //req mem signal
    .lsu_wr_mem_en(lsu_wr_mem_en),
    .lsu_mem_addr(lsu_mem_addr),
    .lsu_wr_addr_index(lsu_wr_addr_index),
    .lsu_rd_addr_index(lsu_rd_addr_index),
    .lsu_wr_mem_data(lsu_wr_mem_data),


    .lsu_reg_wdata_o(lsu_reg_wdata_o),     
    .lsu_wr_reg_en_o(lsu_wr_reg_en_o),                  
    .lsu_wr_reg_addr_o(lsu_wr_reg_addr_o),
    .lsu_pc_o(lsu_pc_o),
    .lsu_inst_o(lsu_inst_o),

    .wr_mem_en(ram_wr_en),
    .mem_addr(ram_addr),
    .mem_sel(ram_addr_sel),
    .wr_mem_data(ram_wr_data),
    .wr_mem_ce(ram_ce)

);

lsu_wb u4_lsu_wb(

    .clk(clk),
    .rst_n(rst_n),

    .lsu_reg_wdata_o(lsu_reg_wdata_o),     
    .lsu_wr_reg_en_o(lsu_wr_reg_en_o),                  
    .lsu_wr_reg_addr_o(lsu_wr_reg_addr_o),
    .lsu_pc_o(lsu_pc_o),
    .lsu_inst_o(lsu_inst_o),
    .stall(stall),

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

biu u_biu(

    .clk(clk),
    .rst_n(rst_n),

    // master 0 interface            //ex
    .m0_req(ram_ce), 
    .m0_we(ram_wr_en),         
    .m0_addr(ram_addr),      
    .m0_addr_sel(ram_addr_sel),
    .m0_wdata(ram_wr_data),         
    .m0_rdata(ram_data_in),                               

    // master 1 interface            //if
    .m1_req(1'b1), 
    .m1_we(1'b1),         
    .m1_addr(pc),      
    .m1_addr_sel(4'b1111),
    .m1_wdata(32'b0),         
    .m1_rdata(inst_i),

    // slave 0 interface            //rom
    .s0_we(s0_we),         
    .s0_addr(s0_addr),      
    .s0_addr_sel(s0_addr_sel),
    .s0_wdata(s0_wdata),         
    .s0_rdata(s0_rdata),   

    // slave 1 interface            //ram
    .s1_we(s1_we),         
    .s1_addr(s1_addr),      
    .s1_addr_sel(s1_addr_sel),
    .s1_wdata(s1_wdata),         
    .s1_rdata(s1_rdata),

    .biu_hold_flag(biu_hold_flag)                  //to ctrl

);

endmodule