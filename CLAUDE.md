# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Agate is an experimental hardware design domain specific language (DSL) implemented in Agda. It allows hardware designers to write circuit descriptions in Agda that compile to SystemVerilog for simulation and synthesis.

## Prerequisites

- [Agda](https://agda.readthedocs.io/en/latest/getting-started/installation.html) - functional programming language and proof assistant
- [Verilator](https://veripool.org/guide/latest/install.html) - SystemVerilog simulator
- Haskell libraries (install with `cabal install --lib text-2.0.2`)

## Build System and Commands

### Primary Commands
- `make` or `make all` - Full build: compile Agda to executable, generate SystemVerilog, run simulations
- `make Main` - Compile Agda files to create the Main executable
- `make sim` - Run all simulations and generate VCD waveforms
- `make lint` - Lint all generated SystemVerilog files
- `make clean` - Remove all generated files

### Individual Simulation Targets
- `make nandGate_tb.vcd` - Simulate NAND gate
- `make adder8_tb.vcd` - Simulate 8-bit adder
- `make adder16_tb.vcd` - Simulate 16-bit adder
- `make twoSorter8_tb.vcd` - Simulate 8-bit two-sorter

### Build Process Flow
1. Agda files are compiled to Haskell via MAlonzo backend (`agda -c Main.agda`)
2. Haskell is compiled to create `Main` executable
3. `./Main` generates SystemVerilog files (.sv)
4. Verilator compiles and simulates each SystemVerilog module with testbenches
5. VCD waveform files are generated for viewing

## Architecture

### Core Module Structure
- **AgateClass.agda** - Defines the main `Agate` typeclass with hardware primitives (inv, and2, or2, xor2, add, lessThan, mux)
- **Netlist.agda** - Internal representation for hardware circuits, defines `Bit` and `NetType` data structures
- **SystemVerilog.agda** - Code generation backend that converts netlists to SystemVerilog
- **Combinational.agda** - Combinational circuit implementations using the Agate monad
- **Combinators.agda** - Higher-level circuit combinators and utilities
- **BitVec.agda** - Bit vector operations and utilities
- **Examples.agda** - Example circuits (nandGate, adder8, adder16, twoSorter8) and their SystemVerilog generators
- **Main.agda** - Top-level main program that generates all SystemVerilog files

### Design Pattern
Agate uses a monadic DSL pattern where:
- Hardware descriptions are written as monadic computations in the `Agate` monad
- The `Agate` typeclass provides hardware primitives as operations
- Netlists serve as an intermediate representation
- SystemVerilog generation is the final compilation target

### Key Types
- `Agate m Bit` - The main typeclass for hardware operations in monad `m` with bit type `Bit`
- `Bit` - Represents single bits (localNet, indexOfVec, zeroV)
- `Vec Bit n` - Represents bit vectors of size `n`
- Monadic structure allows for stateful netlist construction

## File Organization

- `*.agda` - Source Agda files
- `*.sv` - Generated SystemVerilog modules
- `*_tb.sv` - Testbench files for SystemVerilog modules
- `*.vcd` - Generated waveform files from simulations
- `MAlonzo/` - Generated Haskell code from Agda compilation
- `obj_dir/` - Verilator build artifacts
- `*.agdai` - Compiled Agda interface files

## Development Workflow

1. Edit Agda source files to define new circuits
2. Add examples to Examples.agda and wire them into Main.agda
3. Run `make` to compile and test everything
4. View generated SystemVerilog in .sv files
5. Examine waveforms in .vcd files to verify circuit behavior
6. Use `make lint` to check SystemVerilog quality

## Testing

Simulation testing is integrated into the build process. Each generated SystemVerilog module has a corresponding testbench that:
- Instantiates the module under test
- Applies test vectors
- Generates VCD waveforms for inspection
- Validates expected behavior

Run `make sim` to execute all testbenches, or individual targets for specific modules.