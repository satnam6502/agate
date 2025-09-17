# agate
An experimental hardware design domain specific language (DSL) implemented in Agda

## Pre-requisites
You will need to install [Agda](https://agda.readthedocs.io/en/latest/getting-started/installation.html) and [Verilator](https://veripool.org/guide/latest/install.html), a freely available SystemVerilog simulator.

## Compiling Main.hs to produce an executable
The default `make` rule will compile the top-level main program in `Main.hs` into a binary. When this binary is run several SystemVerilog hardware description files are generated from their Agda Agate descriptions.
Once the SystemVerilog hardware files are generated, testbench are executed using Verilator to test each generated SystemVerilog file.

To compile the main program into a binary for execution certain Haskell libraries have to be installed e.g.

```console
cabal install --lib text-2.0.2
```

If things work correctly you should see output like:

```console
$ make
agda -c Main.agda
Checking Main (/Users/satnam/agate/Main.agda).
 Checking Examples (/Users/satnam/agate/Examples.agda).
  Checking AgateClass (/Users/satnam/agate/AgateClass.agda).
  Checking Combinators (/Users/satnam/agate/Combinators.agda).
  Checking Combinational (/Users/satnam/agate/Combinational.agda).
   Checking BitVec (/Users/satnam/agate/BitVec.agda).
  Checking Netlist (/Users/satnam/agate/Netlist.agda).
  Checking SystemVerilog (/Users/satnam/agate/SystemVerilog.agda).
Compiling Agda.Primitive in /Users/satnam/.cabal/store/ghc-9.4.8/Agd-2.7.0-87125eb0/share/lib/prim/_build/2.7.0/agda/Agda/Primitive.agdai to /Users/satnam/agate/MAlonzo/Code/Agda/Primitive.hs
Compiling Agda.Builtin.IO in /Users/satnam/.cabal/store/ghc-9.4.8/Agd-2.7.0-87125eb0/share/lib/prim/_build/2.7.0/agda/Agda/Builtin/IO.agdai to /Users/satnam/agate/MAlonzo/Code/Agda/Builtin/IO.hs
Compiling Level in /Users/satnam/plfa/standard-library/_build/2.7.0/agda/src/Level.agdai to /Users/satnam/agate/MAlonzo/Code/Level.hs
...
[113 of 115] Compiling MAlonzo.Code.Examples ( MAlonzo/Code/Examples.hs, MAlonzo/Code/Examples.o )
[114 of 115] Compiling MAlonzo.Code.Main ( /Users/satnam/agate/MAlonzo/Code/Main.hs, /Users/satnam/agate/MAlonzo/Code/Main.o )
[115 of 115] Linking /Users/satnam/agate/Main
./Main
Wrote nandGate.sv
Wrote adder8.sv
Wrote adder16.sv
Wrote twoSorter8.sv
verilator --timing --trace --binary nandGate.sv nandGate_tb.sv --top nandGate_tb
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated.o /Users/satnam/verilator/include/verilated.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated_vcd_c.o /Users/satnam/verilator/include/verilated_vcd_c.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated_timing.o /Users/satnam/verilator/include/verilated_timing.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated_threads.o /Users/satnam/verilator/include/verilated_threads.cpp
python3 /Users/satnam/verilator/bin/verilator_includer -DVL_INCLUDE_OPT=include VnandGate_tb.cpp VnandGate_tb___024root__DepSet_hcaf5b6a5__0.cpp VnandGate_tb___024root__DepSet_h80806d63__0.cpp VnandGate_tb__main.cpp VnandGate_tb__Trace__0.cpp VnandGate_tb___024root__Slow.cpp VnandGate_tb___024root__DepSet_hcaf5b6a5__0__Slow.cpp VnandGate_tb___024root__DepSet_h80806d63__0__Slow.cpp VnandGate_tb__Syms.cpp VnandGate_tb__Trace__0__Slow.cpp VnandGate_tb__TraceDecls__0__Slow.cpp > VnandGate_tb__ALL.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o VnandGate_tb__ALL.o VnandGate_tb__ALL.cpp
echo "" > VnandGate_tb__ALL.verilator_deplist.tmp
g++  -Wl,-U,__Z15vl_time_stamp64v,-U,__Z13sc_time_stampv   verilated.o verilated_vcd_c.o verilated_timing.o verilated_threads.o VnandGate_tb__ALL.a    -pthread -lpthread   -o VnandGate_tb
rm VnandGate_tb__ALL.verilator_deplist.tmp
- V e r i l a t i o n   R e p o r t: Verilator 5.038 2025-07-08 rev v5.038-49-g318b1c1a3
- Verilator: Built from 0.035 MB sources in 3 modules, into 0.034 MB in 11 C++ files needing 0.000 MB
- Verilator: Walltime 3.675 s (elab=0.004, cvt=0.008, bld=3.653); cpu 0.008 s on 1 threads
./obj_dir/VnandGate_tb +trace
- nandGate_tb.sv:12: Verilog $finish
- S i m u l a t i o n   R e p o r t: Verilator 5.038 2025-07-08
- Verilator: $finish at 40ps; walltime 0.000 s; speed 106.383 ns/s
- Verilator: cpu 0.000 s on 1 threads; alloced 0 MB
verilator --timing --trace --binary adder8.sv adder8_tb.sv --top adder8_tb
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated.o /Users/satnam/verilator/include/verilated.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated_vcd_c.o /Users/satnam/verilator/include/verilated_vcd_c.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated_timing.o /Users/satnam/verilator/include/verilated_timing.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated_threads.o /Users/satnam/verilator/include/verilated_threads.cpp
python3 /Users/satnam/verilator/bin/verilator_includer -DVL_INCLUDE_OPT=include Vadder8_tb.cpp Vadder8_tb___024root__DepSet_h79378c13__0.cpp Vadder8_tb___024root__DepSet_hca8589b0__0.cpp Vadder8_tb__main.cpp Vadder8_tb__Trace__0.cpp Vadder8_tb___024root__Slow.cpp Vadder8_tb___024root__DepSet_h79378c13__0__Slow.cpp Vadder8_tb___024root__DepSet_hca8589b0__0__Slow.cpp Vadder8_tb__Syms.cpp Vadder8_tb__Trace__0__Slow.cpp Vadder8_tb__TraceDecls__0__Slow.cpp > Vadder8_tb__ALL.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o Vadder8_tb__ALL.o Vadder8_tb__ALL.cpp
echo "" > Vadder8_tb__ALL.verilator_deplist.tmp
g++  -Wl,-U,__Z15vl_time_stamp64v,-U,__Z13sc_time_stampv   verilated.o verilated_vcd_c.o verilated_timing.o verilated_threads.o Vadder8_tb__ALL.a    -pthread -lpthread   -o Vadder8_tb
rm Vadder8_tb__ALL.verilator_deplist.tmp
- V e r i l a t i o n   R e p o r t: Verilator 5.038 2025-07-08 rev v5.038-49-g318b1c1a3
- Verilator: Built from 0.038 MB sources in 3 modules, into 0.177 MB in 11 C++ files needing 0.000 MB
- Verilator: Walltime 3.547 s (elab=0.000, cvt=0.009, bld=3.534); cpu 0.013 s on 1 threads
./obj_dir/Vadder8_tb +trace
- adder8_tb.sv:14: Verilog $finish
- S i m u l a t i o n   R e p o r t: Verilator 5.038 2025-07-08
- Verilator: $finish at 10ps; walltime 0.000 s; speed 18.450 ns/s
- Verilator: cpu 0.001 s on 1 threads; alloced 0 MB
verilator --timing --trace --binary adder16.sv adder16_tb.sv --top adder16_tb
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated.o /Users/satnam/verilator/include/verilated.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated_vcd_c.o /Users/satnam/verilator/include/verilated_vcd_c.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated_timing.o /Users/satnam/verilator/include/verilated_timing.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated_threads.o /Users/satnam/verilator/include/verilated_threads.cpp
python3 /Users/satnam/verilator/bin/verilator_includer -DVL_INCLUDE_OPT=include Vadder16_tb.cpp Vadder16_tb___024root__DepSet_hf0a99244__0.cpp Vadder16_tb___024root__DepSet_hd1ef5622__0.cpp Vadder16_tb__main.cpp Vadder16_tb__Trace__0.cpp Vadder16_tb___024root__Slow.cpp Vadder16_tb___024root__DepSet_hf0a99244__0__Slow.cpp Vadder16_tb___024root__DepSet_hd1ef5622__0__Slow.cpp Vadder16_tb__Syms.cpp Vadder16_tb__Trace__0__Slow.cpp Vadder16_tb__TraceDecls__0__Slow.cpp > Vadder16_tb__ALL.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o Vadder16_tb__ALL.o Vadder16_tb__ALL.cpp
echo "" > Vadder16_tb__ALL.verilator_deplist.tmp
g++  -Wl,-U,__Z15vl_time_stamp64v,-U,__Z13sc_time_stampv   verilated.o verilated_vcd_c.o verilated_timing.o verilated_threads.o Vadder16_tb__ALL.a    -pthread -lpthread   -o Vadder16_tb
rm Vadder16_tb__ALL.verilator_deplist.tmp
- V e r i l a t i o n   R e p o r t: Verilator 5.038 2025-07-08 rev v5.038-49-g318b1c1a3
- Verilator: Built from 0.035 MB sources in 3 modules, into 0.033 MB in 11 C++ files needing 0.000 MB
- Verilator: Walltime 3.452 s (elab=0.000, cvt=0.003, bld=3.445); cpu 0.006 s on 1 threads
./obj_dir/Vadder16_tb +trace
- adder16_tb.sv:12: Verilog $finish
- S i m u l a t i o n   R e p o r t: Verilator 5.038 2025-07-08
- Verilator: $finish at 10ps; walltime 0.000 s; speed 26.738 ns/s
- Verilator: cpu 0.000 s on 1 threads; alloced 0 MB
verilator --timing --trace --binary twoSorter8.sv twoSorter8_tb.sv --top twoSorter8_tb
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated.o /Users/satnam/verilator/include/verilated.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated_vcd_c.o /Users/satnam/verilator/include/verilated_vcd_c.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o verilated_timing.o /Users/satnam/verilator/include/verilated_timing.cpp
python3 /Users/satnam/verilator/bin/verilator_includer -DVL_INCLUDE_OPT=include VtwoSorter8_tb.cpp VtwoSorter8_tb___024root__DepSet_h12e92fb4__0.cpp VtwoSorter8_tb___024root__DepSet_h3fa6dbef__0.cpp VtwoSorter8_tb__main.cpp VtwoSorter8_tb__Trace__0.cpp VtwoSorter8_tb___024root__Slow.cpp VtwoSorter8_tb___024root__DepSet_h12e92fb4__0__Slow.cpp VtwoSorter8_tb___024root__DepSet_h3fa6dbef__0__Slow.cpp VtwoSorter8_tb__Syms.cpp VtwoSorter8_tb__Trace__0__Slow.cpp VtwoSorter8_tb__TraceDecls__0__Slow.cpp > VtwoSorter8_tb__ALL.cpp
g++ -Os  -I.  -MMD -I/Users/satnam/verilator/include -I/Users/satnam/verilator/include/vltstd -DVM_COVERAGE=0 -DVM_SC=0 -DVM_TIMING=1 -DVM_TRACE=1 -DVM_TRACE_FST=0 -DVM_TRACE_VCD=1 -DVM_TRACE_SAIF=0 -faligned-new -fbracket-depth=4096 -fcf-protection=none -Xclang -fno-pch-timestamp -Qunused-arguments -Wno-bool-operation -Wno-c++11-narrowing -Wno-constant-logical-operand -Wno-non-pod-varargs -Wno-parentheses-equality -Wno-shadow -Wno-sign-compare -Wno-tautological-bitwise-compare -Wno-tautological-compare -Wno-uninitialized -Wno-unused-but-set-parameter -Wno-unused-but-set-variable -Wno-unused-parameter -Wno-unused-variable    -DVL_TIME_CONTEXT   -std=gnu++20 -c -o VtwoSorter8_tb__ALL.o VtwoSorter8_tb__ALL.cpp
echo "" > VtwoSorter8_tb__ALL.verilator_deplist.tmp
g++  -Wl,-U,__Z15vl_time_stamp64v,-U,__Z13sc_time_stampv   verilated.o verilated_vcd_c.o verilated_timing.o verilated_threads.o VtwoSorter8_tb__ALL.a    -pthread -lpthread   -o VtwoSorter8_tb
rm VtwoSorter8_tb__ALL.verilator_deplist.tmp
- V e r i l a t i o n   R e p o r t: Verilator 5.038 2025-07-08 rev v5.038-49-g318b1c1a3
- Verilator: Built from 0.035 MB sources in 3 modules, into 0.036 MB in 11 C++ files needing 0.000 MB
- Verilator: Walltime 2.987 s (elab=0.000, cvt=0.002, bld=2.981); cpu 0.005 s on 1 threads
./obj_dir/VtwoSorter8_tb +trace
- twoSorter8_tb.sv:13: Verilog $finish
- S i m u l a t i o n   R e p o r t: Verilator 5.038 2025-07-08
- Verilator: $finish at 20ps; walltime 0.000 s; speed 55.710 ns/s
- Verilator: cpu 0.000 s on 1 threads; alloced 0 MB
```
