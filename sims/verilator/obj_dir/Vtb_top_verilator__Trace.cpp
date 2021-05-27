// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vtb_top_verilator__Syms.h"


//======================

void Vtb_top_verilator::traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code) {
    // Callback from vcd->dump()
    Vtb_top_verilator* t = (Vtb_top_verilator*)userthis;
    Vtb_top_verilator__Syms* __restrict vlSymsp = t->__VlSymsp;  // Setup global symbol table
    if (vlSymsp->getClearActivity()) {
        t->traceChgThis(vlSymsp, vcdp, code);
    }
}

//======================


void Vtb_top_verilator::traceChgThis(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    if (false && vcdp) {}  // Prevent unused
    // Body
    {
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 4U))))) {
            vlTOPp->traceChgThis__2(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & ((vlTOPp->__Vm_traceActivity 
                                | (vlTOPp->__Vm_traceActivity 
                                   >> 4U)) | (vlTOPp->__Vm_traceActivity 
                                              >> 6U))))) {
            vlTOPp->traceChgThis__3(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 5U))))) {
            vlTOPp->traceChgThis__4(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 6U))))) {
            vlTOPp->traceChgThis__5(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & (vlTOPp->__Vm_traceActivity 
                               | (vlTOPp->__Vm_traceActivity 
                                  >> 8U))))) {
            vlTOPp->traceChgThis__6(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((2U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__7(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((4U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__8(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((8U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__9(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((0x10U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__10(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((0x20U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__11(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((1U & ((vlTOPp->__Vm_traceActivity 
                                >> 5U) | (vlTOPp->__Vm_traceActivity 
                                          >> 7U))))) {
            vlTOPp->traceChgThis__12(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((0x80U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__13(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((0x100U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__14(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((0x200U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__15(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((0x400U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__16(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((0x800U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__17(vlSymsp, vcdp, code);
        }
        if (VL_UNLIKELY((0x1000U & vlTOPp->__Vm_traceActivity))) {
            vlTOPp->traceChgThis__18(vlSymsp, vcdp, code);
        }
        vlTOPp->traceChgThis__19(vlSymsp, vcdp, code);
    }
    // Final
    vlTOPp->__Vm_traceActivity = 0U;
}

void Vtb_top_verilator::traceChgThis__2(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+1);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgIData(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i),32);
        vcdp->chgBit(oldp+1,(((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
                              & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req))));
        vcdp->chgBit(oldp+2,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o));
        vcdp->chgIData(oldp+3,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o),32);
        vcdp->chgBit(oldp+4,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o));
        vcdp->chgIData(oldp+5,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o),32);
        vcdp->chgBit(oldp+6,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o));
        vcdp->chgBit(oldp+7,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o));
        vcdp->chgCData(oldp+8,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg1_raddr_o),5);
        vcdp->chgCData(oldp+9,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg2_raddr_o),5);
        vcdp->chgBit(oldp+10,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_we_o));
        vcdp->chgCData(oldp+11,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_waddr_o),5);
        vcdp->chgIData(oldp+12,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o),32);
        vcdp->chgBit(oldp+13,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_we_o));
        vcdp->chgIData(oldp+14,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__csr_data_o),32);
        vcdp->chgIData(oldp+15,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_waddr_o),32);
        vcdp->chgIData(oldp+16,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o),32);
        vcdp->chgIData(oldp+17,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o),32);
        vcdp->chgIData(oldp+18,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o),32);
        vcdp->chgBit(oldp+19,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_we_o));
        vcdp->chgCData(oldp+20,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_waddr_o),5);
        vcdp->chgBit(oldp+21,((1U & ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag) 
                                     | (((0x33U == 
                                          (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                         & (1U == (0x7fU 
                                                   & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                      >> 0x19U))))
                                         ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                            >> 0xeU)
                                         : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o))))));
        vcdp->chgBit(oldp+22,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_flag_o));
        vcdp->chgIData(oldp+23,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_addr_o),32);
        vcdp->chgBit(oldp+24,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_div_start_o));
        vcdp->chgIData(oldp+25,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o),32);
        vcdp->chgBit(oldp+26,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o));
        vcdp->chgIData(oldp+27,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__csr_clint_data_o),32);
        vcdp->chgCData(oldp+28,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index),2);
        vcdp->chgCData(oldp+29,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index),2);
        vcdp->chgQData(oldp+30,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp),64);
        vcdp->chgQData(oldp+32,((VL_ULL(1) + (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp))),64);
        vcdp->chgIData(oldp+34,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res),32);
        vcdp->chgIData(oldp+35,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res),32);
        vcdp->chgBit(oldp+36,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed));
        vcdp->chgBit(oldp+37,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned));
        vcdp->chgBit(oldp+38,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2));
        vcdp->chgIData(oldp+39,((((0x33U == (0x7fU 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                  & (1U == (0x7fU & 
                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                             >> 0x19U))))
                                  ? ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                      ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res
                                      : 0U) : 0U)),32);
        vcdp->chgBit(oldp+40,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag));
        vcdp->chgBit(oldp+41,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag));
        vcdp->chgIData(oldp+42,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr),32);
        vcdp->chgBit(oldp+43,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we));
        vcdp->chgBit(oldp+44,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req));
        vcdp->chgBit(oldp+45,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor));
        vcdp->chgIData(oldp+46,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_sub_res),32);
        vcdp->chgIData(oldp+47,(((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor)
                                  ? (1U | (0xfffffffeU 
                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result 
                                              << 1U)))
                                  : (0xfffffffeU & 
                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result 
                                      << 1U)))),32);
        vcdp->chgIData(oldp+48,(((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor)
                                  ? (0x7fffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_sub_res)
                                  : (0x7fffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend))),32);
        vcdp->chgIData(oldp+49,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o),32);
        vcdp->chgBit(oldp+50,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o));
        vcdp->chgIData(oldp+51,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o),32);
        vcdp->chgBit(oldp+52,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o));
        vcdp->chgIData(oldp+53,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o),32);
        vcdp->chgBit(oldp+54,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o));
        vcdp->chgIData(oldp+55,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o),32);
        vcdp->chgBit(oldp+56,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o));
        vcdp->chgCData(oldp+57,((2U | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_req_i) 
                                        << 3U) | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_req_i) 
                                                   << 2U) 
                                                  | ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
                                                     & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req)))))),4);
        vcdp->chgCData(oldp+58,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant),2);
    }
}

void Vtb_top_verilator::traceChgThis__3(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+60);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(oldp+0,(((1U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__int_state)) 
                              | (1U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state)))));
    }
}

void Vtb_top_verilator::traceChgThis__4(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+61);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgCData(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next),3);
    }
}

void Vtb_top_verilator::traceChgThis__5(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+62);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgIData(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o),32);
        vcdp->chgIData(oldp+1,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o),32);
        vcdp->chgIData(oldp+2,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m1_data_o),32);
        vcdp->chgIData(oldp+3,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o),32);
        vcdp->chgIData(oldp+4,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i),32);
        vcdp->chgIData(oldp+5,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o),32);
        vcdp->chgIData(oldp+6,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i),32);
        vcdp->chgIData(oldp+7,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o),32);
        vcdp->chgIData(oldp+8,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o),32);
        vcdp->chgIData(oldp+9,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o),32);
        vcdp->chgIData(oldp+10,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o),32);
        vcdp->chgIData(oldp+11,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o),32);
        vcdp->chgIData(oldp+12,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_wdata_o),32);
        vcdp->chgCData(oldp+13,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o),3);
        vcdp->chgBit(oldp+14,((2U <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))));
        vcdp->chgBit(oldp+15,((3U <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))));
        vcdp->chgIData(oldp+16,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__reg_wdata),32);
        vcdp->chgCData(oldp+17,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__int_state),4);
        vcdp->chgIData(oldp+18,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_o),32);
        vcdp->chgIData(oldp+19,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_o),32);
        vcdp->chgIData(oldp+20,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o),32);
        vcdp->chgIData(oldp+21,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o),32);
        vcdp->chgIData(oldp+22,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o),32);
        vcdp->chgIData(oldp+23,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o),32);
    }
}

void Vtb_top_verilator::traceChgThis__6(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+86);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy));
        vcdp->chgIData(oldp+1,((0x5061U | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy)
                                             ? 1U : 0U) 
                                           << 0xaU))),32);
        vcdp->chgCData(oldp+2,(((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy)
                                 ? 1U : 0U)),2);
        vcdp->chgCData(oldp+3,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next),3);
    }
}

void Vtb_top_verilator::traceChgThis__7(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+90);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDO));
    }
}

void Vtb_top_verilator::traceChgThis__8(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+91);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(oldp+0,(vlTOPp->tb_top_verilator__DOT__result_printed));
        vcdp->chgIData(oldp+1,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_wdata),32);
        vcdp->chgBit(oldp+2,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_we));
        vcdp->chgIData(oldp+3,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbdata0),32);
        vcdp->chgIData(oldp+4,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__command),32);
        vcdp->chgBit(oldp+5,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__idle));
    }
}

void Vtb_top_verilator::traceChgThis__9(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+97);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__sticky_busy));
        vcdp->chgQData(oldp+1,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_resp_data),40);
        vcdp->chgBit(oldp+3,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_is_busy));
        vcdp->chgBit(oldp+4,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_rdy));
        vcdp->chgQData(oldp+5,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_data),40);
    }
}

void Vtb_top_verilator::traceChgThis__10(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+104);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__over));
        vcdp->chgBit(oldp+1,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__succ));
        vcdp->chgIData(oldp+2,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o),32);
        vcdp->chgIData(oldp+3,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r),32);
        vcdp->chgIData(oldp+4,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r),32);
        vcdp->chgCData(oldp+5,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__int_ff__DOT__qout_r),8);
        vcdp->chgIData(oldp+6,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r),32);
        vcdp->chgIData(oldp+7,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_addr_ff__DOT__qout_r),32);
        vcdp->chgBit(oldp+8,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_we_ff__DOT__qout_r));
        vcdp->chgCData(oldp+9,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_waddr_ff__DOT__qout_r),5);
        vcdp->chgIData(oldp+10,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r),32);
        vcdp->chgIData(oldp+11,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r),32);
        vcdp->chgBit(oldp+12,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_we_ff__DOT__qout_r));
        vcdp->chgIData(oldp+13,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r),32);
        vcdp->chgIData(oldp+14,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r),32);
        vcdp->chgIData(oldp+15,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r),32);
        vcdp->chgIData(oldp+16,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r),32);
        vcdp->chgIData(oldp+17,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_jump_ff__DOT__qout_r),32);
        vcdp->chgIData(oldp+18,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_jump_ff__DOT__qout_r),32);
        vcdp->chgCData(oldp+19,((7U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                       >> 0xcU))),3);
        vcdp->chgBit(oldp+20,((1U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus 
                                     >> 3U))));
        vcdp->chgIData(oldp+21,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mtvec),32);
        vcdp->chgIData(oldp+22,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mepc),32);
        vcdp->chgIData(oldp+23,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus),32);
        vcdp->chgIData(oldp+24,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o),32);
        vcdp->chgBit(oldp+25,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o));
        vcdp->chgBit(oldp+26,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o));
        vcdp->chgCData(oldp+27,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_reg_waddr_o),5);
        vcdp->chgBit(oldp+28,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_we_o));
        vcdp->chgIData(oldp+29,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o),32);
        vcdp->chgIData(oldp+30,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o),32);
        vcdp->chgIData(oldp+31,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_addr_o),32);
        vcdp->chgBit(oldp+32,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o));
        vcdp->chgQData(oldp+33,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle),64);
        vcdp->chgIData(oldp+35,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mcause),32);
        vcdp->chgIData(oldp+36,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mie),32);
        vcdp->chgIData(oldp+37,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mscratch),32);
        vcdp->chgCData(oldp+38,((0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)),7);
        vcdp->chgCData(oldp+39,((7U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                       >> 0xcU))),3);
        vcdp->chgCData(oldp+40,((0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                          >> 0x19U))),7);
        vcdp->chgCData(oldp+41,((0x1fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                          >> 7U))),5);
        vcdp->chgCData(oldp+42,((0x1fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                          >> 0xfU))),5);
        vcdp->chgCData(oldp+43,((0x1fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                          >> 0x14U))),5);
        vcdp->chgIData(oldp+44,((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                 >> (0x1fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))),32);
        vcdp->chgIData(oldp+45,((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                 >> (0x1fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                              >> 0x14U)))),32);
        vcdp->chgIData(oldp+46,((0xffffffffU >> (0x1fU 
                                                 & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))),32);
        vcdp->chgIData(oldp+47,((0xffffffffU >> (0x1fU 
                                                 & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0x14U)))),32);
        vcdp->chgIData(oldp+48,(((IData)(1U) + (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))),32);
        vcdp->chgIData(oldp+49,(((IData)(1U) + (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))),32);
        vcdp->chgIData(oldp+50,((((0x33U == (0x7fU 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                  & (1U == (0x7fU & 
                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                             >> 0x19U))))
                                  ? ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                      ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r
                                      : ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                          ? ((0x1000U 
                                              & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                              ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r
                                              : ((0x80000000U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                                  ? 
                                                 ((IData)(1U) 
                                                  + 
                                                  (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                                  : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                          : ((0x1000U 
                                              & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                              ? ((0x80000000U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                                  ? 
                                                 ((IData)(1U) 
                                                  + 
                                                  (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                                  : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                              : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)))
                                  : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)),32);
        vcdp->chgIData(oldp+51,((((0x33U == (0x7fU 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                  & (1U == (0x7fU & 
                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                             >> 0x19U))))
                                  ? ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                      ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r
                                      : ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                          ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r
                                          : ((0x1000U 
                                              & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                              ? ((0x80000000U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)
                                                  ? 
                                                 ((IData)(1U) 
                                                  + 
                                                  (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))
                                                  : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)
                                              : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)))
                                  : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)),32);
        vcdp->chgCData(oldp+52,((0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)),7);
        vcdp->chgCData(oldp+53,((0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                          >> 0x19U))),7);
        vcdp->chgCData(oldp+54,((0x1fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                          >> 7U))),5);
        vcdp->chgCData(oldp+55,((0x1fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                          >> 0xfU))),5);
        vcdp->chgIData(oldp+56,((((0x33U == (0x7fU 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                  & (1U == (0x7fU & 
                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                             >> 0x19U))))
                                  ? 0U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)
                                           ? 0U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o)
                                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o
                                                    : 0U)))),32);
        vcdp->chgBit(oldp+57,(((~ ((0x33U == (0x7fU 
                                              & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                   & (1U == (0x7fU 
                                             & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                >> 0x19U))))) 
                               & ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)) 
                                  & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o)))));
        vcdp->chgCData(oldp+58,((((0x33U == (0x7fU 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                  & (1U == (0x7fU & 
                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                             >> 0x19U))))
                                  ? 0U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)
                                           ? 0U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o)
                                                    ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_reg_waddr_o)
                                                    : 0U)))),5);
        vcdp->chgBit(oldp+59,((1U & (((0x33U == (0x7fU 
                                                 & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                      & (1U == (0x7fU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U))))
                                      ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                         >> 0xeU) : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)))));
        vcdp->chgBit(oldp+60,((((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                                & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U)))) 
                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                  >> 0xeU))));
        vcdp->chgIData(oldp+61,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r),32);
        vcdp->chgIData(oldp+62,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r),32);
        vcdp->chgCData(oldp+63,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r),3);
        vcdp->chgCData(oldp+64,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state),4);
        vcdp->chgIData(oldp+65,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count),32);
        vcdp->chgIData(oldp+66,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result),32);
        vcdp->chgIData(oldp+67,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain),32);
        vcdp->chgIData(oldp+68,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend),32);
        vcdp->chgBit(oldp+69,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__invert_result));
        vcdp->chgBit(oldp+70,((4U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r))));
        vcdp->chgBit(oldp+71,((5U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r))));
        vcdp->chgBit(oldp+72,((6U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r))));
        vcdp->chgBit(oldp+73,((7U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r))));
        vcdp->chgIData(oldp+74,((- vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r)),32);
        vcdp->chgIData(oldp+75,((- vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r)),32);
        vcdp->chgCData(oldp+76,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state),5);
        vcdp->chgIData(oldp+77,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__inst_addr),32);
        vcdp->chgIData(oldp+78,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__cause),32);
    }
}

void Vtb_top_verilator::traceChgThis__11(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+183);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(oldp+0,((1U & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req)))));
        vcdp->chgIData(oldp+1,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_addr),32);
        vcdp->chgBit(oldp+2,((((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) 
                               & (~ ((1U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data))) 
                                     & (0x11U == (0x3fU 
                                                  & (IData)(
                                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                             >> 0x22U))))))) 
                              | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__need_resp))));
        vcdp->chgBit(oldp+3,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req));
        vcdp->chgBit(oldp+4,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reset_req));
        vcdp->chgCData(oldp+5,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr),5);
        vcdp->chgIData(oldp+6,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_wdata),32);
        vcdp->chgBit(oldp+7,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_we));
        vcdp->chgQData(oldp+8,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req_data),40);
        vcdp->chgIData(oldp+10,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dcsr),32);
        vcdp->chgIData(oldp+11,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus),32);
        vcdp->chgIData(oldp+12,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmcontrol),32);
        vcdp->chgIData(oldp+13,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__hartinfo),32);
        vcdp->chgIData(oldp+14,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs),32);
        vcdp->chgIData(oldp+15,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__data0),32);
        vcdp->chgIData(oldp+16,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbcs),32);
        vcdp->chgIData(oldp+17,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0),32);
        vcdp->chgIData(oldp+18,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data),32);
        vcdp->chgBit(oldp+19,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__need_resp));
        vcdp->chgBit(oldp+20,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__is_read_reg));
        vcdp->chgBit(oldp+21,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy));
        vcdp->chgQData(oldp+22,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data),40);
        vcdp->chgIData(oldp+24,(((IData)(4U) + vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0)),32);
        vcdp->chgQData(oldp+25,((((QData)((IData)((0x3fU 
                                                   & (IData)(
                                                             (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                              >> 0x22U))))) 
                                  << 0x22U) | ((QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data)) 
                                               << 2U))),40);
        vcdp->chgCData(oldp+27,((3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data))),2);
        vcdp->chgIData(oldp+28,((IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                         >> 2U))),32);
        vcdp->chgCData(oldp+29,((0x3fU & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                  >> 0x22U)))),6);
        vcdp->chgBit(oldp+30,(((1U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data))) 
                               & (0x11U == (0x3fU & (IData)(
                                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                             >> 0x22U)))))));
        vcdp->chgCData(oldp+31,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state),3);
        vcdp->chgBit(oldp+32,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack));
        vcdp->chgBit(oldp+33,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack_d));
    }
}

void Vtb_top_verilator::traceChgThis__12(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+217);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgIData(oldp+0,(((0U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr))
                                 ? 0U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                                [vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr])),32);
    }
}

void Vtb_top_verilator::traceChgThis__13(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+218);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgIData(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                               [0x1aU]),32);
        vcdp->chgIData(oldp+1,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                               [0x1bU]),32);
        vcdp->chgIData(oldp+2,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[0]),32);
        vcdp->chgIData(oldp+3,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[1]),32);
        vcdp->chgIData(oldp+4,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[2]),32);
        vcdp->chgIData(oldp+5,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[3]),32);
        vcdp->chgIData(oldp+6,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[4]),32);
        vcdp->chgIData(oldp+7,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[5]),32);
        vcdp->chgIData(oldp+8,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[6]),32);
        vcdp->chgIData(oldp+9,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[7]),32);
        vcdp->chgIData(oldp+10,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[8]),32);
        vcdp->chgIData(oldp+11,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[9]),32);
        vcdp->chgIData(oldp+12,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[10]),32);
        vcdp->chgIData(oldp+13,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[11]),32);
        vcdp->chgIData(oldp+14,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[12]),32);
        vcdp->chgIData(oldp+15,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[13]),32);
        vcdp->chgIData(oldp+16,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[14]),32);
        vcdp->chgIData(oldp+17,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[15]),32);
        vcdp->chgIData(oldp+18,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[16]),32);
        vcdp->chgIData(oldp+19,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[17]),32);
        vcdp->chgIData(oldp+20,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[18]),32);
        vcdp->chgIData(oldp+21,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[19]),32);
        vcdp->chgIData(oldp+22,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[20]),32);
        vcdp->chgIData(oldp+23,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[21]),32);
        vcdp->chgIData(oldp+24,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[22]),32);
        vcdp->chgIData(oldp+25,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[23]),32);
        vcdp->chgIData(oldp+26,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[24]),32);
        vcdp->chgIData(oldp+27,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[25]),32);
        vcdp->chgIData(oldp+28,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[26]),32);
        vcdp->chgIData(oldp+29,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[27]),32);
        vcdp->chgIData(oldp+30,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[28]),32);
        vcdp->chgIData(oldp+31,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[29]),32);
        vcdp->chgIData(oldp+32,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[30]),32);
        vcdp->chgIData(oldp+33,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[31]),32);
    }
}

void Vtb_top_verilator::traceChgThis__14(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+252);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__ack));
        vcdp->chgQData(oldp+1,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req_data),40);
        vcdp->chgBit(oldp+3,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_valid));
        vcdp->chgQData(oldp+4,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_data),40);
        vcdp->chgBit(oldp+6,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle));
        vcdp->chgCData(oldp+7,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state),3);
        vcdp->chgBit(oldp+8,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack));
        vcdp->chgBit(oldp+9,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack_d));
        vcdp->chgCData(oldp+10,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state),2);
        vcdp->chgCData(oldp+11,(((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))
                                  ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req)
                                      ? 2U : 1U) : 
                                 ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))
                                   ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req)
                                       ? 2U : 1U) : 1U))),2);
        vcdp->chgBit(oldp+12,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req));
        vcdp->chgBit(oldp+13,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req_d));
    }
}

void Vtb_top_verilator::traceChgThis__15(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+266);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgQData(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg),40);
        vcdp->chgBit(oldp+2,((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg 
                                            >> 0x10U)))));
    }
}

void Vtb_top_verilator::traceChgThis__16(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+269);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgCData(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg),5);
    }
}

void Vtb_top_verilator::traceChgThis__17(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+270);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__ack));
        vcdp->chgBit(oldp+1,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req));
        vcdp->chgCData(oldp+2,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state),2);
        vcdp->chgCData(oldp+3,(((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))
                                 ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req)
                                     ? 2U : 1U) : (
                                                   (2U 
                                                    == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))
                                                    ? 
                                                   ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req)
                                                     ? 2U
                                                     : 1U)
                                                    : 1U))),2);
        vcdp->chgBit(oldp+4,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req));
        vcdp->chgBit(oldp+5,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req_d));
    }
}

void Vtb_top_verilator::traceChgThis__18(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+276);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(oldp+0,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req));
        vcdp->chgCData(oldp+1,(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state),4);
    }
}

void Vtb_top_verilator::traceChgThis__19(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) {
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* oldp = vcdp->oldp(code+278);
    if (false && vcdp && oldp) {}  // Prevent unused
    // Body
    {
        vcdp->chgBit(oldp+0,(vlTOPp->clk_i));
        vcdp->chgBit(oldp+1,(vlTOPp->rst_ni));
    }
}
