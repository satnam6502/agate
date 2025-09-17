// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VnandGate_tb.h for the primary calling header

#include "VnandGate_tb__pch.h"
#include "VnandGate_tb__Syms.h"
#include "VnandGate_tb___024root.h"

void VnandGate_tb___024root___ctor_var_reset(VnandGate_tb___024root* vlSelf);

VnandGate_tb___024root::VnandGate_tb___024root(VnandGate_tb__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    VnandGate_tb___024root___ctor_var_reset(this);
}

void VnandGate_tb___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

VnandGate_tb___024root::~VnandGate_tb___024root() {
}
