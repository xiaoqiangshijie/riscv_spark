module lsu(

    //addr and inst
    input [31:0] lsu_pc,
    input [31:0] lsu_inst,

    //wb signal
    input [31:0] lsu_reg_wdata,     
    input        lsu_wr_reg_en,                  
    input [4:0]  lsu_wr_reg_addr,

    //req mem
    input        lsu_wr_mem_en,
    input [31:0] lsu_mem_addr,
    input [1:0]  lsu_wr_addr_index,
    input [1:0]  lsu_rd_addr_index,
    input [31:0] lsu_wr_mem_data,

    //rd mem data
    input [31:0] mem_lsu_rd_data,

    output reg [31:0] lsu_reg_wdata_o,     
    output reg        lsu_wr_reg_en_o,                  
    output reg [4:0]  lsu_wr_reg_addr_o,
    output reg [31:0] lsu_pc_o,
    output reg [31:0] lsu_inst_o,

    //to mem
    output reg        wr_mem_en,
    output reg [31:0] mem_addr,
    output reg [3:0]  mem_sel,
    output reg [31:0] wr_mem_data,
    output reg        wr_mem_ce

);

wire[6:0] opcode = lsu_inst[6:0];
wire[2:0] funct3 = lsu_inst[14:12];
wire[6:0] funct7 = lsu_inst[31:25];
wire[4:0] rd     = lsu_inst[11:7];
wire[4:0] rs1    = lsu_inst[19:15];
wire[4:0] rs2    = lsu_inst[24:20];

// L type inst
parameter INST_TYPE_L   = 7'b0000011;
parameter INST_LB       = 3'b000;
parameter INST_LH       = 3'b001;
parameter INST_LW       = 3'b010;
parameter INST_LBU      = 3'b100;
parameter INST_LHU      = 3'b101;

// S type inst
parameter INST_TYPE_S   = 7'b0100011;
parameter INST_SB       = 3'b000;
parameter INST_SH       = 3'b001;
parameter INST_SW       = 3'b010;



always @ (*) begin
    lsu_reg_wdata_o   = lsu_reg_wdata;     
    lsu_wr_reg_en_o   = lsu_wr_reg_en;               
    lsu_wr_reg_addr_o = lsu_wr_reg_addr;
    lsu_pc_o          = lsu_pc;
    lsu_inst_o        = lsu_inst;

    wr_mem_ce         = 1'b0;
    wr_mem_en         = 1'b0;
    mem_addr          = 32'b0;
    mem_sel           = 4'b0000;
    wr_mem_data       = 32'b0;
    case (opcode)
        INST_TYPE_S: begin
            case (funct3)
                INST_SB: begin
                    wr_mem_ce   = 1'b1;
                    wr_mem_en   = 1'b1;
                    mem_addr    = lsu_mem_addr;
                    wr_mem_data = {lsu_wr_mem_data[7:0],lsu_wr_mem_data[7:0],lsu_wr_mem_data[7:0],lsu_wr_mem_data[7:0]};
                    case (lsu_wr_addr_index)
                        2'b00: begin
                            mem_sel = 4'b0001;
                        end
                        2'b01: begin
                            mem_sel = 4'b0010;
                        end
                        2'b10: begin
                            mem_sel = 4'b0100;
                        end
                        2'b11: begin
                            mem_sel = 4'b1000;
                        end
                        default:begin
                            mem_sel = 4'b0000;
                        end
                    endcase
                end
                INST_SH: begin
                    wr_mem_ce   = 1'b1;
                    wr_mem_en   = 1'b1;
                    mem_addr    = lsu_mem_addr;
                    wr_mem_data = {lsu_wr_mem_data[7:0],lsu_wr_mem_data[7:0],lsu_wr_mem_data[7:0],lsu_wr_mem_data[7:0]};
                    case (lsu_wr_addr_index)
                        2'b00: begin
                            mem_sel = 4'b0011;
                        end
                        2'b10: begin
                            mem_sel = 4'b1100;
                        end
                        default:begin
                            mem_sel = 4'b0000;
                        end
                    endcase
                end
                INST_SW: begin
                    wr_mem_ce   = 1'b1;
                    wr_mem_en   = 1'b1;
                    mem_addr    = lsu_mem_addr;
                    wr_mem_data = lsu_wr_mem_data;
                    mem_sel     = 4'b1111;
                end
                default: begin
                    wr_mem_ce   = 1'b0;
                    wr_mem_en   = 1'b0;
                    mem_addr    = 32'b0;
                    wr_mem_data = 32'b0;
                    mem_sel     = 4'b0000;
                end
            endcase
        end
        INST_TYPE_L: begin
            case (funct3)
                INST_LB: begin
                    wr_mem_ce   = 1'b1;
                    wr_mem_en   = 1'b0;
                    mem_addr    = lsu_mem_addr;
                    case (lsu_rd_addr_index)
                        2'b00: begin
                            lsu_reg_wdata_o = {{24{mem_lsu_rd_data[7]}}, mem_lsu_rd_data[7:0]};
                            mem_sel         = 4'b0001;
                        end
                        2'b01: begin
                            lsu_reg_wdata_o = {{24{mem_lsu_rd_data[15]}}, mem_lsu_rd_data[15:8]};
                            mem_sel         = 4'b0010;
                        end
                        2'b10: begin
                            lsu_reg_wdata_o = {{24{mem_lsu_rd_data[23]}}, mem_lsu_rd_data[23:16]};
                            mem_sel         = 4'b0100;
                        end
                        2'b11: begin
                            lsu_reg_wdata_o = {{24{mem_lsu_rd_data[31]}}, mem_lsu_rd_data[31:24]};
                            mem_sel         = 4'b1000;
                        end
                        default:begin
                            lsu_reg_wdata_o = 32'b0;
                            mem_sel   = 4'b0000;
                        end
                    endcase
                end
                INST_LH: begin
                    wr_mem_ce   = 1'b1;
                    wr_mem_en   = 1'b0;
                    mem_addr    = lsu_mem_addr;
                    case (lsu_rd_addr_index)
                        2'b00: begin
                            lsu_reg_wdata_o = {{16{mem_lsu_rd_data[15]}}, mem_lsu_rd_data[15:0]};
                            mem_sel         = 4'b0011;
                        end
                        2'b10: begin
                            lsu_reg_wdata_o = {{16{mem_lsu_rd_data[31]}}, mem_lsu_rd_data[31:16]};
                            mem_sel         = 4'b1100;
                        end
                        default:begin
                            lsu_reg_wdata_o = 32'b0;
                            mem_sel   = 4'b0000;
                        end
                    endcase
                end
                INST_LW: begin
                    wr_mem_ce        = 1'b1;
                    wr_mem_en        = 1'b0;
                    mem_addr         = lsu_mem_addr;
                    lsu_reg_wdata_o  = mem_lsu_rd_data;
                    mem_sel          = 4'b1111;
                end
                INST_LBU: begin
                    wr_mem_ce   = 1'b1;
                    wr_mem_en   = 1'b0;
                    mem_addr    = lsu_mem_addr;
                    case (lsu_rd_addr_index)
                        2'b00: begin
                            lsu_reg_wdata_o = {24'b0, mem_lsu_rd_data[7:0]};
                            mem_sel         = 4'b0001;
                        end
                        2'b01: begin
                            lsu_reg_wdata_o = {24'b0, mem_lsu_rd_data[15:8]};
                            mem_sel         = 4'b0010;
                        end
                        2'b10: begin
                            lsu_reg_wdata_o = {24'b0, mem_lsu_rd_data[23:16]};
                            mem_sel         = 4'b0100;
                        end
                        2'b11: begin
                            lsu_reg_wdata_o = {24'b0, mem_lsu_rd_data[31:24]};
                            mem_sel         = 4'b1000;
                        end
                        default:begin
                            lsu_reg_wdata_o = 32'b0;
                            mem_sel   = 4'b0000;
                        end
                    endcase
                end
                INST_LHU: begin
                    wr_mem_ce   = 1'b1;
                    wr_mem_en   = 1'b0;
                    mem_addr    = lsu_mem_addr;
                    case (lsu_rd_addr_index)
                        2'b00: begin
                            lsu_reg_wdata_o = {16'b0, mem_lsu_rd_data[15:0]};
                            mem_sel         = 4'b0011;
                        end
                        2'b10: begin
                            lsu_reg_wdata_o = {16'b0, mem_lsu_rd_data[31:16]};
                            mem_sel         = 4'b1100;
                        end
                        default:begin
                            lsu_reg_wdata_o = 32'b0;
                            mem_sel   = 4'b0000;
                        end
                    endcase
                end
                default: begin
                    wr_mem_ce       = 1'b0;
                    wr_mem_en       = 1'b0;
                    mem_addr        = 32'b0;
                    lsu_reg_wdata_o = 32'b0;
                    mem_sel         = 4'b0000;
                    wr_mem_data     = 32'b0;
                end
            endcase
        end
    endcase
end

endmodule