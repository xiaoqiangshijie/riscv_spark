// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vtb_top_verilator__Syms.h"


//======================

void Vtb_top_verilator::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addCallback(&Vtb_top_verilator::traceInit, &Vtb_top_verilator::traceFull, &Vtb_top_verilator::traceChg, this);
}
void Vtb_top_verilator::traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->open()
    Vtb_top_verilator* t = (Vtb_top_verilator*)userthis;
    Vtb_top_verilator__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (!Verilated::calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
                        "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vcdp->scopeEscape(' ');
    t->traceInitThis(vlSymsp, vcdp, code);
    vcdp->scopeEscape('.');
}
void Vtb_top_verilator::traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vtb_top_verilator* t = (Vtb_top_verilator*)userthis;
    Vtb_top_verilator__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    t->traceFullThis(vlSymsp, vcdp, code);
}

//======================


void Vtb_top_verilator::traceInitThis(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    if (false && vcdp) {}  // Prevent unused
    vcdp->module(vlSymsp->name());  // Setup signal names
    // Body
    {
        vlTOPp->traceInitThis__1(vlSymsp, vcdp, code);
    }
}

void Vtb_top_verilator::traceFullThis(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    if (false && vcdp) {}  // Prevent unused
    // Body
    {
        vlTOPp->traceFullThis__1(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vtb_top_verilator::traceInitThis__1(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    int c = code;
    if (false && vcdp && c) {}  // Prevent unused
    // Body
    {
        vcdp->declBit(c+278,"clk_i", false,-1);
        vcdp->declBit(c+279,"rst_ni", false,-1);
        vcdp->declBit(c+278,"tb_top_verilator clk_i", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator rst_ni", false,-1);
        vcdp->declBit(c+183,"tb_top_verilator halted", false,-1);
        vcdp->declBus(c+218,"tb_top_verilator x26", false,-1, 31,0);
        vcdp->declBus(c+219,"tb_top_verilator x27", false,-1, 31,0);
        vcdp->declBit(c+91,"tb_top_verilator result_printed", false,-1);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top rst", false,-1);
        vcdp->declBit(c+104,"tb_top_verilator u_soc_top over", false,-1);
        vcdp->declBit(c+105,"tb_top_verilator u_soc_top succ", false,-1);
        vcdp->declBit(c+183,"tb_top_verilator u_soc_top halted_ind", false,-1);
        vcdp->declBit(c+280,"tb_top_verilator u_soc_top jtag_TCK", false,-1);
        vcdp->declBit(c+281,"tb_top_verilator u_soc_top jtag_TMS", false,-1);
        vcdp->declBit(c+282,"tb_top_verilator u_soc_top jtag_TDI", false,-1);
        vcdp->declBit(c+90,"tb_top_verilator u_soc_top jtag_TDO", false,-1);
        vcdp->declBus(c+1,"tb_top_verilator u_soc_top m0_addr_i", false,-1, 31,0);
        vcdp->declBus(c+62,"tb_top_verilator u_soc_top m0_data_i", false,-1, 31,0);
        vcdp->declBus(c+63,"tb_top_verilator u_soc_top m0_data_o", false,-1, 31,0);
        vcdp->declBit(c+2,"tb_top_verilator u_soc_top m0_req_i", false,-1);
        vcdp->declBit(c+3,"tb_top_verilator u_soc_top m0_we_i", false,-1);
        vcdp->declBus(c+106,"tb_top_verilator u_soc_top m1_addr_i", false,-1, 31,0);
        vcdp->declBus(c+283,"tb_top_verilator u_soc_top m1_data_i", false,-1, 31,0);
        vcdp->declBus(c+64,"tb_top_verilator u_soc_top m1_data_o", false,-1, 31,0);
        vcdp->declBit(c+284,"tb_top_verilator u_soc_top m1_req_i", false,-1);
        vcdp->declBit(c+285,"tb_top_verilator u_soc_top m1_we_i", false,-1);
        vcdp->declBus(c+184,"tb_top_verilator u_soc_top m2_addr_i", false,-1, 31,0);
        vcdp->declBus(c+92,"tb_top_verilator u_soc_top m2_data_i", false,-1, 31,0);
        vcdp->declBus(c+286,"tb_top_verilator u_soc_top m2_data_o", false,-1, 31,0);
        vcdp->declBit(c+185,"tb_top_verilator u_soc_top m2_req_i", false,-1);
        vcdp->declBit(c+93,"tb_top_verilator u_soc_top m2_we_i", false,-1);
        vcdp->declBus(c+287,"tb_top_verilator u_soc_top m3_addr_i", false,-1, 31,0);
        vcdp->declBus(c+288,"tb_top_verilator u_soc_top m3_data_i", false,-1, 31,0);
        vcdp->declBus(c+289,"tb_top_verilator u_soc_top m3_data_o", false,-1, 31,0);
        vcdp->declBit(c+290,"tb_top_verilator u_soc_top m3_req_i", false,-1);
        vcdp->declBit(c+291,"tb_top_verilator u_soc_top m3_we_i", false,-1);
        vcdp->declBus(c+4,"tb_top_verilator u_soc_top s0_addr_o", false,-1, 31,0);
        vcdp->declBus(c+65,"tb_top_verilator u_soc_top s0_data_o", false,-1, 31,0);
        vcdp->declBus(c+66,"tb_top_verilator u_soc_top s0_data_i", false,-1, 31,0);
        vcdp->declBit(c+5,"tb_top_verilator u_soc_top s0_we_o", false,-1);
        vcdp->declBus(c+6,"tb_top_verilator u_soc_top s1_addr_o", false,-1, 31,0);
        vcdp->declBus(c+67,"tb_top_verilator u_soc_top s1_data_o", false,-1, 31,0);
        vcdp->declBus(c+68,"tb_top_verilator u_soc_top s1_data_i", false,-1, 31,0);
        vcdp->declBit(c+7,"tb_top_verilator u_soc_top s1_we_o", false,-1);
        vcdp->declBus(c+292,"tb_top_verilator u_soc_top s2_addr_o", false,-1, 31,0);
        vcdp->declBus(c+293,"tb_top_verilator u_soc_top s2_data_o", false,-1, 31,0);
        vcdp->declBus(c+294,"tb_top_verilator u_soc_top s2_data_i", false,-1, 31,0);
        vcdp->declBit(c+295,"tb_top_verilator u_soc_top s2_we_o", false,-1);
        vcdp->declBit(c+8,"tb_top_verilator u_soc_top rib_hold_flag_o", false,-1);
        vcdp->declBit(c+186,"tb_top_verilator u_soc_top jtag_halt_req_o", false,-1);
        vcdp->declBit(c+187,"tb_top_verilator u_soc_top jtag_reset_req_o", false,-1);
        vcdp->declBus(c+188,"tb_top_verilator u_soc_top jtag_reg_addr_o", false,-1, 4,0);
        vcdp->declBus(c+189,"tb_top_verilator u_soc_top jtag_reg_data_o", false,-1, 31,0);
        vcdp->declBit(c+190,"tb_top_verilator u_soc_top jtag_reg_we_o", false,-1);
        vcdp->declBus(c+217,"tb_top_verilator u_soc_top jtag_reg_data_i", false,-1, 31,0);
        vcdp->declBus(c+296,"tb_top_verilator u_soc_top int_flag", false,-1, 7,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core rst", false,-1);
        vcdp->declBus(c+1,"tb_top_verilator u_soc_top u_core rib_ex_addr_o", false,-1, 31,0);
        vcdp->declBus(c+63,"tb_top_verilator u_soc_top u_core rib_ex_data_i", false,-1, 31,0);
        vcdp->declBus(c+62,"tb_top_verilator u_soc_top u_core rib_ex_data_o", false,-1, 31,0);
        vcdp->declBit(c+2,"tb_top_verilator u_soc_top u_core rib_ex_req_o", false,-1);
        vcdp->declBit(c+3,"tb_top_verilator u_soc_top u_core rib_ex_we_o", false,-1);
        vcdp->declBus(c+106,"tb_top_verilator u_soc_top u_core rib_pc_addr_o", false,-1, 31,0);
        vcdp->declBus(c+64,"tb_top_verilator u_soc_top u_core rib_pc_data_i", false,-1, 31,0);
        vcdp->declBus(c+188,"tb_top_verilator u_soc_top u_core jtag_reg_addr_i", false,-1, 4,0);
        vcdp->declBus(c+189,"tb_top_verilator u_soc_top u_core jtag_reg_data_i", false,-1, 31,0);
        vcdp->declBit(c+190,"tb_top_verilator u_soc_top u_core jtag_reg_we_i", false,-1);
        vcdp->declBus(c+217,"tb_top_verilator u_soc_top u_core jtag_reg_data_o", false,-1, 31,0);
        vcdp->declBit(c+8,"tb_top_verilator u_soc_top u_core rib_hold_flag_i", false,-1);
        vcdp->declBit(c+186,"tb_top_verilator u_soc_top u_core jtag_halt_flag_i", false,-1);
        vcdp->declBit(c+187,"tb_top_verilator u_soc_top u_core jtag_reset_flag_i", false,-1);
        vcdp->declBus(c+296,"tb_top_verilator u_soc_top u_core int_i", false,-1, 7,0);
        vcdp->declBus(c+4,"tb_top_verilator u_soc_top u_core s0_addr_o", false,-1, 31,0);
        vcdp->declBus(c+65,"tb_top_verilator u_soc_top u_core s0_data_o", false,-1, 31,0);
        vcdp->declBus(c+66,"tb_top_verilator u_soc_top u_core s0_data_i", false,-1, 31,0);
        vcdp->declBit(c+5,"tb_top_verilator u_soc_top u_core s0_we_o", false,-1);
        vcdp->declBus(c+6,"tb_top_verilator u_soc_top u_core s1_addr_o", false,-1, 31,0);
        vcdp->declBus(c+67,"tb_top_verilator u_soc_top u_core s1_data_o", false,-1, 31,0);
        vcdp->declBus(c+68,"tb_top_verilator u_soc_top u_core s1_data_i", false,-1, 31,0);
        vcdp->declBit(c+7,"tb_top_verilator u_soc_top u_core s1_we_o", false,-1);
        vcdp->declBus(c+106,"tb_top_verilator u_soc_top u_core pc_pc_o", false,-1, 31,0);
        vcdp->declBus(c+107,"tb_top_verilator u_soc_top u_core if_inst_o", false,-1, 31,0);
        vcdp->declBus(c+108,"tb_top_verilator u_soc_top u_core if_inst_addr_o", false,-1, 31,0);
        vcdp->declBus(c+109,"tb_top_verilator u_soc_top u_core if_int_flag_o", false,-1, 7,0);
        vcdp->declBus(c+9,"tb_top_verilator u_soc_top u_core id_reg1_raddr_o", false,-1, 4,0);
        vcdp->declBus(c+10,"tb_top_verilator u_soc_top u_core id_reg2_raddr_o", false,-1, 4,0);
        vcdp->declBus(c+107,"tb_top_verilator u_soc_top u_core id_inst_o", false,-1, 31,0);
        vcdp->declBus(c+108,"tb_top_verilator u_soc_top u_core id_inst_addr_o", false,-1, 31,0);
        vcdp->declBus(c+69,"tb_top_verilator u_soc_top u_core id_reg1_rdata_o", false,-1, 31,0);
        vcdp->declBus(c+70,"tb_top_verilator u_soc_top u_core id_reg2_rdata_o", false,-1, 31,0);
        vcdp->declBit(c+11,"tb_top_verilator u_soc_top u_core id_reg_we_o", false,-1);
        vcdp->declBus(c+12,"tb_top_verilator u_soc_top u_core id_reg_waddr_o", false,-1, 4,0);
        vcdp->declBus(c+13,"tb_top_verilator u_soc_top u_core id_csr_raddr_o", false,-1, 31,0);
        vcdp->declBit(c+14,"tb_top_verilator u_soc_top u_core id_csr_we_o", false,-1);
        vcdp->declBus(c+15,"tb_top_verilator u_soc_top u_core id_csr_rdata_o", false,-1, 31,0);
        vcdp->declBus(c+16,"tb_top_verilator u_soc_top u_core id_csr_waddr_o", false,-1, 31,0);
        vcdp->declBus(c+71,"tb_top_verilator u_soc_top u_core id_op1_o", false,-1, 31,0);
        vcdp->declBus(c+72,"tb_top_verilator u_soc_top u_core id_op2_o", false,-1, 31,0);
        vcdp->declBus(c+73,"tb_top_verilator u_soc_top u_core id_op1_jump_o", false,-1, 31,0);
        vcdp->declBus(c+17,"tb_top_verilator u_soc_top u_core id_op2_jump_o", false,-1, 31,0);
        vcdp->declBus(c+110,"tb_top_verilator u_soc_top u_core ie_inst_o", false,-1, 31,0);
        vcdp->declBus(c+111,"tb_top_verilator u_soc_top u_core ie_inst_addr_o", false,-1, 31,0);
        vcdp->declBit(c+112,"tb_top_verilator u_soc_top u_core ie_reg_we_o", false,-1);
        vcdp->declBus(c+113,"tb_top_verilator u_soc_top u_core ie_reg_waddr_o", false,-1, 4,0);
        vcdp->declBus(c+114,"tb_top_verilator u_soc_top u_core ie_reg1_rdata_o", false,-1, 31,0);
        vcdp->declBus(c+115,"tb_top_verilator u_soc_top u_core ie_reg2_rdata_o", false,-1, 31,0);
        vcdp->declBit(c+116,"tb_top_verilator u_soc_top u_core ie_csr_we_o", false,-1);
        vcdp->declBus(c+117,"tb_top_verilator u_soc_top u_core ie_csr_waddr_o", false,-1, 31,0);
        vcdp->declBus(c+118,"tb_top_verilator u_soc_top u_core ie_csr_rdata_o", false,-1, 31,0);
        vcdp->declBus(c+119,"tb_top_verilator u_soc_top u_core ie_op1_o", false,-1, 31,0);
        vcdp->declBus(c+120,"tb_top_verilator u_soc_top u_core ie_op2_o", false,-1, 31,0);
        vcdp->declBus(c+121,"tb_top_verilator u_soc_top u_core ie_op1_jump_o", false,-1, 31,0);
        vcdp->declBus(c+122,"tb_top_verilator u_soc_top u_core ie_op2_jump_o", false,-1, 31,0);
        vcdp->declBus(c+62,"tb_top_verilator u_soc_top u_core ex_mem_wdata_o", false,-1, 31,0);
        vcdp->declBus(c+18,"tb_top_verilator u_soc_top u_core ex_mem_raddr_o", false,-1, 31,0);
        vcdp->declBus(c+19,"tb_top_verilator u_soc_top u_core ex_mem_waddr_o", false,-1, 31,0);
        vcdp->declBit(c+3,"tb_top_verilator u_soc_top u_core ex_mem_we_o", false,-1);
        vcdp->declBit(c+2,"tb_top_verilator u_soc_top u_core ex_mem_req_o", false,-1);
        vcdp->declBus(c+74,"tb_top_verilator u_soc_top u_core ex_reg_wdata_o", false,-1, 31,0);
        vcdp->declBit(c+20,"tb_top_verilator u_soc_top u_core ex_reg_we_o", false,-1);
        vcdp->declBus(c+21,"tb_top_verilator u_soc_top u_core ex_reg_waddr_o", false,-1, 4,0);
        vcdp->declBit(c+22,"tb_top_verilator u_soc_top u_core ex_hold_flag_o", false,-1);
        vcdp->declBit(c+23,"tb_top_verilator u_soc_top u_core ex_jump_flag_o", false,-1);
        vcdp->declBus(c+24,"tb_top_verilator u_soc_top u_core ex_jump_addr_o", false,-1, 31,0);
        vcdp->declBit(c+25,"tb_top_verilator u_soc_top u_core ex_div_start_o", false,-1);
        vcdp->declBus(c+114,"tb_top_verilator u_soc_top u_core ex_div_dividend_o", false,-1, 31,0);
        vcdp->declBus(c+115,"tb_top_verilator u_soc_top u_core ex_div_divisor_o", false,-1, 31,0);
        vcdp->declBus(c+123,"tb_top_verilator u_soc_top u_core ex_div_op_o", false,-1, 2,0);
        vcdp->declBus(c+113,"tb_top_verilator u_soc_top u_core ex_div_reg_waddr_o", false,-1, 4,0);
        vcdp->declBus(c+26,"tb_top_verilator u_soc_top u_core ex_csr_wdata_o", false,-1, 31,0);
        vcdp->declBit(c+27,"tb_top_verilator u_soc_top u_core ex_csr_we_o", false,-1);
        vcdp->declBus(c+117,"tb_top_verilator u_soc_top u_core ex_csr_waddr_o", false,-1, 31,0);
        vcdp->declBus(c+69,"tb_top_verilator u_soc_top u_core regs_rdata1_o", false,-1, 31,0);
        vcdp->declBus(c+70,"tb_top_verilator u_soc_top u_core regs_rdata2_o", false,-1, 31,0);
        vcdp->declBus(c+15,"tb_top_verilator u_soc_top u_core csr_data_o", false,-1, 31,0);
        vcdp->declBus(c+28,"tb_top_verilator u_soc_top u_core csr_clint_data_o", false,-1, 31,0);
        vcdp->declBit(c+124,"tb_top_verilator u_soc_top u_core csr_global_int_en_o", false,-1);
        vcdp->declBus(c+125,"tb_top_verilator u_soc_top u_core csr_clint_csr_mtvec", false,-1, 31,0);
        vcdp->declBus(c+126,"tb_top_verilator u_soc_top u_core csr_clint_csr_mepc", false,-1, 31,0);
        vcdp->declBus(c+127,"tb_top_verilator u_soc_top u_core csr_clint_csr_mstatus", false,-1, 31,0);
        vcdp->declBus(c+75,"tb_top_verilator u_soc_top u_core ctrl_hold_flag_o", false,-1, 2,0);
        vcdp->declBit(c+23,"tb_top_verilator u_soc_top u_core ctrl_jump_flag_o", false,-1);
        vcdp->declBus(c+24,"tb_top_verilator u_soc_top u_core ctrl_jump_addr_o", false,-1, 31,0);
        vcdp->declBus(c+128,"tb_top_verilator u_soc_top u_core div_result_o", false,-1, 31,0);
        vcdp->declBit(c+129,"tb_top_verilator u_soc_top u_core div_ready_o", false,-1);
        vcdp->declBit(c+130,"tb_top_verilator u_soc_top u_core div_busy_o", false,-1);
        vcdp->declBus(c+131,"tb_top_verilator u_soc_top u_core div_reg_waddr_o", false,-1, 4,0);
        vcdp->declBit(c+132,"tb_top_verilator u_soc_top u_core clint_we_o", false,-1);
        vcdp->declBus(c+133,"tb_top_verilator u_soc_top u_core clint_waddr_o", false,-1, 31,0);
        vcdp->declBus(c+297,"tb_top_verilator u_soc_top u_core clint_raddr_o", false,-1, 31,0);
        vcdp->declBus(c+134,"tb_top_verilator u_soc_top u_core clint_data_o", false,-1, 31,0);
        vcdp->declBus(c+135,"tb_top_verilator u_soc_top u_core clint_int_addr_o", false,-1, 31,0);
        vcdp->declBit(c+136,"tb_top_verilator u_soc_top u_core clint_int_assert_o", false,-1);
        vcdp->declBit(c+60,"tb_top_verilator u_soc_top u_core clint_hold_flag_o", false,-1);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_pc_reg clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_pc_reg rst", false,-1);
        vcdp->declBit(c+23,"tb_top_verilator u_soc_top u_core u_pc_reg jump_flag_i", false,-1);
        vcdp->declBus(c+24,"tb_top_verilator u_soc_top u_core u_pc_reg jump_addr_i", false,-1, 31,0);
        vcdp->declBus(c+75,"tb_top_verilator u_soc_top u_core u_pc_reg hold_flag_i", false,-1, 2,0);
        vcdp->declBit(c+187,"tb_top_verilator u_soc_top u_core u_pc_reg jtag_reset_flag_i", false,-1);
        vcdp->declBus(c+106,"tb_top_verilator u_soc_top u_core u_pc_reg pc_o", false,-1, 31,0);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_ctrl rst", false,-1);
        vcdp->declBit(c+23,"tb_top_verilator u_soc_top u_core u_ctrl jump_flag_i", false,-1);
        vcdp->declBus(c+24,"tb_top_verilator u_soc_top u_core u_ctrl jump_addr_i", false,-1, 31,0);
        vcdp->declBit(c+22,"tb_top_verilator u_soc_top u_core u_ctrl hold_flag_ex_i", false,-1);
        vcdp->declBit(c+8,"tb_top_verilator u_soc_top u_core u_ctrl hold_flag_rib_i", false,-1);
        vcdp->declBit(c+186,"tb_top_verilator u_soc_top u_core u_ctrl jtag_halt_flag_i", false,-1);
        vcdp->declBit(c+60,"tb_top_verilator u_soc_top u_core u_ctrl hold_flag_clint_i", false,-1);
        vcdp->declBus(c+75,"tb_top_verilator u_soc_top u_core u_ctrl hold_flag_o", false,-1, 2,0);
        vcdp->declBit(c+23,"tb_top_verilator u_soc_top u_core u_ctrl jump_flag_o", false,-1);
        vcdp->declBus(c+24,"tb_top_verilator u_soc_top u_core u_ctrl jump_addr_o", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_regs clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_regs rst", false,-1);
        vcdp->declBit(c+20,"tb_top_verilator u_soc_top u_core u_regs we_i", false,-1);
        vcdp->declBus(c+21,"tb_top_verilator u_soc_top u_core u_regs waddr_i", false,-1, 4,0);
        vcdp->declBus(c+74,"tb_top_verilator u_soc_top u_core u_regs wdata_i", false,-1, 31,0);
        vcdp->declBit(c+190,"tb_top_verilator u_soc_top u_core u_regs jtag_we_i", false,-1);
        vcdp->declBus(c+188,"tb_top_verilator u_soc_top u_core u_regs jtag_addr_i", false,-1, 4,0);
        vcdp->declBus(c+189,"tb_top_verilator u_soc_top u_core u_regs jtag_data_i", false,-1, 31,0);
        vcdp->declBus(c+9,"tb_top_verilator u_soc_top u_core u_regs raddr1_i", false,-1, 4,0);
        vcdp->declBus(c+69,"tb_top_verilator u_soc_top u_core u_regs rdata1_o", false,-1, 31,0);
        vcdp->declBus(c+10,"tb_top_verilator u_soc_top u_core u_regs raddr2_i", false,-1, 4,0);
        vcdp->declBus(c+70,"tb_top_verilator u_soc_top u_core u_regs rdata2_o", false,-1, 31,0);
        vcdp->declBus(c+217,"tb_top_verilator u_soc_top u_core u_regs jtag_data_o", false,-1, 31,0);
        {int i; for (i=0; i<32; i++) {
                vcdp->declBus(c+220+i*1,"tb_top_verilator u_soc_top u_core u_regs regs", true,(i+0), 31,0);}}
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_csr_reg clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_csr_reg rst", false,-1);
        vcdp->declBit(c+27,"tb_top_verilator u_soc_top u_core u_csr_reg we_i", false,-1);
        vcdp->declBus(c+13,"tb_top_verilator u_soc_top u_core u_csr_reg raddr_i", false,-1, 31,0);
        vcdp->declBus(c+117,"tb_top_verilator u_soc_top u_core u_csr_reg waddr_i", false,-1, 31,0);
        vcdp->declBus(c+26,"tb_top_verilator u_soc_top u_core u_csr_reg data_i", false,-1, 31,0);
        vcdp->declBit(c+132,"tb_top_verilator u_soc_top u_core u_csr_reg clint_we_i", false,-1);
        vcdp->declBus(c+297,"tb_top_verilator u_soc_top u_core u_csr_reg clint_raddr_i", false,-1, 31,0);
        vcdp->declBus(c+133,"tb_top_verilator u_soc_top u_core u_csr_reg clint_waddr_i", false,-1, 31,0);
        vcdp->declBus(c+134,"tb_top_verilator u_soc_top u_core u_csr_reg clint_data_i", false,-1, 31,0);
        vcdp->declBit(c+124,"tb_top_verilator u_soc_top u_core u_csr_reg global_int_en_o", false,-1);
        vcdp->declBus(c+28,"tb_top_verilator u_soc_top u_core u_csr_reg clint_data_o", false,-1, 31,0);
        vcdp->declBus(c+125,"tb_top_verilator u_soc_top u_core u_csr_reg clint_csr_mtvec", false,-1, 31,0);
        vcdp->declBus(c+126,"tb_top_verilator u_soc_top u_core u_csr_reg clint_csr_mepc", false,-1, 31,0);
        vcdp->declBus(c+127,"tb_top_verilator u_soc_top u_core u_csr_reg clint_csr_mstatus", false,-1, 31,0);
        vcdp->declBus(c+15,"tb_top_verilator u_soc_top u_core u_csr_reg data_o", false,-1, 31,0);
        vcdp->declQuad(c+137,"tb_top_verilator u_soc_top u_core u_csr_reg cycle", false,-1, 63,0);
        vcdp->declBus(c+125,"tb_top_verilator u_soc_top u_core u_csr_reg mtvec", false,-1, 31,0);
        vcdp->declBus(c+139,"tb_top_verilator u_soc_top u_core u_csr_reg mcause", false,-1, 31,0);
        vcdp->declBus(c+126,"tb_top_verilator u_soc_top u_core u_csr_reg mepc", false,-1, 31,0);
        vcdp->declBus(c+140,"tb_top_verilator u_soc_top u_core u_csr_reg mie", false,-1, 31,0);
        vcdp->declBus(c+127,"tb_top_verilator u_soc_top u_core u_csr_reg mstatus", false,-1, 31,0);
        vcdp->declBus(c+141,"tb_top_verilator u_soc_top u_core u_csr_reg mscratch", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_if_id clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_if_id rst", false,-1);
        vcdp->declBus(c+64,"tb_top_verilator u_soc_top u_core u_if_id inst_i", false,-1, 31,0);
        vcdp->declBus(c+106,"tb_top_verilator u_soc_top u_core u_if_id inst_addr_i", false,-1, 31,0);
        vcdp->declBus(c+75,"tb_top_verilator u_soc_top u_core u_if_id hold_flag_i", false,-1, 2,0);
        vcdp->declBus(c+296,"tb_top_verilator u_soc_top u_core u_if_id int_flag_i", false,-1, 7,0);
        vcdp->declBus(c+109,"tb_top_verilator u_soc_top u_core u_if_id int_flag_o", false,-1, 7,0);
        vcdp->declBus(c+107,"tb_top_verilator u_soc_top u_core u_if_id inst_o", false,-1, 31,0);
        vcdp->declBus(c+108,"tb_top_verilator u_soc_top u_core u_if_id inst_addr_o", false,-1, 31,0);
        vcdp->declBit(c+76,"tb_top_verilator u_soc_top u_core u_if_id hold_en", false,-1);
        vcdp->declBus(c+107,"tb_top_verilator u_soc_top u_core u_if_id inst", false,-1, 31,0);
        vcdp->declBus(c+108,"tb_top_verilator u_soc_top u_core u_if_id inst_addr", false,-1, 31,0);
        vcdp->declBus(c+109,"tb_top_verilator u_soc_top u_core u_if_id int_flag", false,-1, 7,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_core u_if_id inst_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_if_id inst_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_if_id inst_ff rst", false,-1);
        vcdp->declBit(c+76,"tb_top_verilator u_soc_top u_core u_if_id inst_ff hold_en", false,-1);
        vcdp->declBus(c+299,"tb_top_verilator u_soc_top u_core u_if_id inst_ff def_val", false,-1, 31,0);
        vcdp->declBus(c+64,"tb_top_verilator u_soc_top u_core u_if_id inst_ff din", false,-1, 31,0);
        vcdp->declBus(c+107,"tb_top_verilator u_soc_top u_core u_if_id inst_ff qout", false,-1, 31,0);
        vcdp->declBus(c+107,"tb_top_verilator u_soc_top u_core u_if_id inst_ff qout_r", false,-1, 31,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_core u_if_id inst_addr_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_if_id inst_addr_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_if_id inst_addr_ff rst", false,-1);
        vcdp->declBit(c+76,"tb_top_verilator u_soc_top u_core u_if_id inst_addr_ff hold_en", false,-1);
        vcdp->declBus(c+300,"tb_top_verilator u_soc_top u_core u_if_id inst_addr_ff def_val", false,-1, 31,0);
        vcdp->declBus(c+106,"tb_top_verilator u_soc_top u_core u_if_id inst_addr_ff din", false,-1, 31,0);
        vcdp->declBus(c+108,"tb_top_verilator u_soc_top u_core u_if_id inst_addr_ff qout", false,-1, 31,0);
        vcdp->declBus(c+108,"tb_top_verilator u_soc_top u_core u_if_id inst_addr_ff qout_r", false,-1, 31,0);
        vcdp->declBus(c+301,"tb_top_verilator u_soc_top u_core u_if_id int_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_if_id int_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_if_id int_ff rst", false,-1);
        vcdp->declBit(c+76,"tb_top_verilator u_soc_top u_core u_if_id int_ff hold_en", false,-1);
        vcdp->declBus(c+302,"tb_top_verilator u_soc_top u_core u_if_id int_ff def_val", false,-1, 7,0);
        vcdp->declBus(c+296,"tb_top_verilator u_soc_top u_core u_if_id int_ff din", false,-1, 7,0);
        vcdp->declBus(c+109,"tb_top_verilator u_soc_top u_core u_if_id int_ff qout", false,-1, 7,0);
        vcdp->declBus(c+109,"tb_top_verilator u_soc_top u_core u_if_id int_ff qout_r", false,-1, 7,0);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id rst", false,-1);
        vcdp->declBus(c+107,"tb_top_verilator u_soc_top u_core u_id inst_i", false,-1, 31,0);
        vcdp->declBus(c+108,"tb_top_verilator u_soc_top u_core u_id inst_addr_i", false,-1, 31,0);
        vcdp->declBus(c+69,"tb_top_verilator u_soc_top u_core u_id reg1_rdata_i", false,-1, 31,0);
        vcdp->declBus(c+70,"tb_top_verilator u_soc_top u_core u_id reg2_rdata_i", false,-1, 31,0);
        vcdp->declBus(c+15,"tb_top_verilator u_soc_top u_core u_id csr_rdata_i", false,-1, 31,0);
        vcdp->declBit(c+23,"tb_top_verilator u_soc_top u_core u_id ex_jump_flag_i", false,-1);
        vcdp->declBus(c+9,"tb_top_verilator u_soc_top u_core u_id reg1_raddr_o", false,-1, 4,0);
        vcdp->declBus(c+10,"tb_top_verilator u_soc_top u_core u_id reg2_raddr_o", false,-1, 4,0);
        vcdp->declBus(c+13,"tb_top_verilator u_soc_top u_core u_id csr_raddr_o", false,-1, 31,0);
        vcdp->declBus(c+71,"tb_top_verilator u_soc_top u_core u_id op1_o", false,-1, 31,0);
        vcdp->declBus(c+72,"tb_top_verilator u_soc_top u_core u_id op2_o", false,-1, 31,0);
        vcdp->declBus(c+73,"tb_top_verilator u_soc_top u_core u_id op1_jump_o", false,-1, 31,0);
        vcdp->declBus(c+17,"tb_top_verilator u_soc_top u_core u_id op2_jump_o", false,-1, 31,0);
        vcdp->declBus(c+107,"tb_top_verilator u_soc_top u_core u_id inst_o", false,-1, 31,0);
        vcdp->declBus(c+108,"tb_top_verilator u_soc_top u_core u_id inst_addr_o", false,-1, 31,0);
        vcdp->declBus(c+69,"tb_top_verilator u_soc_top u_core u_id reg1_rdata_o", false,-1, 31,0);
        vcdp->declBus(c+70,"tb_top_verilator u_soc_top u_core u_id reg2_rdata_o", false,-1, 31,0);
        vcdp->declBit(c+11,"tb_top_verilator u_soc_top u_core u_id reg_we_o", false,-1);
        vcdp->declBus(c+12,"tb_top_verilator u_soc_top u_core u_id reg_waddr_o", false,-1, 4,0);
        vcdp->declBit(c+14,"tb_top_verilator u_soc_top u_core u_id csr_we_o", false,-1);
        vcdp->declBus(c+15,"tb_top_verilator u_soc_top u_core u_id csr_rdata_o", false,-1, 31,0);
        vcdp->declBus(c+16,"tb_top_verilator u_soc_top u_core u_id csr_waddr_o", false,-1, 31,0);
        vcdp->declBus(c+142,"tb_top_verilator u_soc_top u_core u_id opcode", false,-1, 6,0);
        vcdp->declBus(c+143,"tb_top_verilator u_soc_top u_core u_id funct3", false,-1, 2,0);
        vcdp->declBus(c+144,"tb_top_verilator u_soc_top u_core u_id funct7", false,-1, 6,0);
        vcdp->declBus(c+145,"tb_top_verilator u_soc_top u_core u_id rd", false,-1, 4,0);
        vcdp->declBus(c+146,"tb_top_verilator u_soc_top u_core u_id rs1", false,-1, 4,0);
        vcdp->declBus(c+147,"tb_top_verilator u_soc_top u_core u_id rs2", false,-1, 4,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex rst", false,-1);
        vcdp->declBus(c+107,"tb_top_verilator u_soc_top u_core u_id_ex inst_i", false,-1, 31,0);
        vcdp->declBus(c+108,"tb_top_verilator u_soc_top u_core u_id_ex inst_addr_i", false,-1, 31,0);
        vcdp->declBit(c+11,"tb_top_verilator u_soc_top u_core u_id_ex reg_we_i", false,-1);
        vcdp->declBus(c+12,"tb_top_verilator u_soc_top u_core u_id_ex reg_waddr_i", false,-1, 4,0);
        vcdp->declBus(c+69,"tb_top_verilator u_soc_top u_core u_id_ex reg1_rdata_i", false,-1, 31,0);
        vcdp->declBus(c+70,"tb_top_verilator u_soc_top u_core u_id_ex reg2_rdata_i", false,-1, 31,0);
        vcdp->declBit(c+14,"tb_top_verilator u_soc_top u_core u_id_ex csr_we_i", false,-1);
        vcdp->declBus(c+16,"tb_top_verilator u_soc_top u_core u_id_ex csr_waddr_i", false,-1, 31,0);
        vcdp->declBus(c+15,"tb_top_verilator u_soc_top u_core u_id_ex csr_rdata_i", false,-1, 31,0);
        vcdp->declBus(c+71,"tb_top_verilator u_soc_top u_core u_id_ex op1_i", false,-1, 31,0);
        vcdp->declBus(c+72,"tb_top_verilator u_soc_top u_core u_id_ex op2_i", false,-1, 31,0);
        vcdp->declBus(c+73,"tb_top_verilator u_soc_top u_core u_id_ex op1_jump_i", false,-1, 31,0);
        vcdp->declBus(c+17,"tb_top_verilator u_soc_top u_core u_id_ex op2_jump_i", false,-1, 31,0);
        vcdp->declBus(c+75,"tb_top_verilator u_soc_top u_core u_id_ex hold_flag_i", false,-1, 2,0);
        vcdp->declBus(c+119,"tb_top_verilator u_soc_top u_core u_id_ex op1_o", false,-1, 31,0);
        vcdp->declBus(c+120,"tb_top_verilator u_soc_top u_core u_id_ex op2_o", false,-1, 31,0);
        vcdp->declBus(c+121,"tb_top_verilator u_soc_top u_core u_id_ex op1_jump_o", false,-1, 31,0);
        vcdp->declBus(c+122,"tb_top_verilator u_soc_top u_core u_id_ex op2_jump_o", false,-1, 31,0);
        vcdp->declBus(c+110,"tb_top_verilator u_soc_top u_core u_id_ex inst_o", false,-1, 31,0);
        vcdp->declBus(c+111,"tb_top_verilator u_soc_top u_core u_id_ex inst_addr_o", false,-1, 31,0);
        vcdp->declBit(c+112,"tb_top_verilator u_soc_top u_core u_id_ex reg_we_o", false,-1);
        vcdp->declBus(c+113,"tb_top_verilator u_soc_top u_core u_id_ex reg_waddr_o", false,-1, 4,0);
        vcdp->declBus(c+114,"tb_top_verilator u_soc_top u_core u_id_ex reg1_rdata_o", false,-1, 31,0);
        vcdp->declBus(c+115,"tb_top_verilator u_soc_top u_core u_id_ex reg2_rdata_o", false,-1, 31,0);
        vcdp->declBit(c+116,"tb_top_verilator u_soc_top u_core u_id_ex csr_we_o", false,-1);
        vcdp->declBus(c+117,"tb_top_verilator u_soc_top u_core u_id_ex csr_waddr_o", false,-1, 31,0);
        vcdp->declBus(c+118,"tb_top_verilator u_soc_top u_core u_id_ex csr_rdata_o", false,-1, 31,0);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex hold_en", false,-1);
        vcdp->declBus(c+110,"tb_top_verilator u_soc_top u_core u_id_ex inst", false,-1, 31,0);
        vcdp->declBus(c+111,"tb_top_verilator u_soc_top u_core u_id_ex inst_addr", false,-1, 31,0);
        vcdp->declBit(c+112,"tb_top_verilator u_soc_top u_core u_id_ex reg_we", false,-1);
        vcdp->declBus(c+113,"tb_top_verilator u_soc_top u_core u_id_ex reg_waddr", false,-1, 4,0);
        vcdp->declBus(c+114,"tb_top_verilator u_soc_top u_core u_id_ex reg1_rdata", false,-1, 31,0);
        vcdp->declBus(c+115,"tb_top_verilator u_soc_top u_core u_id_ex reg2_rdata", false,-1, 31,0);
        vcdp->declBit(c+116,"tb_top_verilator u_soc_top u_core u_id_ex csr_we", false,-1);
        vcdp->declBus(c+117,"tb_top_verilator u_soc_top u_core u_id_ex csr_waddr", false,-1, 31,0);
        vcdp->declBus(c+118,"tb_top_verilator u_soc_top u_core u_id_ex csr_rdata", false,-1, 31,0);
        vcdp->declBus(c+119,"tb_top_verilator u_soc_top u_core u_id_ex op1", false,-1, 31,0);
        vcdp->declBus(c+120,"tb_top_verilator u_soc_top u_core u_id_ex op2", false,-1, 31,0);
        vcdp->declBus(c+121,"tb_top_verilator u_soc_top u_core u_id_ex op1_jump", false,-1, 31,0);
        vcdp->declBus(c+122,"tb_top_verilator u_soc_top u_core u_id_ex op2_jump", false,-1, 31,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_core u_id_ex inst_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex inst_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex inst_ff rst", false,-1);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex inst_ff hold_en", false,-1);
        vcdp->declBus(c+299,"tb_top_verilator u_soc_top u_core u_id_ex inst_ff def_val", false,-1, 31,0);
        vcdp->declBus(c+107,"tb_top_verilator u_soc_top u_core u_id_ex inst_ff din", false,-1, 31,0);
        vcdp->declBus(c+110,"tb_top_verilator u_soc_top u_core u_id_ex inst_ff qout", false,-1, 31,0);
        vcdp->declBus(c+110,"tb_top_verilator u_soc_top u_core u_id_ex inst_ff qout_r", false,-1, 31,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_core u_id_ex inst_addr_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex inst_addr_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex inst_addr_ff rst", false,-1);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex inst_addr_ff hold_en", false,-1);
        vcdp->declBus(c+300,"tb_top_verilator u_soc_top u_core u_id_ex inst_addr_ff def_val", false,-1, 31,0);
        vcdp->declBus(c+108,"tb_top_verilator u_soc_top u_core u_id_ex inst_addr_ff din", false,-1, 31,0);
        vcdp->declBus(c+111,"tb_top_verilator u_soc_top u_core u_id_ex inst_addr_ff qout", false,-1, 31,0);
        vcdp->declBus(c+111,"tb_top_verilator u_soc_top u_core u_id_ex inst_addr_ff qout_r", false,-1, 31,0);
        vcdp->declBus(c+303,"tb_top_verilator u_soc_top u_core u_id_ex reg_we_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex reg_we_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex reg_we_ff rst", false,-1);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex reg_we_ff hold_en", false,-1);
        vcdp->declBus(c+304,"tb_top_verilator u_soc_top u_core u_id_ex reg_we_ff def_val", false,-1, 0,0);
        vcdp->declBus(c+11,"tb_top_verilator u_soc_top u_core u_id_ex reg_we_ff din", false,-1, 0,0);
        vcdp->declBus(c+112,"tb_top_verilator u_soc_top u_core u_id_ex reg_we_ff qout", false,-1, 0,0);
        vcdp->declBus(c+112,"tb_top_verilator u_soc_top u_core u_id_ex reg_we_ff qout_r", false,-1, 0,0);
        vcdp->declBus(c+305,"tb_top_verilator u_soc_top u_core u_id_ex reg_waddr_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex reg_waddr_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex reg_waddr_ff rst", false,-1);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex reg_waddr_ff hold_en", false,-1);
        vcdp->declBus(c+306,"tb_top_verilator u_soc_top u_core u_id_ex reg_waddr_ff def_val", false,-1, 4,0);
        vcdp->declBus(c+12,"tb_top_verilator u_soc_top u_core u_id_ex reg_waddr_ff din", false,-1, 4,0);
        vcdp->declBus(c+113,"tb_top_verilator u_soc_top u_core u_id_ex reg_waddr_ff qout", false,-1, 4,0);
        vcdp->declBus(c+113,"tb_top_verilator u_soc_top u_core u_id_ex reg_waddr_ff qout_r", false,-1, 4,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_core u_id_ex reg1_rdata_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex reg1_rdata_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex reg1_rdata_ff rst", false,-1);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex reg1_rdata_ff hold_en", false,-1);
        vcdp->declBus(c+300,"tb_top_verilator u_soc_top u_core u_id_ex reg1_rdata_ff def_val", false,-1, 31,0);
        vcdp->declBus(c+69,"tb_top_verilator u_soc_top u_core u_id_ex reg1_rdata_ff din", false,-1, 31,0);
        vcdp->declBus(c+114,"tb_top_verilator u_soc_top u_core u_id_ex reg1_rdata_ff qout", false,-1, 31,0);
        vcdp->declBus(c+114,"tb_top_verilator u_soc_top u_core u_id_ex reg1_rdata_ff qout_r", false,-1, 31,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_core u_id_ex reg2_rdata_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex reg2_rdata_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex reg2_rdata_ff rst", false,-1);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex reg2_rdata_ff hold_en", false,-1);
        vcdp->declBus(c+300,"tb_top_verilator u_soc_top u_core u_id_ex reg2_rdata_ff def_val", false,-1, 31,0);
        vcdp->declBus(c+70,"tb_top_verilator u_soc_top u_core u_id_ex reg2_rdata_ff din", false,-1, 31,0);
        vcdp->declBus(c+115,"tb_top_verilator u_soc_top u_core u_id_ex reg2_rdata_ff qout", false,-1, 31,0);
        vcdp->declBus(c+115,"tb_top_verilator u_soc_top u_core u_id_ex reg2_rdata_ff qout_r", false,-1, 31,0);
        vcdp->declBus(c+303,"tb_top_verilator u_soc_top u_core u_id_ex csr_we_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex csr_we_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex csr_we_ff rst", false,-1);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex csr_we_ff hold_en", false,-1);
        vcdp->declBus(c+304,"tb_top_verilator u_soc_top u_core u_id_ex csr_we_ff def_val", false,-1, 0,0);
        vcdp->declBus(c+14,"tb_top_verilator u_soc_top u_core u_id_ex csr_we_ff din", false,-1, 0,0);
        vcdp->declBus(c+116,"tb_top_verilator u_soc_top u_core u_id_ex csr_we_ff qout", false,-1, 0,0);
        vcdp->declBus(c+116,"tb_top_verilator u_soc_top u_core u_id_ex csr_we_ff qout_r", false,-1, 0,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_core u_id_ex csr_waddr_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex csr_waddr_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex csr_waddr_ff rst", false,-1);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex csr_waddr_ff hold_en", false,-1);
        vcdp->declBus(c+300,"tb_top_verilator u_soc_top u_core u_id_ex csr_waddr_ff def_val", false,-1, 31,0);
        vcdp->declBus(c+16,"tb_top_verilator u_soc_top u_core u_id_ex csr_waddr_ff din", false,-1, 31,0);
        vcdp->declBus(c+117,"tb_top_verilator u_soc_top u_core u_id_ex csr_waddr_ff qout", false,-1, 31,0);
        vcdp->declBus(c+117,"tb_top_verilator u_soc_top u_core u_id_ex csr_waddr_ff qout_r", false,-1, 31,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_core u_id_ex csr_rdata_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex csr_rdata_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex csr_rdata_ff rst", false,-1);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex csr_rdata_ff hold_en", false,-1);
        vcdp->declBus(c+300,"tb_top_verilator u_soc_top u_core u_id_ex csr_rdata_ff def_val", false,-1, 31,0);
        vcdp->declBus(c+15,"tb_top_verilator u_soc_top u_core u_id_ex csr_rdata_ff din", false,-1, 31,0);
        vcdp->declBus(c+118,"tb_top_verilator u_soc_top u_core u_id_ex csr_rdata_ff qout", false,-1, 31,0);
        vcdp->declBus(c+118,"tb_top_verilator u_soc_top u_core u_id_ex csr_rdata_ff qout_r", false,-1, 31,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_core u_id_ex op1_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex op1_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex op1_ff rst", false,-1);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex op1_ff hold_en", false,-1);
        vcdp->declBus(c+300,"tb_top_verilator u_soc_top u_core u_id_ex op1_ff def_val", false,-1, 31,0);
        vcdp->declBus(c+71,"tb_top_verilator u_soc_top u_core u_id_ex op1_ff din", false,-1, 31,0);
        vcdp->declBus(c+119,"tb_top_verilator u_soc_top u_core u_id_ex op1_ff qout", false,-1, 31,0);
        vcdp->declBus(c+119,"tb_top_verilator u_soc_top u_core u_id_ex op1_ff qout_r", false,-1, 31,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_core u_id_ex op2_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex op2_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex op2_ff rst", false,-1);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex op2_ff hold_en", false,-1);
        vcdp->declBus(c+300,"tb_top_verilator u_soc_top u_core u_id_ex op2_ff def_val", false,-1, 31,0);
        vcdp->declBus(c+72,"tb_top_verilator u_soc_top u_core u_id_ex op2_ff din", false,-1, 31,0);
        vcdp->declBus(c+120,"tb_top_verilator u_soc_top u_core u_id_ex op2_ff qout", false,-1, 31,0);
        vcdp->declBus(c+120,"tb_top_verilator u_soc_top u_core u_id_ex op2_ff qout_r", false,-1, 31,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_core u_id_ex op1_jump_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex op1_jump_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex op1_jump_ff rst", false,-1);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex op1_jump_ff hold_en", false,-1);
        vcdp->declBus(c+300,"tb_top_verilator u_soc_top u_core u_id_ex op1_jump_ff def_val", false,-1, 31,0);
        vcdp->declBus(c+73,"tb_top_verilator u_soc_top u_core u_id_ex op1_jump_ff din", false,-1, 31,0);
        vcdp->declBus(c+121,"tb_top_verilator u_soc_top u_core u_id_ex op1_jump_ff qout", false,-1, 31,0);
        vcdp->declBus(c+121,"tb_top_verilator u_soc_top u_core u_id_ex op1_jump_ff qout_r", false,-1, 31,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_core u_id_ex op2_jump_ff DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_id_ex op2_jump_ff clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_id_ex op2_jump_ff rst", false,-1);
        vcdp->declBit(c+77,"tb_top_verilator u_soc_top u_core u_id_ex op2_jump_ff hold_en", false,-1);
        vcdp->declBus(c+300,"tb_top_verilator u_soc_top u_core u_id_ex op2_jump_ff def_val", false,-1, 31,0);
        vcdp->declBus(c+17,"tb_top_verilator u_soc_top u_core u_id_ex op2_jump_ff din", false,-1, 31,0);
        vcdp->declBus(c+122,"tb_top_verilator u_soc_top u_core u_id_ex op2_jump_ff qout", false,-1, 31,0);
        vcdp->declBus(c+122,"tb_top_verilator u_soc_top u_core u_id_ex op2_jump_ff qout_r", false,-1, 31,0);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_ex rst", false,-1);
        vcdp->declBus(c+110,"tb_top_verilator u_soc_top u_core u_ex inst_i", false,-1, 31,0);
        vcdp->declBus(c+111,"tb_top_verilator u_soc_top u_core u_ex inst_addr_i", false,-1, 31,0);
        vcdp->declBit(c+112,"tb_top_verilator u_soc_top u_core u_ex reg_we_i", false,-1);
        vcdp->declBus(c+113,"tb_top_verilator u_soc_top u_core u_ex reg_waddr_i", false,-1, 4,0);
        vcdp->declBus(c+114,"tb_top_verilator u_soc_top u_core u_ex reg1_rdata_i", false,-1, 31,0);
        vcdp->declBus(c+115,"tb_top_verilator u_soc_top u_core u_ex reg2_rdata_i", false,-1, 31,0);
        vcdp->declBit(c+116,"tb_top_verilator u_soc_top u_core u_ex csr_we_i", false,-1);
        vcdp->declBus(c+117,"tb_top_verilator u_soc_top u_core u_ex csr_waddr_i", false,-1, 31,0);
        vcdp->declBus(c+118,"tb_top_verilator u_soc_top u_core u_ex csr_rdata_i", false,-1, 31,0);
        vcdp->declBit(c+136,"tb_top_verilator u_soc_top u_core u_ex int_assert_i", false,-1);
        vcdp->declBus(c+135,"tb_top_verilator u_soc_top u_core u_ex int_addr_i", false,-1, 31,0);
        vcdp->declBus(c+119,"tb_top_verilator u_soc_top u_core u_ex op1_i", false,-1, 31,0);
        vcdp->declBus(c+120,"tb_top_verilator u_soc_top u_core u_ex op2_i", false,-1, 31,0);
        vcdp->declBus(c+121,"tb_top_verilator u_soc_top u_core u_ex op1_jump_i", false,-1, 31,0);
        vcdp->declBus(c+122,"tb_top_verilator u_soc_top u_core u_ex op2_jump_i", false,-1, 31,0);
        vcdp->declBus(c+63,"tb_top_verilator u_soc_top u_core u_ex mem_rdata_i", false,-1, 31,0);
        vcdp->declBit(c+129,"tb_top_verilator u_soc_top u_core u_ex div_ready_i", false,-1);
        vcdp->declBus(c+128,"tb_top_verilator u_soc_top u_core u_ex div_result_i", false,-1, 31,0);
        vcdp->declBit(c+130,"tb_top_verilator u_soc_top u_core u_ex div_busy_i", false,-1);
        vcdp->declBus(c+131,"tb_top_verilator u_soc_top u_core u_ex div_reg_waddr_i", false,-1, 4,0);
        vcdp->declBus(c+62,"tb_top_verilator u_soc_top u_core u_ex mem_wdata_o", false,-1, 31,0);
        vcdp->declBus(c+18,"tb_top_verilator u_soc_top u_core u_ex mem_raddr_o", false,-1, 31,0);
        vcdp->declBus(c+19,"tb_top_verilator u_soc_top u_core u_ex mem_waddr_o", false,-1, 31,0);
        vcdp->declBit(c+3,"tb_top_verilator u_soc_top u_core u_ex mem_we_o", false,-1);
        vcdp->declBit(c+2,"tb_top_verilator u_soc_top u_core u_ex mem_req_o", false,-1);
        vcdp->declBus(c+74,"tb_top_verilator u_soc_top u_core u_ex reg_wdata_o", false,-1, 31,0);
        vcdp->declBit(c+20,"tb_top_verilator u_soc_top u_core u_ex reg_we_o", false,-1);
        vcdp->declBus(c+21,"tb_top_verilator u_soc_top u_core u_ex reg_waddr_o", false,-1, 4,0);
        vcdp->declBus(c+26,"tb_top_verilator u_soc_top u_core u_ex csr_wdata_o", false,-1, 31,0);
        vcdp->declBit(c+27,"tb_top_verilator u_soc_top u_core u_ex csr_we_o", false,-1);
        vcdp->declBus(c+117,"tb_top_verilator u_soc_top u_core u_ex csr_waddr_o", false,-1, 31,0);
        vcdp->declBit(c+25,"tb_top_verilator u_soc_top u_core u_ex div_start_o", false,-1);
        vcdp->declBus(c+114,"tb_top_verilator u_soc_top u_core u_ex div_dividend_o", false,-1, 31,0);
        vcdp->declBus(c+115,"tb_top_verilator u_soc_top u_core u_ex div_divisor_o", false,-1, 31,0);
        vcdp->declBus(c+123,"tb_top_verilator u_soc_top u_core u_ex div_op_o", false,-1, 2,0);
        vcdp->declBus(c+113,"tb_top_verilator u_soc_top u_core u_ex div_reg_waddr_o", false,-1, 4,0);
        vcdp->declBit(c+22,"tb_top_verilator u_soc_top u_core u_ex hold_flag_o", false,-1);
        vcdp->declBit(c+23,"tb_top_verilator u_soc_top u_core u_ex jump_flag_o", false,-1);
        vcdp->declBus(c+24,"tb_top_verilator u_soc_top u_core u_ex jump_addr_o", false,-1, 31,0);
        vcdp->declBus(c+29,"tb_top_verilator u_soc_top u_core u_ex mem_raddr_index", false,-1, 1,0);
        vcdp->declBus(c+30,"tb_top_verilator u_soc_top u_core u_ex mem_waddr_index", false,-1, 1,0);
        vcdp->declQuad(c+31,"tb_top_verilator u_soc_top u_core u_ex mul_temp", false,-1, 63,0);
        vcdp->declQuad(c+33,"tb_top_verilator u_soc_top u_core u_ex mul_temp_invert", false,-1, 63,0);
        vcdp->declBus(c+148,"tb_top_verilator u_soc_top u_core u_ex sr_shift", false,-1, 31,0);
        vcdp->declBus(c+149,"tb_top_verilator u_soc_top u_core u_ex sri_shift", false,-1, 31,0);
        vcdp->declBus(c+150,"tb_top_verilator u_soc_top u_core u_ex sr_shift_mask", false,-1, 31,0);
        vcdp->declBus(c+151,"tb_top_verilator u_soc_top u_core u_ex sri_shift_mask", false,-1, 31,0);
        vcdp->declBus(c+35,"tb_top_verilator u_soc_top u_core u_ex op1_add_op2_res", false,-1, 31,0);
        vcdp->declBus(c+36,"tb_top_verilator u_soc_top u_core u_ex op1_jump_add_op2_jump_res", false,-1, 31,0);
        vcdp->declBus(c+152,"tb_top_verilator u_soc_top u_core u_ex reg1_data_invert", false,-1, 31,0);
        vcdp->declBus(c+153,"tb_top_verilator u_soc_top u_core u_ex reg2_data_invert", false,-1, 31,0);
        vcdp->declBit(c+37,"tb_top_verilator u_soc_top u_core u_ex op1_ge_op2_signed", false,-1);
        vcdp->declBit(c+38,"tb_top_verilator u_soc_top u_core u_ex op1_ge_op2_unsigned", false,-1);
        vcdp->declBit(c+39,"tb_top_verilator u_soc_top u_core u_ex op1_eq_op2", false,-1);
        vcdp->declBus(c+154,"tb_top_verilator u_soc_top u_core u_ex mul_op1", false,-1, 31,0);
        vcdp->declBus(c+155,"tb_top_verilator u_soc_top u_core u_ex mul_op2", false,-1, 31,0);
        vcdp->declBus(c+156,"tb_top_verilator u_soc_top u_core u_ex opcode", false,-1, 6,0);
        vcdp->declBus(c+123,"tb_top_verilator u_soc_top u_core u_ex funct3", false,-1, 2,0);
        vcdp->declBus(c+157,"tb_top_verilator u_soc_top u_core u_ex funct7", false,-1, 6,0);
        vcdp->declBus(c+158,"tb_top_verilator u_soc_top u_core u_ex rd", false,-1, 4,0);
        vcdp->declBus(c+159,"tb_top_verilator u_soc_top u_core u_ex uimm", false,-1, 4,0);
        vcdp->declBus(c+78,"tb_top_verilator u_soc_top u_core u_ex reg_wdata", false,-1, 31,0);
        vcdp->declBit(c+112,"tb_top_verilator u_soc_top u_core u_ex reg_we", false,-1);
        vcdp->declBus(c+113,"tb_top_verilator u_soc_top u_core u_ex reg_waddr", false,-1, 4,0);
        vcdp->declBus(c+160,"tb_top_verilator u_soc_top u_core u_ex div_wdata", false,-1, 31,0);
        vcdp->declBit(c+161,"tb_top_verilator u_soc_top u_core u_ex div_we", false,-1);
        vcdp->declBus(c+162,"tb_top_verilator u_soc_top u_core u_ex div_waddr", false,-1, 4,0);
        vcdp->declBit(c+163,"tb_top_verilator u_soc_top u_core u_ex div_hold_flag", false,-1);
        vcdp->declBit(c+164,"tb_top_verilator u_soc_top u_core u_ex div_jump_flag", false,-1);
        vcdp->declBus(c+40,"tb_top_verilator u_soc_top u_core u_ex div_jump_addr", false,-1, 31,0);
        vcdp->declBit(c+41,"tb_top_verilator u_soc_top u_core u_ex hold_flag", false,-1);
        vcdp->declBit(c+42,"tb_top_verilator u_soc_top u_core u_ex jump_flag", false,-1);
        vcdp->declBus(c+43,"tb_top_verilator u_soc_top u_core u_ex jump_addr", false,-1, 31,0);
        vcdp->declBit(c+44,"tb_top_verilator u_soc_top u_core u_ex mem_we", false,-1);
        vcdp->declBit(c+45,"tb_top_verilator u_soc_top u_core u_ex mem_req", false,-1);
        vcdp->declBit(c+163,"tb_top_verilator u_soc_top u_core u_ex div_start", false,-1);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_div clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_div rst", false,-1);
        vcdp->declBus(c+114,"tb_top_verilator u_soc_top u_core u_div dividend_i", false,-1, 31,0);
        vcdp->declBus(c+115,"tb_top_verilator u_soc_top u_core u_div divisor_i", false,-1, 31,0);
        vcdp->declBit(c+25,"tb_top_verilator u_soc_top u_core u_div start_i", false,-1);
        vcdp->declBus(c+123,"tb_top_verilator u_soc_top u_core u_div op_i", false,-1, 2,0);
        vcdp->declBus(c+113,"tb_top_verilator u_soc_top u_core u_div reg_waddr_i", false,-1, 4,0);
        vcdp->declBus(c+128,"tb_top_verilator u_soc_top u_core u_div result_o", false,-1, 31,0);
        vcdp->declBit(c+129,"tb_top_verilator u_soc_top u_core u_div ready_o", false,-1);
        vcdp->declBit(c+130,"tb_top_verilator u_soc_top u_core u_div busy_o", false,-1);
        vcdp->declBus(c+131,"tb_top_verilator u_soc_top u_core u_div reg_waddr_o", false,-1, 4,0);
        vcdp->declBus(c+307,"tb_top_verilator u_soc_top u_core u_div STATE_IDLE", false,-1, 3,0);
        vcdp->declBus(c+308,"tb_top_verilator u_soc_top u_core u_div STATE_START", false,-1, 3,0);
        vcdp->declBus(c+309,"tb_top_verilator u_soc_top u_core u_div STATE_CALC", false,-1, 3,0);
        vcdp->declBus(c+310,"tb_top_verilator u_soc_top u_core u_div STATE_END", false,-1, 3,0);
        vcdp->declBus(c+165,"tb_top_verilator u_soc_top u_core u_div dividend_r", false,-1, 31,0);
        vcdp->declBus(c+166,"tb_top_verilator u_soc_top u_core u_div divisor_r", false,-1, 31,0);
        vcdp->declBus(c+167,"tb_top_verilator u_soc_top u_core u_div op_r", false,-1, 2,0);
        vcdp->declBus(c+168,"tb_top_verilator u_soc_top u_core u_div state", false,-1, 3,0);
        vcdp->declBus(c+169,"tb_top_verilator u_soc_top u_core u_div count", false,-1, 31,0);
        vcdp->declBus(c+170,"tb_top_verilator u_soc_top u_core u_div div_result", false,-1, 31,0);
        vcdp->declBus(c+171,"tb_top_verilator u_soc_top u_core u_div div_remain", false,-1, 31,0);
        vcdp->declBus(c+172,"tb_top_verilator u_soc_top u_core u_div minuend", false,-1, 31,0);
        vcdp->declBit(c+173,"tb_top_verilator u_soc_top u_core u_div invert_result", false,-1);
        vcdp->declBit(c+174,"tb_top_verilator u_soc_top u_core u_div op_div", false,-1);
        vcdp->declBit(c+175,"tb_top_verilator u_soc_top u_core u_div op_divu", false,-1);
        vcdp->declBit(c+176,"tb_top_verilator u_soc_top u_core u_div op_rem", false,-1);
        vcdp->declBit(c+177,"tb_top_verilator u_soc_top u_core u_div op_remu", false,-1);
        vcdp->declBus(c+178,"tb_top_verilator u_soc_top u_core u_div dividend_invert", false,-1, 31,0);
        vcdp->declBus(c+179,"tb_top_verilator u_soc_top u_core u_div divisor_invert", false,-1, 31,0);
        vcdp->declBit(c+46,"tb_top_verilator u_soc_top u_core u_div minuend_ge_divisor", false,-1);
        vcdp->declBus(c+47,"tb_top_verilator u_soc_top u_core u_div minuend_sub_res", false,-1, 31,0);
        vcdp->declBus(c+48,"tb_top_verilator u_soc_top u_core u_div div_result_tmp", false,-1, 31,0);
        vcdp->declBus(c+49,"tb_top_verilator u_soc_top u_core u_div minuend_tmp", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_clint clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_clint rst", false,-1);
        vcdp->declBus(c+109,"tb_top_verilator u_soc_top u_core u_clint int_flag_i", false,-1, 7,0);
        vcdp->declBus(c+107,"tb_top_verilator u_soc_top u_core u_clint inst_i", false,-1, 31,0);
        vcdp->declBus(c+108,"tb_top_verilator u_soc_top u_core u_clint inst_addr_i", false,-1, 31,0);
        vcdp->declBit(c+23,"tb_top_verilator u_soc_top u_core u_clint jump_flag_i", false,-1);
        vcdp->declBus(c+24,"tb_top_verilator u_soc_top u_core u_clint jump_addr_i", false,-1, 31,0);
        vcdp->declBit(c+25,"tb_top_verilator u_soc_top u_core u_clint div_started_i", false,-1);
        vcdp->declBus(c+75,"tb_top_verilator u_soc_top u_core u_clint hold_flag_i", false,-1, 2,0);
        vcdp->declBus(c+28,"tb_top_verilator u_soc_top u_core u_clint data_i", false,-1, 31,0);
        vcdp->declBus(c+125,"tb_top_verilator u_soc_top u_core u_clint csr_mtvec", false,-1, 31,0);
        vcdp->declBus(c+126,"tb_top_verilator u_soc_top u_core u_clint csr_mepc", false,-1, 31,0);
        vcdp->declBus(c+127,"tb_top_verilator u_soc_top u_core u_clint csr_mstatus", false,-1, 31,0);
        vcdp->declBit(c+124,"tb_top_verilator u_soc_top u_core u_clint global_int_en_i", false,-1);
        vcdp->declBit(c+60,"tb_top_verilator u_soc_top u_core u_clint hold_flag_o", false,-1);
        vcdp->declBit(c+132,"tb_top_verilator u_soc_top u_core u_clint we_o", false,-1);
        vcdp->declBus(c+133,"tb_top_verilator u_soc_top u_core u_clint waddr_o", false,-1, 31,0);
        vcdp->declBus(c+297,"tb_top_verilator u_soc_top u_core u_clint raddr_o", false,-1, 31,0);
        vcdp->declBus(c+134,"tb_top_verilator u_soc_top u_core u_clint data_o", false,-1, 31,0);
        vcdp->declBus(c+135,"tb_top_verilator u_soc_top u_core u_clint int_addr_o", false,-1, 31,0);
        vcdp->declBit(c+136,"tb_top_verilator u_soc_top u_core u_clint int_assert_o", false,-1);
        vcdp->declBus(c+307,"tb_top_verilator u_soc_top u_core u_clint S_INT_IDLE", false,-1, 3,0);
        vcdp->declBus(c+308,"tb_top_verilator u_soc_top u_core u_clint S_INT_SYNC_ASSERT", false,-1, 3,0);
        vcdp->declBus(c+309,"tb_top_verilator u_soc_top u_core u_clint S_INT_ASYNC_ASSERT", false,-1, 3,0);
        vcdp->declBus(c+310,"tb_top_verilator u_soc_top u_core u_clint S_INT_MRET", false,-1, 3,0);
        vcdp->declBus(c+311,"tb_top_verilator u_soc_top u_core u_clint S_CSR_IDLE", false,-1, 4,0);
        vcdp->declBus(c+312,"tb_top_verilator u_soc_top u_core u_clint S_CSR_MSTATUS", false,-1, 4,0);
        vcdp->declBus(c+313,"tb_top_verilator u_soc_top u_core u_clint S_CSR_MEPC", false,-1, 4,0);
        vcdp->declBus(c+314,"tb_top_verilator u_soc_top u_core u_clint S_CSR_MSTATUS_MRET", false,-1, 4,0);
        vcdp->declBus(c+315,"tb_top_verilator u_soc_top u_core u_clint S_CSR_MCAUSE", false,-1, 4,0);
        vcdp->declBus(c+79,"tb_top_verilator u_soc_top u_core u_clint int_state", false,-1, 3,0);
        vcdp->declBus(c+180,"tb_top_verilator u_soc_top u_core u_clint csr_state", false,-1, 4,0);
        vcdp->declBus(c+181,"tb_top_verilator u_soc_top u_core u_clint inst_addr", false,-1, 31,0);
        vcdp->declBus(c+182,"tb_top_verilator u_soc_top u_core u_clint cause", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_core u_bus clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_core u_bus rst", false,-1);
        vcdp->declBus(c+1,"tb_top_verilator u_soc_top u_core u_bus m0_addr_i", false,-1, 31,0);
        vcdp->declBus(c+62,"tb_top_verilator u_soc_top u_core u_bus m0_data_i", false,-1, 31,0);
        vcdp->declBus(c+63,"tb_top_verilator u_soc_top u_core u_bus m0_data_o", false,-1, 31,0);
        vcdp->declBit(c+2,"tb_top_verilator u_soc_top u_core u_bus m0_req_i", false,-1);
        vcdp->declBit(c+3,"tb_top_verilator u_soc_top u_core u_bus m0_we_i", false,-1);
        vcdp->declBus(c+106,"tb_top_verilator u_soc_top u_core u_bus m1_addr_i", false,-1, 31,0);
        vcdp->declBus(c+300,"tb_top_verilator u_soc_top u_core u_bus m1_data_i", false,-1, 31,0);
        vcdp->declBus(c+64,"tb_top_verilator u_soc_top u_core u_bus m1_data_o", false,-1, 31,0);
        vcdp->declBit(c+316,"tb_top_verilator u_soc_top u_core u_bus m1_req_i", false,-1);
        vcdp->declBit(c+304,"tb_top_verilator u_soc_top u_core u_bus m1_we_i", false,-1);
        vcdp->declBus(c+317,"tb_top_verilator u_soc_top u_core u_bus m2_addr_i", false,-1, 31,0);
        vcdp->declBus(c+318,"tb_top_verilator u_soc_top u_core u_bus m2_data_i", false,-1, 31,0);
        vcdp->declBus(c+80,"tb_top_verilator u_soc_top u_core u_bus m2_data_o", false,-1, 31,0);
        vcdp->declBit(c+319,"tb_top_verilator u_soc_top u_core u_bus m2_req_i", false,-1);
        vcdp->declBit(c+320,"tb_top_verilator u_soc_top u_core u_bus m2_we_i", false,-1);
        vcdp->declBus(c+321,"tb_top_verilator u_soc_top u_core u_bus m3_addr_i", false,-1, 31,0);
        vcdp->declBus(c+322,"tb_top_verilator u_soc_top u_core u_bus m3_data_i", false,-1, 31,0);
        vcdp->declBus(c+81,"tb_top_verilator u_soc_top u_core u_bus m3_data_o", false,-1, 31,0);
        vcdp->declBit(c+323,"tb_top_verilator u_soc_top u_core u_bus m3_req_i", false,-1);
        vcdp->declBit(c+324,"tb_top_verilator u_soc_top u_core u_bus m3_we_i", false,-1);
        vcdp->declBus(c+4,"tb_top_verilator u_soc_top u_core u_bus s0_addr_o", false,-1, 31,0);
        vcdp->declBus(c+65,"tb_top_verilator u_soc_top u_core u_bus s0_data_o", false,-1, 31,0);
        vcdp->declBus(c+66,"tb_top_verilator u_soc_top u_core u_bus s0_data_i", false,-1, 31,0);
        vcdp->declBit(c+5,"tb_top_verilator u_soc_top u_core u_bus s0_we_o", false,-1);
        vcdp->declBus(c+6,"tb_top_verilator u_soc_top u_core u_bus s1_addr_o", false,-1, 31,0);
        vcdp->declBus(c+67,"tb_top_verilator u_soc_top u_core u_bus s1_data_o", false,-1, 31,0);
        vcdp->declBus(c+68,"tb_top_verilator u_soc_top u_core u_bus s1_data_i", false,-1, 31,0);
        vcdp->declBit(c+7,"tb_top_verilator u_soc_top u_core u_bus s1_we_o", false,-1);
        vcdp->declBus(c+50,"tb_top_verilator u_soc_top u_core u_bus s2_addr_o", false,-1, 31,0);
        vcdp->declBus(c+82,"tb_top_verilator u_soc_top u_core u_bus s2_data_o", false,-1, 31,0);
        vcdp->declBus(c+325,"tb_top_verilator u_soc_top u_core u_bus s2_data_i", false,-1, 31,0);
        vcdp->declBit(c+51,"tb_top_verilator u_soc_top u_core u_bus s2_we_o", false,-1);
        vcdp->declBus(c+52,"tb_top_verilator u_soc_top u_core u_bus s3_addr_o", false,-1, 31,0);
        vcdp->declBus(c+83,"tb_top_verilator u_soc_top u_core u_bus s3_data_o", false,-1, 31,0);
        vcdp->declBus(c+326,"tb_top_verilator u_soc_top u_core u_bus s3_data_i", false,-1, 31,0);
        vcdp->declBit(c+53,"tb_top_verilator u_soc_top u_core u_bus s3_we_o", false,-1);
        vcdp->declBus(c+54,"tb_top_verilator u_soc_top u_core u_bus s4_addr_o", false,-1, 31,0);
        vcdp->declBus(c+84,"tb_top_verilator u_soc_top u_core u_bus s4_data_o", false,-1, 31,0);
        vcdp->declBus(c+327,"tb_top_verilator u_soc_top u_core u_bus s4_data_i", false,-1, 31,0);
        vcdp->declBit(c+55,"tb_top_verilator u_soc_top u_core u_bus s4_we_o", false,-1);
        vcdp->declBus(c+56,"tb_top_verilator u_soc_top u_core u_bus s5_addr_o", false,-1, 31,0);
        vcdp->declBus(c+85,"tb_top_verilator u_soc_top u_core u_bus s5_data_o", false,-1, 31,0);
        vcdp->declBus(c+328,"tb_top_verilator u_soc_top u_core u_bus s5_data_i", false,-1, 31,0);
        vcdp->declBit(c+57,"tb_top_verilator u_soc_top u_core u_bus s5_we_o", false,-1);
        vcdp->declBit(c+8,"tb_top_verilator u_soc_top u_core u_bus hold_flag_o", false,-1);
        vcdp->declBus(c+329,"tb_top_verilator u_soc_top u_core u_bus slave_0", false,-1, 3,0);
        vcdp->declBus(c+307,"tb_top_verilator u_soc_top u_core u_bus slave_1", false,-1, 3,0);
        vcdp->declBus(c+308,"tb_top_verilator u_soc_top u_core u_bus slave_2", false,-1, 3,0);
        vcdp->declBus(c+330,"tb_top_verilator u_soc_top u_core u_bus slave_3", false,-1, 3,0);
        vcdp->declBus(c+309,"tb_top_verilator u_soc_top u_core u_bus slave_4", false,-1, 3,0);
        vcdp->declBus(c+331,"tb_top_verilator u_soc_top u_core u_bus slave_5", false,-1, 3,0);
        vcdp->declBus(c+332,"tb_top_verilator u_soc_top u_core u_bus grant0", false,-1, 1,0);
        vcdp->declBus(c+333,"tb_top_verilator u_soc_top u_core u_bus grant1", false,-1, 1,0);
        vcdp->declBus(c+334,"tb_top_verilator u_soc_top u_core u_bus grant2", false,-1, 1,0);
        vcdp->declBus(c+335,"tb_top_verilator u_soc_top u_core u_bus grant3", false,-1, 1,0);
        vcdp->declBus(c+58,"tb_top_verilator u_soc_top u_core u_bus req", false,-1, 3,0);
        vcdp->declBus(c+59,"tb_top_verilator u_soc_top u_core u_bus grant", false,-1, 1,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_rom clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_rom rst", false,-1);
        vcdp->declBit(c+5,"tb_top_verilator u_soc_top u_rom we_i", false,-1);
        vcdp->declBus(c+4,"tb_top_verilator u_soc_top u_rom addr_i", false,-1, 31,0);
        vcdp->declBus(c+65,"tb_top_verilator u_soc_top u_rom data_i", false,-1, 31,0);
        vcdp->declBus(c+66,"tb_top_verilator u_soc_top u_rom data_o", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_ram clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_ram rst", false,-1);
        vcdp->declBit(c+7,"tb_top_verilator u_soc_top u_ram we_i", false,-1);
        vcdp->declBus(c+6,"tb_top_verilator u_soc_top u_ram addr_i", false,-1, 31,0);
        vcdp->declBus(c+67,"tb_top_verilator u_soc_top u_ram data_i", false,-1, 31,0);
        vcdp->declBus(c+68,"tb_top_verilator u_soc_top u_ram data_o", false,-1, 31,0);
        vcdp->declBus(c+336,"tb_top_verilator u_soc_top u_jtag_top DMI_ADDR_BITS", false,-1, 31,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_jtag_top DMI_DATA_BITS", false,-1, 31,0);
        vcdp->declBus(c+337,"tb_top_verilator u_soc_top u_jtag_top DMI_OP_BITS", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_jtag_top clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_jtag_top jtag_rst_n", false,-1);
        vcdp->declBit(c+280,"tb_top_verilator u_soc_top u_jtag_top jtag_pin_TCK", false,-1);
        vcdp->declBit(c+281,"tb_top_verilator u_soc_top u_jtag_top jtag_pin_TMS", false,-1);
        vcdp->declBit(c+282,"tb_top_verilator u_soc_top u_jtag_top jtag_pin_TDI", false,-1);
        vcdp->declBit(c+90,"tb_top_verilator u_soc_top u_jtag_top jtag_pin_TDO", false,-1);
        vcdp->declBit(c+190,"tb_top_verilator u_soc_top u_jtag_top reg_we_o", false,-1);
        vcdp->declBus(c+188,"tb_top_verilator u_soc_top u_jtag_top reg_addr_o", false,-1, 4,0);
        vcdp->declBus(c+189,"tb_top_verilator u_soc_top u_jtag_top reg_wdata_o", false,-1, 31,0);
        vcdp->declBus(c+217,"tb_top_verilator u_soc_top u_jtag_top reg_rdata_i", false,-1, 31,0);
        vcdp->declBit(c+93,"tb_top_verilator u_soc_top u_jtag_top mem_we_o", false,-1);
        vcdp->declBus(c+184,"tb_top_verilator u_soc_top u_jtag_top mem_addr_o", false,-1, 31,0);
        vcdp->declBus(c+92,"tb_top_verilator u_soc_top u_jtag_top mem_wdata_o", false,-1, 31,0);
        vcdp->declBus(c+286,"tb_top_verilator u_soc_top u_jtag_top mem_rdata_i", false,-1, 31,0);
        vcdp->declBit(c+185,"tb_top_verilator u_soc_top u_jtag_top op_req_o", false,-1);
        vcdp->declBit(c+186,"tb_top_verilator u_soc_top u_jtag_top halt_req_o", false,-1);
        vcdp->declBit(c+187,"tb_top_verilator u_soc_top u_jtag_top reset_req_o", false,-1);
        vcdp->declBus(c+338,"tb_top_verilator u_soc_top u_jtag_top DM_RESP_BITS", false,-1, 31,0);
        vcdp->declBus(c+338,"tb_top_verilator u_soc_top u_jtag_top DTM_REQ_BITS", false,-1, 31,0);
        vcdp->declBit(c+252,"tb_top_verilator u_soc_top u_jtag_top dtm_ack_o", false,-1);
        vcdp->declBit(c+276,"tb_top_verilator u_soc_top u_jtag_top dtm_req_valid_o", false,-1);
        vcdp->declQuad(c+253,"tb_top_verilator u_soc_top u_jtag_top dtm_req_data_o", false,-1, 39,0);
        vcdp->declBit(c+270,"tb_top_verilator u_soc_top u_jtag_top dm_ack_o", false,-1);
        vcdp->declQuad(c+191,"tb_top_verilator u_soc_top u_jtag_top dm_resp_data_o", false,-1, 39,0);
        vcdp->declBit(c+271,"tb_top_verilator u_soc_top u_jtag_top dm_resp_valid_o", false,-1);
        vcdp->declBit(c+339,"tb_top_verilator u_soc_top u_jtag_top dm_op_req_o", false,-1);
        vcdp->declBit(c+340,"tb_top_verilator u_soc_top u_jtag_top dm_halt_req_o", false,-1);
        vcdp->declBit(c+341,"tb_top_verilator u_soc_top u_jtag_top dm_reset_req_o", false,-1);
        vcdp->declBus(c+336,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver DMI_ADDR_BITS", false,-1, 31,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver DMI_DATA_BITS", false,-1, 31,0);
        vcdp->declBus(c+337,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver DMI_OP_BITS", false,-1, 31,0);
        vcdp->declBus(c+307,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver IDCODE_VERSION", false,-1, 3,0);
        vcdp->declBus(c+342,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver IDCODE_PART_NUMBER", false,-1, 15,0);
        vcdp->declBus(c+343,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver IDCODE_MANUFLD", false,-1, 10,0);
        vcdp->declBus(c+307,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver DTM_VERSION", false,-1, 3,0);
        vcdp->declBus(c+305,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver IR_BITS", false,-1, 31,0);
        vcdp->declBus(c+338,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver DM_RESP_BITS", false,-1, 31,0);
        vcdp->declBus(c+338,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver DTM_REQ_BITS", false,-1, 31,0);
        vcdp->declBus(c+338,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver SHIFT_REG_BITS", false,-1, 31,0);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rst_n", false,-1);
        vcdp->declBit(c+280,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver jtag_TCK", false,-1);
        vcdp->declBit(c+282,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver jtag_TDI", false,-1);
        vcdp->declBit(c+281,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver jtag_TMS", false,-1);
        vcdp->declBit(c+90,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver jtag_TDO", false,-1);
        vcdp->declBit(c+271,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver dm_resp_i", false,-1);
        vcdp->declQuad(c+191,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver dm_resp_data_i", false,-1, 39,0);
        vcdp->declBit(c+252,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver dtm_ack_o", false,-1);
        vcdp->declBit(c+270,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver dm_ack_i", false,-1);
        vcdp->declBit(c+276,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver dtm_req_valid_o", false,-1);
        vcdp->declQuad(c+253,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver dtm_req_data_o", false,-1, 39,0);
        vcdp->declBus(c+329,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver TEST_LOGIC_RESET", false,-1, 3,0);
        vcdp->declBus(c+307,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver RUN_TEST_IDLE", false,-1, 3,0);
        vcdp->declBus(c+308,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver SELECT_DR", false,-1, 3,0);
        vcdp->declBus(c+330,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver CAPTURE_DR", false,-1, 3,0);
        vcdp->declBus(c+309,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver SHIFT_DR", false,-1, 3,0);
        vcdp->declBus(c+331,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver EXIT1_DR", false,-1, 3,0);
        vcdp->declBus(c+344,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver PAUSE_DR", false,-1, 3,0);
        vcdp->declBus(c+345,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver EXIT2_DR", false,-1, 3,0);
        vcdp->declBus(c+310,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver UPDATE_DR", false,-1, 3,0);
        vcdp->declBus(c+346,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver SELECT_IR", false,-1, 3,0);
        vcdp->declBus(c+347,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver CAPTURE_IR", false,-1, 3,0);
        vcdp->declBus(c+348,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver SHIFT_IR", false,-1, 3,0);
        vcdp->declBus(c+349,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver EXIT1_IR", false,-1, 3,0);
        vcdp->declBus(c+350,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver PAUSE_IR", false,-1, 3,0);
        vcdp->declBus(c+351,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver EXIT2_IR", false,-1, 3,0);
        vcdp->declBus(c+352,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver UPDATE_IR", false,-1, 3,0);
        vcdp->declBus(c+353,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver REG_BYPASS", false,-1, 4,0);
        vcdp->declBus(c+311,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver REG_IDCODE", false,-1, 4,0);
        vcdp->declBus(c+354,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver REG_DMI", false,-1, 4,0);
        vcdp->declBus(c+315,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver REG_DTMCS", false,-1, 4,0);
        vcdp->declBus(c+269,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver ir_reg", false,-1, 4,0);
        vcdp->declQuad(c+266,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver shift_reg", false,-1, 39,0);
        vcdp->declBus(c+277,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver jtag_state", false,-1, 3,0);
        vcdp->declBit(c+86,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver is_busy", false,-1);
        vcdp->declBit(c+97,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver sticky_busy", false,-1);
        vcdp->declBit(c+255,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver dtm_req_valid", false,-1);
        vcdp->declQuad(c+256,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver dtm_req_data", false,-1, 39,0);
        vcdp->declQuad(c+98,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver dm_resp_data", false,-1, 39,0);
        vcdp->declBit(c+100,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver dm_is_busy", false,-1);
        vcdp->declBus(c+355,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver addr_bits", false,-1, 5,0);
        vcdp->declQuad(c+356,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver busy_response", false,-1, 39,0);
        vcdp->declQuad(c+98,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver none_busy_response", false,-1, 39,0);
        vcdp->declBus(c+358,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver idcode", false,-1, 31,0);
        vcdp->declBus(c+87,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver dtmcs", false,-1, 31,0);
        vcdp->declBus(c+88,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver dmi_stat", false,-1, 1,0);
        vcdp->declBit(c+268,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver dtm_reset", false,-1);
        vcdp->declBit(c+258,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx_idle", false,-1);
        vcdp->declBit(c+101,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx_valid", false,-1);
        vcdp->declQuad(c+102,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx_data", false,-1, 39,0);
        vcdp->declBit(c+255,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx_valid", false,-1);
        vcdp->declQuad(c+256,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx_data", false,-1, 39,0);
        vcdp->declBus(c+338,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx DW", false,-1, 31,0);
        vcdp->declBit(c+280,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx rst_n", false,-1);
        vcdp->declBit(c+270,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx ack_i", false,-1);
        vcdp->declBit(c+255,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx req_i", false,-1);
        vcdp->declQuad(c+256,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx req_data_i", false,-1, 39,0);
        vcdp->declBit(c+258,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx idle_o", false,-1);
        vcdp->declBit(c+276,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx req_o", false,-1);
        vcdp->declQuad(c+253,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx req_data_o", false,-1, 39,0);
        vcdp->declBus(c+359,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx STATE_IDLE", false,-1, 2,0);
        vcdp->declBus(c+360,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx STATE_ASSERT", false,-1, 2,0);
        vcdp->declBus(c+361,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx STATE_DEASSERT", false,-1, 2,0);
        vcdp->declBus(c+259,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx state", false,-1, 2,0);
        vcdp->declBus(c+89,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx state_next", false,-1, 2,0);
        vcdp->declBit(c+260,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx ack", false,-1);
        vcdp->declBit(c+261,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx ack_d", false,-1);
        vcdp->declBit(c+276,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx req", false,-1);
        vcdp->declQuad(c+253,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx req_data", false,-1, 39,0);
        vcdp->declBit(c+258,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver tx idle", false,-1);
        vcdp->declBus(c+338,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx DW", false,-1, 31,0);
        vcdp->declBit(c+280,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx rst_n", false,-1);
        vcdp->declBit(c+271,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx req_i", false,-1);
        vcdp->declQuad(c+191,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx req_data_i", false,-1, 39,0);
        vcdp->declBit(c+252,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx ack_o", false,-1);
        vcdp->declQuad(c+102,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx recv_data_o", false,-1, 39,0);
        vcdp->declBit(c+101,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx recv_rdy_o", false,-1);
        vcdp->declBus(c+333,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx STATE_IDLE", false,-1, 1,0);
        vcdp->declBus(c+334,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx STATE_DEASSERT", false,-1, 1,0);
        vcdp->declBus(c+262,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx state", false,-1, 1,0);
        vcdp->declBus(c+263,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx state_next", false,-1, 1,0);
        vcdp->declBit(c+264,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx req", false,-1);
        vcdp->declBit(c+265,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx req_d", false,-1);
        vcdp->declQuad(c+102,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx recv_data", false,-1, 39,0);
        vcdp->declBit(c+101,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx recv_rdy", false,-1);
        vcdp->declBit(c+252,"tb_top_verilator u_soc_top u_jtag_top u_jtag_driver rx ack", false,-1);
        vcdp->declBus(c+336,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm DMI_ADDR_BITS", false,-1, 31,0);
        vcdp->declBus(c+298,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm DMI_DATA_BITS", false,-1, 31,0);
        vcdp->declBus(c+337,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm DMI_OP_BITS", false,-1, 31,0);
        vcdp->declBus(c+338,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm DM_RESP_BITS", false,-1, 31,0);
        vcdp->declBus(c+338,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm DTM_REQ_BITS", false,-1, 31,0);
        vcdp->declBus(c+338,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm SHIFT_REG_BITS", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rst_n", false,-1);
        vcdp->declBit(c+270,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_ack_o", false,-1);
        vcdp->declBit(c+276,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dtm_req_valid_i", false,-1);
        vcdp->declQuad(c+253,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dtm_req_data_i", false,-1, 39,0);
        vcdp->declBit(c+252,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dtm_ack_i", false,-1);
        vcdp->declQuad(c+191,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_resp_data_o", false,-1, 39,0);
        vcdp->declBit(c+271,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_resp_valid_o", false,-1);
        vcdp->declBit(c+190,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_reg_we_o", false,-1);
        vcdp->declBus(c+188,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_reg_addr_o", false,-1, 4,0);
        vcdp->declBus(c+189,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_reg_wdata_o", false,-1, 31,0);
        vcdp->declBus(c+217,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_reg_rdata_i", false,-1, 31,0);
        vcdp->declBit(c+93,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_mem_we_o", false,-1);
        vcdp->declBus(c+184,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_mem_addr_o", false,-1, 31,0);
        vcdp->declBus(c+92,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_mem_wdata_o", false,-1, 31,0);
        vcdp->declBus(c+286,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_mem_rdata_i", false,-1, 31,0);
        vcdp->declBit(c+185,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_op_req_o", false,-1);
        vcdp->declBit(c+186,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_halt_req_o", false,-1);
        vcdp->declBit(c+187,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_reset_req_o", false,-1);
        vcdp->declBus(c+193,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dcsr", false,-1, 31,0);
        vcdp->declBus(c+194,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dmstatus", false,-1, 31,0);
        vcdp->declBus(c+195,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dmcontrol", false,-1, 31,0);
        vcdp->declBus(c+196,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm hartinfo", false,-1, 31,0);
        vcdp->declBus(c+197,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm abstractcs", false,-1, 31,0);
        vcdp->declBus(c+198,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm data0", false,-1, 31,0);
        vcdp->declBus(c+199,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm sbcs", false,-1, 31,0);
        vcdp->declBus(c+200,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm sbaddress0", false,-1, 31,0);
        vcdp->declBus(c+94,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm sbdata0", false,-1, 31,0);
        vcdp->declBus(c+95,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm command", false,-1, 31,0);
        vcdp->declBus(c+362,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm DCSR", false,-1, 15,0);
        vcdp->declBus(c+363,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm DMSTATUS", false,-1, 5,0);
        vcdp->declBus(c+364,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm DMCONTROL", false,-1, 5,0);
        vcdp->declBus(c+365,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm HARTINFO", false,-1, 5,0);
        vcdp->declBus(c+366,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm ABSTRACTCS", false,-1, 5,0);
        vcdp->declBus(c+367,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm DATA0", false,-1, 5,0);
        vcdp->declBus(c+368,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm SBCS", false,-1, 5,0);
        vcdp->declBus(c+369,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm SBADDRESS0", false,-1, 5,0);
        vcdp->declBus(c+370,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm SBDATA0", false,-1, 5,0);
        vcdp->declBus(c+371,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm COMMAND", false,-1, 5,0);
        vcdp->declBus(c+372,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm DPC", false,-1, 15,0);
        vcdp->declBus(c+332,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm OP_SUCC", false,-1, 1,0);
        vcdp->declBus(c+201,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm read_data", false,-1, 31,0);
        vcdp->declBit(c+190,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_reg_we", false,-1);
        vcdp->declBus(c+188,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_reg_addr", false,-1, 4,0);
        vcdp->declBus(c+189,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_reg_wdata", false,-1, 31,0);
        vcdp->declBit(c+93,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_mem_we", false,-1);
        vcdp->declBus(c+184,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_mem_addr", false,-1, 31,0);
        vcdp->declBus(c+92,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_mem_wdata", false,-1, 31,0);
        vcdp->declBit(c+186,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_halt_req", false,-1);
        vcdp->declBit(c+187,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_reset_req", false,-1);
        vcdp->declBit(c+202,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm need_resp", false,-1);
        vcdp->declBit(c+203,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm is_read_reg", false,-1);
        vcdp->declBit(c+204,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx_valid", false,-1);
        vcdp->declQuad(c+205,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx_data", false,-1, 39,0);
        vcdp->declBus(c+207,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm sbaddress0_next", false,-1, 31,0);
        vcdp->declQuad(c+208,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm dm_resp_data", false,-1, 39,0);
        vcdp->declBus(c+210,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm op", false,-1, 1,0);
        vcdp->declBus(c+211,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm data", false,-1, 31,0);
        vcdp->declBus(c+212,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm address", false,-1, 5,0);
        vcdp->declBit(c+213,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm read_dmstatus", false,-1);
        vcdp->declBus(c+338,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx rst_n", false,-1);
        vcdp->declBit(c+252,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx ack_i", false,-1);
        vcdp->declBit(c+202,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx req_i", false,-1);
        vcdp->declQuad(c+208,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx req_data_i", false,-1, 39,0);
        vcdp->declBit(c+96,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx idle_o", false,-1);
        vcdp->declBit(c+271,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx req_o", false,-1);
        vcdp->declQuad(c+191,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx req_data_o", false,-1, 39,0);
        vcdp->declBus(c+359,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx STATE_IDLE", false,-1, 2,0);
        vcdp->declBus(c+360,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx STATE_ASSERT", false,-1, 2,0);
        vcdp->declBus(c+361,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx STATE_DEASSERT", false,-1, 2,0);
        vcdp->declBus(c+214,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx state", false,-1, 2,0);
        vcdp->declBus(c+61,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx state_next", false,-1, 2,0);
        vcdp->declBit(c+215,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx ack", false,-1);
        vcdp->declBit(c+216,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx ack_d", false,-1);
        vcdp->declBit(c+271,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx req", false,-1);
        vcdp->declQuad(c+191,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx req_data", false,-1, 39,0);
        vcdp->declBit(c+96,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm tx idle", false,-1);
        vcdp->declBus(c+338,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx DW", false,-1, 31,0);
        vcdp->declBit(c+278,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx clk", false,-1);
        vcdp->declBit(c+279,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx rst_n", false,-1);
        vcdp->declBit(c+276,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx req_i", false,-1);
        vcdp->declQuad(c+253,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx req_data_i", false,-1, 39,0);
        vcdp->declBit(c+270,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx ack_o", false,-1);
        vcdp->declQuad(c+205,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx recv_data_o", false,-1, 39,0);
        vcdp->declBit(c+204,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx recv_rdy_o", false,-1);
        vcdp->declBus(c+333,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx STATE_IDLE", false,-1, 1,0);
        vcdp->declBus(c+334,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx STATE_DEASSERT", false,-1, 1,0);
        vcdp->declBus(c+272,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx state", false,-1, 1,0);
        vcdp->declBus(c+273,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx state_next", false,-1, 1,0);
        vcdp->declBit(c+274,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx req", false,-1);
        vcdp->declBit(c+275,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx req_d", false,-1);
        vcdp->declQuad(c+205,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx recv_data", false,-1, 39,0);
        vcdp->declBit(c+204,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx recv_rdy", false,-1);
        vcdp->declBit(c+270,"tb_top_verilator u_soc_top u_jtag_top u_jtag_dm rx ack", false,-1);
    }
}

void Vtb_top_verilator::traceFullThis__1(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+1);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->fullIData(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i),32);
        vcdp->fullBit(oldp+1,(((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
                               & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req))));
        vcdp->fullBit(oldp+2,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o));
        vcdp->fullIData(oldp+3,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o),32);
        vcdp->fullBit(oldp+4,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o));
        vcdp->fullIData(oldp+5,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o),32);
        vcdp->fullBit(oldp+6,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o));
        vcdp->fullBit(oldp+7,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o));
        vcdp->fullCData(oldp+8,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg1_raddr_o),5);
        vcdp->fullCData(oldp+9,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg2_raddr_o),5);
        vcdp->fullBit(oldp+10,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_we_o));
        vcdp->fullCData(oldp+11,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_waddr_o),5);
        vcdp->fullIData(oldp+12,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o),32);
        vcdp->fullBit(oldp+13,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_we_o));
        vcdp->fullIData(oldp+14,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__csr_data_o),32);
        vcdp->fullIData(oldp+15,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_waddr_o),32);
        vcdp->fullIData(oldp+16,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o),32);
        vcdp->fullIData(oldp+17,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o),32);
        vcdp->fullIData(oldp+18,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o),32);
        vcdp->fullBit(oldp+19,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_we_o));
        vcdp->fullCData(oldp+20,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_waddr_o),5);
        vcdp->fullBit(oldp+21,((1U & ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag) 
                                      | (((0x33U == 
                                           (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                          & (1U == 
                                             (0x7fU 
                                              & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                 >> 0x19U))))
                                          ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                             >> 0xeU)
                                          : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o))))));
        vcdp->fullBit(oldp+22,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_flag_o));
        vcdp->fullIData(oldp+23,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_addr_o),32);
        vcdp->fullBit(oldp+24,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_div_start_o));
        vcdp->fullIData(oldp+25,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o),32);
        vcdp->fullBit(oldp+26,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o));
        vcdp->fullIData(oldp+27,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__csr_clint_data_o),32);
        vcdp->fullCData(oldp+28,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index),2);
        vcdp->fullCData(oldp+29,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index),2);
        vcdp->fullQData(oldp+30,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp),64);
        vcdp->fullQData(oldp+32,((VL_ULL(1) + (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp))),64);
        vcdp->fullIData(oldp+34,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res),32);
        vcdp->fullIData(oldp+35,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res),32);
        vcdp->fullBit(oldp+36,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed));
        vcdp->fullBit(oldp+37,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned));
        vcdp->fullBit(oldp+38,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2));
        vcdp->fullIData(oldp+39,((((0x33U == (0x7fU 
                                              & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                   & (1U == (0x7fU 
                                             & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                >> 0x19U))))
                                   ? ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                       ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res
                                       : 0U) : 0U)),32);
        vcdp->fullBit(oldp+40,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag));
        vcdp->fullBit(oldp+41,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag));
        vcdp->fullIData(oldp+42,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr),32);
        vcdp->fullBit(oldp+43,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we));
        vcdp->fullBit(oldp+44,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req));
        vcdp->fullBit(oldp+45,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor));
        vcdp->fullIData(oldp+46,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_sub_res),32);
        vcdp->fullIData(oldp+47,(((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor)
                                   ? (1U | (0xfffffffeU 
                                            & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result 
                                               << 1U)))
                                   : (0xfffffffeU & 
                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result 
                                       << 1U)))),32);
        vcdp->fullIData(oldp+48,(((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor)
                                   ? (0x7fffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_sub_res)
                                   : (0x7fffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend))),32);
        vcdp->fullIData(oldp+49,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o),32);
        vcdp->fullBit(oldp+50,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o));
        vcdp->fullIData(oldp+51,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o),32);
        vcdp->fullBit(oldp+52,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o));
        vcdp->fullIData(oldp+53,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o),32);
        vcdp->fullBit(oldp+54,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o));
        vcdp->fullIData(oldp+55,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o),32);
        vcdp->fullBit(oldp+56,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o));
        vcdp->fullCData(oldp+57,((2U | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_req_i) 
                                         << 3U) | (
                                                   ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_req_i) 
                                                    << 2U) 
                                                   | ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
                                                      & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req)))))),4);
        vcdp->fullCData(oldp+58,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant),2);
        vcdp->fullBit(oldp+59,(((1U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__int_state)) 
                                | (1U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state)))));
        vcdp->fullCData(oldp+60,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next),3);
        vcdp->fullIData(oldp+61,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o),32);
        vcdp->fullIData(oldp+62,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o),32);
        vcdp->fullIData(oldp+63,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m1_data_o),32);
        vcdp->fullIData(oldp+64,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o),32);
        vcdp->fullIData(oldp+65,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i),32);
        vcdp->fullIData(oldp+66,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o),32);
        vcdp->fullIData(oldp+67,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i),32);
        vcdp->fullIData(oldp+68,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o),32);
        vcdp->fullIData(oldp+69,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o),32);
        vcdp->fullIData(oldp+70,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o),32);
        vcdp->fullIData(oldp+71,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o),32);
        vcdp->fullIData(oldp+72,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o),32);
        vcdp->fullIData(oldp+73,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_wdata_o),32);
        vcdp->fullCData(oldp+74,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o),3);
        vcdp->fullBit(oldp+75,((2U <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))));
        vcdp->fullBit(oldp+76,((3U <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))));
        vcdp->fullIData(oldp+77,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__reg_wdata),32);
        vcdp->fullCData(oldp+78,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__int_state),4);
        vcdp->fullIData(oldp+79,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_o),32);
        vcdp->fullIData(oldp+80,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_o),32);
        vcdp->fullIData(oldp+81,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o),32);
        vcdp->fullIData(oldp+82,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o),32);
        vcdp->fullIData(oldp+83,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o),32);
        vcdp->fullIData(oldp+84,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o),32);
        vcdp->fullBit(oldp+85,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy));
        vcdp->fullIData(oldp+86,((0x5061U | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy)
                                               ? 1U
                                               : 0U) 
                                             << 0xaU))),32);
        vcdp->fullCData(oldp+87,(((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy)
                                   ? 1U : 0U)),2);
        vcdp->fullCData(oldp+88,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next),3);
        vcdp->fullBit(oldp+89,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDO));
        vcdp->fullBit(oldp+90,(vlTOPp->tb_top_verilator__DOT__result_printed));
        vcdp->fullIData(oldp+91,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_wdata),32);
        vcdp->fullBit(oldp+92,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_we));
        vcdp->fullIData(oldp+93,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbdata0),32);
        vcdp->fullIData(oldp+94,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__command),32);
        vcdp->fullBit(oldp+95,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__idle));
        vcdp->fullBit(oldp+96,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__sticky_busy));
        vcdp->fullQData(oldp+97,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_resp_data),40);
        vcdp->fullBit(oldp+99,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_is_busy));
        vcdp->fullBit(oldp+100,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_rdy));
        vcdp->fullQData(oldp+101,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_data),40);
        vcdp->fullBit(oldp+103,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__over));
        vcdp->fullBit(oldp+104,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__succ));
        vcdp->fullIData(oldp+105,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o),32);
        vcdp->fullIData(oldp+106,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r),32);
        vcdp->fullIData(oldp+107,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r),32);
        vcdp->fullCData(oldp+108,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__int_ff__DOT__qout_r),8);
        vcdp->fullIData(oldp+109,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r),32);
        vcdp->fullIData(oldp+110,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_addr_ff__DOT__qout_r),32);
        vcdp->fullBit(oldp+111,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_we_ff__DOT__qout_r));
        vcdp->fullCData(oldp+112,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_waddr_ff__DOT__qout_r),5);
        vcdp->fullIData(oldp+113,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r),32);
        vcdp->fullIData(oldp+114,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r),32);
        vcdp->fullBit(oldp+115,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_we_ff__DOT__qout_r));
        vcdp->fullIData(oldp+116,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r),32);
        vcdp->fullIData(oldp+117,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r),32);
        vcdp->fullIData(oldp+118,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r),32);
        vcdp->fullIData(oldp+119,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r),32);
        vcdp->fullIData(oldp+120,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_jump_ff__DOT__qout_r),32);
        vcdp->fullIData(oldp+121,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_jump_ff__DOT__qout_r),32);
        vcdp->fullCData(oldp+122,((7U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                         >> 0xcU))),3);
        vcdp->fullBit(oldp+123,((1U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus 
                                       >> 3U))));
        vcdp->fullIData(oldp+124,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mtvec),32);
        vcdp->fullIData(oldp+125,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mepc),32);
        vcdp->fullIData(oldp+126,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus),32);
        vcdp->fullIData(oldp+127,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o),32);
        vcdp->fullBit(oldp+128,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o));
        vcdp->fullBit(oldp+129,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o));
        vcdp->fullCData(oldp+130,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_reg_waddr_o),5);
        vcdp->fullBit(oldp+131,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_we_o));
        vcdp->fullIData(oldp+132,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o),32);
        vcdp->fullIData(oldp+133,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o),32);
        vcdp->fullIData(oldp+134,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_addr_o),32);
        vcdp->fullBit(oldp+135,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o));
        vcdp->fullQData(oldp+136,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle),64);
        vcdp->fullIData(oldp+138,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mcause),32);
        vcdp->fullIData(oldp+139,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mie),32);
        vcdp->fullIData(oldp+140,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mscratch),32);
        vcdp->fullCData(oldp+141,((0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)),7);
        vcdp->fullCData(oldp+142,((7U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                         >> 0xcU))),3);
        vcdp->fullCData(oldp+143,((0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                            >> 0x19U))),7);
        vcdp->fullCData(oldp+144,((0x1fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                            >> 7U))),5);
        vcdp->fullCData(oldp+145,((0x1fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                            >> 0xfU))),5);
        vcdp->fullCData(oldp+146,((0x1fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                            >> 0x14U))),5);
        vcdp->fullIData(oldp+147,((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                   >> (0x1fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))),32);
        vcdp->fullIData(oldp+148,((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                   >> (0x1fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                >> 0x14U)))),32);
        vcdp->fullIData(oldp+149,((0xffffffffU >> (0x1fU 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))),32);
        vcdp->fullIData(oldp+150,((0xffffffffU >> (0x1fU 
                                                   & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                      >> 0x14U)))),32);
        vcdp->fullIData(oldp+151,(((IData)(1U) + (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))),32);
        vcdp->fullIData(oldp+152,(((IData)(1U) + (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))),32);
        vcdp->fullIData(oldp+153,((((0x33U == (0x7fU 
                                               & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                    & (1U == (0x7fU 
                                              & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                 >> 0x19U))))
                                    ? ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                        ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r
                                        : ((0x2000U 
                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                            ? ((0x1000U 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r
                                                : (
                                                   (0x80000000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                                    ? 
                                                   ((IData)(1U) 
                                                    + 
                                                    (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                                    : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                            : ((0x1000U 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                ? (
                                                   (0x80000000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                                    ? 
                                                   ((IData)(1U) 
                                                    + 
                                                    (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                                    : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)))
                                    : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)),32);
        vcdp->fullIData(oldp+154,((((0x33U == (0x7fU 
                                               & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                    & (1U == (0x7fU 
                                              & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                 >> 0x19U))))
                                    ? ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                        ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r
                                        : ((0x2000U 
                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                            ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r
                                            : ((0x1000U 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                ? (
                                                   (0x80000000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)
                                                    ? 
                                                   ((IData)(1U) 
                                                    + 
                                                    (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))
                                                    : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)
                                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)))
                                    : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)),32);
        vcdp->fullCData(oldp+155,((0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)),7);
        vcdp->fullCData(oldp+156,((0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                            >> 0x19U))),7);
        vcdp->fullCData(oldp+157,((0x1fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                            >> 7U))),5);
        vcdp->fullCData(oldp+158,((0x1fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                            >> 0xfU))),5);
        vcdp->fullIData(oldp+159,((((0x33U == (0x7fU 
                                               & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                    & (1U == (0x7fU 
                                              & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                 >> 0x19U))))
                                    ? 0U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)
                                             ? 0U : 
                                            ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o)
                                              ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o
                                              : 0U)))),32);
        vcdp->fullBit(oldp+160,(((~ ((0x33U == (0x7fU 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                     & (1U == (0x7fU 
                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0x19U))))) 
                                 & ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)) 
                                    & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o)))));
        vcdp->fullCData(oldp+161,((((0x33U == (0x7fU 
                                               & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                    & (1U == (0x7fU 
                                              & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                 >> 0x19U))))
                                    ? 0U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)
                                             ? 0U : 
                                            ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o)
                                              ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_reg_waddr_o)
                                              : 0U)))),5);
        vcdp->fullBit(oldp+162,((1U & (((0x33U == (0x7fU 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                        & (1U == (0x7fU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x19U))))
                                        ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                           >> 0xeU)
                                        : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)))));
        vcdp->fullBit(oldp+163,((((0x33U == (0x7fU 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                  & (1U == (0x7fU & 
                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                             >> 0x19U)))) 
                                 & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                    >> 0xeU))));
        vcdp->fullIData(oldp+164,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r),32);
        vcdp->fullIData(oldp+165,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r),32);
        vcdp->fullCData(oldp+166,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r),3);
        vcdp->fullCData(oldp+167,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state),4);
        vcdp->fullIData(oldp+168,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count),32);
        vcdp->fullIData(oldp+169,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result),32);
        vcdp->fullIData(oldp+170,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain),32);
        vcdp->fullIData(oldp+171,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend),32);
        vcdp->fullBit(oldp+172,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__invert_result));
        vcdp->fullBit(oldp+173,((4U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r))));
        vcdp->fullBit(oldp+174,((5U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r))));
        vcdp->fullBit(oldp+175,((6U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r))));
        vcdp->fullBit(oldp+176,((7U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r))));
        vcdp->fullIData(oldp+177,((- vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r)),32);
        vcdp->fullIData(oldp+178,((- vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r)),32);
        vcdp->fullCData(oldp+179,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state),5);
        vcdp->fullIData(oldp+180,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__inst_addr),32);
        vcdp->fullIData(oldp+181,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__cause),32);
        vcdp->fullBit(oldp+182,((1U & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req)))));
        vcdp->fullIData(oldp+183,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_addr),32);
        vcdp->fullBit(oldp+184,((((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) 
                                  & (~ ((1U == (3U 
                                                & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data))) 
                                        & (0x11U == 
                                           (0x3fU & (IData)(
                                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                             >> 0x22U))))))) 
                                 | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__need_resp))));
        vcdp->fullBit(oldp+185,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req));
        vcdp->fullBit(oldp+186,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reset_req));
        vcdp->fullCData(oldp+187,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr),5);
        vcdp->fullIData(oldp+188,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_wdata),32);
        vcdp->fullBit(oldp+189,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_we));
        vcdp->fullQData(oldp+190,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req_data),40);
        vcdp->fullIData(oldp+192,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dcsr),32);
        vcdp->fullIData(oldp+193,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus),32);
        vcdp->fullIData(oldp+194,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmcontrol),32);
        vcdp->fullIData(oldp+195,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__hartinfo),32);
        vcdp->fullIData(oldp+196,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs),32);
        vcdp->fullIData(oldp+197,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__data0),32);
        vcdp->fullIData(oldp+198,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbcs),32);
        vcdp->fullIData(oldp+199,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0),32);
        vcdp->fullIData(oldp+200,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data),32);
        vcdp->fullBit(oldp+201,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__need_resp));
        vcdp->fullBit(oldp+202,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__is_read_reg));
        vcdp->fullBit(oldp+203,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy));
        vcdp->fullQData(oldp+204,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data),40);
        vcdp->fullIData(oldp+206,(((IData)(4U) + vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0)),32);
        vcdp->fullQData(oldp+207,((((QData)((IData)(
                                                    (0x3fU 
                                                     & (IData)(
                                                               (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                                >> 0x22U))))) 
                                    << 0x22U) | ((QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data)) 
                                                 << 2U))),40);
        vcdp->fullCData(oldp+209,((3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data))),2);
        vcdp->fullIData(oldp+210,((IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                           >> 2U))),32);
        vcdp->fullCData(oldp+211,((0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U)))),6);
        vcdp->fullBit(oldp+212,(((1U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data))) 
                                 & (0x11U == (0x3fU 
                                              & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x22U)))))));
        vcdp->fullCData(oldp+213,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state),3);
        vcdp->fullBit(oldp+214,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack));
        vcdp->fullBit(oldp+215,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack_d));
        vcdp->fullIData(oldp+216,(((0U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr))
                                    ? 0U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                                   [vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr])),32);
        vcdp->fullIData(oldp+217,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                                  [0x1aU]),32);
        vcdp->fullIData(oldp+218,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                                  [0x1bU]),32);
        vcdp->fullIData(oldp+219,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[0]),32);
        vcdp->fullIData(oldp+220,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[1]),32);
        vcdp->fullIData(oldp+221,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[2]),32);
        vcdp->fullIData(oldp+222,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[3]),32);
        vcdp->fullIData(oldp+223,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[4]),32);
        vcdp->fullIData(oldp+224,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[5]),32);
        vcdp->fullIData(oldp+225,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[6]),32);
        vcdp->fullIData(oldp+226,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[7]),32);
        vcdp->fullIData(oldp+227,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[8]),32);
        vcdp->fullIData(oldp+228,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[9]),32);
        vcdp->fullIData(oldp+229,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[10]),32);
        vcdp->fullIData(oldp+230,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[11]),32);
        vcdp->fullIData(oldp+231,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[12]),32);
        vcdp->fullIData(oldp+232,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[13]),32);
        vcdp->fullIData(oldp+233,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[14]),32);
        vcdp->fullIData(oldp+234,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[15]),32);
        vcdp->fullIData(oldp+235,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[16]),32);
        vcdp->fullIData(oldp+236,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[17]),32);
        vcdp->fullIData(oldp+237,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[18]),32);
        vcdp->fullIData(oldp+238,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[19]),32);
        vcdp->fullIData(oldp+239,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[20]),32);
        vcdp->fullIData(oldp+240,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[21]),32);
        vcdp->fullIData(oldp+241,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[22]),32);
        vcdp->fullIData(oldp+242,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[23]),32);
        vcdp->fullIData(oldp+243,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[24]),32);
        vcdp->fullIData(oldp+244,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[25]),32);
        vcdp->fullIData(oldp+245,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[26]),32);
        vcdp->fullIData(oldp+246,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[27]),32);
        vcdp->fullIData(oldp+247,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[28]),32);
        vcdp->fullIData(oldp+248,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[29]),32);
        vcdp->fullIData(oldp+249,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[30]),32);
        vcdp->fullIData(oldp+250,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[31]),32);
        vcdp->fullBit(oldp+251,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__ack));
        vcdp->fullQData(oldp+252,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req_data),40);
        vcdp->fullBit(oldp+254,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_valid));
        vcdp->fullQData(oldp+255,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_data),40);
        vcdp->fullBit(oldp+257,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle));
        vcdp->fullCData(oldp+258,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state),3);
        vcdp->fullBit(oldp+259,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack));
        vcdp->fullBit(oldp+260,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack_d));
        vcdp->fullCData(oldp+261,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state),2);
        vcdp->fullCData(oldp+262,(((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))
                                    ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req)
                                        ? 2U : 1U) : 
                                   ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))
                                     ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req)
                                         ? 2U : 1U)
                                     : 1U))),2);
        vcdp->fullBit(oldp+263,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req));
        vcdp->fullBit(oldp+264,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req_d));
        vcdp->fullQData(oldp+265,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg),40);
        vcdp->fullBit(oldp+267,((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg 
                                               >> 0x10U)))));
        vcdp->fullCData(oldp+268,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg),5);
        vcdp->fullBit(oldp+269,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__ack));
        vcdp->fullBit(oldp+270,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req));
        vcdp->fullCData(oldp+271,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state),2);
        vcdp->fullCData(oldp+272,(((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))
                                    ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req)
                                        ? 2U : 1U) : 
                                   ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))
                                     ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req)
                                         ? 2U : 1U)
                                     : 1U))),2);
        vcdp->fullBit(oldp+273,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req));
        vcdp->fullBit(oldp+274,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req_d));
        vcdp->fullBit(oldp+275,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req));
        vcdp->fullCData(oldp+276,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state),4);
        vcdp->fullBit(oldp+277,(vlTOPp->clk_i));
        vcdp->fullBit(oldp+278,(vlTOPp->rst_ni));
        vcdp->fullBit(oldp+279,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK));
        vcdp->fullBit(oldp+280,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TMS));
        vcdp->fullBit(oldp+281,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI));
        vcdp->fullIData(oldp+282,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m1_data_i),32);
        vcdp->fullBit(oldp+283,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m1_req_i));
        vcdp->fullBit(oldp+284,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m1_we_i));
        vcdp->fullIData(oldp+285,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m2_data_o),32);
        vcdp->fullIData(oldp+286,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m3_addr_i),32);
        vcdp->fullIData(oldp+287,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m3_data_i),32);
        vcdp->fullIData(oldp+288,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m3_data_o),32);
        vcdp->fullBit(oldp+289,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m3_req_i));
        vcdp->fullBit(oldp+290,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m3_we_i));
        vcdp->fullIData(oldp+291,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s2_addr_o),32);
        vcdp->fullIData(oldp+292,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s2_data_o),32);
        vcdp->fullIData(oldp+293,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s2_data_i),32);
        vcdp->fullBit(oldp+294,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s2_we_o));
        vcdp->fullCData(oldp+295,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__int_flag),8);
        vcdp->fullIData(oldp+296,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o),32);
        vcdp->fullIData(oldp+297,(0x20U),32);
        vcdp->fullIData(oldp+298,(1U),32);
        vcdp->fullIData(oldp+299,(0U),32);
        vcdp->fullIData(oldp+300,(8U),32);
        vcdp->fullCData(oldp+301,(0U),8);
        vcdp->fullIData(oldp+302,(1U),32);
        vcdp->fullBit(oldp+303,(0U));
        vcdp->fullIData(oldp+304,(5U),32);
        vcdp->fullCData(oldp+305,(0U),5);
        vcdp->fullCData(oldp+306,(1U),4);
        vcdp->fullCData(oldp+307,(2U),4);
        vcdp->fullCData(oldp+308,(4U),4);
        vcdp->fullCData(oldp+309,(8U),4);
        vcdp->fullCData(oldp+310,(1U),5);
        vcdp->fullCData(oldp+311,(2U),5);
        vcdp->fullCData(oldp+312,(4U),5);
        vcdp->fullCData(oldp+313,(8U),5);
        vcdp->fullCData(oldp+314,(0x10U),5);
        vcdp->fullBit(oldp+315,(1U));
        vcdp->fullIData(oldp+316,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i),32);
        vcdp->fullIData(oldp+317,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i),32);
        vcdp->fullBit(oldp+318,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_req_i));
        vcdp->fullBit(oldp+319,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i));
        vcdp->fullIData(oldp+320,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i),32);
        vcdp->fullIData(oldp+321,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i),32);
        vcdp->fullBit(oldp+322,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_req_i));
        vcdp->fullBit(oldp+323,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i));
        vcdp->fullIData(oldp+324,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_i),32);
        vcdp->fullIData(oldp+325,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_i),32);
        vcdp->fullIData(oldp+326,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_i),32);
        vcdp->fullIData(oldp+327,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_i),32);
        vcdp->fullCData(oldp+328,(0U),4);
        vcdp->fullCData(oldp+329,(3U),4);
        vcdp->fullCData(oldp+330,(5U),4);
        vcdp->fullCData(oldp+331,(0U),2);
        vcdp->fullCData(oldp+332,(1U),2);
        vcdp->fullCData(oldp+333,(2U),2);
        vcdp->fullCData(oldp+334,(3U),2);
        vcdp->fullIData(oldp+335,(6U),32);
        vcdp->fullIData(oldp+336,(2U),32);
        vcdp->fullIData(oldp+337,(0x28U),32);
        vcdp->fullBit(oldp+338,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__dm_op_req_o));
        vcdp->fullBit(oldp+339,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__dm_halt_req_o));
        vcdp->fullBit(oldp+340,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__dm_reset_req_o));
        vcdp->fullSData(oldp+341,(0xe200U),16);
        vcdp->fullSData(oldp+342,(0x537U),11);
        vcdp->fullCData(oldp+343,(6U),4);
        vcdp->fullCData(oldp+344,(7U),4);
        vcdp->fullCData(oldp+345,(9U),4);
        vcdp->fullCData(oldp+346,(0xaU),4);
        vcdp->fullCData(oldp+347,(0xbU),4);
        vcdp->fullCData(oldp+348,(0xcU),4);
        vcdp->fullCData(oldp+349,(0xdU),4);
        vcdp->fullCData(oldp+350,(0xeU),4);
        vcdp->fullCData(oldp+351,(0xfU),4);
        vcdp->fullCData(oldp+352,(0x1fU),5);
        vcdp->fullCData(oldp+353,(0x11U),5);
        vcdp->fullCData(oldp+354,(6U),6);
        vcdp->fullQData(oldp+355,(VL_ULL(3)),40);
        vcdp->fullIData(oldp+357,(0x1e200a6fU),32);
        vcdp->fullCData(oldp+358,(1U),3);
        vcdp->fullCData(oldp+359,(2U),3);
        vcdp->fullCData(oldp+360,(4U),3);
        vcdp->fullSData(oldp+361,(0x7b0U),16);
        vcdp->fullCData(oldp+362,(0x11U),6);
        vcdp->fullCData(oldp+363,(0x10U),6);
        vcdp->fullCData(oldp+364,(0x12U),6);
        vcdp->fullCData(oldp+365,(0x16U),6);
        vcdp->fullCData(oldp+366,(4U),6);
        vcdp->fullCData(oldp+367,(0x38U),6);
        vcdp->fullCData(oldp+368,(0x39U),6);
        vcdp->fullCData(oldp+369,(0x3cU),6);
        vcdp->fullCData(oldp+370,(0x17U),6);
        vcdp->fullSData(oldp+371,(0x7b1U),16);
    }
}
