// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VnandGate_tb.h for the primary calling header

#include "VnandGate_tb__pch.h"
#include "VnandGate_tb___024root.h"

VL_ATTR_COLD void VnandGate_tb___024root___eval_initial__TOP(VnandGate_tb___024root* vlSelf);
VlCoroutine VnandGate_tb___024root___eval_initial__TOP__Vtiming__0(VnandGate_tb___024root* vlSelf);

void VnandGate_tb___024root___eval_initial(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___eval_initial\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VnandGate_tb___024root___eval_initial__TOP(vlSelf);
    VnandGate_tb___024root___eval_initial__TOP__Vtiming__0(vlSelf);
}

VL_INLINE_OPT VlCoroutine VnandGate_tb___024root___eval_initial__TOP__Vtiming__0(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___eval_initial__TOP__Vtiming__0\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.nandGate_tb__DOT__a = 0U;
    vlSelfRef.nandGate_tb__DOT__b = 0U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "nandGate_tb.sv", 
                                         9);
    vlSelfRef.nandGate_tb__DOT__a = 0U;
    vlSelfRef.nandGate_tb__DOT__b = 1U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "nandGate_tb.sv", 
                                         10);
    vlSelfRef.nandGate_tb__DOT__a = 1U;
    vlSelfRef.nandGate_tb__DOT__b = 0U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "nandGate_tb.sv", 
                                         11);
    vlSelfRef.nandGate_tb__DOT__a = 1U;
    vlSelfRef.nandGate_tb__DOT__b = 1U;
    co_await vlSelfRef.__VdlySched.delay(0xaULL, nullptr, 
                                         "nandGate_tb.sv", 
                                         12);
    VL_FINISH_MT("nandGate_tb.sv", 12, "");
}

void VnandGate_tb___024root___eval_act(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___eval_act\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void VnandGate_tb___024root___eval_nba(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___eval_nba\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

void VnandGate_tb___024root___timing_resume(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___timing_resume\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        vlSelfRef.__VdlySched.resume();
    }
}

void VnandGate_tb___024root___eval_triggers__act(VnandGate_tb___024root* vlSelf);

bool VnandGate_tb___024root___eval_phase__act(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___eval_phase__act\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlTriggerVec<1> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    VnandGate_tb___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelfRef.__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelfRef.__VactTriggered, vlSelfRef.__VnbaTriggered);
        vlSelfRef.__VnbaTriggered.thisOr(vlSelfRef.__VactTriggered);
        VnandGate_tb___024root___timing_resume(vlSelf);
        VnandGate_tb___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool VnandGate_tb___024root___eval_phase__nba(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___eval_phase__nba\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelfRef.__VnbaTriggered.any();
    if (__VnbaExecute) {
        VnandGate_tb___024root___eval_nba(vlSelf);
        vlSelfRef.__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VnandGate_tb___024root___dump_triggers__nba(VnandGate_tb___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void VnandGate_tb___024root___dump_triggers__act(VnandGate_tb___024root* vlSelf);
#endif  // VL_DEBUG

void VnandGate_tb___024root___eval(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___eval\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
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
            VnandGate_tb___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("nandGate_tb.sv", 1, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelfRef.__VactIterCount = 0U;
        vlSelfRef.__VactContinue = 1U;
        while (vlSelfRef.__VactContinue) {
            if (VL_UNLIKELY(((0x64U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                VnandGate_tb___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("nandGate_tb.sv", 1, "", "Active region did not converge.");
            }
            vlSelfRef.__VactIterCount = ((IData)(1U) 
                                         + vlSelfRef.__VactIterCount);
            vlSelfRef.__VactContinue = 0U;
            if (VnandGate_tb___024root___eval_phase__act(vlSelf)) {
                vlSelfRef.__VactContinue = 1U;
            }
        }
        if (VnandGate_tb___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void VnandGate_tb___024root___eval_debug_assertions(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___eval_debug_assertions\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
