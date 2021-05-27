// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Primary design header
//
// This header should be included by all source files instantiating the design.
// The class here is then constructed to instantiate the design.
// See the Verilator manual for examples.

#ifndef _VTB_TOP_VERILATOR_H_
#define _VTB_TOP_VERILATOR_H_  // guard

#include "verilated_heavy.h"

//==========

class Vtb_top_verilator__Syms;
class Vtb_top_verilator_VerilatedVcd;


//----------

VL_MODULE(Vtb_top_verilator) {
  public:
    
    // PORTS
    // The application code writes and reads these signals to
    // propagate new values into/out from the Verilated model.
    VL_IN8(clk_i,0,0);
    VL_IN8(rst_ni,0,0);
    
    // LOCAL SIGNALS
    // Internals; generally not touched by application code
    // Anonymous structures to workaround compiler member-count bugs
    struct {
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK;
        CData/*0:0*/ tb_top_verilator__DOT__result_printed;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__over;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__succ;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__jtag_TMS;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDO;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__m1_req_i;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__m1_we_i;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__m3_req_i;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__m3_we_i;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__s2_we_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o;
        CData/*7:0*/ tb_top_verilator__DOT__u_soc_top__DOT__int_flag;
        CData/*4:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg1_raddr_o;
        CData/*4:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg2_raddr_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_we_o;
        CData/*4:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_waddr_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_we_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_we_o;
        CData/*4:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_waddr_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_flag_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_div_start_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o;
        CData/*2:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o;
        CData/*4:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_reg_waddr_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_we_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o;
        CData/*7:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__int_ff__DOT__qout_r;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_we_ff__DOT__qout_r;
        CData/*4:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_waddr_ff__DOT__qout_r;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_we_ff__DOT__qout_r;
        CData/*1:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index;
        CData/*1:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req;
        CData/*2:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r;
        CData/*3:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__invert_result;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_div;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_divu;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_rem;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor;
        CData/*3:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__int_state;
        CData/*4:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_req_i;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_req_i;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o;
        CData/*1:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant;
    };
    struct {
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__dm_op_req_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__dm_halt_req_o;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__dm_reset_req_o;
        CData/*4:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg;
        CData/*3:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__sticky_busy;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_valid;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_is_busy;
        CData/*2:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state;
        CData/*2:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack_d;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle;
        CData/*1:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state;
        CData/*1:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state_next;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req_d;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_rdy;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__ack;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_we;
        CData/*4:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_we;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reset_req;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__need_resp;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__is_read_reg;
        CData/*2:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state;
        CData/*2:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack_d;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__idle;
        CData/*1:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state;
        CData/*1:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state_next;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req_d;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy;
        CData/*0:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__ack;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__m1_data_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__m1_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__m2_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__m3_addr_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__m3_data_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__m3_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__s2_addr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__s2_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__s2_data_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_waddr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o;
    };
    struct {
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_wdata_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_addr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__csr_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__csr_clint_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_addr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mtvec;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mcause;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mepc;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mie;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mscratch;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_addr_ff__DOT__qout_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_jump_ff__DOT__qout_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_jump_ff__DOT__qout_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__reg_wdata;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_invert;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_invert;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_sub_res;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result_tmp;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_tmp;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__inst_addr;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__cause;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o;
    };
    struct {
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_i;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dcsr;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmcontrol;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__hartinfo;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__data0;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbcs;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbdata0;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__command;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_wdata;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_addr;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_wdata;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0_next;
        QData/*63:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle;
        QData/*63:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp;
        QData/*39:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg;
        QData/*39:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_data;
        QData/*39:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_resp_data;
        QData/*39:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req_data;
        QData/*39:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_data;
        QData/*39:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req_data;
        QData/*39:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data;
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[32];
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom[4096];
        IData/*31:0*/ tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram[4096];
    };
    
    // LOCAL VARIABLES
    // Internals; generally not touched by application code
    CData/*3:0*/ __Vtableidx1;
    CData/*4:0*/ __Vtableidx3;
    CData/*4:0*/ __Vtableidx4;
    CData/*0:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req;
    CData/*0:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req;
    CData/*4:0*/ __Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v0;
    CData/*0:0*/ __Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v0;
    CData/*4:0*/ __Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v1;
    CData/*0:0*/ __Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v1;
    CData/*3:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state;
    CData/*0:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle;
    CData/*0:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req;
    CData/*0:0*/ __Vclklast__TOP__tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK;
    CData/*0:0*/ __Vclklast__TOP__clk_i;
    CData/*0:0*/ __Vclklast__TOP__rst_ni;
    IData/*31:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0;
    IData/*31:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus;
    IData/*31:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs;
    IData/*31:0*/ __Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v0;
    IData/*31:0*/ __Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v1;
    IData/*31:0*/ __Vm_traceActivity;
    QData/*39:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg;
    static CData/*1:0*/ __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[16];
    static CData/*0:0*/ __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[16];
    static CData/*3:0*/ __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[64];
    static CData/*2:0*/ __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[32];
    static CData/*2:0*/ __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[32];
    
    // INTERNAL VARIABLES
    // Internals; generally not touched by application code
    Vtb_top_verilator__Syms* __VlSymsp;  // Symbol table
    
    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vtb_top_verilator);  ///< Copying not allowed
  public:
    /// Construct the model; called by application code
    /// The special name  may be used to make a wrapper with a
    /// single model invisible with respect to DPI scope names.
    Vtb_top_verilator(const char* name = "TOP");
    /// Destroy the model; called (often implicitly) by application code
    ~Vtb_top_verilator();
    /// Trace signals in the model; called by application code
    void trace(VerilatedVcdC* tfp, int levels, int options = 0);
    
    // API METHODS
    /// Evaluate the model.  Application must call when inputs change.
    void eval() { eval_step(); }
    /// Evaluate when calling multiple units/models per time step.
    void eval_step();
    /// Evaluate at end of a timestep for tracing, when using eval_step().
    /// Application must call after all eval() and before time changes.
    void eval_end_step() {}
    /// Simulation complete, run final blocks.  Application must call on completion.
    void final();
    
    // INTERNAL METHODS
  private:
    static void _eval_initial_loop(Vtb_top_verilator__Syms* __restrict vlSymsp);
  public:
    void __Vconfigure(Vtb_top_verilator__Syms* symsp, bool first);
  private:
    static QData _change_request(Vtb_top_verilator__Syms* __restrict vlSymsp);
  public:
    static void _combo__TOP__12(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _combo__TOP__9(Vtb_top_verilator__Syms* __restrict vlSymsp);
  private:
    void _ctor_var_reset() VL_ATTR_COLD;
  public:
    static void _eval(Vtb_top_verilator__Syms* __restrict vlSymsp);
  private:
#ifdef VL_DEBUG
    void _eval_debug_assertions();
#endif  // VL_DEBUG
  public:
    static void _eval_initial(Vtb_top_verilator__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _eval_settle(Vtb_top_verilator__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _initial__TOP__2(Vtb_top_verilator__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void _sequent__TOP__1(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__10(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__11(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__13(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__14(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__15(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__16(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__3(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__4(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__5(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__6(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _sequent__TOP__8(Vtb_top_verilator__Syms* __restrict vlSymsp);
    static void _settle__TOP__7(Vtb_top_verilator__Syms* __restrict vlSymsp) VL_ATTR_COLD;
    static void traceChgThis(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__10(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__11(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__12(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__13(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__14(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__15(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__16(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__17(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__18(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__19(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__2(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__3(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__4(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__5(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__6(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__7(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__8(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceChgThis__9(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code);
    static void traceFullThis(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceFullThis__1(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInitThis__1(Vtb_top_verilator__Syms* __restrict vlSymsp, VerilatedVcd* vcdp, uint32_t code) VL_ATTR_COLD;
    static void traceInit(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceFull(VerilatedVcd* vcdp, void* userthis, uint32_t code);
    static void traceChg(VerilatedVcd* vcdp, void* userthis, uint32_t code);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
