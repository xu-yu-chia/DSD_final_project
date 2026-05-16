# DSD Final Project 工作紀錄

最後更新：2026-05-16 13:04 Asia/Taipei

主要工作區：

```text
C:\Users\User\DSD_Lab\Final\DSD_final_project
```

Vivado project：

```text
C:\Users\User\DSD_Lab\Final\DSD_final_project\final\final.xpr
```

## 目前狀態

- 目前正式版本：`v0.2.1`
- `v0.2.1` 將 top-level clock port 對齊 PDF 要求的 `clk`。
- RTL simulation 已通過全部 15 個 testcase。
- Synthesis、placement、routing、post-route timing 皆已完成並通過。
- `scripts/run_vivado_checks.tcl` 目前刻意不產生 bitstream。
- Vivado journal/log 與暫存工作檔集中放在 `tmp/`。
- 舊的 `FinalProject` 資料夾已刪除；有保留價值的舊檔已搬到 `legacy_artifacts/FinalProject_deprecated/`。
- 助教提供的 `.coe` 檔案不可修改；目前 `init_rom.coe`、`golden_rom.coe`、`instr_mem_cpucheck.coe` 皆已確認與 `coe備份檔/` 內備份檔 SHA256 完全一致。

## 版本紀錄

- `v0.2.1` - 2026-05-16 13:04 Asia/Taipei
  - 將 top-level port `FPGA_clk` 改為 PDF 要求的 `clk`。
  - 同步更新 `constraints/RISCV_CNN.xdc` 與 `tb/tb_finalproject.v` 的 clock port 名稱。
  - 未修改助教 `.coe` 檔案；三個 `.coe` 已與 `coe備份檔/` 備份比對 SHA256 一致。
  - RTL simulation 通過，`cycle_count = 30712`。
  - Implementation timing 通過，`WNS = 0.130 ns`。
  - `scripts/run_vivado_checks.tcl` 在 sandbox 內遇到 Vivado `.Xil` 暫存目錄刪除錯誤；改用等效的 implementation-only Tcl 在核准後重跑 synthesis/place/route/report，結果通過。
  - 建立 Git tag：`v0.2.1`，並推送到 GitHub。
- `v0.2.0` - 2026-05-16 01:23 Asia/Taipei
  - 完成 CNN row pipeline 優化。
  - RTL simulation 通過，`cycle_count = 30712`。
  - Post-route timing 通過，`WNS = 0.087 ns`。
  - 整理工作區，刪除舊 `FinalProject` 資料夾。
  - 將舊版有價值檔案保存到 `legacy_artifacts/FinalProject_deprecated/`。
  - 建立 Git tag：`v0.2.0`，並推送到 GitHub。
- `v0.1.2` - 2026-05-16 00:46 Asia/Taipei
  - 記錄 GitHub clone / workspace 同步狀態。
  - 將 baseline project 檔案保存在 `DSD_final_project`。
- `v0.1.1` - 2026-05-16 00:38 Asia/Taipei
  - 匯入 final project baseline 到 Git。
- `v0.1.0` - 2026-05-16 00:30 Asia/Taipei
  - 建立 Vivado project baseline。
  - Baseline RTL simulation、synthesis、implementation、timing 皆通過。

## 固定維護規則

之後每次更動都要同步完成以下事項：

1. 更新 `CODEX_WORKLOG.md`，包含更動內容、驗證結果、速度與面積比較。
2. 執行必要驗證，至少確認 RTL simulation；若有 RTL/時序相關修改，需跑完整 Vivado checks。
3. 建立 Git commit，commit message 需包含版本或明確功能摘要。
4. 需要形成正式節點時建立 Git tag，例如 `v0.2.1`、`v0.3.0`。
5. 修改完成後一律推送到 GitHub remote `origin`：即使不建立 tag，也必須至少建立並推送 commit；只有使用者明確要求暫停推送時才例外。

## 速度與面積版本比較

面積主要以 implementation report 的 Slice LUTs、Slice Registers、Block RAM Tile、DSPs 紀錄。  
AT product 以 `Slice LUTs × cycle_count` 作為本專案的簡化比較指標，數值越低越好。

| 版本 | 時間 | cycle_count | 速度變化 | Slice LUTs | LUT 面積變化 | Registers | BRAM Tile | DSP | WNS | LUT×cycle AT | AT 變化 |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| `v0.1.2` | 2026-05-16 00:46 | 34080 | baseline | 2140 | baseline | 1915 | 15 | 2 | 0.049 ns | 72931200 | baseline |
| `v0.2.0` | 2026-05-16 01:23 | 30712 | cycles -3368 / -9.88% | 2197 | +57 / +2.66% | 1915 | 15 | 2 | 0.087 ns | 67474264 | -5456936 / -7.48% |
| `v0.2.1` | 2026-05-16 13:04 | 30712 | cycles -3368 / -9.88% | 2195 | +55 / +2.57% | 1915 | 15 | 2 | 0.130 ns | 67412840 | -5518360 / -7.57% |

解讀：

- `v0.2.0` 相比 `v0.1.2`，cycle 數下降約 9.88%，等效 throughput 約提升 10.97%。
- `v0.2.1` 只修正 clock port 命名，cycle_count 維持 30712。
- Slice LUTs 相比 baseline 增加 55 個，約增加 2.57%；Registers、BRAM、DSP 維持不變。
- 以 `LUT×cycle` 估算 AT product，`v0.2.1` 約改善 7.57%。

## 本次 PDF clock / COE 修正

修改檔案：

```text
RISCV_CNN.v
constraints\RISCV_CNN.xdc
tb\tb_finalproject.v
reports\timing_impl.rpt
reports\timing_synth.rpt
reports\utilization_impl.rpt
reports\utilization_synth.rpt
```

修正內容：

- Top-level clock port 由 `FPGA_clk` 改為 `clk`，對齊 PDF module I/O 要求。
- XDC clock pin 與 `create_clock` 改為套用在 `[get_ports clk]`。
- Testbench DUT instantiation 改為 `.clk(FPGA_clk)`，保留 testbench 內部 clock signal 名稱。
- 助教 `.coe` 檔案已恢復並確認與 `coe備份檔/` 完全一致。

COE SHA256 比對：

```text
init_rom.coe               7DDF3C7944E2B78F3179FD4862886C3FC4942A3CD58341345B5E6409100FEE2B
golden_rom.coe             060BBE3730DEBEE894CFB8DC4B87F080470F49E7A7B1E4E2C9573B2DC9162265
instr_mem_cpucheck.coe     B70B211A9B1577C78695E20AC46439196CB8FD65FFE58707346A0A693797A2E3
```

RTL simulation：

```text
vivado.bat -mode batch -source scripts/run_rtl_xsim.tcl -journal tmp/tmp_clkfix_rtl.jou -log tmp/tmp_clkfix_rtl.log

result_valid = 7fff
result_pass  = 7fff
cycle_count  = 30712
addr13       = 00000401
FINALPROJECT_RTL_PASS
```

Implementation check：

```text
vivado.bat -mode batch -source tmp/tmp_clkfix_impl_only.tcl -journal tmp/tmp_clkfix_impl_only_escalated.jou -log tmp/tmp_clkfix_impl_only_escalated.log

route_design completed successfully
Timing met
WNS = 0.130 ns
TNS = 0.000 ns
fully routed nets = 4083
routing errors    = 0
```

Implementation utilization：

```text
Slice LUTs       = 2195 / 20800  (10.55%)
Slice Registers  = 1915 / 41600  (4.60%)
Block RAM Tile   = 15 / 50       (30.00%)
DSPs             = 2 / 90        (2.22%)
```

## 本次優化重點

修改檔案：

```text
src\student_fp_core.v
```

CNN datapath 優化方式：

- 保留 `C_MAC` state 與 `row_sum_reg` pipeline register，避免把 3 個乘法與加總直接拉進 BRAM capture critical path。
- 新增 `kernel_row_offset_for`、`next_krow`、`next_word_addr`、`next_lane`。
- 在 `C_ACCUM_ROW` 同一個 cycle 內完成上一個 kernel row 的累加，並提前送出下一個 BRAM row address。
- 因此 kernel row 1 與 row 2 不再需要額外回到 `C_ROW_ADDR` state。

效能結果：

```text
優化前 cycle_count：34080
優化後 cycle_count：30712
減少 cycles：3368
改善幅度：約 9.9%
```

曾測試但未保留的更激進版本：

- 嘗試在 BRAM capture state 直接計算 `row_sum_reg`。
- RTL simulation 可降到 `cycle_count = 29028`。
- 但 post-route timing 失敗，約 `WNS = -1.492 ns`。
- 因此最後保留目前這版 timing 較穩定的 pipeline 優化。

## 驗證結果

執行指令：

```text
vivado.bat -mode batch -source scripts/run_vivado_checks.tcl -journal tmp/tmp_opt_checks.jou -log tmp/tmp_opt_checks.log
```

RTL simulation：

```text
result_valid = 7fff
result_pass  = 7fff
cycle_count  = 30712
addr13       = 00000401
FINALPROJECT_RTL_PASS
```

Post-route timing：

```text
WNS = 0.087 ns
TNS = 0.000 ns
WHS = 0.100 ns
THS = 0.000 ns
Timing met
```

Route status：

```text
fully routed nets = 4083
routing errors    = 0
```

Implementation utilization：

```text
Slice LUTs       = 2197 / 20800  (10.56%)
Slice Registers  = 1915 / 41600  (4.60%)
Block RAM Tile   = 15 / 50       (30.00%)
DSPs             = 2 / 90        (2.22%)
```

Report 檔案：

```text
reports\timing_impl.rpt
reports\timing_synth.rpt
reports\utilization_impl.rpt
reports\utilization_synth.rpt
reports\route_status.rpt
```

## Script 與工作區整理

修改檔案：

```text
scripts\create_final_project.tcl
scripts\run_rtl_xsim.tcl
scripts\run_vivado_checks.tcl
scripts\update_final_project.tcl
.gitignore
```

整理內容：

- Tcl scripts 已改成自動偵測目前的 `DSD_final_project` 路徑，不再依賴舊的 `FinalProject` 路徑。
- Vivado `info script` 取得的 Windows 反斜線路徑會先正規化再判斷 repo 位置。
- `run_vivado_checks.tcl` 的暫存工作目錄從 `codex_temp\vivado_work` 改為 `tmp\vivado_work`。
- `.gitignore` 新增忽略 `tmp/`。

## 舊檔保存與刪除

刪除舊資料夾前，已將有保留價值的舊檔搬到：

```text
legacy_artifacts\FinalProject_deprecated
```

保留檔案：

```text
114_DSD_Final_Project_v1.pdf
FP_studID.bit
RISCV_CNN.xdc
run_rtl_sim.tcl
studID_FP_report.pdf
studID_FP_report.tex
studID_FP_report_outline.md
studID_name_FP.v
tb_riscv_cnn.v
vivado_build.tcl
```

已刪除舊資料夾：

```text
C:\Users\User\DSD_Lab\Final\FinalProject
C:\Users\User\DSD_Lab\Final\FinalProject廢棄
```

目前 `C:\Users\User\DSD_Lab\Final` 底下只保留：

```text
C:\Users\User\DSD_Lab\Final\DSD_final_project
```

## 重要專案檔案

Top 與核心 RTL：

```text
RISCV_CNN.v
src\student_fp_core.v
test_circuit_bram_ip.v
```

Testbench：

```text
tb\tb_finalproject.v
```

Constraints：

```text
constraints\RISCV_CNN.xdc
```

Vivado project 與 IP：

```text
final\final.xpr
final\final.srcs\sources_1\ip\Data_mem\Data_mem.xci
final\final.srcs\sources_1\ip\instr_mem\instr_mem.xci
final\final.srcs\sources_1\ip\init_rom\init_rom.xci
final\final.srcs\sources_1\ip\golden_rom\golden_rom.xci
```

Memory initialization：

```text
init_rom.coe
golden_rom.coe
instr_mem_cpucheck.coe
```

文件：

```text
114_DSD_Final_Project_v2.pdf
114_DSD_Final_Project_v3.pdf
README.md
CODEX_WORKLOG.md
```

