# DSD Final Project 工作紀錄

最後更新：2026-05-17 22:28 Asia/Taipei

主要工作區：

```text
C:\Users\User\DSD_Lab\Final\DSD_final_project
```

Vivado project：

```text
C:\Users\User\DSD_Lab\Final\DSD_final_project\final\final.xpr
```

## 目前狀態

- 目前正式版本：`v0.4.0`
- `v0.4.0` 將 CNN 最後一個 kernel row 的 accumulate、rounding、packing 合併，移除每個 output pixel 的 `C_FINISH_PIXEL` 額外週期，以降低 ranking 用 AT product。
- `v0.3.0` 加入 CNN BRAM read prefetch pipeline，以降低 ranking 用 AT product。
- RTL simulation 已通過全部 15 個 testcase。
- Synthesis、placement、routing、post-route timing 皆已完成並通過。
- 2026-05-17 已將 `Simple_CPU` 與 `CNN` 從 `src/student_fp_core.v` 整合進 `RISCV_CNN.v`；Vivado project 與 Tcl scripts 不再把 `student_fp_core.v` 加入 sources。
- 整合後 RTL simulation 通過，`cycle_count = 25660`；這是 source 結構維護，未建立新的正式效能版本，速度與面積表仍以 `v0.3.0` 為準。
- `scripts/run_vivado_checks.tcl` 目前刻意不產生 bitstream。
- Vivado journal/log 與暫存工作檔集中放在 `tmp/`。
- 舊的 `FinalProject` 資料夾已刪除；有保留價值的舊檔已搬到 `legacy_artifacts/FinalProject_deprecated/`。
- 助教提供的 `.coe` 檔案不可修改；目前 `init_rom.coe`、`golden_rom.coe`、`instr_mem_cpucheck.coe` 皆已確認與 `coe備份檔/` 內備份檔 SHA256 完全一致。

## 版本紀錄

- `v0.4.0` - 2026-05-17 22:28 Asia/Taipei
  - 在 CNN `C_ACCUM_ROW` 將最後一列累加後的 rounding/packing 提前完成。
  - 移除不再需要的 `C_FINISH_PIXEL` state，並將 rounding remainder 化簡為 `value[5:0]`。
  - RTL simulation 通過，`cycle_count = 23976`。
  - Implementation timing 通過，`WNS = 0.056 ns`。
  - 相比 `v0.1.2` baseline，PDF 官方 AT product 約改善 28.32%。
- `v0.3.0` - 2026-05-17 02:48 Asia/Taipei
  - 在 CNN datapath 加入 BRAM read prefetch pipeline。
  - RTL simulation 通過，`cycle_count = 25660`。
  - Implementation timing 通過，`WNS = 0.043 ns`。
  - 相比 `v0.1.2` baseline，PDF 官方 AT product 約改善 23.57%。
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
2. 每個新版本都必須在「速度與面積版本比較」表格新增一列，並在「解讀」區補上該版本的重點說明；速度變化、面積變化與 AT 變化一律相對 `v0.1.2` baseline 比較，不與前一版本比較。
3. 每個新版本都必須有獨立小節，至少包含修改檔案、修正內容、驗證結果、cycle_count、utilization、WNS，以及是否採用或捨棄該嘗試的理由。
4. 執行必要驗證，至少確認 RTL simulation；若有 RTL/時序相關修改，需跑完整 Vivado checks。
5. 建立 Git commit，commit message 需包含版本或明確功能摘要。
6. 需要形成正式節點時建立 Git tag，例如 `v0.2.1`、`v0.3.0`。
7. 修改完成後一律推送到 GitHub remote `origin`：即使不建立 tag，也必須至少建立並推送 commit；只有使用者明確要求暫停推送時才例外。

## 速度與面積版本比較

面積主要以 implementation report 的 Slice LUTs、Slice Registers、F7/F8 Muxes、Block RAM Tile、DSPs 紀錄。  
AT product 改用 PDF 官方完整公式，數值越低越好：

```text
Official Area = Slice LUTs + Slice Registers + F7 Muxes + F8 Muxes + 280 × DSPs
Processing Time = cycle_count × 10 ns
PDF AT product = Official Area × Processing Time
```

| 版本 | 時間 | cycle_count | Processing Time | 速度變化 vs baseline | Official Area | Area 變化 vs baseline | Slice LUTs | Registers | F7 Muxes | F8 Muxes | BRAM Tile | DSP | WNS | PDF AT product | AT 變化 vs baseline |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| `v0.1.2` | 2026-05-16 00:46 | 34080 | 340800 ns | baseline | 4912 | baseline | 2140 | 1915 | 287 | 10 | 15 | 2 | 0.049 ns | 1674009600 | baseline |
| `v0.2.0` | 2026-05-16 01:23 | 30712 | 307120 ns | cycles -3368 / -9.88% | 4944 | +32 / +0.65% | 2197 | 1915 | 262 | 10 | 15 | 2 | 0.087 ns | 1518401280 | -155608320 / -9.30% |
| `v0.2.1` | 2026-05-16 13:04 | 30712 | 307120 ns | cycles -3368 / -9.88% | 4942 | +30 / +0.61% | 2195 | 1915 | 262 | 10 | 15 | 2 | 0.130 ns | 1517787040 | -156222560 / -9.33% |
| `v0.3.0` | 2026-05-17 02:48 | 25660 | 256600 ns | cycles -8420 / -24.71% | 4986 | +74 / +1.51% | 2239 | 1915 | 262 | 10 | 15 | 2 | 0.043 ns | 1279407600 | -394602000 / -23.57% |
| `v0.4.0` | 2026-05-17 22:28 | 23976 | 239760 ns | cycles -10104 / -29.65% | 5005 | +93 / +1.89% | 2258 | 1915 | 262 | 10 | 15 | 2 | 0.056 ns | 1199998800 | -474010800 / -28.32% |

解讀：

- 所有速度、面積與 AT 變化皆固定相對 `v0.1.2` baseline，不使用前一版本作為比較基準。
- `v0.2.0` cycle 數下降約 9.88%，等效 throughput 約提升 10.97%；Official Area 比 baseline 增加 32，約增加 0.65%；PDF AT product 改善約 9.30%。
- `v0.2.1` 只修正 clock port 命名，cycle_count 維持 30712；Official Area 比 baseline 增加 30，約增加 0.61%；PDF AT product 改善約 9.33%。
- `v0.3.0` 在 CNN datapath 加入 BRAM read prefetch pipeline，cycle_count 比 baseline 少 8420 cycles，約下降 24.71%，等效 throughput 約提升 32.81%。
- `v0.3.0` Official Area 比 baseline 增加 74，約增加 1.51%；Registers、BRAM、DSP 維持不變，implementation timing 仍通過 10 ns clock。
- 以 PDF 官方完整公式計算，`v0.3.0` AT product 比 baseline 改善約 23.57%。
- `v0.4.0` 每個 output pixel 少一個 finish/pack cycle，因此最後 testcase 的 `cycle_count` 比 `v0.3.0` 再少 1684 cycles；相比 baseline 少 10104 cycles，約下降 29.65%。
- `v0.4.0` Official Area 比 baseline 增加 93，約增加 1.89%；Registers、BRAM、DSP 維持不變，implementation timing 仍通過 10 ns clock。
- 以 PDF 官方完整公式計算，`v0.4.0` AT product 比 baseline 改善約 28.32%。

## v0.4.0 CNN finish-cycle ranking 優化

修改檔案：

```text
RISCV_CNN.v
reports\timing_impl.rpt
reports\timing_synth.rpt
reports\utilization_impl.rpt
reports\utilization_synth.rpt
reports\route_status.rpt
CODEX_WORKLOG.md
```

修正內容：

- 在 `C_ACCUM_ROW` 且 `krow == 2` 時，直接使用 `acc_next` 做 round-to-nearest/ties-to-even 與 output packing。
- 原本每個 output pixel 都需要的 `C_FINISH_PIXEL` state 被移除；flush output word 時仍維持下一個 cycle 進入 `C_WRITE_OUT`，確保 BRAM write enable 與 address/data 穩定。
- `round_sat_q12_to_q6` 的 remainder 由 `value - (base <<< 6)` 化簡為 `value[5:0]`，保持二補數 arithmetic shift 下的同等語意。

驗證結果：

```text
vivado.bat -mode batch -source scripts\run_vivado_checks.tcl -journal tmp\tmp_round_rem_checks.jou -log tmp\tmp_round_rem_checks.log

result_valid = 7fff
result_pass  = 7fff
cycle_count  = 23976
addr13       = 00000401
FINALPROJECT_RTL_PASS

route_design completed successfully
Post Routing Timing Summary | WNS=0.056 | TNS=0.000 | WHS=0.036 | THS=0.000
```

Implementation utilization：

```text
Slice LUTs       = 2258 / 20800  (10.86%)
Slice Registers  = 1915 / 41600  (4.60%)
Block RAM Tile   = 15 / 50       (30.00%)
DSPs             = 2 / 90        (2.22%)
F7 Muxes         = 262
F8 Muxes         = 10
```

採用判定：

- 採用此版本作為目前正式 ranking 版本，因為 RTL 全測通過、implementation timing 通過，且 PDF AT product 從 `v0.3.0` 的 `1279407600` 降到 `1199998800`。
- 相比 `v0.3.0`，cycle 減少 1684，Official Area 增加 19；PDF AT product 仍改善約 6.21%。

## 2026-05-17 RTL source 整合

性質：

- 維護變更；不改 CNN/CPU 行為與 ranking 架構，未建立新的正式效能版本。
- 目的為讓 `RISCV_CNN.v` 成為單一主要 RTL source，下載 GitHub 專案後開 `final/final.xpr` 時不需要另外引入 `src/student_fp_core.v`。

修改檔案：

```text
RISCV_CNN.v
src\student_fp_core.v
final\final.xpr
scripts\create_final_project.tcl
scripts\run_rtl_xsim.tcl
scripts\run_vivado_checks.tcl
scripts\update_final_project.tcl
README.md
CODEX_WORKLOG.md
```

修正內容：

- 將 `src/student_fp_core.v` 內的 `Simple_CPU` 與 `CNN` module 直接整合到 `RISCV_CNN.v`。
- 刪除舊的 `src/student_fp_core.v`，避免同名 module 保留兩份後造成同步風險。
- 從 `final/final.xpr` 的 `sources_1` 移除 `src/student_fp_core.v`。
- 更新 `create_final_project.tcl`、`run_rtl_xsim.tcl`、`run_vivado_checks.tcl`，讓 build/sim/check flow 只編譯 `RISCV_CNN.v` 與 `test_circuit_bram_ip.v`。
- 更新 `update_final_project.tcl`，若舊 project 仍包含 `src/student_fp_core.v`，會自動從 sources 移除。
- 更新 README 的檔案表，標示 CPU/CNN core 已整合在 `RISCV_CNN.v`。

驗證結果：

```text
vivado.bat -mode batch -source scripts\run_rtl_xsim.tcl -journal tmp\tmp_integrated_rtl.jou -log tmp\tmp_integrated_rtl.log

Analyzing Verilog file ".../RISCV_CNN.v"
analyzing module RISCV_CNN
analyzing module Simple_CPU
analyzing module CNN

result_valid = 7fff
result_pass  = 7fff
cycle_count  = 25660
addr13       = 00000401
FINALPROJECT_RTL_PASS
```

速度與面積：

- RTL simulation cycle_count 與 `v0.3.0` 相同，仍為 `25660`。
- 此次只調整 source 組織與 Vivado source list，未重新建立新的 implementation/timing 正式版本。
- 速度與面積版本比較表不新增列；正式 comparison 仍以 `v0.3.0` 的 implementation reports 為準。

## v0.3.0 CNN pipeline ranking 優化

修改檔案：

```text
src\student_fp_core.v
reports\timing_impl.rpt
reports\timing_synth.rpt
reports\utilization_impl.rpt
reports\utilization_synth.rpt
reports\route_status.rpt
```

修正內容：

- `C_PIXEL_START` 先送出第一個 kernel row 的 BRAM read address，移除每個 output pixel 原本額外的 `C_ROW_ADDR` 等待週期。
- `C_MAC` 提早送出下一個 kernel row 的 BRAM read address，讓下一列 memory read 與目前列的 accumulate 重疊。
- `C_ACCUM_ROW` 保留累加 pipeline stage，非最後 kernel row 時直接進入 `C_ROW_CAP_A` 捕捉已提前讀出的資料。

驗證結果：

```text
RTL simulation: FINALPROJECT_RTL_PASS
cycle_count: 25660
result_valid: 7fff
result_pass:  7fff
Implementation route status: 0 routing errors
Implementation WNS: 0.043 ns
Implementation utilization: 2239 Slice LUTs, 1915 registers, 15 BRAM tiles, 2 DSPs
```

未採用嘗試：

- 曾嘗試移除 prefetch 後不再進入的 `C_ROW_ADDR` dead state 與相關 address wire，implementation LUT 可降到 2185，但 WNS 變成 -0.053 ns，未通過 10 ns timing，因此不作為正式版本採用。

採用判定：

- 採用此版本作為目前正式版本，因為 RTL 全測通過、implementation timing 通過，且 AT product 相對 `v0.1.2` baseline 明顯改善。

## v0.2.1 PDF clock / COE 修正

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

採用判定：

- 採用此版本作為 clock/spec 修正版，因為它不改變 `cycle_count`，但修正 top-level clock port 與 XDC/testbench 對齊 PDF 要求；implementation timing 通過。
- `scripts/run_vivado_checks.tcl` 曾在 sandbox 內遇到 Vivado `.Xil` 暫存目錄刪除錯誤，改用等效 implementation-only Tcl 重跑並通過，因此保留此版本。

## v0.2.0 CNN row pipeline 優化與工作區整理

修改檔案：

```text
src\student_fp_core.v
reports\timing_impl.rpt
reports\timing_synth.rpt
reports\utilization_impl.rpt
reports\utilization_synth.rpt
reports\route_status.rpt
scripts\create_final_project.tcl
scripts\run_rtl_xsim.tcl
scripts\run_vivado_checks.tcl
scripts\update_final_project.tcl
.gitignore
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

驗證結果：

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

採用判定：

- 採用此版本作為第一個 ranking 優化版本，因為 `cycle_count` 從 34080 降到 30712，implementation timing 仍通過。
- 曾測試更激進的 BRAM capture 直接計算版本，RTL 可降到 `cycle_count = 29028`，但 post-route timing 約 `WNS = -1.492 ns`，因此捨棄。

Report 檔案：

```text
reports\timing_impl.rpt
reports\timing_synth.rpt
reports\utilization_impl.rpt
reports\utilization_synth.rpt
reports\route_status.rpt
```

### Script 與工作區整理

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

### 舊檔保存與刪除

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

## v0.1.2 Baseline project / workspace sync

修改檔案：

```text
CODEX_WORKLOG.md
README.md
reports\timing_impl.rpt
reports\timing_synth.rpt
reports\utilization_impl.rpt
reports\utilization_synth.rpt
reports\route_status.rpt
```

修正內容：

- 記錄 GitHub clone / workspace 同步狀態。
- 將 baseline Vivado project、RTL、testbench、constraints、COE 與 reports 保存在 `DSD_final_project`。
- 以此版本作為後續 ranking 優化的比較 baseline。

驗證結果：

```text
RTL simulation: PASS
cycle_count: 34080
Implementation route status: 0 routing errors
Implementation WNS: 0.049 ns
Implementation utilization: 2140 Slice LUTs, 1915 registers, 15 BRAM tiles, 2 DSPs
```

採用判定：

- 採用此版本作為 baseline，因為 RTL simulation、synthesis、implementation 與 timing 皆通過。
- `v0.1.0` 和 `v0.1.1` 屬於 project 建立與 Git 匯入節點，未另行作 ranking 比較；後續面積與速度比較以 `v0.1.2` 為 baseline。

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

