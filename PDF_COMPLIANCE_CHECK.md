# PDF Compliance Check

Checked date: 2026-05-25 Asia/Taipei

Reference documents:

- `助教給的檔案/0524更新/114_DSD_Final_Project_v5.pdf`
- `Memory_setting.pdf`
- `MEMORY_SETTING.md`
- TA release files under `助教給的檔案/0524更新/`

## Result

The current adopted source version `v0.9.4-rank1-pipeline` is consistent with the visible PDF requirements and TA 2026-05-24 update.

This check does not claim that full #3 post-synthesis timing simulation or #5 post-implementation timing simulation has been rerun for this version. It confirms source/IP/interface compliance before tagging the verified version.

## Top-Level Interface

`RISCV_CNN.v` uses the TA 2026-05-24 top-level interface:

```verilog
module RISCV_CNN(
    input         FPGA_clk,
    input         rstn,
    input  [3:0]  tc,
    input         mode,
    input         st,
    output        all_done,
    output [6:0]  seven_seg,
    output [3:0]  anode
);
```

`constraints/RISCV_CNN.xdc` maps the pins required by the v5 PDF:

| Signal | Pin |
|---|---|
| `FPGA_clk` | `P17` |
| `rstn` | `P15` |
| `st` | `R15` |
| `mode` | `P5` |
| `tc[0]..tc[3]` | `R1`, `N4`, `M4`, `R2` |
| `seven_seg[6:0]` | `B4`, `A4`, `A3`, `B1`, `A1`, `B3`, `B2` |
| `anode[3:0]` | `H1`, `C1`, `C2`, `G2` |
| `all_done` | `K2` |

## TA Files

The in-use TA files match the 2026-05-24 release by SHA256:

| File | Status |
|---|---|
| `test_circuit_bram_ip.v` vs `助教給的檔案/0524更新/test_circuit_bram_ip.v` | match |
| `tb/post_sim_tb.v` vs `助教給的檔案/0524更新/post_sim_tb.v` | match |

`test_circuit_bram_ip.v` was not modified for scoring or timing bypass.

## BRAM Settings

The Vivado IP `.xci` settings match `MEMORY_SETTING.md`.

### Instruction_Memory

| Setting | Current value |
|---|---|
| Component name | `Instruction_Memory` |
| Memory type | `Single_Port_ROM` |
| Width | 32 |
| Depth | 1024 |
| Operating mode | `WRITE_FIRST` |
| Enable A | `Always_Enabled` |
| Byte size | 9 |
| Algorithm | `Minimum_Area` |
| Primitive | `8kx2` |
| Output registers | disabled |

RTL instantiation has no `.ena(1'b1)` connection for `Instruction_Memory`, which is correct for Always Enabled.

### Data_mem

| Setting | Current value |
|---|---|
| Component name | `Data_mem` |
| Memory type | `True_Dual_Port_RAM` |
| Port A width/depth | 32 / 1024 |
| Port B width/depth | 32 / 1024 |
| Operating mode A/B | `READ_FIRST` / `READ_FIRST` |
| Enable A/B | `Use_ENA_Pin` / `Use_ENB_Pin` |
| Byte size | 9 |
| Algorithm | `Minimum_Area` |
| Primitive | `8kx2` |
| Output registers | disabled |

RTL intentionally connects `Data_mem.ena` and `Data_mem.enb`, because this IP is configured to use enable pins. This does not conflict with the earlier rule to remove `.ena(1'b1)` from `Instruction_Memory`.

### TA ROMs

`init_rom` and `golden_rom` settings match the recorded memory setting notes:

| IP | Type | Width | Depth | Mode | Enable |
|---|---|---:|---:|---|---|
| `init_rom` | Single Port ROM | 32 | 10240 | `WRITE_FIRST` | `Use_ENA_Pin` |
| `golden_rom` | Single Port ROM | 32 | 2156 | `WRITE_FIRST` | `Use_ENA_Pin` |

These ROMs are instantiated inside the TA test circuit, not as extra student design BRAMs.

## Memory Map And Control Behavior

The design follows the PDF memory map and control protocol:

- Data memory is 32-bit wide and 1024 words deep.
- The CPU observes `Data_mem[11][0]` as the active-high start field and clears it by writing 0 before CNN execution starts.
- `Data_mem[12][6:1]` is used as the feature-map size field.
- The CNN writes output data into the student output area and sets `Data_mem[13][10:1]` for output start plus `Data_mem[13][0]` for completion.
- Addresses `960..1023` are reserved for grading and are not used by the CNN output path.

The current `instr_mem_cpucheck.coe` is an integrated instruction image:

- The first 36 words keep the TA CPU-check program.
- The appended words perform bias/start setup with normal CPU instructions.
- The current image has 51 data words after removing redundant appended control-flow/no-op instructions.

## Prohibited-Behavior Check

No prohibited bypass behavior was found in the adopted source:

- No edits to the TA `test_circuit_bram_ip.v`.
- No direct golden-ROM lookup or hard-coded output-answer path in `RISCV_CNN.v`.
- No testcase-id special path in the CNN datapath.
- No extra student BRAM instantiation beyond `Instruction_Memory` and `Data_mem`; `init_rom` and `golden_rom` are part of the TA test circuit.

## Current Adopted Metrics

The latest adopted bitstream remains:

```text
final/bit_temp/at_rank1_adopted_pipeline_20260525_233131.bit
```

Latest recorded metrics:

```text
RTL score_bcd = 0100
cycle_count = 14268
Implementation WNS = 0.013 ns
Implementation WHS = 0.072 ns
Route errors = 0
Official Area = 5201
AT product = 742078680
```
