# Parameterized ALU in Verilog

A parameterized Arithmetic Logic Unit (ALU) implemented in Verilog. This project supports common arithmetic, logical, comparison, and shift operations along with status flag generation.

## Features

* Parameterized data width (default: 32-bit)
* Arithmetic operations

  * ADD
  * SUB
* Logical operations

  * AND
  * OR
  * XOR
* Shift operations

  * Shift Left Logical (SLL)
  * Shift Right Logical (SRL)
  * Shift Right Arithmetic (SRA)
* Comparison operation

  * Set Less Than (SLT)
* Status flags

  * Zero
  * Carry
  * Overflow
  * Negative

## Project Structure

```text
Parameterized-ALU-in-Verilog/
│
├── rtl/
│   └── alu.v
│
├── tb/
│   └── alu_tb.v
│
├── docs/
│   ├── block_diagram.png
│   └── waveform.png
│
└── README.md
```

## Supported Operations

| Opcode | Operation |
| ------ | --------- |
| 0000   | ADD       |
| 0001   | SUB       |
| 0010   | AND       |
| 0011   | OR        |
| 0100   | XOR       |
| 0101   | SLL       |
| 0110   | SRL       |
| 0111   | SRA       |
| 1000   | SLT       |

## Inputs

| Signal | Width | Description      |
| ------ | ----- | ---------------- |
| A      | WIDTH | Operand A        |
| B      | WIDTH | Operand B        |
| opcode | 4     | Operation select |

## Outputs

| Signal   | Description                          |
| -------- | ------------------------------------ |
| result   | Operation result                     |
| zero     | Set when result equals zero          |
| carry    | Carry-out from arithmetic operations |
| overflow | Signed arithmetic overflow           |
| negative | MSB of result                        |

## Verification

The testbench verifies:

* Addition
* Subtraction
* Logical operations
* Shift operations
* Signed comparison
* Zero flag generation
* Overflow detection

Example overflow test:

```text
A = 32'h7FFFFFFF
B = 32'h00000001
Opcode = ADD

Result   = 32'h80000000
Overflow = 1
```

## Simulation

Simulation was performed using Xilinx Vivado Simulator.

(Add waveform screenshot here)

## What I Learned

* Parameterized RTL design
* Signed vs unsigned arithmetic
* Overflow detection logic
* Combinational circuit implementation
* Verilog testbench development
* Waveform-based debugging

## Future Improvements

* Self-checking testbench
* SystemVerilog assertions (SVA)
* Functional coverage
* UVM-based verification environment
