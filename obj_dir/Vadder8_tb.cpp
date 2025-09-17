// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vadder8_tb__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

Vadder8_tb::Vadder8_tb(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vadder8_tb__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
    contextp()->traceBaseModelCbAdd(
        [this](VerilatedTraceBaseC* tfp, int levels, int options) { traceBaseModel(tfp, levels, options); });
}

Vadder8_tb::Vadder8_tb(const char* _vcname__)
    : Vadder8_tb(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vadder8_tb::~Vadder8_tb() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vadder8_tb___024root___eval_debug_assertions(Vadder8_tb___024root* vlSelf);
#endif  // VL_DEBUG
void Vadder8_tb___024root___eval_static(Vadder8_tb___024root* vlSelf);
void Vadder8_tb___024root___eval_initial(Vadder8_tb___024root* vlSelf);
void Vadder8_tb___024root___eval_settle(Vadder8_tb___024root* vlSelf);
void Vadder8_tb___024root___eval(Vadder8_tb___024root* vlSelf);

void Vadder8_tb::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vadder8_tb::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vadder8_tb___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vadder8_tb___024root___eval_static(&(vlSymsp->TOP));
        Vadder8_tb___024root___eval_initial(&(vlSymsp->TOP));
        Vadder8_tb___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vadder8_tb___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

void Vadder8_tb::eval_end_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+eval_end_step Vadder8_tb::eval_end_step\n"); );
#ifdef VM_TRACE
    // Tracing
    if (VL_UNLIKELY(vlSymsp->__Vm_dumping)) vlSymsp->_traceDump();
#endif  // VM_TRACE
}

//============================================================
// Events and timing
bool Vadder8_tb::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t Vadder8_tb::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vadder8_tb::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vadder8_tb___024root___eval_final(Vadder8_tb___024root* vlSelf);

VL_ATTR_COLD void Vadder8_tb::final() {
    Vadder8_tb___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vadder8_tb::hierName() const { return vlSymsp->name(); }
const char* Vadder8_tb::modelName() const { return "Vadder8_tb"; }
unsigned Vadder8_tb::threads() const { return 1; }
void Vadder8_tb::prepareClone() const { contextp()->prepareClone(); }
void Vadder8_tb::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> Vadder8_tb::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false, false, false}};
};

//============================================================
// Trace configuration

void Vadder8_tb___024root__trace_decl_types(VerilatedVcd* tracep);

void Vadder8_tb___024root__trace_init_top(Vadder8_tb___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vadder8_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vadder8_tb___024root*>(voidSelf);
    Vadder8_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->pushPrefix(std::string{vlSymsp->name()}, VerilatedTracePrefixType::SCOPE_MODULE);
    Vadder8_tb___024root__trace_decl_types(tracep);
    Vadder8_tb___024root__trace_init_top(vlSelf, tracep);
    tracep->popPrefix();
}

VL_ATTR_COLD void Vadder8_tb___024root__trace_register(Vadder8_tb___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vadder8_tb::traceBaseModel(VerilatedTraceBaseC* tfp, int levels, int options) {
    (void)levels; (void)options;
    VerilatedVcdC* const stfp = dynamic_cast<VerilatedVcdC*>(tfp);
    if (VL_UNLIKELY(!stfp)) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vadder8_tb::trace()' called on non-VerilatedVcdC object;"
            " use --trace-fst with VerilatedFst object, and --trace-vcd with VerilatedVcd object");
    }
    stfp->spTrace()->addModel(this);
    stfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP));
    Vadder8_tb___024root__trace_register(&(vlSymsp->TOP), stfp->spTrace());
}
