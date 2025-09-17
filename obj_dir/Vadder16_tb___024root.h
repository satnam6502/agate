// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vadder16_tb.h for the primary calling header

#ifndef VERILATED_VADDER16_TB___024ROOT_H_
#define VERILATED_VADDER16_TB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vadder16_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vadder16_tb___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ __VactContinue;
    SData/*15:0*/ adder16_tb__DOT__a;
    SData/*15:0*/ adder16_tb__DOT__b;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<1> __VactTriggered;
    VlTriggerVec<1> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vadder16_tb__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vadder16_tb___024root(Vadder16_tb__Syms* symsp, const char* v__name);
    ~Vadder16_tb___024root();
    VL_UNCOPYABLE(Vadder16_tb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
