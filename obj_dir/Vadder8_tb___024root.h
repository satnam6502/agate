// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vadder8_tb.h for the primary calling header

#ifndef VERILATED_VADDER8_TB___024ROOT_H_
#define VERILATED_VADDER8_TB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vadder8_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vadder8_tb___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ adder8_tb__DOT__cin;
    CData/*7:0*/ adder8_tb__DOT__a;
    CData/*7:0*/ adder8_tb__DOT__b;
    CData/*0:0*/ __VactContinue;
    IData/*31:0*/ __VactIterCount;
    VlUnpacked<CData/*0:0*/, 3> __Vm_traceActivity;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vadder8_tb__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vadder8_tb___024root(Vadder8_tb__Syms* symsp, const char* v__name);
    ~Vadder8_tb___024root();
    VL_UNCOPYABLE(Vadder8_tb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
