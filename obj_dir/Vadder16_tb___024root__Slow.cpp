// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vadder16_tb.h for the primary calling header

#include "Vadder16_tb__pch.h"
#include "Vadder16_tb__Syms.h"
#include "Vadder16_tb___024root.h"

void Vadder16_tb___024root___ctor_var_reset(Vadder16_tb___024root* vlSelf);

Vadder16_tb___024root::Vadder16_tb___024root(Vadder16_tb__Syms* symsp, const char* v__name)
    : VerilatedModule{v__name}
    , __VdlySched{*symsp->_vm_contextp__}
    , vlSymsp{symsp}
 {
    // Reset structure values
    Vadder16_tb___024root___ctor_var_reset(this);
}

void Vadder16_tb___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vadder16_tb___024root::~Vadder16_tb___024root() {
}
