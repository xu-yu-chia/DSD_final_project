# DSD Final Project

RISC-V RV32 CPU with a memory-mapped CNN coprocessor for the EE3044 Digital System Design final project.

Current working version: `v0.9.4-rank1-pipeline` AT optimization experiment

## Current Status

- `test_circuit_bram_ip.v` is kept unchanged from the TA-provided version.
- The project has been updated to the TA 2026-05-24 interface release: top-level clock port `FPGA_clk` and output `all_done`.
- `instr_mem_cpucheck.coe` is the integrated instruction image: the first 36 words keep the TA CPU-check program, and the appended words perform bias/start setup through the CPU. The latest appended sequence removes redundant control-flow/no-op instructions but still performs the same CPU-driven bias/start behavior.
- RTL display-based regression passes all testcases with the `v0.9.4-rank1-pipeline` datapath.
- A non-project bitstream was generated for `v0.9.4-rank1-pipeline` at `final/bit_temp/at_rank1_adopted_pipeline_20260525_233131.bit`, and its implementation timing report met timing.
- Full #3 post-synthesis timing and #5 post-implementation timing simulations have not been rerun for `v0.9.4-rank1-pipeline`; the previous known clean #5 PASS datapath remains `v0.9.0`/`v0.9.1`. This version preserves the timing-simulation interface fixes from those versions.
- Vivado GUI post-synthesis timing simulation elaboration is supported; the testbench no longer depends on RTL-only internal signals by default.
- `scripts/run_vivado_checks.tcl` intentionally does not generate a bitstream; `scripts/write_bit_temp.tcl` is used for timestamped bitstreams in `final/bit_temp/`.

Latest RTL result:

```text
score_bcd = 0100
cycle_count = 14268
result_valid = 7fff
result_pass  = 7fff
FINALPROJECT_SIM_PASS
```

Latest generated `v0.9.4-rank1-pipeline` bitstream implementation result:

```text
Post Routing Timing Summary | WNS=0.013 | TNS=0.000 | WHS=0.072 | THS=0.000
All user specified timing constraints are met.
```

Latest #5 post-implementation timing simulation result before the 2026-05-24 interface update:

```text
post_impl_score_bcd = 0100
FINALPROJECT_POST_IMPL_PASS
```

## Important Files

| Purpose | File |
|---|---|
| Top RTL | `RISCV_CNN.v` |
| TA test circuit in use | `test_circuit_bram_ip.v` |
| Local simulation testbench | `tb/tb_finalproject.v` |
| TA post-simulation helper testbench | `tb/post_sim_tb.v` |
| Constraints | `constraints/RISCV_CNN.xdc` |
| Vivado project | `final/final.xpr` |
| Work log | `CODEX_WORKLOG.md` |
| Memory setting notes | `MEMORY_SETTING.md` |

TA-provided reference files are kept in the TA reference directory at the project root.

## Design Summary

Top module: `RISCV_CNN`

Top-level ports: `FPGA_clk`, `rstn`, `tc[3:0]`, `mode`, `st`, `all_done`, `seven_seg[6:0]`, `anode[3:0]`.

The design contains:

- A multi-cycle RV32 CPU supporting the required instruction subset.
- A memory-mapped CNN coprocessor.
- BRAM-based data memory and instruction memory.
- Top-level seven-segment display outputs used by the TA test circuit.

The CNN uses two 3x3 convolution layers. Feature, weight, and output values are signed 8-bit Q1.6 values packed four bytes per 32-bit memory word, using big-endian byte order inside each word.

## Memory Map

| Address | Use |
|---:|---|
| `0..2` | Layer 0 weights |
| `3..5` | Layer 1 weights |
| `11` | Start control, `data_mem[11][0]` |
| `12` | Feature map size, `data_mem[12][6:1]` |
| `13` | Output start and done, `data_mem[13][10:1]` and `data_mem[13][0]` |
| `14` | Bias 0 |
| `15` | Bias 1 |
| `16..271` | Input feature map |
| `272..959` | Student-defined / CNN output area |
| `960..1023` | Reserved grading area |

## Verification

Run RTL simulation only:

```powershell
& 'C:\Xilinx\Vivado\2022.1\bin\vivado.bat' -mode batch -source scripts\run_rtl_xsim.tcl -journal tmp\rtl.jou -log tmp\rtl.log
```

Run full Vivado checks and regenerate reports:

```powershell
& 'C:\Xilinx\Vivado\2022.1\bin\vivado.bat' -mode batch -source scripts\run_vivado_checks.tcl -journal tmp\full_checks.jou -log tmp\full_checks.log
```

Run the fast post-implementation timing simulation helper:

```powershell
& 'C:\Xilinx\Vivado\2022.1\bin\vivado.bat' -mode batch -source scripts\run_post_impl_fast_xsim.tcl -journal tmp\post_impl_fast.jou -log tmp\post_impl_fast.log
```

Generated reports:

```text
reports/utilization_synth.rpt
reports/timing_synth.rpt
reports/utilization_impl.rpt
reports/timing_impl.rpt
reports/route_status.rpt
```

## Vivado GUI Notes

GUI simulation flow is supported. Use Flow Navigator simulation actions directly for behavioral, post-synthesis, and post-implementation simulations.

The local testbench defaults to top-level display checking through `seven_seg` and `anode`, so GUI timing simulations do not depend on optimized-away internal net names. Batch RTL regression enables extra internal snapshots through `RTL_INTERNAL_CHECK` to print `cycle_count` and internal pass bitmaps.

## Latest Utilization

Implementation utilization for generated `v0.9.4-rank1-pipeline` bitstream:

```text
Slice LUTs       = 2305 / 20800  (11.08%)
Slice Registers  = 2065 / 41600  (4.96%)
F7 Muxes         = 261
F8 Muxes         = 10
Block RAM Tile   = 14 / 50       (28.00%)
DSPs             = 2 / 90        (2.22%)
```

## AT Product

Official project formula:

```text
Official Area = Slice LUTs + Slice Registers + F7 Muxes + F8 Muxes + 280 x DSPs
Processing Time = cycle_count x 10 ns
AT product = Official Area x Processing Time
```

For `v0.9.4-rank1-pipeline`:

```text
Official Area = 2305 + 2065 + 261 + 10 + 280*2 = 5201
cycle_count = 14268
Processing Time = 142680 ns
AT product = 5201 * 142680 = 742078680
```

## Memory Settings

- `Instruction_Memory` follows `MEMORY_SETTING.md`: Single Port ROM, 32-bit width, depth 1024, Write First, Always Enabled, with no RTL `.ena(1'b1)` connection.
- `Data_mem` follows `MEMORY_SETTING.md`: True Dual Port RAM, Read First, ENA/ENB pin enabled.

## Notes

- The design should be judged by the RTL and TA test environment, not by internal testbench-only signals.
- Detailed version history, tradeoffs, and rationale are kept in `CODEX_WORKLOG.md`.
