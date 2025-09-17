// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "VnandGate_tb__Syms.h"


VL_ATTR_COLD void VnandGate_tb___024root__trace_init_sub__TOP__0(VnandGate_tb___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root__trace_init_sub__TOP__0\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    const int c = vlSymsp->__Vm_baseCode;
    // Body
    tracep->pushPrefix("nandGate_tb", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1,0,"a",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+2,0,"b",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+3,0,"c",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->pushPrefix("nandGate_inst", VerilatedTracePrefixType::SCOPE_MODULE);
    tracep->declBit(c+1,0,"i1",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+2,0,"i2",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+3,0,"o",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+3,0,"net3",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+4,0,"net2",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+2,0,"net1",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->declBit(c+1,0,"net0",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC, false,-1);
    tracep->popPrefix();
    tracep->popPrefix();
}

VL_ATTR_COLD void VnandGate_tb___024root__trace_init_top(VnandGate_tb___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root__trace_init_top\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VnandGate_tb___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void VnandGate_tb___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
VL_ATTR_COLD void VnandGate_tb___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VnandGate_tb___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void VnandGate_tb___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void VnandGate_tb___024root__trace_register(VnandGate_tb___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root__trace_register\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    tracep->addConstCb(&VnandGate_tb___024root__trace_const_0, 0U, vlSelf);
    tracep->addFullCb(&VnandGate_tb___024root__trace_full_0, 0U, vlSelf);
    tracep->addChgCb(&VnandGate_tb___024root__trace_chg_0, 0U, vlSelf);
    tracep->addCleanupCb(&VnandGate_tb___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void VnandGate_tb___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root__trace_const_0\n"); );
    // Init
    VnandGate_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VnandGate_tb___024root*>(voidSelf);
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
}

VL_ATTR_COLD void VnandGate_tb___024root__trace_full_0_sub_0(VnandGate_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void VnandGate_tb___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root__trace_full_0\n"); );
    // Init
    VnandGate_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<VnandGate_tb___024root*>(voidSelf);
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    VnandGate_tb___024root__trace_full_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void VnandGate_tb___024root__trace_full_0_sub_0(VnandGate_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VnandGate_tb___024root__trace_full_0_sub_0\n"); );
    VnandGate_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Init
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    // Body
    bufp->fullBit(oldp+1,(vlSelfRef.nandGate_tb__DOT__a));
    bufp->fullBit(oldp+2,(vlSelfRef.nandGate_tb__DOT__b));
    bufp->fullBit(oldp+3,((1U & (~ ((IData)(vlSelfRef.nandGate_tb__DOT__a) 
                                    & (IData)(vlSelfRef.nandGate_tb__DOT__b))))));
    bufp->fullBit(oldp+4,(((IData)(vlSelfRef.nandGate_tb__DOT__a) 
                           & (IData)(vlSelfRef.nandGate_tb__DOT__b))));
}
