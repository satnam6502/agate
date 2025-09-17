// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VnandGate_tb.h for the primary calling header

#include "VnandGate_tb__pch.h"
#include "VnandGate_tb___024root.h"

VL_ATTR_COLD void VnandGate_tb___024root___eval_static(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___eval_static\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void VnandGate_tb___024root___eval_final(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___eval_final\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void VnandGate_tb___024root___eval_settle(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___eval_settle\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VnandGate_tb___024root___dump_triggers__act(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___dump_triggers__act\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VactTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VactTriggered.word(0U))) {
        VL_DBG_MSGF("         'act' region trigger index 0 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

#ifdef VL_DEBUG
VL_ATTR_COLD void VnandGate_tb___024root___dump_triggers__nba(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___dump_triggers__nba\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1U & (~ vlSelfRef.__VnbaTriggered.any()))) {
        VL_DBG_MSGF("         No triggers active\n");
    }
    if ((1ULL & vlSelfRef.__VnbaTriggered.word(0U))) {
        VL_DBG_MSGF("         'nba' region trigger index 0 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void VnandGate_tb___024root___ctor_var_reset(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___ctor_var_reset\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->name());
    vlSelf->nandGate_tb__DOT__a = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 10261203017356213556ull);
    vlSelf->nandGate_tb__DOT__b = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5890666092337260001ull);
    }
