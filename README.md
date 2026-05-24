# DSD Final Project

RISC-V RV32 CPU with a memory-mapped CNN coprocessor for the EE3044 Digital System Design final project.

Current verified version: `v0.9.1`

## Current Status

- `test_circuit_bram_ip.v` is kept unchanged from the TA-provided version.
- `instr_mem_cpucheck.coe` is the integrated instruction image: the first 36 words keep the TA CPU-check program, and the appended words perform bias/start setup through the CPU.
- RTL display-based regression passes all testcases.
- Full Vivado synthesis, placement, routing, post-route timing, and #5 post-implementation timing simulation pass.
- Vivado GUI post-synthesis timing simulation elaboration is supported; the testbench no longer depends on RTL-only internal signals by default.
- `scripts/run_vivado_checks.tcl` intentionally does not generate a bitstream.

Latest RTL result:

```text
score_bcd = 0100
cycle_count = 25746
result_valid = 7fff
result_pass  = 7fff
FINALPROJECT_SIM_PASS
```

Latest implementation result:

```text
Post Routing Timing Summary | WNS=0.731 | TNS=0.000 | WHS=0.033 | THS=0.000
All user specified timing constraints are met.
```

Latest #5 post-implementation timing simulation result:

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
| Constraints | `constraints/RISCV_CNN.xdc` |
| Vivado project | `final/final.xpr` |
| Work log | `CODEX_WORKLOG.md` |
| Memory setting notes | `MEMORY_SETTING.md` |

TA-provided reference files are kept in the TA reference directory at the project root.

## Design Summary

Top module: `RISCV_CNN`

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

Implementation utilization for `v0.9.1`:

```text
Slice LUTs       = 2154 / 20800  (10.36%)
Slice Registers  = 1862 / 41600  (4.48%)
F7 Muxes         = 261
F8 Muxes         = 2
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

For `v0.9.1`:

```text
Official Area = 2154 + 1862 + 261 + 2 + 280*2 = 4839
cycle_count = 25746
Processing Time = 257460 ns
AT product = 4839 * 257460 = 1245848940
```

## Memory Settings

- `Instruction_Memory` follows `MEMORY_SETTING.md`: Single Port ROM, 32-bit width, depth 1024, Write First, Always Enabled, with no RTL `.ena(1'b1)` connection.
- `Data_mem` follows `MEMORY_SETTING.md`: True Dual Port RAM, Read First, ENA/ENB pin enabled.

## Notes

- The design should be judged by the RTL and TA test environment, not by internal testbench-only signals.
- Detailed version history, tradeoffs, and rationale are kept in `CODEX_WORKLOG.md`.
