// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vadder8_tb.h for the primary calling header

#include "Vadder8_tb__pch.h"
#include "Vadder8_tb__Syms.h"
#include "Vadder8_tb___024root.h"

VL_ATTR_COLD void Vadder8_tb___024root___eval_initial__TOP(Vadder8_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vadder8_tb___024root___eval_initial__TOP\n"); );
    Vadder8_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    VlWide<4>/*127:0*/ __Vtemp_1;
    // Body
    if ((0U != VL_TESTPLUSARGS_I(std::string{"trace"}))) {
        __Vtemp_1[0U] = 0x2e766364U;
        __Vtemp_1[1U] = 0x385f7462U;
        __Vtemp_1[2U] = 0x64646572U;
        __Vtemp_1[3U] = 0x61U;
        vlSymsp->_vm_contextp__->dumpfile(VL_CVT_PACK_STR_NW(4, __Vtemp_1));
        vlSymsp->_traceDumpOpen();
    }
}
