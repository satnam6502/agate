AGDA ?= agda
VERILATOR = verilator
VERILATOR_ARGS = +1800-2017ext+sv

# Simulation with verilator requires g++ version 10 or higher.

.PHONY: all lint sim clean

SRCS = AgateClass.agda \
       BitVec.agda \
       Combinators.agda \
       Combinational.agda \
       Netlist.agda \
       SystemVerilog.agda \
       Examples.agda \
       Main.agda

all:	sim

Main:	$(SRCS)
	$(AGDA) -c Main.agda

nandGate.sv:	./Main
		./Main

adder8_tb.vcd:	nandGate.sv # adder8.sv is generated at the same time as nandGate.sv
		$(VERILATOR) --timing --trace --binary adder8.sv adder8_tb.sv --top adder8_tb
		./obj_dir/Vadder8_tb +trace

adder16_tb.vcd:	nandGate.sv
		$(VERILATOR) --timing --trace --binary adder16.sv adder16_tb.sv --top adder16_tb
		./obj_dir/Vadder16_tb +trace

twoSorter8_tb.vcd:	nandGate.sv
		$(VERILATOR) --timing --trace --binary twoSorter8.sv twoSorter8_tb.sv --top twoSorter8_tb
		./obj_dir/VtwoSorter8_tb +trace

lint:	nandGate.sv adder8.sv
	$(VERILATOR) $(VERILATOR_ARGS) --timing --lint-only nandGate.sv nandGate_tb.sv
	$(VERILATOR) $(VERILATOR_ARGS) --timing --lint-only adder8.sv adder8_tb.sv
	$(VERILATOR) $(VERILATOR_ARGS) --timing --lint-only adder16.sv adder16_tb.sv
	$(VERILATOR) $(VERILATOR_ARGS) --timing --lint-only twoSorter8.sv twoSorter8_tb.sv

nandGate_tb.vcd:	nandGate.sv
			$(VERILATOR) --timing --trace --binary nandGate.sv nandGate_tb.sv --top nandGate_tb
			./obj_dir/VnandGate_tb +trace

sim:	nandGate_tb.vcd adder8_tb.vcd adder16_tb.vcd twoSorter8_tb.vcd

clean:
	rm -rf MAlonzo Main nandGate.sv nandGate_tb.vcd obj_dir *.agdai
