// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VnandGate_tb.h for the primary calling header

#include "VnandGate_tb__pch.h"
#include "VnandGate_tb__Syms.h"
#include "VnandGate_tb___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void VnandGate_tb___024root___dump_triggers__act(VnandGate_tb___024root* vlSelf);
#endif  // VL_DEBUG

void VnandGate_tb___024root___eval_triggers__act(VnandGate_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root___eval_triggers__act\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered.setBit(0U, vlSelfRef.__VdlySched.awaitingCurrentTime());
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VnandGate_tb___024root___dump_triggers__act(vlSelf);
    }
#endif
}
