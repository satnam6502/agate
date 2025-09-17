// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vadder16_tb.h for the primary calling header

#include "Vadder16_tb__pch.h"
#include "Vadder16_tb___024root.h"

VL_ATTR_COLD void Vadder16_tb___024root___eval_initial__TOP(Vadder16_tb___024root* vlSelf);
VlCoroutine Vadder16_tb___024root___eval_initial__TOP__Vtiming__0(Vadder16_tb___024root* vlSelf);

void Vadder16_tb___024root___eval_initial(Vadder16_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder16_tb___024root___eval_initial\n"); );
    Vadder16_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vadder16_tb___024root___eval_initial__TOP(vlSelf);
    Vadder16_tb___024root___eval_initial__TOP__Vtiming__0(vlSelf);
}

VL_INLINE_OPT VlCoroutine Vadder16_tb___024root___eval_initial__TOP__Vtiming__0(Vadder16_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder16_tb___024root___eval_initial__TOP__Vtiming__0\n"); );
    Vadder16_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.adder16_tb__DOT__a = 0x7d0U;
    vlSelfRef.adder16_tb__DOT__b = 0xaU;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "adder16_tb.sv", 
                                         12);
    VL_FINISH_MT("adder16_tb.sv", 12, "");
}

void Vadder16_tb___024root___eval_act(Vadder16_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder16_tb___024root___eval_act\n"); );
    Vadder16_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void Vadder16_tb___024root___eval_nba(Vadder16_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder16_tb___024root___eval_nba\n"); );
    Vadder16_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void Vadder16_tb___024root___timing_resume(Vadder16_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder16_tb___024root___timing_resume\n"); );
    Vadder16_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void Vadder16_tb___024root___eval_triggers__act(Vadder16_tb___024root* vlSelf);

bool Vadder16_tb___024root___eval_phase__act(Vadder16_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder16_tb___024root___eval_phase__act\n"); );
    Vadder16_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<1> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vadder16_tb___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        Vadder16_tb___024root___timing_resume(vlSelf);
        Vadder16_tb___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vadder16_tb___024root___eval_phase__nba(Vadder16_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder16_tb___024root___eval_phase__nba\n"); );
    Vadder16_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vadder16_tb___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vadder16_tb___024root___dump_triggers__nba(Vadder16_tb___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vadder16_tb___024root___dump_triggers__act(Vadder16_tb___024root* vlSelf);
#endif  // VL_DEBUG

void Vadder16_tb___024root___eval(Vadder16_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder16_tb___024root___eval\n"); );
    Vadder16_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
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
            Vadder16_tb___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("adder16_tb.sv", 1, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY(((0x64U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                Vadder16_tb___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("adder16_tb.sv", 1, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (Vadder16_tb___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (Vadder16_tb___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vadder16_tb___024root___eval_debug_assertions(Vadder16_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder16_tb___024root___eval_debug_assertions\n"); );
    Vadder16_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
