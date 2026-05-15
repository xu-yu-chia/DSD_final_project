# RISCV_CNN Final Project Report Outline

## Degree of Completion
- Completed RV32 multi-cycle CPU subset: `lw`, `sw`, `add`, `sub`, `addi`, `beq`, `blt`.
- Completed CPU bias generation and memory-mapped CNN launch.
- Completed two-stage 3x3 CNN coprocessor with Q1.6 signed fixed-point data.
- Completed output start address/status protocol: `DataMemory[13] = (512 << 1) | 1`.

## Architecture
- Top module: `RISCV_CNN(clk, rstn, tc, mode, st, seven_seg, anode)`.
- Shared 1024 x 32-bit data memory:
  - Port A: local tester during initialization, CPU after initialization.
  - Port B: CNN coprocessor.
- CPU executes a small ROM program to poll start, clear start, compute Bias0/Bias1, and launch CNN.
- CNN reads weights/input/bias from shared memory, computes intermediate output at address 272, then final output at address 512.

## Design Technique
- Instruction memory is byte-PC mapped with instruction index `pc[9:2]`.
- Data memory CPU accesses are RV32 byte-addressed and converted to word index by `addr[11:2]`.
- Feature maps are row-major, four signed Q1.6 bytes per word, big-endian lane order.
- CNN uses a row-MAC architecture with three signed 8x8 multipliers per kernel row.
- Each convolution output preserves full accumulated precision, then applies round-to-nearest ties-to-even and saturation to signed Q1.6.

## Verification Screenshots To Add
- Behavioral simulation transcript showing all local testcases passing.
- Behavioral waveform around:
  - CPU clearing `DataMemory[12][0]`.
  - CPU writing `DataMemory[14]` and `DataMemory[15]`.
  - CPU writing command `DataMemory[6]`.
  - CNN writing final status `DataMemory[13]`.
- Post-synthesis simulation result.
- Post-implementation timing simulation result.
- STA summary screenshot from `reports/timing_impl.rpt`.

## Hardness and Solutions
- Addressing was the main source of risk because the PDF memory map is word-addressed while RV32 load/store instructions are byte-addressed.
- The solution was to keep the CPU standard-compliant and convert CPU memory addresses with `addr[11:2]`.
- Another risk was feature packing when a 3-value convolution window crosses a 32-bit word boundary; the CNN explicitly fetches a second word only when lane index is 2 or 3.

## Suggestions
- Providing the TA test circuit skeleton together with the project PDF would make integration and verification less ambiguous.
