// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vadder8_tb.h for the primary calling header

#include "Vadder8_tb__pch.h"
#include "Vadder8_tb___024root.h"

VL_ATTR_COLD void Vadder8_tb___024root___eval_initial__TOP(Vadder8_tb___024root* vlSelf);
VlCoroutine Vadder8_tb___024root___eval_initial__TOP__Vtiming__0(Vadder8_tb___024root* vlSelf);

void Vadder8_tb___024root___eval_initial(Vadder8_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder8_tb___024root___eval_initial\n"); );
    Vadder8_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vadder8_tb___024root___eval_initial__TOP(vlSelf);
    vlSelfRef.__Vm_traceActivity[1U] = 1U;
    Vadder8_tb___024root___eval_initial__TOP__Vtiming__0(vlSelf);
}

VL_INLINE_OPT VlCoroutine Vadder8_tb___024root___eval_initial__TOP__Vtiming__0(Vadder8_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder8_tb___024root___eval_initial__TOP__Vtiming__0\n"); );
    Vadder8_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.adder8_tb__DOT__cin = 0U;
    vlSelfRef.adder8_tb__DOT__a = 0xcU;
    vlSelfRef.adder8_tb__DOT__b = 5U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "adder8_tb.sv", 
                                         14);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    VL_FINISH_MT("adder8_tb.sv", 14, "");
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
}

void Vadder8_tb___024root___eval_act(Vadder8_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder8_tb___024root___eval_act\n"); );
    Vadder8_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void Vadder8_tb___024root___eval_nba(Vadder8_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder8_tb___024root___eval_nba\n"); );
    Vadder8_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void Vadder8_tb___024root___timing_resume(Vadder8_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder8_tb___024root___timing_resume\n"); );
    Vadder8_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void Vadder8_tb___024root___eval_triggers__act(Vadder8_tb___024root* vlSelf);

bool Vadder8_tb___024root___eval_phase__act(Vadder8_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder8_tb___024root___eval_phase__act\n"); );
    Vadder8_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<1> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vadder8_tb___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        Vadder8_tb___024root___timing_resume(vlSelf);
        Vadder8_tb___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vadder8_tb___024root___eval_phase__nba(Vadder8_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder8_tb___024root___eval_phase__nba\n"); );
    Vadder8_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vadder8_tb___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vadder8_tb___024root___dump_triggers__nba(Vadder8_tb___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vadder8_tb___024root___dump_triggers__act(Vadder8_tb___024root* vlSelf);
#endif  // VL_DEBUG

void Vadder8_tb___024root___eval(Vadder8_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder8_tb___024root___eval\n"); );
    Vadder8_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY(((0x64U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vadder8_tb___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("adder8_tb.sv", 1, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY(((0x64U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vadder8_tb___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("adder8_tb.sv", 1, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (Vadder8_tb___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (Vadder8_tb___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vadder8_tb___024root___eval_debug_assertions(Vadder8_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder8_tb___024root___eval_debug_assertions\n"); );
    Vadder8_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
