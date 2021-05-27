// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtb_top_verilator.h for the primary calling header

#include "Vtb_top_verilator.h"
#include "Vtb_top_verilator__Syms.h"

//==========
CData/*1:0*/ Vtb_top_verilator::__Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[16];
CData/*0:0*/ Vtb_top_verilator::__Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[16];
CData/*3:0*/ Vtb_top_verilator::__Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[64];
CData/*2:0*/ Vtb_top_verilator::__Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[32];
CData/*2:0*/ Vtb_top_verilator::__Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[32];

VL_CTOR_IMP(Vtb_top_verilator) {
    Vtb_top_verilator__Syms* __restrict vlSymsp = __VlSymsp = new Vtb_top_verilator__Syms(this, name());
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Reset internal values
    
    // Reset structure values
    _ctor_var_reset();
}

void Vtb_top_verilator::__Vconfigure(Vtb_top_verilator__Syms* vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->__VlSymsp = vlSymsp;
    if (false && this->__VlSymsp) {}  // Prevent unused
    Verilated::timeunit(-12);
    Verilated::timeprecision(-12);
}

Vtb_top_verilator::~Vtb_top_verilator() {
    VL_DO_CLEAR(delete __VlSymsp, __VlSymsp = NULL);
}

void Vtb_top_verilator::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vtb_top_verilator::eval\n"); );
    Vtb_top_verilator__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        vlSymsp->__Vm_activity = true;
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("tb_top_verilator.sv", 1, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vtb_top_verilator::_eval_initial_loop(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    vlSymsp->__Vm_activity = true;
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        _eval_settle(vlSymsp);
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("tb_top_verilator.sv", 1, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void Vtb_top_verilator::_sequent__TOP__1(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_sequent__TOP__1\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDO 
        = (1U & ((0xbU == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state))
                  ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg)
                  : ((4U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state)) 
                     & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg))));
}

void Vtb_top_verilator::_initial__TOP__2(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_initial__TOP__2\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    WData/*95:0*/ __Vtemp1[3];
    // Body
    VL_WRITEF("asdfgh\n\n");
    __Vtemp1[0U] = 0x64617461U;
    __Vtemp1[1U] = 0x706c652eU;
    __Vtemp1[2U] = 0x73696dU;
    VL_READMEM_N(true, 32, 4096, 0, VL_CVT_PACK_STR_NW(3, __Vtemp1)
                 , vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom
                 , 0, ~VL_ULL(0));
}

VL_INLINE_OPT void Vtb_top_verilator::_sequent__TOP__3(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_sequent__TOP__3\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg;
    if ((0xaU == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state))) {
        vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg = VL_ULL(1);
    } else {
        if ((0xbU == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state))) {
            vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg 
                = (((QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI)) 
                    << 4U) | (QData)((IData)((0xfU 
                                              & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg 
                                                         >> 1U))))));
        } else {
            if ((3U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state))) {
                vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg 
                    = ((0x10U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                        ? ((8U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                            ? VL_ULL(0) : ((4U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                            ? VL_ULL(0)
                                            : ((2U 
                                                & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                                ? VL_ULL(0)
                                                : (
                                                   (1U 
                                                    & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                                    ? 
                                                   ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy)
                                                     ? VL_ULL(3)
                                                     : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_resp_data)
                                                    : (QData)((IData)(
                                                                      (0x5061U 
                                                                       | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy)
                                                                            ? 1U
                                                                            : 0U) 
                                                                          << 0xaU))))))))
                        : ((8U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                            ? VL_ULL(0) : ((4U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                            ? VL_ULL(0)
                                            : ((2U 
                                                & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                                ? VL_ULL(0)
                                                : (
                                                   (1U 
                                                    & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                                    ? VL_ULL(0x1e200a6f)
                                                    : VL_ULL(0))))));
            } else {
                if ((4U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state))) {
                    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg 
                        = ((0x10U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                            ? ((8U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                ? ((4U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                    ? ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                        ? ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                            ? (QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI))
                                            : (QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI)))
                                        : (QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI)))
                                    : (QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI)))
                                : ((4U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                    ? (QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI))
                                    : ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                        ? (QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI))
                                        : ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                            ? (((QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI)) 
                                                << 0x27U) 
                                               | (VL_ULL(0x7fffffffff) 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg 
                                                     >> 1U)))
                                            : (((QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI)) 
                                                << 0x1fU) 
                                               | (QData)((IData)(
                                                                 (0x7fffffffU 
                                                                  & (IData)(
                                                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg 
                                                                             >> 1U))))))))))
                            : ((8U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                ? (QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI))
                                : ((4U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                    ? (QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI))
                                    : ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                        ? (QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI))
                                        : ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))
                                            ? (((QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI)) 
                                                << 0x1fU) 
                                               | (QData)((IData)(
                                                                 (0x7fffffffU 
                                                                  & (IData)(
                                                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg 
                                                                             >> 1U))))))
                                            : (QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI)))))));
                }
            }
        }
    }
}

VL_INLINE_OPT void Vtb_top_verilator::_sequent__TOP__4(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_sequent__TOP__4\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req;
    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs;
    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus;
    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0;
    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req;
    if ((1U & (~ (IData)(vlTOPp->rst_ni)))) {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__command = 0U;
    }
    if (vlTOPp->rst_ni) {
        if ((1U & (~ (IData)(vlTOPp->tb_top_verilator__DOT__result_printed)))) {
            if (VL_UNLIKELY((1U == vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                             [0x1aU]))) {
                if ((1U == vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                     [0x1bU])) {
                    VL_WRITEF("~~~~~~~~~~~~~~~~~~~ TEST_PASS ~~~~~~~~~~~~~~~~~~~\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n~~~~~~~~~ #####     ##     ####    #### ~~~~~~~~~\n~~~~~~~~~ #    #   #  #   #       #     ~~~~~~~~~\n~~~~~~~~~ #    #  #    #   ####    #### ~~~~~~~~~\n~~~~~~~~~ #####   ######       #       #~~~~~~~~~\n~~~~~~~~~ #       #    #  #    #  #    #~~~~~~~~~\n~~~~~~~~~ #       #    #   ####    #### ~~~~~~~~~\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
                } else {
                    VL_WRITEF("~~~~~~~~~~~~~~~~~~~ TEST_FAIL ~~~~~~~~~~~~~~~~~~~~\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n~~~~~~~~~~######    ##       #    #     ~~~~~~~~~~\n~~~~~~~~~~#        #  #      #    #     ~~~~~~~~~~\n~~~~~~~~~~#####   #    #     #    #     ~~~~~~~~~~\n~~~~~~~~~~#       ######     #    #     ~~~~~~~~~~\n~~~~~~~~~~#       #    #     #    #     ~~~~~~~~~~\n~~~~~~~~~~#       #    #     #    ######~~~~~~~~~~\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
                }
                vlTOPp->tb_top_verilator__DOT__result_printed = 1U;
                VL_FINISH_MT("tb_top_verilator.sv", 62, "");
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__result_printed = 0U;
    }
    if (vlTOPp->rst_ni) {
        if ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state))) {
            vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req 
                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__need_resp;
        } else {
            if ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state))) {
                if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack) {
                    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req = 0U;
                }
            }
        }
    } else {
        vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req = 0U;
    }
    if (vlTOPp->rst_ni) {
        if ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state))) {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__idle 
                = (1U & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__need_resp)));
        } else {
            if ((2U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state))) {
                if ((4U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state))) {
                    if ((1U & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack)))) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__idle = 1U;
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__idle = 1U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) {
            if ((1U != (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                if ((2U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                    if ((0x10U != (0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U))))) {
                        if ((0x17U != (0x3fU & (IData)(
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                        >> 0x22U))))) {
                            if ((4U != (0x3fU & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x22U))))) {
                                if ((0x38U != (0x3fU 
                                               & (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x22U))))) {
                                    if ((0x39U != (0x3fU 
                                                   & (IData)(
                                                             (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                              >> 0x22U))))) {
                                        if ((0x3cU 
                                             == (0x3fU 
                                                 & (IData)(
                                                           (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                            >> 0x22U))))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbdata0 
                                                = (IData)(
                                                          (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                           >> 2U));
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbdata0 = 0U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) {
            if ((1U != (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                if ((2U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                    if ((0x10U != (0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U))))) {
                        if ((0x17U != (0x3fU & (IData)(
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                        >> 0x22U))))) {
                            if ((4U != (0x3fU & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x22U))))) {
                                if ((0x38U != (0x3fU 
                                               & (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x22U))))) {
                                    if ((0x39U != (0x3fU 
                                                   & (IData)(
                                                             (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                              >> 0x22U))))) {
                                        if ((0x3cU 
                                             == (0x3fU 
                                                 & (IData)(
                                                           (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                            >> 0x22U))))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_wdata 
                                                = (IData)(
                                                          (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                           >> 2U));
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_wdata = 0U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) {
            if ((1U != (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                if ((2U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                    if ((0x10U != (0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U))))) {
                        if ((0x17U != (0x3fU & (IData)(
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                        >> 0x22U))))) {
                            if ((4U != (0x3fU & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x22U))))) {
                                if ((0x38U != (0x3fU 
                                               & (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x22U))))) {
                                    if ((0x39U != (0x3fU 
                                                   & (IData)(
                                                             (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                              >> 0x22U))))) {
                                        if ((0x3cU 
                                             == (0x3fU 
                                                 & (IData)(
                                                           (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                            >> 0x22U))))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_we = 1U;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_we = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_we = 0U;
    }
}

VL_INLINE_OPT void Vtb_top_verilator::_sequent__TOP__5(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_sequent__TOP__5\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    CData/*5:0*/ __Vtableidx2;
    // Body
    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state;
    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req;
    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle;
    __Vtableidx2 = (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TMS) 
                     << 5U) | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state) 
                                << 1U) | (IData)(vlTOPp->rst_ni)));
    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state 
        = vlTOPp->__Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state
        [__Vtableidx2];
    if (vlTOPp->rst_ni) {
        if ((8U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state))) {
            if (((0x10U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg)) 
                 & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg 
                            >> 0x10U)))) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__sticky_busy = 0U;
            }
        } else {
            if ((3U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state))) {
                if ((0x11U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__sticky_busy 
                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy;
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__sticky_busy = 0U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_valid) {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_is_busy = 1U;
        } else {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_rdy) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_is_busy = 0U;
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_is_busy = 0U;
    }
    if (vlTOPp->rst_ni) {
        if ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state))) {
            vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req 
                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_valid;
        } else {
            if ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state))) {
                if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack) {
                    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req = 0U;
                }
            }
        }
    } else {
        vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req = 0U;
    }
    if (vlTOPp->rst_ni) {
        if ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state))) {
            vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle 
                = (1U & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_valid)));
        } else {
            if ((2U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state))) {
                if ((4U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state))) {
                    if ((1U & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack)))) {
                        vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle = 1U;
                    }
                }
            }
        }
    } else {
        vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle = 1U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_rdy) {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_resp_data 
                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_data;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_resp_data = VL_ULL(0);
    }
    if (vlTOPp->rst_ni) {
        if ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))) {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_rdy = 1U;
            }
        } else {
            if ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_rdy = 0U;
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_rdy = 0U;
    }
    if (vlTOPp->rst_ni) {
        if ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))) {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_data 
                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req_data;
            }
        } else {
            if ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_data = VL_ULL(0);
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_data = VL_ULL(0);
    }
}

VL_INLINE_OPT void Vtb_top_verilator::_sequent__TOP__6(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_sequent__TOP__6\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    CData/*3:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state;
    CData/*0:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__invert_result;
    CData/*4:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state;
    CData/*0:0*/ __Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom__v0;
    CData/*0:0*/ __Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram__v0;
    SData/*11:0*/ __Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom__v0;
    SData/*11:0*/ __Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram__v0;
    IData/*31:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o;
    IData/*31:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r;
    IData/*31:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r;
    IData/*31:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count;
    IData/*31:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result;
    IData/*31:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain;
    IData/*31:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend;
    IData/*31:0*/ __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o;
    IData/*31:0*/ __Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom__v0;
    IData/*31:0*/ __Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram__v0;
    // Body
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state;
    __Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram__v0 = 0U;
    __Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom__v0 = 0U;
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o;
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o;
    vlTOPp->__Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v0 = 0U;
    vlTOPp->__Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v1 = 0U;
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__invert_result 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__invert_result;
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain;
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count;
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state;
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r;
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result;
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r;
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__succ 
        = (1U & ((~ (IData)(vlTOPp->rst_ni)) | (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                                                [0x1bU])));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__over 
        = (1U & ((~ (IData)(vlTOPp->rst_ni)) | (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                                                [0x1aU])));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle 
        = ((IData)(vlTOPp->rst_ni) ? (VL_ULL(1) + vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle)
            : VL_ULL(0));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__int_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (2U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 0U : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__int_flag));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_we_ff__DOT__qout_r 
        = ((~ ((~ (IData)(vlTOPp->rst_ni)) | (3U <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o)))) 
           & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_we_o));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_jump_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (3U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 0U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_jump_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (3U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 0U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_we_ff__DOT__qout_r 
        = ((~ ((~ (IData)(vlTOPp->rst_ni)) | (3U <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o)))) 
           & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_we_o));
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o) {
            if ((0x305U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                if ((0x342U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mcause 
                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o;
                }
            }
        } else {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_we_o) {
                if ((0x305U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                    if ((0x342U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mcause 
                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o;
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mcause = 0U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o) {
            if ((0x305U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                if ((0x342U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                    if ((0x341U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                        if ((0x304U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                            if ((0x300U != (0xfffU 
                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                                if ((0x340U == (0xfffU 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mscratch 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o;
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_we_o) {
                if ((0x305U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                    if ((0x342U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                        if ((0x341U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                            if ((0x304U != (0xfffU 
                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                                if ((0x300U != (0xfffU 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                                    if ((0x340U == 
                                         (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mscratch 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mscratch = 0U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o) {
            if ((0x305U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                if ((0x342U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                    if ((0x341U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                        if ((0x304U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mie 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o;
                        }
                    }
                }
            }
        } else {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_we_o) {
                if ((0x305U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                    if ((0x342U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                        if ((0x341U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                            if ((0x304U == (0xfffU 
                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mie 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o;
                            }
                        }
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mie = 0U;
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (3U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 0U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__csr_data_o);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_addr_o 
        = ((IData)(vlTOPp->rst_ni) ? ((0x10U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                       ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mtvec
                                       : ((8U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                           ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mepc
                                           : 0U)) : 0U);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_addr_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (3U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 0U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r);
    if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o) {
        __Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram__v0 
            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o;
        __Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram__v0 = 1U;
        __Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram__v0 
            = (0xfffU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o 
                         >> 2U));
    }
    if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o) {
        __Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom__v0 
            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o;
        __Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom__v0 = 1U;
        __Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom__v0 
            = (0xfffU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o 
                         >> 2U));
    }
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o 
        = ((IData)(vlTOPp->rst_ni) ? ((0x10U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                       ? ((8U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                           ? 0U : (
                                                   (4U 
                                                    & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                     ? 0U
                                                     : 
                                                    ((1U 
                                                      & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                      ? 0U
                                                      : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__cause))))
                                       : ((8U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                           ? ((4U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                               ? 0U
                                               : ((2U 
                                                   & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                   ? 0U
                                                   : 
                                                  ((1U 
                                                    & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                    ? 0U
                                                    : 
                                                   ((0xfffffff0U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus) 
                                                    | ((8U 
                                                        & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus 
                                                           >> 4U)) 
                                                       | (7U 
                                                          & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus))))))
                                           : ((4U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                               ? ((2U 
                                                   & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                   ? 0U
                                                   : 
                                                  ((1U 
                                                    & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                    ? 0U
                                                    : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__inst_addr))
                                               : ((2U 
                                                   & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                   ? 
                                                  ((1U 
                                                    & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                    ? 0U
                                                    : 
                                                   (0xfffffff7U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus))
                                                   : 0U))))
            : 0U);
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reset_req)))
            ? 0U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_flag_o)
                     ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_addr_o
                     : ((1U <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))
                         ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o
                         : ((IData)(4U) + vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o))));
    if (vlTOPp->rst_ni) {
        if (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_we_o) 
             & (0U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_waddr_o)))) {
            vlTOPp->__Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v0 
                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_wdata_o;
            vlTOPp->__Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v0 = 1U;
            vlTOPp->__Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v0 
                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_waddr_o;
        } else {
            if (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_we) 
                 & (0U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr)))) {
                vlTOPp->__Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v1 
                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_wdata;
                vlTOPp->__Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v1 = 1U;
                vlTOPp->__Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v1 
                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr;
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o 
        = ((IData)(vlTOPp->rst_ni) & ((0x10U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state)) 
                                      | (8U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (3U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 0U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (3U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 0U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o);
    if (vlTOPp->rst_ni) {
        if ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state))) {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_div_start_o) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r 
                    = (7U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                             >> 0xcU));
                __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r 
                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r;
                __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r 
                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r;
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_reg_waddr_o 
                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_waddr_ff__DOT__qout_r;
                __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state = 2U;
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o = 1U;
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r = 0U;
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_reg_waddr_o = 0U;
                __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r = 0U;
                __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r = 0U;
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o = 0U;
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o = 0U;
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o = 0U;
            }
        } else {
            if ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state))) {
                if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_div_start_o) {
                    if ((0U == vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o 
                            = (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_div) 
                                | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_divu))
                                ? 0xffffffffU : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r);
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o = 1U;
                        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state = 1U;
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o = 0U;
                    } else {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o = 1U;
                        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count = 0x40000000U;
                        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state = 4U;
                        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result = 0U;
                        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain = 0U;
                        if (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_div) 
                             | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_rem))) {
                            if ((0x80000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r)) {
                                __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_invert;
                            }
                            if ((0x80000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r)) {
                                __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_invert;
                                __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend 
                                    = (1U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_invert 
                                             >> 0x1fU));
                            } else {
                                __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend 
                                    = (1U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r 
                                             >> 0x1fU));
                            }
                        } else {
                            __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend 
                                = (1U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r 
                                         >> 0x1fU));
                        }
                        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__invert_result 
                            = (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_div) 
                                & ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r 
                                    ^ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r) 
                                   >> 0x1fU)) | ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_rem) 
                                                 & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r 
                                                    >> 0x1fU)));
                    }
                } else {
                    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state = 1U;
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o = 0U;
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o = 0U;
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o = 0U;
                }
            } else {
                if ((4U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state))) {
                    if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_div_start_o) {
                        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r 
                            = (0xfffffffeU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r 
                                              << 1U));
                        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result 
                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result_tmp;
                        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count 
                            = (0x7fffffffU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count 
                                              >> 1U));
                        if ((0U != vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count)) {
                            __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend 
                                = ((0xfffffffeU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_tmp 
                                                   << 1U)) 
                                   | (1U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r 
                                            >> 0x1eU)));
                        } else {
                            __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state = 8U;
                            __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain 
                                = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor)
                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_sub_res
                                    : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend);
                        }
                    } else {
                        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state = 1U;
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o = 0U;
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o = 0U;
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o = 0U;
                    }
                } else {
                    if ((8U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state))) {
                        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_div_start_o) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o = 1U;
                            __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state = 1U;
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o = 0U;
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o 
                                = (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_div) 
                                    | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_divu))
                                    ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__invert_result)
                                        ? (- vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result)
                                        : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result)
                                    : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__invert_result)
                                        ? (- vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain)
                                        : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain));
                        } else {
                            __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state = 1U;
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o = 0U;
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o = 0U;
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o = 0U;
                        }
                    }
                }
            }
        }
    } else {
        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state = 1U;
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o = 0U;
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o = 0U;
        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result = 0U;
        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain = 0U;
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r = 0U;
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_reg_waddr_o = 0U;
        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r = 0U;
        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r = 0U;
        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend = 0U;
        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__invert_result = 0U;
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o = 0U;
        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count = 0U;
    }
    if (__Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram__v0) {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram[__Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram__v0] 
            = __Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram__v0;
    }
    if (__Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom__v0) {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom[__Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom__v0] 
            = __Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom__v0;
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state 
        = __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count 
        = __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain 
        = __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__invert_result 
        = __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__invert_result;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r 
        = __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result 
        = __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r 
        = __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend 
        = __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_jump_ff__DOT__qout_r 
           + vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_jump_ff__DOT__qout_r);
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o) {
            if ((0x305U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mtvec 
                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o;
            }
        } else {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_we_o) {
                if ((0x305U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mtvec 
                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o;
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mtvec = 0U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o) {
            if ((0x305U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                if ((0x342U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                    if ((0x341U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mepc 
                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o;
                    }
                }
            }
        } else {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_we_o) {
                if ((0x305U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                    if ((0x342U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                        if ((0x341U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mepc 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o;
                        }
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mepc = 0U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o) {
            if ((0x305U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                if ((0x342U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                    if ((0x341U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                        if ((0x304U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                            if ((0x300U == (0xfffU 
                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r))) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o;
                            }
                        }
                    }
                }
            }
        } else {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_we_o) {
                if ((0x305U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                    if ((0x342U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                        if ((0x341U != (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                            if ((0x304U != (0xfffU 
                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                                if ((0x300U == (0xfffU 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o;
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus = 0U;
    }
    if (vlTOPp->rst_ni) {
        if ((0x10U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))) {
            __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state = 1U;
        } else {
            if ((8U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))) {
                __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state = 1U;
            } else {
                if ((4U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))) {
                    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state 
                        = ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                            ? 1U : ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                     ? 1U : 2U));
                } else {
                    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))) {
                        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state 
                            = ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                ? 1U : 0x10U);
                    } else {
                        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))) {
                            if ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__int_state))) {
                                __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state = 4U;
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__inst_addr 
                                    = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_flag_o)
                                        ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_addr_o 
                                           - (IData)(4U))
                                        : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r);
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__cause 
                                    = ((0x73U == vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                        ? 0xbU : ((0x100073U 
                                                   == vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 3U
                                                   : 0xaU));
                            } else {
                                if ((4U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__int_state))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__cause = 0x80000004U;
                                    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state = 4U;
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__inst_addr 
                                        = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_flag_o)
                                            ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_addr_o
                                            : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_div_start_o)
                                                ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r 
                                                   - (IData)(4U))
                                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r));
                                } else {
                                    if ((8U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__int_state))) {
                                        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state = 8U;
                                    }
                                }
                            }
                        } else {
                            __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state = 1U;
                        }
                    }
                }
            }
        }
    } else {
        __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state = 1U;
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__cause = 0U;
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__inst_addr = 0U;
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
           == vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed 
        = VL_GTES_III(1,32,32, vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r, vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
           >= vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
           + vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_invert 
        = (- vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_div 
        = (4U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_divu 
        = (5U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_rem 
        = (6U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_invert 
        = (- vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_sub_res 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend 
           - vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend 
           >= vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_waddr_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (3U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 0U : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_waddr_o));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (3U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 0U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (3U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 0U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (3U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 1U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o 
        = __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o 
        = ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
           & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_we_ff__DOT__qout_r));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result_tmp 
        = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor)
            ? (1U | (0xfffffffeU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result 
                                    << 1U))) : (0xfffffffeU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result 
                                                   << 1U)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_tmp 
        = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor)
            ? (0x7fffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_sub_res)
            : (0x7fffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_we_o 
        = ((IData)(vlTOPp->rst_ni) & ((0x10U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                       ? ((~ ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state) 
                                              >> 3U)) 
                                          & ((~ ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state) 
                                                 >> 2U)) 
                                             & ((~ 
                                                 ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state) 
                                                  >> 1U)) 
                                                & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state)))))
                                       : ((8U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                           ? ((~ ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state) 
                                                  >> 2U)) 
                                              & ((~ 
                                                  ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state) 
                                                   >> 1U)) 
                                                 & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))))
                                           : ((4U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                               ? ((~ 
                                                   ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state) 
                                                    >> 1U)) 
                                                  & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state)))
                                               : (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state) 
                                                   >> 1U) 
                                                  & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state)))))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o 
        = ((IData)(vlTOPp->rst_ni) ? ((0x10U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                       ? ((8U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                           ? 0U : (
                                                   (4U 
                                                    & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                     ? 0U
                                                     : 
                                                    ((1U 
                                                      & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                      ? 0U
                                                      : 0x342U))))
                                       : ((8U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                           ? ((4U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                               ? 0U
                                               : ((2U 
                                                   & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                   ? 0U
                                                   : 
                                                  ((1U 
                                                    & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                    ? 0U
                                                    : 0x300U)))
                                           : ((4U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                               ? ((2U 
                                                   & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                   ? 0U
                                                   : 
                                                  ((1U 
                                                    & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                    ? 0U
                                                    : 0x341U))
                                               : ((2U 
                                                   & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                   ? 
                                                  ((1U 
                                                    & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state))
                                                    ? 0U
                                                    : 0x300U)
                                                   : 0U))))
            : 0U);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (3U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 0U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_waddr_o);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (2U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 0U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
        = ((1U & ((~ (IData)(vlTOPp->rst_ni)) | (2U 
                                                 <= (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o))))
            ? 1U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m1_data_o);
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr 
                    = ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                        ? ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                            ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res
                                    : 0U) : 0U) : 0U)
                        : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                            ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res
                                    : 0U) : 0U) : (
                                                   (2U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((1U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x4000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((0x2000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       ((- (IData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned))) 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res)
                                                        : 
                                                       ((- (IData)(
                                                                   (1U 
                                                                    & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned))))) 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res))
                                                       : 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       ((- (IData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed))) 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res)
                                                        : 
                                                       ((- (IData)(
                                                                   (1U 
                                                                    & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed))))) 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res)))
                                                      : 
                                                     ((0x2000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                       ? 0U
                                                       : 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       ((- (IData)(
                                                                   (1U 
                                                                    & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2))))) 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res)
                                                        : 
                                                       ((- (IData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2))) 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res))))
                                                     : 0U)
                                                    : 0U)));
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr 
            = ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                ? 0U : ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                         ? 0U : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                  ? ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                      ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                          ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                              ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res
                                              : 0U)
                                          : 0U) : 0U)
                                  : 0U)));
    }
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o 
                                            = ((0x1000U 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                ? (
                                                   (~ 
                                                    (0x1fU 
                                                     & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xfU))) 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r)
                                                : (
                                                   (0x1fU 
                                                    & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                       >> 0xfU)) 
                                                   | vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r));
                                    } else {
                                        if ((0x1000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o 
                                                = (0x1fU 
                                                   & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                      >> 0xfU));
                                        }
                                    }
                                } else {
                                    if ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o 
                                            = ((0x1000U 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r 
                                                   & (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                                : (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                   | vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r));
                                    } else {
                                        if ((0x1000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o 
                                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag 
                    = (1U & ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                              ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                  >> 2U) & ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                             >> 1U) 
                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r))
                              : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                  ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                      >> 1U) & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                  : ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                      >> 1U) & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                & ((0x4000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0x2000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned)
                                                      : 
                                                     (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned)))
                                                     : 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed)
                                                      : 
                                                     (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed))))
                                                    : 
                                                   ((~ 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                      >> 0xdU)) 
                                                    & ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2))
                                                        : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2)))))))));
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag 
            = (1U & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                         >> 5U)) & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                        >> 4U)) & (
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 3U) 
                                                   & ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                       >> 2U) 
                                                      & ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                          >> 1U) 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r))))));
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_div_start_o 
        = (1U & ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
                 & (((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                     & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                        >> 0x19U))))
                     ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                        >> 0xeU) : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_we_o 
        = ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
           & ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_we_ff__DOT__qout_r) 
              | ((~ ((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                     & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                        >> 0x19U))))) 
                 & ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)) 
                    & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o)))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_waddr_o 
        = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_waddr_ff__DOT__qout_r) 
           | (((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
               & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                  >> 0x19U)))) ? 0U
               : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)
                   ? 0U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o)
                            ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_reg_waddr_o)
                            : 0U))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index 
        = (3U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                 + (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                    >> 7U)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index 
        = (3U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                 + (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                    >> 0x14U)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp 
        = ((QData)((IData)((((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                             & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                >> 0x19U))))
                             ? ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                 ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r
                                 : ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                     ? ((0x1000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                         ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r
                                         : ((0x80000000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                             ? ((IData)(1U) 
                                                + (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                             : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                     : ((0x1000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                         ? ((0x80000000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                             ? ((IData)(1U) 
                                                + (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                             : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                         : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)))
                             : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))) 
           * (QData)((IData)((((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                               & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0x19U))))
                               ? ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                   ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r
                                   : ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                       ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r
                                       : ((0x1000U 
                                           & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                           ? ((0x80000000U 
                                               & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)
                                               ? ((IData)(1U) 
                                                  + 
                                                  (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))
                                               : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)
                                           : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)))
                               : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))));
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o 
            = ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? 0U : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                             ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                      ? 0U : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                               ? ((1U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0U 
                                                    == 
                                                    (7U 
                                                     & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xcU)))
                                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                    : 
                                                   ((1U 
                                                     == 
                                                     (7U 
                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                         >> 0xcU)))
                                                     ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                     : 
                                                    ((2U 
                                                      == 
                                                      (7U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                          >> 0xcU)))
                                                      ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                      : 0U)))
                                                   : 0U)
                                               : 0U))))
                : 0U);
    }
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o 
            = ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? 0U : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                             ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                      ? 0U : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                               ? ((1U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0U 
                                                    == 
                                                    (7U 
                                                     & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xcU)))
                                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                    : 
                                                   ((1U 
                                                     == 
                                                     (7U 
                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                         >> 0xcU)))
                                                     ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                     : 
                                                    ((2U 
                                                      == 
                                                      (7U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                          >> 0xcU)))
                                                      ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                      : 0U)))
                                                   : 0U)
                                               : 0U))))
                : ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? 0U : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                             ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                      ? 0U : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                               ? ((1U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0x4000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0x2000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 0U
                                                     : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res)
                                                    : 
                                                   ((0x2000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 0U
                                                      : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res)
                                                     : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res))
                                                   : 0U)
                                               : 0U)))));
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 0U;
    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                  >> 6U)))) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                if ((0U == (7U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xcU)))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 1U;
                                } else {
                                    if ((1U == (7U 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                   >> 0xcU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 1U;
                                    } else {
                                        if ((2U == 
                                             (7U & 
                                              (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                               >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 1U;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 1U;
                                    }
                                } else {
                                    if ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 1U;
                                        }
                                    } else {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 1U;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we 
            = ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                >> 5U) & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                              >> 4U)) & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                             >> 3U)) 
                                         & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                >> 2U)) 
                                            & ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                >> 1U) 
                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  & ((0U 
                                                      == 
                                                      (7U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                          >> 0xcU))) 
                                                     | ((1U 
                                                         == 
                                                         (7U 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                             >> 0xcU))) 
                                                        | (2U 
                                                           == 
                                                           (7U 
                                                            & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                               >> 0xcU)))))))))));
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state 
        = __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
        = __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_addr_o 
        = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)
            ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_addr_o
            : (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr 
               | (((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                   & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                      >> 0x19U)))) ? 
                  ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res
                    : 0U) : 0U)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_flag_o 
        = (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag) 
            | (((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                   >> 0x19U)))) & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                   >> 0xeU))) 
           | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o));
    vlTOPp->__Vtableidx1 = (2U | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_req_i) 
                                   << 3U) | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_req_i) 
                                              << 2U) 
                                             | ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
                                                & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req)))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant 
        = vlTOPp->__Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant
        [vlTOPp->__Vtableidx1];
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o 
        = vlTOPp->__Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o
        [vlTOPp->__Vtableidx1];
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o 
        = ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
           & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__csr_clint_data_o 
        = ((((0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o) 
             == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o)) 
            & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_we_o))
            ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o
            : (((((((((0xc00U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o)) 
                      | (0xc80U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))) 
                     | (0x305U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))) 
                    | (0x342U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))) 
                   | (0x341U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))) 
                  | (0x304U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))) 
                 | (0x300U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))) 
                | (0x340U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o)))
                ? ((0xc00U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                    ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle)
                    : ((0xc80U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                        ? (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle 
                                   >> 0x20U)) : ((0x305U 
                                                  == 
                                                  (0xfffU 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                                                  ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mtvec
                                                  : 
                                                 ((0x342U 
                                                   == 
                                                   (0xfffU 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                                                   ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mcause
                                                   : 
                                                  ((0x341U 
                                                    == 
                                                    (0xfffU 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mepc
                                                    : 
                                                   ((0x304U 
                                                     == 
                                                     (0xfffU 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                                                     ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mie
                                                     : 
                                                    ((0x300U 
                                                      == 
                                                      (0xfffU 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                                                      ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus
                                                      : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mscratch)))))))
                : 0U));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_we_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_we_o 
                                    = (1U & ((0x4000U 
                                              & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                              ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU) 
                                                 | (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU))
                                              : ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU) 
                                                 | (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU))));
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_waddr_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_waddr_o 
                                    = (0xfffU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                 >> 0x14U));
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o 
                                    = ((0xfff00000U 
                                        & ((- (IData)(
                                                      (1U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                          >> 0x1fU)))) 
                                           << 0x14U)) 
                                       | ((0xff000U 
                                           & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r) 
                                          | ((0x800U 
                                              & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                 >> 9U)) 
                                             | (0x7feU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x14U)))));
                            }
                        }
                    }
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o 
                                    = ((0xfffff000U 
                                        & ((- (IData)(
                                                      (1U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                          >> 0x1fU)))) 
                                           << 0xcU)) 
                                       | (0xfffU & 
                                          (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                           >> 0x14U)));
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o 
                                        = ((0xfffff000U 
                                            & ((- (IData)(
                                                          (1U 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0x1fU)))) 
                                               << 0xcU)) 
                                           | ((0x800U 
                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  << 4U)) 
                                              | ((0x7e0U 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x14U)) 
                                                 | (0x1eU 
                                                    & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 7U)))));
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o 
                                            = ((0xfffff000U 
                                                & ((- (IData)(
                                                              (1U 
                                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                  >> 0x1fU)))) 
                                                   << 0xcU)) 
                                               | ((0x800U 
                                                   & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      << 4U)) 
                                                  | ((0x7e0U 
                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                         >> 0x14U)) 
                                                     | (0x1eU 
                                                        & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                           >> 7U)))));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((1U & (~ ((0U == 
                                               (0x7fU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U))) 
                                              | (0x20U 
                                                 == 
                                                 (0x7fU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x19U))))))) {
                                    if ((1U == (0x7fU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U)))) {
                                        if ((0x4000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o = 4U;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o = 4U;
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_we_o 
        = (1U & ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                  ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                      >> 5U) & ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                 ? ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                        >> 3U)) & (
                                                   (~ 
                                                    (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 2U)) 
                                                   & ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 1U) 
                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                         & ((0x4000U 
                                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                             ? 
                                                            ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0xdU) 
                                                             | (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                >> 0xcU))
                                                             : 
                                                            ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0xdU) 
                                                             | (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                >> 0xcU)))))))
                                 : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                     ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                         >> 2U) & (
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 1U) 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r))
                                     : ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                         >> 2U) & (
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 1U) 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)))))
                  : ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                      ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U) & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                        >> 3U)) & (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 1U) 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    : 
                                                   ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 1U) 
                                                    & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       & (((0U 
                                                            == 
                                                            (0x7fU 
                                                             & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                >> 0x19U))) 
                                                           | (0x20U 
                                                              == 
                                                              (0x7fU 
                                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                  >> 0x19U)))) 
                                                          | ((1U 
                                                              == 
                                                              (0x7fU 
                                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                  >> 0x19U))) 
                                                             & (~ 
                                                                (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                 >> 0xeU)))))))))
                      : ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                          ? ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                 >> 3U)) & ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                             ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                 >> 1U) 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                             : ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                 >> 1U) 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)))
                          : ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                 >> 3U)) & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 2U)) 
                                            & ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 1U) 
                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  & ((0x4000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (~ 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 0xdU))
                                                      : 
                                                     ((~ 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xdU)) 
                                                      | (~ 
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                          >> 0xcU))))))))))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_waddr_o 
        = (0x1fU & ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                     ? ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                         ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                             ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                 ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                          ? 0U : ((2U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((1U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0x4000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x2000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      >> 7U)
                                                      : 
                                                     ((0x1000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 7U)
                                                       : 0U))
                                                     : 
                                                    ((0x2000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      >> 7U)
                                                      : 
                                                     ((0x1000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 7U)
                                                       : 0U)))
                                                    : 0U)
                                                   : 0U)))
                             : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                 ? ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                     ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                         ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                             ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 7U)
                                             : 0U) : 0U)
                                     : 0U) : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                               ? ((2U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((1U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 7U)
                                                    : 0U)
                                                   : 0U)
                                               : 0U)))
                         : 0U) : ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                   ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                       ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      >> 7U)
                                                      : 0U)
                                                     : 0U)
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (((0U 
                                                        == 
                                                        (0x7fU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                            >> 0x19U))) 
                                                       | (0x20U 
                                                          == 
                                                          (0x7fU 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0x19U))))
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 7U)
                                                       : 
                                                      ((1U 
                                                        == 
                                                        (0x7fU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                            >> 0x19U)))
                                                        ? 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 7U)
                                                        : 0U))
                                                      : 0U)
                                                     : 0U)))
                                       : 0U) : ((0x10U 
                                                 & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                 ? 
                                                ((8U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                  ? 0U
                                                  : 
                                                 ((4U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((2U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((1U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 7U)
                                                     : 0U)
                                                    : 0U)
                                                   : 
                                                  ((2U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((1U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 7U)
                                                     : 0U)
                                                    : 0U)))
                                                 : 
                                                ((8U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                  ? 0U
                                                  : 
                                                 ((4U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 0U
                                                   : 
                                                  ((2U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((1U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x4000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((0x2000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                       ? 0U
                                                       : 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 7U))
                                                      : 
                                                     ((0x2000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                        ? 0U
                                                        : 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 7U))
                                                       : 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 7U)))
                                                     : 0U)
                                                    : 0U)))))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o 
                                    = (0xfffU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                 >> 0x14U));
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg2_raddr_o 
        = (0x1fU & ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                     ? ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                         ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                             ? 0U : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                      ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                               ? 0U
                                               : ((2U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((1U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0x4000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x14U)
                                                     : 
                                                    ((0x2000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 0U
                                                      : 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      >> 0x14U)))
                                                    : 0U)
                                                   : 0U))))
                         : 0U) : ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                   ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                       ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (((0U 
                                                        == 
                                                        (0x7fU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                            >> 0x19U))) 
                                                       | (0x20U 
                                                          == 
                                                          (0x7fU 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0x19U))))
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 0x14U)
                                                       : 
                                                      ((1U 
                                                        == 
                                                        (0x7fU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                            >> 0x19U)))
                                                        ? 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 0x14U)
                                                        : 0U))
                                                      : 0U)
                                                     : 0U)))
                                       : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((((0U 
                                                         == 
                                                         (7U 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                             >> 0xcU))) 
                                                        | (2U 
                                                           == 
                                                           (7U 
                                                            & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                               >> 0xcU)))) 
                                                       | (1U 
                                                          == 
                                                          (7U 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0xcU))))
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 0x14U)
                                                       : 0U)
                                                      : 0U)
                                                     : 0U))))
                                   : 0U)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg1_raddr_o 
        = (0x1fU & ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                     ? ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                         ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                             ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                 ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                          ? 0U : ((2U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((1U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0x4000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 0U
                                                     : 
                                                    ((0x2000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      >> 0xfU)
                                                      : 
                                                     ((0x1000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 0xfU)
                                                       : 0U)))
                                                    : 0U)
                                                   : 0U)))
                             : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                 ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                          ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                              ? ((1U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                  ? 
                                                 (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xfU)
                                                  : 0U)
                                              : 0U)
                                          : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                              ? ((1U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                  ? 
                                                 ((0x4000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0xfU)
                                                   : 
                                                  ((0x2000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xfU)))
                                                  : 0U)
                                              : 0U))))
                         : 0U) : ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                   ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                       ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (((0U 
                                                        == 
                                                        (0x7fU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                            >> 0x19U))) 
                                                       | (0x20U 
                                                          == 
                                                          (0x7fU 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0x19U))))
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 0xfU)
                                                       : 
                                                      ((1U 
                                                        == 
                                                        (0x7fU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                            >> 0x19U)))
                                                        ? 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xfU)
                                                        : 0U))
                                                      : 0U)
                                                     : 0U)))
                                       : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((((0U 
                                                         == 
                                                         (7U 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                             >> 0xcU))) 
                                                        | (2U 
                                                           == 
                                                           (7U 
                                                            & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                               >> 0xcU)))) 
                                                       | (1U 
                                                          == 
                                                          (7U 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0xcU))))
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 0xfU)
                                                       : 0U)
                                                      : 0U)
                                                     : 0U))))
                                   : ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                       ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      >> 0xfU)
                                                      : 0U)
                                                     : 0U)))
                                       : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((0x4000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      ((0x2000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                        ? 0U
                                                        : 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xfU))
                                                       : 
                                                      ((0x2000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       ((0x1000U 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                         ? 0U
                                                         : 
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                         >> 0xfU))
                                                        : 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xfU)))
                                                      : 0U)
                                                     : 0U)))))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
        = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o)
            ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o
            : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__csr_data_o 
        = ((((0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r) 
             == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o)) 
            & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o))
            ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o
            : (((((((((0xc00U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o)) 
                      | (0xc80U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))) 
                     | (0x305U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))) 
                    | (0x342U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))) 
                   | (0x341U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))) 
                  | (0x304U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))) 
                 | (0x300U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))) 
                | (0x340U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o)))
                ? ((0xc00U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                    ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle)
                    : ((0xc80U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                        ? (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle 
                                   >> 0x20U)) : ((0x305U 
                                                  == 
                                                  (0xfffU 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                                                  ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mtvec
                                                  : 
                                                 ((0x342U 
                                                   == 
                                                   (0xfffU 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                                                   ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mcause
                                                   : 
                                                  ((0x341U 
                                                    == 
                                                    (0xfffU 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mepc
                                                    : 
                                                   ((0x304U 
                                                     == 
                                                     (0xfffU 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                                                     ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mie
                                                     : 
                                                    ((0x300U 
                                                      == 
                                                      (0xfffU 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                                                      ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus
                                                      : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mscratch)))))))
                : 0U));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i);
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i);
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i);
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i);
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i);
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i);
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i);
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i);
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i);
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i);
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i);
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i);
                        }
                    }
                }
            }
        }
    }
}

void Vtb_top_verilator::_settle__TOP__7(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_settle__TOP__7\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_div 
        = (4U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_divu 
        = (5U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_rem 
        = (6U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_invert 
        = (- vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_invert 
        = (- vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_sub_res 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend 
           - vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend 
           >= vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_jump_ff__DOT__qout_r 
           + vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_jump_ff__DOT__qout_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
           == vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed 
        = VL_GTES_III(1,32,32, vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r, vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
           >= vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
           + vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o 
        = ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
           & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_we_ff__DOT__qout_r));
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = 0U;
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o 
                                            = ((0x1000U 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                ? (
                                                   (~ 
                                                    (0x1fU 
                                                     & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xfU))) 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r)
                                                : (
                                                   (0x1fU 
                                                    & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                       >> 0xfU)) 
                                                   | vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r));
                                    } else {
                                        if ((0x1000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o 
                                                = (0x1fU 
                                                   & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                      >> 0xfU));
                                        }
                                    }
                                } else {
                                    if ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o 
                                            = ((0x1000U 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r 
                                                   & (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                                : (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                   | vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r));
                                    } else {
                                        if ((0x1000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o 
                                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_div_start_o 
        = (1U & ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
                 & (((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                     & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                        >> 0x19U))))
                     ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                        >> 0xeU) : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_we_o 
        = ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
           & ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_we_ff__DOT__qout_r) 
              | ((~ ((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                     & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                        >> 0x19U))))) 
                 & ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)) 
                    & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o)))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_waddr_o 
        = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_waddr_ff__DOT__qout_r) 
           | (((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
               & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                  >> 0x19U)))) ? 0U
               : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)
                   ? 0U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o)
                            ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_reg_waddr_o)
                            : 0U))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index 
        = (3U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                 + (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                    >> 7U)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index 
        = (3U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                 + (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                    >> 0x14U)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp 
        = ((QData)((IData)((((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                             & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                >> 0x19U))))
                             ? ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                 ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r
                                 : ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                     ? ((0x1000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                         ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r
                                         : ((0x80000000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                             ? ((IData)(1U) 
                                                + (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                             : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                     : ((0x1000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                         ? ((0x80000000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                             ? ((IData)(1U) 
                                                + (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))
                                             : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                         : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)))
                             : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r))) 
           * (QData)((IData)((((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                               & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0x19U))))
                               ? ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                   ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r
                                   : ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                       ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r
                                       : ((0x1000U 
                                           & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                           ? ((0x80000000U 
                                               & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)
                                               ? ((IData)(1U) 
                                                  + 
                                                  (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))
                                               : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)
                                           : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)))
                               : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 0U;
    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                  >> 6U)))) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                if ((0U == (7U & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xcU)))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 1U;
                                } else {
                                    if ((1U == (7U 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                   >> 0xcU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 1U;
                                    } else {
                                        if ((2U == 
                                             (7U & 
                                              (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                               >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 1U;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 1U;
                                    }
                                } else {
                                    if ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 1U;
                                        }
                                    } else {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = 1U;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we 
            = ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                >> 5U) & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                              >> 4U)) & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                             >> 3U)) 
                                         & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                >> 2U)) 
                                            & ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                >> 1U) 
                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  & ((0U 
                                                      == 
                                                      (7U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                          >> 0xcU))) 
                                                     | ((1U 
                                                         == 
                                                         (7U 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                             >> 0xcU))) 
                                                        | (2U 
                                                           == 
                                                           (7U 
                                                            & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                               >> 0xcU)))))))))));
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_we_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_we_o 
                                    = (1U & ((0x4000U 
                                              & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                              ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU) 
                                                 | (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU))
                                              : ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU) 
                                                 | (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU))));
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_waddr_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_waddr_o 
                                    = (0xfffU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                 >> 0x14U));
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o 
                                    = ((0xfff00000U 
                                        & ((- (IData)(
                                                      (1U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                          >> 0x1fU)))) 
                                           << 0x14U)) 
                                       | ((0xff000U 
                                           & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r) 
                                          | ((0x800U 
                                              & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                 >> 9U)) 
                                             | (0x7feU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x14U)))));
                            }
                        }
                    }
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o 
                                    = ((0xfffff000U 
                                        & ((- (IData)(
                                                      (1U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                          >> 0x1fU)))) 
                                           << 0xcU)) 
                                       | (0xfffU & 
                                          (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                           >> 0x14U)));
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o 
                                        = ((0xfffff000U 
                                            & ((- (IData)(
                                                          (1U 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0x1fU)))) 
                                               << 0xcU)) 
                                           | ((0x800U 
                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  << 4U)) 
                                              | ((0x7e0U 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x14U)) 
                                                 | (0x1eU 
                                                    & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 7U)))));
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o 
                                            = ((0xfffff000U 
                                                & ((- (IData)(
                                                              (1U 
                                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                  >> 0x1fU)))) 
                                                   << 0xcU)) 
                                               | ((0x800U 
                                                   & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      << 4U)) 
                                                  | ((0x7e0U 
                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                         >> 0x14U)) 
                                                     | (0x1eU 
                                                        & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                           >> 7U)))));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((1U & (~ ((0U == 
                                               (0x7fU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U))) 
                                              | (0x20U 
                                                 == 
                                                 (0x7fU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x19U))))))) {
                                    if ((1U == (0x7fU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U)))) {
                                        if ((0x4000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o = 4U;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o = 4U;
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_we_o 
        = (1U & ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                  ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                      >> 5U) & ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                 ? ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                        >> 3U)) & (
                                                   (~ 
                                                    (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 2U)) 
                                                   & ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 1U) 
                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                         & ((0x4000U 
                                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                             ? 
                                                            ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0xdU) 
                                                             | (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                >> 0xcU))
                                                             : 
                                                            ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0xdU) 
                                                             | (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                >> 0xcU)))))))
                                 : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                     ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                         >> 2U) & (
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 1U) 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r))
                                     : ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                         >> 2U) & (
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 1U) 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)))))
                  : ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                      ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U) & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                        >> 3U)) & (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 1U) 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    : 
                                                   ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 1U) 
                                                    & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       & (((0U 
                                                            == 
                                                            (0x7fU 
                                                             & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                >> 0x19U))) 
                                                           | (0x20U 
                                                              == 
                                                              (0x7fU 
                                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                  >> 0x19U)))) 
                                                          | ((1U 
                                                              == 
                                                              (0x7fU 
                                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                  >> 0x19U))) 
                                                             & (~ 
                                                                (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                 >> 0xeU)))))))))
                      : ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                          ? ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                 >> 3U)) & ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                             ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                 >> 1U) 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                             : ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                 >> 1U) 
                                                & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)))
                          : ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                 >> 3U)) & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 2U)) 
                                            & ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 1U) 
                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  & ((0x4000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (~ 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 0xdU))
                                                      : 
                                                     ((~ 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xdU)) 
                                                      | (~ 
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                          >> 0xcU))))))))))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_waddr_o 
        = (0x1fU & ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                     ? ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                         ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                             ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                 ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                          ? 0U : ((2U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((1U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0x4000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x2000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      >> 7U)
                                                      : 
                                                     ((0x1000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 7U)
                                                       : 0U))
                                                     : 
                                                    ((0x2000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      >> 7U)
                                                      : 
                                                     ((0x1000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 7U)
                                                       : 0U)))
                                                    : 0U)
                                                   : 0U)))
                             : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                 ? ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                     ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                         ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                             ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 7U)
                                             : 0U) : 0U)
                                     : 0U) : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                               ? ((2U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((1U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 7U)
                                                    : 0U)
                                                   : 0U)
                                               : 0U)))
                         : 0U) : ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                   ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                       ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      >> 7U)
                                                      : 0U)
                                                     : 0U)
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (((0U 
                                                        == 
                                                        (0x7fU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                            >> 0x19U))) 
                                                       | (0x20U 
                                                          == 
                                                          (0x7fU 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0x19U))))
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 7U)
                                                       : 
                                                      ((1U 
                                                        == 
                                                        (0x7fU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                            >> 0x19U)))
                                                        ? 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 7U)
                                                        : 0U))
                                                      : 0U)
                                                     : 0U)))
                                       : 0U) : ((0x10U 
                                                 & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                 ? 
                                                ((8U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                  ? 0U
                                                  : 
                                                 ((4U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((2U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((1U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 7U)
                                                     : 0U)
                                                    : 0U)
                                                   : 
                                                  ((2U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((1U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 7U)
                                                     : 0U)
                                                    : 0U)))
                                                 : 
                                                ((8U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                  ? 0U
                                                  : 
                                                 ((4U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 0U
                                                   : 
                                                  ((2U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((1U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x4000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((0x2000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                       ? 0U
                                                       : 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 7U))
                                                      : 
                                                     ((0x2000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                        ? 0U
                                                        : 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 7U))
                                                       : 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 7U)))
                                                     : 0U)
                                                    : 0U)))))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__csr_clint_data_o 
        = ((((0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o) 
             == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o)) 
            & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_we_o))
            ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o
            : (((((((((0xc00U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o)) 
                      | (0xc80U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))) 
                     | (0x305U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))) 
                    | (0x342U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))) 
                   | (0x341U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))) 
                  | (0x304U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))) 
                 | (0x300U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))) 
                | (0x340U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o)))
                ? ((0xc00U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                    ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle)
                    : ((0xc80U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                        ? (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle 
                                   >> 0x20U)) : ((0x305U 
                                                  == 
                                                  (0xfffU 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                                                  ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mtvec
                                                  : 
                                                 ((0x342U 
                                                   == 
                                                   (0xfffU 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                                                   ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mcause
                                                   : 
                                                  ((0x341U 
                                                    == 
                                                    (0xfffU 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mepc
                                                    : 
                                                   ((0x304U 
                                                     == 
                                                     (0xfffU 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                                                     ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mie
                                                     : 
                                                    ((0x300U 
                                                      == 
                                                      (0xfffU 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o))
                                                      ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus
                                                      : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mscratch)))))))
                : 0U));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o 
                                    = (0xfffU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                 >> 0x14U));
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg2_raddr_o 
        = (0x1fU & ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                     ? ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                         ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                             ? 0U : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                      ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                               ? 0U
                                               : ((2U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((1U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0x4000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x14U)
                                                     : 
                                                    ((0x2000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 0U
                                                      : 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      >> 0x14U)))
                                                    : 0U)
                                                   : 0U))))
                         : 0U) : ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                   ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                       ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (((0U 
                                                        == 
                                                        (0x7fU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                            >> 0x19U))) 
                                                       | (0x20U 
                                                          == 
                                                          (0x7fU 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0x19U))))
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 0x14U)
                                                       : 
                                                      ((1U 
                                                        == 
                                                        (0x7fU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                            >> 0x19U)))
                                                        ? 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 0x14U)
                                                        : 0U))
                                                      : 0U)
                                                     : 0U)))
                                       : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((((0U 
                                                         == 
                                                         (7U 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                             >> 0xcU))) 
                                                        | (2U 
                                                           == 
                                                           (7U 
                                                            & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                               >> 0xcU)))) 
                                                       | (1U 
                                                          == 
                                                          (7U 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0xcU))))
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 0x14U)
                                                       : 0U)
                                                      : 0U)
                                                     : 0U))))
                                   : 0U)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg1_raddr_o 
        = (0x1fU & ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                     ? ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                         ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                             ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                 ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                          ? 0U : ((2U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((1U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0x4000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 0U
                                                     : 
                                                    ((0x2000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      >> 0xfU)
                                                      : 
                                                     ((0x1000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 0xfU)
                                                       : 0U)))
                                                    : 0U)
                                                   : 0U)))
                             : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                 ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                          ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                              ? ((1U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                  ? 
                                                 (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xfU)
                                                  : 0U)
                                              : 0U)
                                          : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                              ? ((1U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                  ? 
                                                 ((0x4000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0xfU)
                                                   : 
                                                  ((0x2000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xfU)))
                                                  : 0U)
                                              : 0U))))
                         : 0U) : ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                   ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                       ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (((0U 
                                                        == 
                                                        (0x7fU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                            >> 0x19U))) 
                                                       | (0x20U 
                                                          == 
                                                          (0x7fU 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0x19U))))
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 0xfU)
                                                       : 
                                                      ((1U 
                                                        == 
                                                        (0x7fU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                            >> 0x19U)))
                                                        ? 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xfU)
                                                        : 0U))
                                                      : 0U)
                                                     : 0U)))
                                       : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((((0U 
                                                         == 
                                                         (7U 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                             >> 0xcU))) 
                                                        | (2U 
                                                           == 
                                                           (7U 
                                                            & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                               >> 0xcU)))) 
                                                       | (1U 
                                                          == 
                                                          (7U 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0xcU))))
                                                       ? 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                       >> 0xfU)
                                                       : 0U)
                                                      : 0U)
                                                     : 0U))))
                                   : ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                       ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                      >> 0xfU)
                                                      : 0U)
                                                     : 0U)))
                                       : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (4U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 0U
                                                    : 
                                                   ((2U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((1U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((0x4000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      ((0x2000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                        ? 0U
                                                        : 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xfU))
                                                       : 
                                                      ((0x2000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       ((0x1000U 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                         ? 0U
                                                         : 
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                         >> 0xfU))
                                                        : 
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xfU)))
                                                      : 0U)
                                                     : 0U)))))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0_next 
        = ((IData)(4U) + vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0);
    vlTOPp->__Vtableidx4 = (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack) 
                             << 4U) | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__need_resp) 
                                        << 3U) | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next 
        = vlTOPp->__Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next
        [vlTOPp->__Vtableidx4];
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state_next 
        = ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))
            ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req)
                ? 2U : 1U) : ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))
                               ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req)
                                   ? 2U : 1U) : 1U));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy 
        = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__sticky_busy) 
           | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_is_busy));
    vlTOPp->__Vtableidx3 = (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack) 
                             << 4U) | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_valid) 
                                        << 3U) | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next 
        = vlTOPp->__Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next
        [vlTOPp->__Vtableidx3];
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state_next 
        = ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))
            ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req)
                ? 2U : 1U) : ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))
                               ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req)
                                   ? 2U : 1U) : 1U));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result_tmp 
        = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor)
            ? (1U | (0xfffffffeU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result 
                                    << 1U))) : (0xfffffffeU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result 
                                                   << 1U)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_tmp 
        = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor)
            ? (0x7fffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_sub_res)
            : (0x7fffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend));
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr 
                    = ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                        ? ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                            ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res
                                    : 0U) : 0U) : 0U)
                        : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                            ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res
                                    : 0U) : 0U) : (
                                                   (2U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((1U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x4000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((0x2000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       ((- (IData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned))) 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res)
                                                        : 
                                                       ((- (IData)(
                                                                   (1U 
                                                                    & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned))))) 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res))
                                                       : 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       ((- (IData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed))) 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res)
                                                        : 
                                                       ((- (IData)(
                                                                   (1U 
                                                                    & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed))))) 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res)))
                                                      : 
                                                     ((0x2000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                       ? 0U
                                                       : 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       ((- (IData)(
                                                                   (1U 
                                                                    & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2))))) 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res)
                                                        : 
                                                       ((- (IData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2))) 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res))))
                                                     : 0U)
                                                    : 0U)));
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr 
            = ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                ? 0U : ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                         ? 0U : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                  ? ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                      ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                          ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                              ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res
                                              : 0U)
                                          : 0U) : 0U)
                                  : 0U)));
    }
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag 
                    = (1U & ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                              ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                  >> 2U) & ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                             >> 1U) 
                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r))
                              : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                  ? ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                      >> 1U) & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                  : ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                      >> 1U) & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                & ((0x4000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0x2000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned)
                                                      : 
                                                     (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned)))
                                                     : 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed)
                                                      : 
                                                     (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed))))
                                                    : 
                                                   ((~ 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                      >> 0xdU)) 
                                                    & ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2))
                                                        : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2)))))))));
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag 
            = (1U & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                         >> 5U)) & ((~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                        >> 4U)) & (
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 3U) 
                                                   & ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                       >> 2U) 
                                                      & ((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                          >> 1U) 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r))))));
    }
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o 
            = ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? 0U : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                             ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                      ? 0U : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                               ? ((1U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0U 
                                                    == 
                                                    (7U 
                                                     & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xcU)))
                                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                    : 
                                                   ((1U 
                                                     == 
                                                     (7U 
                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                         >> 0xcU)))
                                                     ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                     : 
                                                    ((2U 
                                                      == 
                                                      (7U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                          >> 0xcU)))
                                                      ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                      : 0U)))
                                                   : 0U)
                                               : 0U))))
                : 0U);
    }
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o 
            = ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? 0U : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                             ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                      ? 0U : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                               ? ((1U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0U 
                                                    == 
                                                    (7U 
                                                     & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xcU)))
                                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                    : 
                                                   ((1U 
                                                     == 
                                                     (7U 
                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                         >> 0xcU)))
                                                     ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                     : 
                                                    ((2U 
                                                      == 
                                                      (7U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                          >> 0xcU)))
                                                      ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                      : 0U)))
                                                   : 0U)
                                               : 0U))))
                : ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? 0U : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                             ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                      ? 0U : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                               ? ((1U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0x4000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0x2000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 0U
                                                     : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res)
                                                    : 
                                                   ((0x2000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 0U
                                                      : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res)
                                                     : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res))
                                                   : 0U)
                                               : 0U)))));
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__int_state 
        = ((IData)(vlTOPp->rst_ni) ? (((0x73U == vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r) 
                                       | (0x100073U 
                                          == vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r))
                                       ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_div_start_o)
                                           ? 1U : 2U)
                                       : (((0U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__int_ff__DOT__qout_r)) 
                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus 
                                              >> 3U))
                                           ? 4U : (
                                                   (0x30200073U 
                                                    == vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 8U
                                                    : 1U)))
            : 1U);
    vlTOPp->__Vtableidx1 = (2U | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_req_i) 
                                   << 3U) | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_req_i) 
                                              << 2U) 
                                             | ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
                                                & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req)))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant 
        = vlTOPp->__Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant
        [vlTOPp->__Vtableidx1];
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o 
        = vlTOPp->__Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o
        [vlTOPp->__Vtableidx1];
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o 
        = ((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)) 
           & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__csr_data_o 
        = ((((0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r) 
             == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o)) 
            & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o))
            ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o
            : (((((((((0xc00U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o)) 
                      | (0xc80U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))) 
                     | (0x305U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))) 
                    | (0x342U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))) 
                   | (0x341U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))) 
                  | (0x304U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))) 
                 | (0x300U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))) 
                | (0x340U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o)))
                ? ((0xc00U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                    ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle)
                    : ((0xc80U == (0xfffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                        ? (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle 
                                   >> 0x20U)) : ((0x305U 
                                                  == 
                                                  (0xfffU 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                                                  ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mtvec
                                                  : 
                                                 ((0x342U 
                                                   == 
                                                   (0xfffU 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                                                   ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mcause
                                                   : 
                                                  ((0x341U 
                                                    == 
                                                    (0xfffU 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mepc
                                                    : 
                                                   ((0x304U 
                                                     == 
                                                     (0xfffU 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                                                     ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mie
                                                     : 
                                                    ((0x300U 
                                                      == 
                                                      (0xfffU 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o))
                                                      ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus
                                                      : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mscratch)))))))
                : 0U));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_addr_o 
        = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o)
            ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_addr_o
            : (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr 
               | (((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                   & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                      >> 0x19U)))) ? 
                  ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res
                    : 0U) : 0U)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_flag_o 
        = (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag) 
            | (((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                   >> 0x19U)))) & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                   >> 0xeU))) 
           | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
        = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o)
            ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o
            : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o 
        = ((1U & (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_flag_o) 
                   | ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag) 
                      | (((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                          & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                             >> 0x19U))))
                          ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                             >> 0xeU) : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)))) 
                  | ((1U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__int_state)) 
                     | (1U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state)))))
            ? 3U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o)
                     ? 1U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req)
                              ? 3U : 0U)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i);
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i);
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i);
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i);
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i);
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i);
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i);
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i);
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i);
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i);
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i);
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o);
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o 
                                = (0xfffffffU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i);
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i 
        = ((IData)(vlTOPp->rst_ni) ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram
           [(0xfffU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o 
                       >> 2U))] : 0U);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i 
        = ((IData)(vlTOPp->rst_ni) ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom
           [(0xfffU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o 
                       >> 2U))] : 0U);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_o 
                            = ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_i);
                    }
                } else {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_o 
                        = ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)
                            ? ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_i)
                            : ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i));
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant)))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_o 
                            = ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_i);
                    }
                } else {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_o 
                        = ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)
                            ? ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_i)
                            : ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i));
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m1_data_o = 1U;
    if ((1U & (~ ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant) 
                  >> 1U)))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m1_data_o 
                            = ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_i);
                    }
                } else {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m1_data_o 
                        = ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)
                            ? ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_i)
                            : ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i));
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o = 0U;
    if ((1U & (~ ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant) 
                  >> 1U)))) {
        if ((1U & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant)))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                            = ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_i);
                    }
                } else {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                        = ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)
                            ? ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_i)
                            : ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i));
                }
            }
        }
    }
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o 
            = ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? 0U : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                             ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                      ? 0U : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                               ? ((1U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0U 
                                                    == 
                                                    (7U 
                                                     & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xcU)))
                                                    ? 
                                                   ((0U 
                                                     == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index))
                                                     ? 
                                                    ((0xffffff00U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o) 
                                                     | (0xffU 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))
                                                     : 
                                                    ((1U 
                                                      == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index))
                                                      ? 
                                                     ((0xffff0000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o) 
                                                      | ((0xff00U 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                             << 8U)) 
                                                         | (0xffU 
                                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)))
                                                      : 
                                                     ((2U 
                                                       == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index))
                                                       ? 
                                                      ((0xff000000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o) 
                                                       | ((0xff0000U 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                              << 0x10U)) 
                                                          | (0xffffU 
                                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)))
                                                       : 
                                                      ((0xff000000U 
                                                        & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                           << 0x18U)) 
                                                       | (0xffffffU 
                                                          & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)))))
                                                    : 
                                                   ((1U 
                                                     == 
                                                     (7U 
                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                         >> 0xcU)))
                                                     ? 
                                                    ((0U 
                                                      == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index))
                                                      ? 
                                                     ((0xffff0000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o) 
                                                      | (0xffffU 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))
                                                      : 
                                                     ((0xffff0000U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                          << 0x10U)) 
                                                      | (0xffffU 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)))
                                                     : 
                                                    ((2U 
                                                      == 
                                                      (7U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                          >> 0xcU)))
                                                      ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r
                                                      : 0U)))
                                                   : 0U)
                                               : 0U))))
                : 0U);
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__reg_wdata 
        = ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
            ? ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                        ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                 ? 0U : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                          ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                              ? ((0x4000U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                  ? 
                                                 ((0x2000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r
                                                   : 
                                                  ((0x1000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r
                                                    : 0U))
                                                  : 
                                                 ((0x2000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r
                                                   : 
                                                  ((0x1000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r
                                                    : 0U)))
                                              : 0U)
                                          : 0U))) : 
                   ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                     ? ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                         ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                             ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                 ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                 : 0U) : 0U) : 0U) : 
                    ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                      ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                          ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                              ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                              : 0U) : 0U) : 0U))) : 0U)
            : ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                        ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                 ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                     ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                         ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                         : 0U) : 0U)
                                 : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                     ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                         ? (((0U == 
                                              (0x7fU 
                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0x19U))) 
                                             | (0x20U 
                                                == 
                                                (0x7fU 
                                                 & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0x19U))))
                                             ? ((0x4000U 
                                                 & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                 ? 
                                                ((0x2000U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                  ? 
                                                 ((0x1000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r)
                                                   : 
                                                  (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                   | vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r))
                                                  : 
                                                 ((0x1000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0x40000000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   (((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                      >> 
                                                      (0x1fU 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)) 
                                                     & (0xffffffffU 
                                                        >> 
                                                        (0x1fU 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))) 
                                                    | ((- (IData)(
                                                                  (1U 
                                                                   & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                                      >> 0x1fU)))) 
                                                       & (~ 
                                                          (0xffffffffU 
                                                           >> 
                                                           (0x1fU 
                                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)))))
                                                    : 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                    >> 
                                                    (0x1fU 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)))
                                                   : 
                                                  (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                   ^ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r)))
                                                 : 
                                                ((0x2000U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                  ? 
                                                 ((0x1000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  (1U 
                                                   & (- (IData)(
                                                                (1U 
                                                                 & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned))))))
                                                   : 
                                                  (1U 
                                                   & (- (IData)(
                                                                (1U 
                                                                 & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed)))))))
                                                  : 
                                                 ((0x1000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                   << 
                                                   (0x1fU 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r))
                                                   : 
                                                  ((0x40000000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                    - vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r)
                                                    : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res))))
                                             : ((1U 
                                                 == 
                                                 (0x7fU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x19U)))
                                                 ? 
                                                ((0x4000U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                  ? 0U
                                                  : 
                                                 ((0x2000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0x1000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? (IData)(
                                                              (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp 
                                                               >> 0x20U))
                                                    : 
                                                   ((0x80000000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                                     ? (IData)(
                                                               ((VL_ULL(1) 
                                                                 + 
                                                                 (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp)) 
                                                                >> 0x20U))
                                                     : (IData)(
                                                               (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp 
                                                                >> 0x20U))))
                                                   : 
                                                  ((0x1000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0U 
                                                     == 
                                                     ((2U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                          >> 0x1eU)) 
                                                      | (1U 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                            >> 0x1fU))))
                                                     ? (IData)(
                                                               (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp 
                                                                >> 0x20U))
                                                     : 
                                                    ((3U 
                                                      == 
                                                      ((2U 
                                                        & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                           >> 0x1eU)) 
                                                       | (1U 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                             >> 0x1fU))))
                                                      ? (IData)(
                                                                (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp 
                                                                 >> 0x20U))
                                                      : 
                                                     ((2U 
                                                       == 
                                                       ((2U 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                            >> 0x1eU)) 
                                                        | (1U 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                              >> 0x1fU))))
                                                       ? (IData)(
                                                                 ((VL_ULL(1) 
                                                                   + 
                                                                   (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp)) 
                                                                  >> 0x20U))
                                                       : (IData)(
                                                                 ((VL_ULL(1) 
                                                                   + 
                                                                   (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp)) 
                                                                  >> 0x20U)))))
                                                    : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp))))
                                                 : 0U))
                                         : 0U) : 0U)))
                    : 0U) : ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                              ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                  ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                           ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                               ? ((1U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                   : 0U)
                                               : 0U)
                                           : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                               ? ((1U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0x4000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0x2000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r)
                                                      : 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                      | vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r))
                                                     : 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((0x40000000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      (((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                         >> 
                                                         (0x1fU 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                             >> 0x14U))) 
                                                        & (0xffffffffU 
                                                           >> 
                                                           (0x1fU 
                                                            & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                               >> 0x14U)))) 
                                                       | ((- (IData)(
                                                                     (1U 
                                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                                         >> 0x1fU)))) 
                                                          & (~ 
                                                             (0xffffffffU 
                                                              >> 
                                                              (0x1fU 
                                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                                  >> 0x14U))))))
                                                       : 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                       >> 
                                                       (0x1fU 
                                                        & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                           >> 0x14U))))
                                                      : 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                      ^ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r)))
                                                    : 
                                                   ((0x2000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (1U 
                                                      & (- (IData)(
                                                                   (1U 
                                                                    & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned))))))
                                                      : 
                                                     (1U 
                                                      & (- (IData)(
                                                                   (1U 
                                                                    & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed)))))))
                                                     : 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                      << 
                                                      (0x1fU 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                          >> 0x14U)))
                                                      : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res)))
                                                   : 0U)
                                               : 0U)))
                              : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                  ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (2U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((1U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x4000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((0x2000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                       ? 0U
                                                       : 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       ((0U 
                                                         == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                         ? 
                                                        (0xffffU 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)
                                                         : 
                                                        (0xffffU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                            >> 0x10U)))
                                                        : 
                                                       ((0U 
                                                         == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                         ? 
                                                        (0xffU 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)
                                                         : 
                                                        ((1U 
                                                          == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                          ? 
                                                         (0xffU 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                             >> 8U))
                                                          : 
                                                         ((2U 
                                                           == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                           ? 
                                                          (0xffU 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                              >> 0x10U))
                                                           : 
                                                          (0xffU 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                              >> 0x18U)))))))
                                                      : 
                                                     ((0x2000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 0U
                                                        : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)
                                                       : 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       ((0U 
                                                         == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                         ? 
                                                        ((0xffff0000U 
                                                          & ((- (IData)(
                                                                        (1U 
                                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                            >> 0xfU)))) 
                                                             << 0x10U)) 
                                                         | (0xffffU 
                                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o))
                                                         : 
                                                        ((0xffff0000U 
                                                          & ((- (IData)(
                                                                        (1U 
                                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                            >> 0x1fU)))) 
                                                             << 0x10U)) 
                                                         | (0xffffU 
                                                            & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                               >> 0x10U))))
                                                        : 
                                                       ((0U 
                                                         == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                         ? 
                                                        ((0xffffff00U 
                                                          & ((- (IData)(
                                                                        (1U 
                                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                            >> 7U)))) 
                                                             << 8U)) 
                                                         | (0xffU 
                                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o))
                                                         : 
                                                        ((1U 
                                                          == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                          ? 
                                                         ((0xffffff00U 
                                                           & ((- (IData)(
                                                                         (1U 
                                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                             >> 0xfU)))) 
                                                              << 8U)) 
                                                          | (0xffU 
                                                             & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                >> 8U)))
                                                          : 
                                                         ((2U 
                                                           == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                           ? 
                                                          ((0xffffff00U 
                                                            & ((- (IData)(
                                                                          (1U 
                                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                              >> 0x17U)))) 
                                                               << 8U)) 
                                                           | (0xffU 
                                                              & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                 >> 0x10U)))
                                                           : 
                                                          ((0xffffff00U 
                                                            & ((- (IData)(
                                                                          (1U 
                                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                              >> 0x1fU)))) 
                                                               << 8U)) 
                                                           | (0xffU 
                                                              & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                 >> 0x18U)))))))))
                                                     : 0U)
                                                    : 0U))))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_wdata_o 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__reg_wdata 
           | (((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
               & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                  >> 0x19U)))) ? 0U
               : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)
                   ? 0U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o)
                            ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o
                            : 0U))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o 
        = ((0U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg2_raddr_o))
            ? 0U : ((((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg2_raddr_o) 
                      == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_waddr_o)) 
                     & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_we_o))
                     ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_wdata_o
                     : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                    [vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg2_raddr_o]));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o 
        = ((0U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg1_raddr_o))
            ? 0U : ((((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg1_raddr_o) 
                      == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_waddr_o)) 
                     & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_we_o))
                     ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_wdata_o
                     : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                    [vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg1_raddr_o]));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o = 4U;
                            }
                        }
                    }
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o = 4U;
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o;
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o = 0U;
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if (((0U == (0x7fU 
                                             & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 0x19U))) 
                                     | (0x20U == (0x7fU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x19U))))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o;
                                } else {
                                    if ((1U == (0x7fU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o;
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((((0U == (7U & 
                                              (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                               >> 0xcU))) 
                                      | (2U == (7U 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0xcU)))) 
                                     | (1U == (7U & 
                                               (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 0xcU))))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                        = ((0xfffff000U 
                                            & ((- (IData)(
                                                          (1U 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0x1fU)))) 
                                               << 0xcU)) 
                                           | ((0xfe0U 
                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0x14U)) 
                                              | (0x1fU 
                                                 & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 7U))));
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                    = (0xfffff000U 
                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r);
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                    = ((0xfffff000U 
                                        & ((- (IData)(
                                                      (1U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                          >> 0x1fU)))) 
                                           << 0xcU)) 
                                       | (0xfffU & 
                                          (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                           >> 0x14U)));
                            }
                        }
                    }
                }
            } else {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                            = ((0xfffff000U 
                                                & ((- (IData)(
                                                              (1U 
                                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                  >> 0x1fU)))) 
                                                   << 0xcU)) 
                                               | (0xfffU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x14U)));
                                    }
                                } else {
                                    if ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                                = (
                                                   (0xfffff000U 
                                                    & ((- (IData)(
                                                                  (1U 
                                                                   & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                      >> 0x1fU)))) 
                                                       << 0xcU)) 
                                                   | (0xfffU 
                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                         >> 0x14U)));
                                        }
                                    } else {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                            = ((0xfffff000U 
                                                & ((- (IData)(
                                                              (1U 
                                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                  >> 0x1fU)))) 
                                                   << 0xcU)) 
                                               | (0xfffU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x14U)));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                            }
                        }
                    }
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                    = (0xfffff000U 
                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r);
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if (((0U == (0x7fU 
                                             & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 0x19U))) 
                                     | (0x20U == (0x7fU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x19U))))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                } else {
                                    if ((1U == (0x7fU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((((0U == (7U & 
                                              (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                               >> 0xcU))) 
                                      | (2U == (7U 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0xcU)))) 
                                     | (1U == (7U & 
                                               (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 0xcU))))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                            }
                        }
                    }
                }
            } else {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                    }
                                } else {
                                    if ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                        }
                                    } else {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                            }
                        }
                    }
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((1U & (~ ((0U == 
                                               (0x7fU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U))) 
                                              | (0x20U 
                                                 == 
                                                 (0x7fU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x19U))))))) {
                                    if ((1U == (0x7fU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U)))) {
                                        if ((0x4000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o 
                                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                            }
                        }
                    }
                }
            }
        }
    }
}

VL_INLINE_OPT void Vtb_top_verilator::_sequent__TOP__8(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_sequent__TOP__8\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (vlTOPp->rst_ni) {
        if ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state))) {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__need_resp) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req_data 
                    = (((QData)((IData)((0x3fU & (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x22U))))) 
                        << 0x22U) | ((QData)((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data)) 
                                     << 2U));
            }
        } else {
            if ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state))) {
                if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req_data = VL_ULL(0);
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req_data = VL_ULL(0);
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) {
            if ((1U != (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                if ((2U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                    if ((0x10U == (0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U))))) {
                        if ((1U & (~ (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                              >> 2U))))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reset_req = 0U;
                        }
                    } else {
                        if ((0x17U == (0x3fU & (IData)(
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                        >> 0x22U))))) {
                            if ((0U == (0xffU & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x1aU))))) {
                                if ((2U >= (7U & (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x16U))))) {
                                    if ((1U & (~ (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x14U))))) {
                                        if ((1U & (IData)(
                                                          (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                           >> 0x12U)))) {
                                            if ((0x7b1U 
                                                 == 
                                                 (0xffffU 
                                                  & (IData)(
                                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                             >> 2U))))) {
                                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reset_req = 1U;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reset_req = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reset_req = 0U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) {
            if ((1U != (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                if ((2U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                    if ((0x10U != (0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U))))) {
                        if ((0x17U == (0x3fU & (IData)(
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                        >> 0x22U))))) {
                            if ((0U == (0xffU & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x1aU))))) {
                                if ((2U >= (7U & (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x16U))))) {
                                    if ((1U & (~ (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x14U))))) {
                                        if ((1U & (IData)(
                                                          (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                           >> 0x12U)))) {
                                            if ((0x7b1U 
                                                 != 
                                                 (0xffffU 
                                                  & (IData)(
                                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                             >> 2U))))) {
                                                if (
                                                    (0x1020U 
                                                     > 
                                                     (0xffffU 
                                                      & (IData)(
                                                                (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                                 >> 2U))))) {
                                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_we = 1U;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_we = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_we = 0U;
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state 
        = ((IData)(vlTOPp->rst_ni) ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next)
            : 1U);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__need_resp 
        = ((IData)(vlTOPp->rst_ni) & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack 
        = ((IData)(vlTOPp->rst_ni) & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack_d));
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) {
            if ((1U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                if ((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                   >> 0x27U)))) {
                    if ((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                       >> 0x26U)))) {
                        if ((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                           >> 0x25U)))) {
                            if ((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                               >> 0x24U)))) {
                                if ((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                   >> 0x23U)))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data = 0U;
                                } else {
                                    if ((1U & (IData)(
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                       >> 0x22U)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data = 0U;
                                    } else {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m2_data_o;
                                        if ((0x10000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbcs)) {
                                            vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0 
                                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0_next;
                                        }
                                        if ((0x8000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbcs)) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_addr 
                                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0_next;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data 
                                    = ((1U & (IData)(
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                      >> 0x23U)))
                                        ? 0U : ((1U 
                                                 & (IData)(
                                                           (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                            >> 0x22U)))
                                                 ? 0U
                                                 : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbcs));
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data = 0U;
                        }
                    } else {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data = 0U;
                    }
                } else {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data 
                        = ((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                          >> 0x26U)))
                            ? ((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                              >> 0x25U)))
                                ? 0U : ((1U & (IData)(
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                       >> 0x24U)))
                                         ? ((1U & (IData)(
                                                          (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                           >> 0x23U)))
                                             ? ((1U 
                                                 & (IData)(
                                                           (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                            >> 0x22U)))
                                                 ? 0U
                                                 : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs)
                                             : 0U) : 
                                        ((1U & (IData)(
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                        >> 0x23U)))
                                          ? ((1U & (IData)(
                                                           (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                            >> 0x22U)))
                                              ? 0U : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__hartinfo)
                                          : ((1U & (IData)(
                                                           (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                            >> 0x22U)))
                                              ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus
                                              : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmcontrol))))
                            : ((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                              >> 0x25U)))
                                ? 0U : ((1U & (IData)(
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                       >> 0x24U)))
                                         ? ((1U & (IData)(
                                                          (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                           >> 0x23U)))
                                             ? 0U : 
                                            ((1U & (IData)(
                                                           (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                            >> 0x22U)))
                                              ? 0U : 
                                             ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__is_read_reg)
                                               ? ((0U 
                                                   == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr))
                                                   ? 0U
                                                   : 
                                                  vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                                                  [vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr])
                                               : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__data0)))
                                         : 0U)));
                }
            } else {
                if ((2U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data = 0U;
                    if ((0x10U == (0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U))))) {
                        if ((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                           >> 2U)))) {
                            if ((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                               >> 0x21U)))) {
                                vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus 
                                    = (0x300U | (0xfffff0ffU 
                                                 & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus));
                                vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req = 1U;
                            } else {
                                if (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req) 
                                     & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                >> 0x20U)))) {
                                    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus 
                                        = (0xc00U | 
                                           (0xfffff0ffU 
                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus));
                                    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req = 0U;
                                }
                            }
                        } else {
                            vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus = 0x430c82U;
                            vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs = 0x1000003U;
                            vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req = 0U;
                        }
                    } else {
                        if ((0x17U == (0x3fU & (IData)(
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                        >> 0x22U))))) {
                            if ((0U == (0xffU & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x1aU))))) {
                                if ((2U < (7U & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x16U))))) {
                                    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs 
                                        = (0x200U | vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs);
                                } else {
                                    vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs 
                                        = (0xfffff8ffU 
                                           & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs);
                                    if ((1U & (~ (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x14U))))) {
                                        if ((1U & (IData)(
                                                          (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                           >> 0x12U)))) {
                                            if ((0x7b1U 
                                                 == 
                                                 (0xffffU 
                                                  & (IData)(
                                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                             >> 2U))))) {
                                                vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus 
                                                    = 
                                                    (0xc00U 
                                                     | (0xfffff0ffU 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus));
                                                vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req = 0U;
                                            } else {
                                                if (
                                                    (0x1020U 
                                                     > 
                                                     (0xffffU 
                                                      & (IData)(
                                                                (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                                 >> 2U))))) {
                                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_wdata 
                                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__data0;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if ((4U != (0x3fU & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x22U))))) {
                                if ((0x38U != (0x3fU 
                                               & (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x22U))))) {
                                    if ((0x39U == (0x3fU 
                                                   & (IData)(
                                                             (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                              >> 0x22U))))) {
                                        vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0 
                                            = (IData)(
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                       >> 2U));
                                        if ((0x100000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbcs)) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_addr 
                                                = (IData)(
                                                          (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                           >> 2U));
                                        }
                                    } else {
                                        if ((0x3cU 
                                             == (0x3fU 
                                                 & (IData)(
                                                           (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                            >> 0x22U))))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_addr 
                                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0;
                                            if ((0x10000U 
                                                 & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbcs)) {
                                                vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0 
                                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0_next;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } else {
                    if ((0U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data = 0U;
                    }
                }
            }
        }
    } else {
        vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus = 0x430c82U;
        vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req = 0U;
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_addr = 0U;
        vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0 = 0U;
        vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs = 0x1000003U;
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_wdata = 0U;
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data = 0U;
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus 
        = vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs 
        = vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0 
        = vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req 
        = vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req;
    vlTOPp->__Vtableidx4 = (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack) 
                             << 4U) | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__need_resp) 
                                        << 3U) | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next 
        = vlTOPp->__Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next
        [vlTOPp->__Vtableidx4];
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack_d 
        = ((IData)(vlTOPp->rst_ni) & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__ack));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0_next 
        = ((IData)(4U) + vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0);
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) {
            if ((1U != (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                if ((2U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                    if ((0x10U == (0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U))))) {
                        if ((1U & (~ (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                              >> 2U))))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbcs = 0x20040404U;
                        }
                    } else {
                        if ((0x17U != (0x3fU & (IData)(
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                        >> 0x22U))))) {
                            if ((4U != (0x3fU & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x22U))))) {
                                if ((0x38U == (0x3fU 
                                               & (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x22U))))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbcs 
                                        = (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                   >> 2U));
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbcs = 0x20040404U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) {
            if ((1U != (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                if ((2U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                    if ((0x10U == (0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U))))) {
                        if ((1U & (~ (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                              >> 2U))))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__hartinfo = 0U;
                        }
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__hartinfo = 0U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) {
            if ((1U != (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                if ((2U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                    if ((0x10U == (0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U))))) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmcontrol 
                            = ((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                              >> 2U)))
                                ? (0x10000U | (0xffc0003fU 
                                               & (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 2U))))
                                : (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                           >> 2U)));
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmcontrol = 0U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) {
            if ((1U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                if ((1U & (~ (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                      >> 0x27U))))) {
                    if ((1U & (~ (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                          >> 0x26U))))) {
                        if ((1U & (~ (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                              >> 0x25U))))) {
                            if ((1U & (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                               >> 0x24U)))) {
                                if ((1U & (~ (IData)(
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                      >> 0x23U))))) {
                                    if ((1U & (~ (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x22U))))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__is_read_reg = 0U;
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if ((2U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                    if ((0x10U != (0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U))))) {
                        if ((0x17U == (0x3fU & (IData)(
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                        >> 0x22U))))) {
                            if ((0U == (0xffU & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x1aU))))) {
                                if ((2U >= (7U & (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x16U))))) {
                                    if ((1U & (~ (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x14U))))) {
                                        if ((1U & (~ (IData)(
                                                             (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                              >> 0x12U))))) {
                                            if ((0x7b0U 
                                                 != 
                                                 (0xffffU 
                                                  & (IData)(
                                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                             >> 2U))))) {
                                                if (
                                                    (0x1020U 
                                                     > 
                                                     (0xffffU 
                                                      & (IData)(
                                                                (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                                 >> 2U))))) {
                                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__is_read_reg = 1U;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__is_read_reg = 0U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) {
            if ((1U != (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                if ((2U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                    if ((0x10U != (0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U))))) {
                        if ((0x17U == (0x3fU & (IData)(
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                        >> 0x22U))))) {
                            if ((0U == (0xffU & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x1aU))))) {
                                if ((2U >= (7U & (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x16U))))) {
                                    if ((1U & (~ (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x14U))))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr 
                                            = (0x1fU 
                                               & (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 2U)));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr = 0U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) {
            if ((1U != (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                if ((2U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                    if ((0x10U != (0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U))))) {
                        if ((0x17U == (0x3fU & (IData)(
                                                       (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                        >> 0x22U))))) {
                            if ((0U == (0xffU & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x1aU))))) {
                                if ((2U >= (7U & (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x16U))))) {
                                    if ((1U & (~ (IData)(
                                                         (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                          >> 0x14U))))) {
                                        if ((1U & (~ (IData)(
                                                             (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                              >> 0x12U))))) {
                                            if ((0x7b0U 
                                                 == 
                                                 (0xffffU 
                                                  & (IData)(
                                                            (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                             >> 2U))))) {
                                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__data0 
                                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dcsr;
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            if ((4U == (0x3fU & (IData)(
                                                        (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                         >> 0x22U))))) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__data0 
                                    = (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                               >> 2U));
                            }
                        }
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__data0 = 0U;
    }
    if (vlTOPp->rst_ni) {
        if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy) {
            if ((1U != (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                if ((2U == (3U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data)))) {
                    if ((0x10U == (0x3fU & (IData)(
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                                    >> 0x22U))))) {
                        if ((1U & (~ (IData)((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                                              >> 2U))))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dcsr = 0xc0U;
                        }
                    }
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dcsr = 0U;
    }
    if (vlTOPp->rst_ni) {
        if ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))) {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy = 1U;
            }
        } else {
            if ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy = 0U;
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy = 0U;
    }
    if (vlTOPp->rst_ni) {
        if ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))) {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data 
                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req_data;
            }
        } else {
            if ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data = VL_ULL(0);
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data = VL_ULL(0);
    }
}

VL_INLINE_OPT void Vtb_top_verilator::_combo__TOP__9(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_combo__TOP__9\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__int_state 
        = ((IData)(vlTOPp->rst_ni) ? (((0x73U == vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r) 
                                       | (0x100073U 
                                          == vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r))
                                       ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_div_start_o)
                                           ? 1U : 2U)
                                       : (((0U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__int_ff__DOT__qout_r)) 
                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus 
                                              >> 3U))
                                           ? 4U : (
                                                   (0x30200073U 
                                                    == vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)
                                                    ? 8U
                                                    : 1U)))
            : 1U);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i 
        = ((IData)(vlTOPp->rst_ni) ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram
           [(0xfffU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o 
                       >> 2U))] : 0U);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i 
        = ((IData)(vlTOPp->rst_ni) ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom
           [(0xfffU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o 
                       >> 2U))] : 0U);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o 
        = ((1U & (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_flag_o) 
                   | ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag) 
                      | (((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
                          & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                             >> 0x19U))))
                          ? (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                             >> 0xeU) : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)))) 
                  | ((1U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__int_state)) 
                     | (1U != (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state)))))
            ? 3U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o)
                     ? 1U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req)
                              ? 3U : 0U)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_o 
                            = ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_i);
                    }
                } else {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_o 
                        = ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)
                            ? ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_i)
                            : ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i));
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant)))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_o 
                            = ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_i);
                    }
                } else {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_o 
                        = ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)
                            ? ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_i)
                            : ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i));
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m1_data_o = 1U;
    if ((1U & (~ ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant) 
                  >> 1U)))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m1_data_o 
                            = ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_i);
                    }
                } else {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m1_data_o 
                        = ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)
                            ? ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_i)
                            : ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i));
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o = 0U;
    if ((1U & (~ ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant) 
                  >> 1U)))) {
        if ((1U & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant)))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                            = ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_i);
                    }
                } else {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                        = ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)
                            ? ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_i)
                            : ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)
                                ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i
                                : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i));
                }
            }
        }
    }
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                                        }
                                    }
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                                        }
                                    }
                                }
                            } else {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                            }
                        } else {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
                        }
                    }
                }
            } else {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o 
            = ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? 0U : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                             ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                      ? 0U : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                               ? ((1U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0U 
                                                    == 
                                                    (7U 
                                                     & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                        >> 0xcU)))
                                                    ? 
                                                   ((0U 
                                                     == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index))
                                                     ? 
                                                    ((0xffffff00U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o) 
                                                     | (0xffU 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))
                                                     : 
                                                    ((1U 
                                                      == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index))
                                                      ? 
                                                     ((0xffff0000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o) 
                                                      | ((0xff00U 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                             << 8U)) 
                                                         | (0xffU 
                                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)))
                                                      : 
                                                     ((2U 
                                                       == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index))
                                                       ? 
                                                      ((0xff000000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o) 
                                                       | ((0xff0000U 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                              << 0x10U)) 
                                                          | (0xffffU 
                                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)))
                                                       : 
                                                      ((0xff000000U 
                                                        & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                           << 0x18U)) 
                                                       | (0xffffffU 
                                                          & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)))))
                                                    : 
                                                   ((1U 
                                                     == 
                                                     (7U 
                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                         >> 0xcU)))
                                                     ? 
                                                    ((0U 
                                                      == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index))
                                                      ? 
                                                     ((0xffff0000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o) 
                                                      | (0xffffU 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))
                                                      : 
                                                     ((0xffff0000U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                          << 0x10U)) 
                                                      | (0xffffU 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)))
                                                     : 
                                                    ((2U 
                                                      == 
                                                      (7U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                          >> 0xcU)))
                                                      ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r
                                                      : 0U)))
                                                   : 0U)
                                               : 0U))))
                : 0U);
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__reg_wdata 
        = ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
            ? ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                        ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                 ? 0U : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                          ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                              ? ((0x4000U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                  ? 
                                                 ((0x2000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r
                                                   : 
                                                  ((0x1000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r
                                                    : 0U))
                                                  : 
                                                 ((0x2000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r
                                                   : 
                                                  ((0x1000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r
                                                    : 0U)))
                                              : 0U)
                                          : 0U))) : 
                   ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                     ? ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                         ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                             ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                 ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                 : 0U) : 0U) : 0U) : 
                    ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                      ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                          ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                              ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                              : 0U) : 0U) : 0U))) : 0U)
            : ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                ? ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                    ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                        ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                 ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                     ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                         ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                         : 0U) : 0U)
                                 : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                     ? ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                         ? (((0U == 
                                              (0x7fU 
                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                  >> 0x19U))) 
                                             | (0x20U 
                                                == 
                                                (0x7fU 
                                                 & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                    >> 0x19U))))
                                             ? ((0x4000U 
                                                 & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                 ? 
                                                ((0x2000U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                  ? 
                                                 ((0x1000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r)
                                                   : 
                                                  (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                   | vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r))
                                                  : 
                                                 ((0x1000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0x40000000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   (((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                      >> 
                                                      (0x1fU 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)) 
                                                     & (0xffffffffU 
                                                        >> 
                                                        (0x1fU 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r))) 
                                                    | ((- (IData)(
                                                                  (1U 
                                                                   & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                                      >> 0x1fU)))) 
                                                       & (~ 
                                                          (0xffffffffU 
                                                           >> 
                                                           (0x1fU 
                                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)))))
                                                    : 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                    >> 
                                                    (0x1fU 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r)))
                                                   : 
                                                  (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                   ^ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r)))
                                                 : 
                                                ((0x2000U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                  ? 
                                                 ((0x1000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  (1U 
                                                   & (- (IData)(
                                                                (1U 
                                                                 & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned))))))
                                                   : 
                                                  (1U 
                                                   & (- (IData)(
                                                                (1U 
                                                                 & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed)))))))
                                                  : 
                                                 ((0x1000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                   << 
                                                   (0x1fU 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r))
                                                   : 
                                                  ((0x40000000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                    - vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r)
                                                    : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res))))
                                             : ((1U 
                                                 == 
                                                 (0x7fU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x19U)))
                                                 ? 
                                                ((0x4000U 
                                                  & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                  ? 0U
                                                  : 
                                                 ((0x2000U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0x1000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? (IData)(
                                                              (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp 
                                                               >> 0x20U))
                                                    : 
                                                   ((0x80000000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r)
                                                     ? (IData)(
                                                               ((VL_ULL(1) 
                                                                 + 
                                                                 (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp)) 
                                                                >> 0x20U))
                                                     : (IData)(
                                                               (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp 
                                                                >> 0x20U))))
                                                   : 
                                                  ((0x1000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0U 
                                                     == 
                                                     ((2U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                          >> 0x1eU)) 
                                                      | (1U 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                            >> 0x1fU))))
                                                     ? (IData)(
                                                               (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp 
                                                                >> 0x20U))
                                                     : 
                                                    ((3U 
                                                      == 
                                                      ((2U 
                                                        & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                           >> 0x1eU)) 
                                                       | (1U 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                             >> 0x1fU))))
                                                      ? (IData)(
                                                                (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp 
                                                                 >> 0x20U))
                                                      : 
                                                     ((2U 
                                                       == 
                                                       ((2U 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                            >> 0x1eU)) 
                                                        | (1U 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r 
                                                              >> 0x1fU))))
                                                       ? (IData)(
                                                                 ((VL_ULL(1) 
                                                                   + 
                                                                   (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp)) 
                                                                  >> 0x20U))
                                                       : (IData)(
                                                                 ((VL_ULL(1) 
                                                                   + 
                                                                   (~ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp)) 
                                                                  >> 0x20U)))))
                                                    : (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp))))
                                                 : 0U))
                                         : 0U) : 0U)))
                    : 0U) : ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                              ? ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                  ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                           ? ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                               ? ((1U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res
                                                   : 0U)
                                               : 0U)
                                           : ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                               ? ((1U 
                                                   & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                   ? 
                                                  ((0x4000U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((0x2000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r)
                                                      : 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                      | vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r))
                                                     : 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((0x40000000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      (((vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                         >> 
                                                         (0x1fU 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                             >> 0x14U))) 
                                                        & (0xffffffffU 
                                                           >> 
                                                           (0x1fU 
                                                            & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                               >> 0x14U)))) 
                                                       | ((- (IData)(
                                                                     (1U 
                                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                                         >> 0x1fU)))) 
                                                          & (~ 
                                                             (0xffffffffU 
                                                              >> 
                                                              (0x1fU 
                                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                                  >> 0x14U))))))
                                                       : 
                                                      (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                       >> 
                                                       (0x1fU 
                                                        & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                           >> 0x14U))))
                                                      : 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r 
                                                      ^ vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r)))
                                                    : 
                                                   ((0x2000U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (1U 
                                                      & (- (IData)(
                                                                   (1U 
                                                                    & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned))))))
                                                      : 
                                                     (1U 
                                                      & (- (IData)(
                                                                   (1U 
                                                                    & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed)))))))
                                                     : 
                                                    ((0x1000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r 
                                                      << 
                                                      (0x1fU 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                                          >> 0x14U)))
                                                      : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res)))
                                                   : 0U)
                                               : 0U)))
                              : ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                  ? 0U : ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                           ? 0U : (
                                                   (2U 
                                                    & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                    ? 
                                                   ((1U 
                                                     & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                     ? 
                                                    ((0x4000U 
                                                      & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                      ? 
                                                     ((0x2000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                       ? 0U
                                                       : 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       ((0U 
                                                         == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                         ? 
                                                        (0xffffU 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)
                                                         : 
                                                        (0xffffU 
                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                            >> 0x10U)))
                                                        : 
                                                       ((0U 
                                                         == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                         ? 
                                                        (0xffU 
                                                         & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)
                                                         : 
                                                        ((1U 
                                                          == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                          ? 
                                                         (0xffU 
                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                             >> 8U))
                                                          : 
                                                         ((2U 
                                                           == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                           ? 
                                                          (0xffU 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                              >> 0x10U))
                                                           : 
                                                          (0xffU 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                              >> 0x18U)))))))
                                                      : 
                                                     ((0x2000U 
                                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                       ? 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 0U
                                                        : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o)
                                                       : 
                                                      ((0x1000U 
                                                        & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)
                                                        ? 
                                                       ((0U 
                                                         == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                         ? 
                                                        ((0xffff0000U 
                                                          & ((- (IData)(
                                                                        (1U 
                                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                            >> 0xfU)))) 
                                                             << 0x10U)) 
                                                         | (0xffffU 
                                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o))
                                                         : 
                                                        ((0xffff0000U 
                                                          & ((- (IData)(
                                                                        (1U 
                                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                            >> 0x1fU)))) 
                                                             << 0x10U)) 
                                                         | (0xffffU 
                                                            & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                               >> 0x10U))))
                                                        : 
                                                       ((0U 
                                                         == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                         ? 
                                                        ((0xffffff00U 
                                                          & ((- (IData)(
                                                                        (1U 
                                                                         & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                            >> 7U)))) 
                                                             << 8U)) 
                                                         | (0xffU 
                                                            & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o))
                                                         : 
                                                        ((1U 
                                                          == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                          ? 
                                                         ((0xffffff00U 
                                                           & ((- (IData)(
                                                                         (1U 
                                                                          & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                             >> 0xfU)))) 
                                                              << 8U)) 
                                                          | (0xffU 
                                                             & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                >> 8U)))
                                                          : 
                                                         ((2U 
                                                           == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index))
                                                           ? 
                                                          ((0xffffff00U 
                                                            & ((- (IData)(
                                                                          (1U 
                                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                              >> 0x17U)))) 
                                                               << 8U)) 
                                                           | (0xffU 
                                                              & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                 >> 0x10U)))
                                                           : 
                                                          ((0xffffff00U 
                                                            & ((- (IData)(
                                                                          (1U 
                                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                              >> 0x1fU)))) 
                                                               << 8U)) 
                                                           | (0xffU 
                                                              & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o 
                                                                 >> 0x18U)))))))))
                                                     : 0U)
                                                    : 0U))))));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                      >> 0x1cU)))) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                              >> 0x1eU)))) {
                    if ((0x20000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o = 0U;
    if ((2U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i;
                        }
                    }
                }
            }
        }
    } else {
        if ((1U & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant))) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o = 0U;
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                          >> 0x1fU)))) {
                if ((0x40000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i 
                                  >> 0x1dU)))) {
                        if ((0x10000000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i)) {
                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o 
                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o;
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_wdata_o 
        = (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__reg_wdata 
           | (((0x33U == (0x7fU & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r)) 
               & (1U == (0x7fU & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r 
                                  >> 0x19U)))) ? 0U
               : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o)
                   ? 0U : ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o)
                            ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o
                            : 0U))));
}

VL_INLINE_OPT void Vtb_top_verilator::_sequent__TOP__10(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_sequent__TOP__10\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (vlTOPp->__Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v0) {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[vlTOPp->__Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v0] 
            = vlTOPp->__Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v0;
    }
    if (vlTOPp->__Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v1) {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[vlTOPp->__Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v1] 
            = vlTOPp->__Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v1;
    }
}

VL_INLINE_OPT void Vtb_top_verilator::_sequent__TOP__11(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_sequent__TOP__11\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (vlTOPp->rst_ni) {
        if ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))) {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__ack = 1U;
            }
        } else {
            if ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))) {
                if ((1U & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req)))) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__ack = 0U;
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__ack = 0U;
    }
    if (vlTOPp->rst_ni) {
        if ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state))) {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_valid) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req_data 
                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_data;
            }
        } else {
            if ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state))) {
                if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req_data = VL_ULL(0);
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req_data = VL_ULL(0);
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state 
        = ((IData)(vlTOPp->rst_ni) ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state_next)
            : 1U);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req 
        = ((IData)(vlTOPp->rst_ni) & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req_d));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state 
        = ((IData)(vlTOPp->rst_ni) ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next)
            : 1U);
    if (vlTOPp->rst_ni) {
        if ((8U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state))) {
            if ((0x11U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))) {
                if (((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy)) 
                     & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle))) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_data 
                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg;
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_data = VL_ULL(0);
    }
    if (vlTOPp->rst_ni) {
        if ((8U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state))) {
            if ((0x11U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg))) {
                if (((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy)) 
                     & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle))) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_valid = 1U;
                }
            }
        } else {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_valid = 0U;
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_valid = 0U;
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack 
        = ((IData)(vlTOPp->rst_ni) & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack_d));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle 
        = vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy 
        = ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__sticky_busy) 
           | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_is_busy));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state_next 
        = ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))
            ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req)
                ? 2U : 1U) : ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state))
                               ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req)
                                   ? 2U : 1U) : 1U));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req_d 
        = ((IData)(vlTOPp->rst_ni) & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req));
    vlTOPp->__Vtableidx3 = (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack) 
                             << 4U) | (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_valid) 
                                        << 3U) | (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state)));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next 
        = vlTOPp->__Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next
        [vlTOPp->__Vtableidx3];
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack_d 
        = ((IData)(vlTOPp->rst_ni) & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__ack));
}

VL_INLINE_OPT void Vtb_top_verilator::_combo__TOP__12(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_combo__TOP__12\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o 
        = ((0U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg2_raddr_o))
            ? 0U : ((((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg2_raddr_o) 
                      == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_waddr_o)) 
                     & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_we_o))
                     ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_wdata_o
                     : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                    [vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg2_raddr_o]));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o 
        = ((0U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg1_raddr_o))
            ? 0U : ((((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg1_raddr_o) 
                      == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_waddr_o)) 
                     & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_we_o))
                     ? vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_wdata_o
                     : vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs
                    [vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg1_raddr_o]));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o = 4U;
                            }
                        }
                    }
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o = 4U;
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o;
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o = 0U;
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if (((0U == (0x7fU 
                                             & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 0x19U))) 
                                     | (0x20U == (0x7fU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x19U))))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o;
                                } else {
                                    if ((1U == (0x7fU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o;
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((((0U == (7U & 
                                              (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                               >> 0xcU))) 
                                      | (2U == (7U 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0xcU)))) 
                                     | (1U == (7U & 
                                               (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 0xcU))))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                        = ((0xfffff000U 
                                            & ((- (IData)(
                                                          (1U 
                                                           & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                              >> 0x1fU)))) 
                                               << 0xcU)) 
                                           | ((0xfe0U 
                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0x14U)) 
                                              | (0x1fU 
                                                 & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 7U))));
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                    = (0xfffff000U 
                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r);
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                    = ((0xfffff000U 
                                        & ((- (IData)(
                                                      (1U 
                                                       & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                          >> 0x1fU)))) 
                                           << 0xcU)) 
                                       | (0xfffU & 
                                          (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                           >> 0x14U)));
                            }
                        }
                    }
                }
            } else {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                            = ((0xfffff000U 
                                                & ((- (IData)(
                                                              (1U 
                                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                  >> 0x1fU)))) 
                                                   << 0xcU)) 
                                               | (0xfffU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x14U)));
                                    }
                                } else {
                                    if ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                                = (
                                                   (0xfffff000U 
                                                    & ((- (IData)(
                                                                  (1U 
                                                                   & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                      >> 0x1fU)))) 
                                                       << 0xcU)) 
                                                   | (0xfffU 
                                                      & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                         >> 0x14U)));
                                        }
                                    } else {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o 
                                            = ((0xfffff000U 
                                                & ((- (IData)(
                                                              (1U 
                                                               & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                                  >> 0x1fU)))) 
                                                   << 0xcU)) 
                                               | (0xfffU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x14U)));
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                            }
                        }
                    }
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                    = (0xfffff000U 
                                       & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r);
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if (((0U == (0x7fU 
                                             & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 0x19U))) 
                                     | (0x20U == (0x7fU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x19U))))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                } else {
                                    if ((1U == (0x7fU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((((0U == (7U & 
                                              (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                               >> 0xcU))) 
                                      | (2U == (7U 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0xcU)))) 
                                     | (1U == (7U & 
                                               (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                >> 0xcU))))) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                            }
                        }
                    }
                }
            } else {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                    }
                                } else {
                                    if ((0x2000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                        if ((1U & (~ 
                                                   (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                    >> 0xcU)))) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                        }
                                    } else {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o = 0U;
    if ((0x40U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                            }
                        }
                    }
                } else {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o;
                            }
                        }
                    } else {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((0x4000U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o 
                                        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                                } else {
                                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                  >> 0xdU)))) {
                                        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o 
                                            = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    } else {
        if ((0x20U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
            if ((0x10U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                              >> 3U)))) {
                    if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                  >> 2U)))) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                if ((1U & (~ ((0U == 
                                               (0x7fU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U))) 
                                              | (0x20U 
                                                 == 
                                                 (0x7fU 
                                                  & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                     >> 0x19U))))))) {
                                    if ((1U == (0x7fU 
                                                & (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                                                   >> 0x19U)))) {
                                        if ((0x4000U 
                                             & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o 
                                                = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else {
            if ((1U & (~ (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r 
                          >> 4U)))) {
                if ((8U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                    if ((4U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                        if ((2U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                            if ((1U & vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r)) {
                                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o 
                                    = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r;
                            }
                        }
                    }
                }
            }
        }
    }
}

VL_INLINE_OPT void Vtb_top_verilator::_sequent__TOP__13(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_sequent__TOP__13\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg 
        = vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg;
}

VL_INLINE_OPT void Vtb_top_verilator::_sequent__TOP__14(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_sequent__TOP__14\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if ((0U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state))) {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg = 1U;
    } else {
        if ((0xfU == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state))) {
            vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg 
                = (0x1fU & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg));
        }
    }
}

VL_INLINE_OPT void Vtb_top_verilator::_sequent__TOP__15(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_sequent__TOP__15\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req 
        = vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req;
    if (vlTOPp->rst_ni) {
        if ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))) {
            if (vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req) {
                vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__ack = 1U;
            }
        } else {
            if ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))) {
                if ((1U & (~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req)))) {
                    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__ack = 0U;
                }
            }
        }
    } else {
        vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__ack = 0U;
    }
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state 
        = ((IData)(vlTOPp->rst_ni) ? (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state_next)
            : 1U);
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req 
        = ((IData)(vlTOPp->rst_ni) & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req_d));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state_next 
        = ((1U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))
            ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req)
                ? 2U : 1U) : ((2U == (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state))
                               ? ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req)
                                   ? 2U : 1U) : 1U));
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req_d 
        = ((IData)(vlTOPp->rst_ni) & (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req));
}

VL_INLINE_OPT void Vtb_top_verilator::_sequent__TOP__16(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_sequent__TOP__16\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state 
        = vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state;
    vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req 
        = vlTOPp->__Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req;
}

void Vtb_top_verilator::_eval(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_eval\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK)) 
         & (IData)(vlTOPp->__Vclklast__TOP__tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK))) {
        vlTOPp->_sequent__TOP__1(vlSymsp);
        vlTOPp->__Vm_traceActivity = (2U | vlTOPp->__Vm_traceActivity);
    }
    if (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK) 
         & (~ (IData)(vlTOPp->__Vclklast__TOP__tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK)))) {
        vlTOPp->_sequent__TOP__3(vlSymsp);
    }
    if ((((IData)(vlTOPp->clk_i) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk_i))) 
         | ((~ (IData)(vlTOPp->rst_ni)) & (IData)(vlTOPp->__Vclklast__TOP__rst_ni)))) {
        vlTOPp->_sequent__TOP__4(vlSymsp);
        vlTOPp->__Vm_traceActivity = (4U | vlTOPp->__Vm_traceActivity);
    }
    if ((((~ (IData)(vlTOPp->rst_ni)) & (IData)(vlTOPp->__Vclklast__TOP__rst_ni)) 
         | ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK) 
            & (~ (IData)(vlTOPp->__Vclklast__TOP__tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK))))) {
        vlTOPp->_sequent__TOP__5(vlSymsp);
        vlTOPp->__Vm_traceActivity = (8U | vlTOPp->__Vm_traceActivity);
    }
    if (((IData)(vlTOPp->clk_i) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk_i)))) {
        vlTOPp->_sequent__TOP__6(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x10U | vlTOPp->__Vm_traceActivity);
    }
    if ((((IData)(vlTOPp->clk_i) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk_i))) 
         | ((~ (IData)(vlTOPp->rst_ni)) & (IData)(vlTOPp->__Vclklast__TOP__rst_ni)))) {
        vlTOPp->_sequent__TOP__8(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x20U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_combo__TOP__9(vlSymsp);
    vlTOPp->__Vm_traceActivity = (0x40U | vlTOPp->__Vm_traceActivity);
    if (((IData)(vlTOPp->clk_i) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk_i)))) {
        vlTOPp->_sequent__TOP__10(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x80U | vlTOPp->__Vm_traceActivity);
    }
    if ((((~ (IData)(vlTOPp->rst_ni)) & (IData)(vlTOPp->__Vclklast__TOP__rst_ni)) 
         | ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK) 
            & (~ (IData)(vlTOPp->__Vclklast__TOP__tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK))))) {
        vlTOPp->_sequent__TOP__11(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x100U | vlTOPp->__Vm_traceActivity);
    }
    vlTOPp->_combo__TOP__12(vlSymsp);
    if (((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK) 
         & (~ (IData)(vlTOPp->__Vclklast__TOP__tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK)))) {
        vlTOPp->_sequent__TOP__13(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x200U | vlTOPp->__Vm_traceActivity);
    }
    if (((~ (IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK)) 
         & (IData)(vlTOPp->__Vclklast__TOP__tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK))) {
        vlTOPp->_sequent__TOP__14(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x400U | vlTOPp->__Vm_traceActivity);
    }
    if ((((IData)(vlTOPp->clk_i) & (~ (IData)(vlTOPp->__Vclklast__TOP__clk_i))) 
         | ((~ (IData)(vlTOPp->rst_ni)) & (IData)(vlTOPp->__Vclklast__TOP__rst_ni)))) {
        vlTOPp->_sequent__TOP__15(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x800U | vlTOPp->__Vm_traceActivity);
    }
    if ((((~ (IData)(vlTOPp->rst_ni)) & (IData)(vlTOPp->__Vclklast__TOP__rst_ni)) 
         | ((IData)(vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK) 
            & (~ (IData)(vlTOPp->__Vclklast__TOP__tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK))))) {
        vlTOPp->_sequent__TOP__16(vlSymsp);
        vlTOPp->__Vm_traceActivity = (0x1000U | vlTOPp->__Vm_traceActivity);
    }
    // Final
    vlTOPp->__Vclklast__TOP__tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK;
    vlTOPp->__Vclklast__TOP__clk_i = vlTOPp->clk_i;
    vlTOPp->__Vclklast__TOP__rst_ni = vlTOPp->rst_ni;
}

void Vtb_top_verilator::_eval_initial(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_eval_initial\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->__Vclklast__TOP__tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK 
        = vlTOPp->tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK;
    vlTOPp->_initial__TOP__2(vlSymsp);
    vlTOPp->__Vclklast__TOP__clk_i = vlTOPp->clk_i;
    vlTOPp->__Vclklast__TOP__rst_ni = vlTOPp->rst_ni;
}

void Vtb_top_verilator::final() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::final\n"); );
    // Variables
    Vtb_top_verilator__Syms* __restrict vlSymsp = this->__VlSymsp;
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
}

void Vtb_top_verilator::_eval_settle(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_eval_settle\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    vlTOPp->_settle__TOP__7(vlSymsp);
    vlTOPp->__Vm_traceActivity = (1U | vlTOPp->__Vm_traceActivity);
}

VL_INLINE_OPT QData Vtb_top_verilator::_change_request(Vtb_top_verilator__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_change_request\n"); );
    Vtb_top_verilator* __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vtb_top_verilator::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clk_i & 0xfeU))) {
        Verilated::overWidthError("clk_i");}
    if (VL_UNLIKELY((rst_ni & 0xfeU))) {
        Verilated::overWidthError("rst_ni");}
}
#endif  // VL_DEBUG

void Vtb_top_verilator::_ctor_var_reset() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtb_top_verilator::_ctor_var_reset\n"); );
    // Body
    clk_i = VL_RAND_RESET_I(1);
    rst_ni = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__result_printed = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__over = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__succ = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__jtag_TCK = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__jtag_TMS = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDI = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__jtag_TDO = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__m0_addr_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__m0_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__m1_data_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__m1_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__m1_req_i = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__m1_we_i = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__m2_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__m3_addr_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__m3_data_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__m3_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__m3_req_i = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__m3_we_i = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__s0_addr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__s0_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__s0_data_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__s0_we_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__s1_addr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__s1_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__s1_data_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__s1_we_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__s2_addr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__s2_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__s2_data_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__s2_we_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__int_flag = VL_RAND_RESET_I(8);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__pc_pc_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg1_raddr_o = VL_RAND_RESET_I(5);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg2_raddr_o = VL_RAND_RESET_I(5);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_we_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_reg_waddr_o = VL_RAND_RESET_I(5);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_raddr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_we_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_csr_waddr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op1_jump_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__id_op2_jump_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_wdata_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_raddr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_waddr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_mem_we_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_wdata_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_we_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_reg_waddr_o = VL_RAND_RESET_I(5);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_flag_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_jump_addr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_div_start_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_wdata_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ex_csr_we_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata1_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__regs_rdata2_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__csr_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__csr_clint_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__ctrl_hold_flag_o = VL_RAND_RESET_I(3);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_result_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_ready_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_busy_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__div_reg_waddr_o = VL_RAND_RESET_I(5);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_we_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_waddr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_raddr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_addr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__clint_int_assert_o = VL_RAND_RESET_I(1);
    { int __Vi0=0; for (; __Vi0<32; ++__Vi0) {
            tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs[__Vi0] = VL_RAND_RESET_I(32);
    }}
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__cycle = VL_RAND_RESET_Q(64);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mtvec = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mcause = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mepc = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mie = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mstatus = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_csr_reg__DOT__mscratch = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_ff__DOT__qout_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__inst_addr_ff__DOT__qout_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_if_id__DOT__int_ff__DOT__qout_r = VL_RAND_RESET_I(8);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_ff__DOT__qout_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__inst_addr_ff__DOT__qout_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_we_ff__DOT__qout_r = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg_waddr_ff__DOT__qout_r = VL_RAND_RESET_I(5);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg1_rdata_ff__DOT__qout_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__reg2_rdata_ff__DOT__qout_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_we_ff__DOT__qout_r = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_waddr_ff__DOT__qout_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__csr_rdata_ff__DOT__qout_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_ff__DOT__qout_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_ff__DOT__qout_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op1_jump_ff__DOT__qout_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_id_ex__DOT__op2_jump_ff__DOT__qout_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_raddr_index = VL_RAND_RESET_I(2);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_waddr_index = VL_RAND_RESET_I(2);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mul_temp = VL_RAND_RESET_Q(64);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_add_op2_res = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_jump_add_op2_jump_res = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_signed = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_ge_op2_unsigned = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__op1_eq_op2 = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__reg_wdata = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__hold_flag = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_flag = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__jump_addr = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_we = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_ex__DOT__mem_req = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_r = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_r = VL_RAND_RESET_I(3);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__state = VL_RAND_RESET_I(4);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__count = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_remain = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__invert_result = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_div = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_divu = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__op_rem = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__dividend_invert = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__divisor_invert = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_ge_divisor = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_sub_res = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__div_result_tmp = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_div__DOT__minuend_tmp = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__int_state = VL_RAND_RESET_I(4);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__csr_state = VL_RAND_RESET_I(5);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__inst_addr = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_clint__DOT__cause = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_addr_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_req_i = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m2_we_i = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_addr_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_req_i = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__m3_we_i = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_addr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_data_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s2_we_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_addr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_data_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s3_we_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_addr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_data_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s4_we_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_addr_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_o = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_data_i = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__s5_we_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant = VL_RAND_RESET_I(2);
    { int __Vi0=0; for (; __Vi0<4096; ++__Vi0) {
            tb_top_verilator__DOT__u_soc_top__DOT__u_rom__DOT___rom[__Vi0] = VL_RAND_RESET_I(32);
    }}
    { int __Vi0=0; for (; __Vi0<4096; ++__Vi0) {
            tb_top_verilator__DOT__u_soc_top__DOT__u_ram__DOT___ram[__Vi0] = VL_RAND_RESET_I(32);
    }}
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__dm_op_req_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__dm_halt_req_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__dm_reset_req_o = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__ir_reg = VL_RAND_RESET_I(5);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg = VL_RAND_RESET_Q(40);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state = VL_RAND_RESET_I(4);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__is_busy = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__sticky_busy = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_valid = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dtm_req_data = VL_RAND_RESET_Q(40);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_resp_data = VL_RAND_RESET_Q(40);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__dm_is_busy = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state = VL_RAND_RESET_I(3);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next = VL_RAND_RESET_I(3);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__ack_d = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req_data = VL_RAND_RESET_Q(40);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state = VL_RAND_RESET_I(2);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__state_next = VL_RAND_RESET_I(2);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__req_d = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_data = VL_RAND_RESET_Q(40);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__recv_rdy = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__rx__DOT__ack = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dcsr = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmcontrol = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__hartinfo = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__data0 = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbcs = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0 = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbdata0 = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__command = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__read_data = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_we = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_addr = VL_RAND_RESET_I(5);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reg_wdata = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_we = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_addr = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_mem_wdata = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_reset_req = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__need_resp = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__is_read_reg = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0_next = VL_RAND_RESET_I(32);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state = VL_RAND_RESET_I(3);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next = VL_RAND_RESET_I(3);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__ack_d = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req_data = VL_RAND_RESET_Q(40);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__idle = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state = VL_RAND_RESET_I(2);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__state_next = VL_RAND_RESET_I(2);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__req_d = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_data = VL_RAND_RESET_Q(40);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__recv_rdy = VL_RAND_RESET_I(1);
    tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__rx__DOT__ack = VL_RAND_RESET_I(1);
    __Vtableidx1 = 0;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[0] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[1] = 0U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[2] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[3] = 0U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[4] = 2U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[5] = 0U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[6] = 2U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[7] = 0U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[8] = 3U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[9] = 3U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[10] = 3U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[11] = 3U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[12] = 3U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[13] = 3U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[14] = 3U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_bus__DOT__grant[15] = 3U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[0] = 0U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[1] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[2] = 0U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[3] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[4] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[5] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[6] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[7] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[8] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[9] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[10] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[11] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[12] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[13] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[14] = 1U;
    __Vtable1_tb_top_verilator__DOT__u_soc_top__DOT__rib_hold_flag_o[15] = 1U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[0] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[1] = 1U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[2] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[3] = 1U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[4] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[5] = 3U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[6] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[7] = 4U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[8] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[9] = 4U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[10] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[11] = 6U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[12] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[13] = 6U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[14] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[15] = 4U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[16] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[17] = 1U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[18] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[19] = 0xaU;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[20] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[21] = 0xbU;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[22] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[23] = 0xbU;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[24] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[25] = 0xdU;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[26] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[27] = 0xdU;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[28] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[29] = 0xbU;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[30] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[31] = 1U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[32] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[33] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[34] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[35] = 2U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[36] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[37] = 9U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[38] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[39] = 5U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[40] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[41] = 5U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[42] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[43] = 8U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[44] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[45] = 7U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[46] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[47] = 8U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[48] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[49] = 2U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[50] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[51] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[52] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[53] = 0xcU;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[54] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[55] = 0xcU;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[56] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[57] = 0xfU;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[58] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[59] = 0xeU;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[60] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[61] = 0xfU;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[62] = 0U;
    __Vtable2_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state[63] = 2U;
    __Vtableidx3 = 0;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[0] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[1] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[2] = 2U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[3] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[4] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[5] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[6] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[7] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[8] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[9] = 2U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[10] = 2U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[11] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[12] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[13] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[14] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[15] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[16] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[17] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[18] = 4U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[19] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[20] = 4U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[21] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[22] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[23] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[24] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[25] = 2U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[26] = 4U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[27] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[28] = 4U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[29] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[30] = 1U;
    __Vtable3_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__state_next[31] = 1U;
    __Vtableidx4 = 0;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[0] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[1] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[2] = 2U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[3] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[4] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[5] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[6] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[7] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[8] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[9] = 2U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[10] = 2U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[11] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[12] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[13] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[14] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[15] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[16] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[17] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[18] = 4U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[19] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[20] = 4U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[21] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[22] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[23] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[24] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[25] = 2U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[26] = 4U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[27] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[28] = 4U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[29] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[30] = 1U;
    __Vtable4_tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__state_next[31] = 1U;
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__sbaddress0 = VL_RAND_RESET_I(32);
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dmstatus = VL_RAND_RESET_I(32);
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__dm_halt_req = VL_RAND_RESET_I(1);
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__abstractcs = VL_RAND_RESET_I(32);
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_dm__DOT__tx__DOT__req = VL_RAND_RESET_I(1);
    __Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v0 = 0;
    __Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v0 = VL_RAND_RESET_I(32);
    __Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v0 = 0;
    __Vdlyvdim0__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v1 = 0;
    __Vdlyvval__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v1 = VL_RAND_RESET_I(32);
    __Vdlyvset__tb_top_verilator__DOT__u_soc_top__DOT__u_core__DOT__u_regs__DOT__regs__v1 = 0;
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__jtag_state = VL_RAND_RESET_I(4);
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__idle = VL_RAND_RESET_I(1);
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__tx__DOT__req = VL_RAND_RESET_I(1);
    __Vdly__tb_top_verilator__DOT__u_soc_top__DOT__u_jtag_top__DOT__u_jtag_driver__DOT__shift_reg = VL_RAND_RESET_Q(40);
    __Vm_traceActivity = 0;
}
