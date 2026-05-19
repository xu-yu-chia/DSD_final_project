# DSD Final Project

RISC-V RV32 CPU with a memory-mapped CNN coprocessor for the EE3044 Digital System Design final project.

Current verified version: `v0.7.0`

## Current Status

- Official TA files in the project root match `助教給的檔案/` by SHA256:
  - `test_circuit_bram_ip.v`
  - `init_rom.coe`
  - `golden_rom.coe`
  - `instr_mem_cpucheck.coe`
- RTL display-based regression passes all 15 testcases.
- Full Vivado synthesis, placement, routing, and post-route timing checks pass.
- `scripts/run_vivado_checks.tcl` intentionally does not generate a bitstream.

Latest RTL result:

```text
score_bcd = 0100
tc = 0..e all pass by display BCD
FINALPROJECT_SIM_PASS
```

Latest implementation result:

```text
Post Routing Timing Summary | WNS=0.129 | TNS=0.000 | WHS=0.103 | THS=0.000
Route status: fully routed nets = 4605, routing errors = 0
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

TA-provided reference files are stored in:

```text
助教給的檔案/
```

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

## Verification Commands

Run RTL simulation only:

```powershell
& 'C:\Xilinx\Vivado\2022.1\bin\vivado.bat' -mode batch -source scripts\run_rtl_xsim.tcl -journal tmp\rtl.jou -log tmp\rtl.log
```

Run full Vivado checks and regenerate reports:

```powershell
& 'C:\Xilinx\Vivado\2022.1\bin\vivado.bat' -mode batch -source scripts\run_vivado_checks.tcl -journal tmp\full_checks.jou -log tmp\full_checks.log
```

Generated reports:

```text
reports/utilization_synth.rpt
reports/timing_synth.rpt
reports/utilization_impl.rpt
reports/timing_impl.rpt
reports/route_status.rpt
```

## Latest Utilization

Implementation utilization for `v0.7.0`:

```text
Slice LUTs       = 2480 / 20800  (11.92%)
Slice Registers  = 2137 / 41600  (5.14%)
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

For `v0.7.0`:

```text
Official Area = 2480 + 2137 + 261 + 10 + 280*2 = 5448
cycle_count = 14252
Processing Time = 142520 ns
AT product = 5448 * 142520 = 776448960
```

## Notes

- `tb/tb_finalproject.v` is a local simulation helper. It checks only the top-level `seven_seg` and `anode` display behavior.
- The design should be judged by the RTL and TA test environment, not by internal testbench-only signals.
- Detailed version history and rationale are kept in `CODEX_WORKLOG.md`.
