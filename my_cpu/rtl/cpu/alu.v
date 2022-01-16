module alu(

    //from de_alu
    input [31:0] alu_op1,
    input [31:0] alu_op2,
    input        alu_rd_reg_en,
    input [4:0]  alu_rd_reg_addr,

    input [31:0] alu_pc,
    input [31:0] alu_inst,

    input [2:0]  alu_inst_type,
    input        alu_or_flag,

    //alu to alu_mem
    output reg [31:0] reg_wdata_o,     
    output            alu_rd_reg_en_o,                  
    output     [4:0]  alu_rd_reg_addr_o,
    output     [31:0] alu_pc_o,
    output     [31:0] alu_inst_o
);

always @ (*) begin

    alu_rd_reg_en_o   = alu_rd_reg_en;
    alu_rd_reg_addr_o = alu_rd_reg_addr;
    alu_pc_o          = alu_pc;
    alu_inst_o        = alu_inst;
    
    case (opcode)
        `INST_TYPE_I: begin
            case (funct3)
                `INST_ORI: begin
                    reg_wdata_o = alu_op1 | alu_op2;
                end
            endcase
        end
    endcase
end

endmodule