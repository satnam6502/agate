// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VnandGate_tb.h for the primary calling header

#ifndef VERILATED_VNANDGATE_TB___024ROOT_H_
#define VERILATED_VNANDGATE_TB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class VnandGate_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) VnandGate_tb___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ nandGate_tb__DOT__a;
    CData/*0:0*/ nandGate_tb__DOT__b;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    VnandGate_tb__Syms* const vlSymsp;

    // CONSTRUCTORS
    VnandGate_tb___024root(VnandGate_tb__Syms* symsp, const char* v__name);
    ~VnandGate_tb___024root();
    VL_UNCOPYABLE(VnandGate_tb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
