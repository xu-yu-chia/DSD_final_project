# DSD Final Project 工作紀錄

最後更新：2026-05-26 Asia/Taipei

主要工作區：

```text
C:\Users\User\DSD_Lab\Final\DSD_final_project
```

Vivado project：

```text
C:\Users\User\DSD_Lab\Final\DSD_final_project\final\final.xpr
```

## 目前狀態

- 目前工作版本更新為 `v0.9.6-cnn-stream-mac3`：`RISCV_CNN.v` 的 CPU pipeline 不改，CNN coprocessor 改成 streaming mem_reader / unpacker / 2-line-buffer 3-row sliding window / parameterized MAC / quantizer / packer / mem_writer pipeline。
- `v0.9.6-cnn-stream-mac3` 已先備份舊 RTL：`RISCV_CNN.before_cnn_pipeline.v`。此備份來自改 CNN pipeline 前的 `RISCV_CNN.v`，保留作為回退基準。
- `v0.9.6-cnn-stream-mac3` 預設 `MAC_PARALLEL = 3`，使用 true 3-multiplier row-MAC，並加上 final row-sum register 讓 10 ns implementation timing 收斂；`MAC_PARALLEL=1/9` 程式路徑已保留，但尚未分別跑 RTL/full Vivado 簽核。
- `v0.9.6-cnn-stream-mac3` RTL simulation 已通過：`score_bcd = 0100`、`cycle_count = 14067`、`result_valid = 7fff`、`result_pass = 7fff`、`addr13 = 000004b1`、`FINALPROJECT_SIM_PASS`。
- `v0.9.6-cnn-stream-mac3` full Vivado checks 已通過：post-route `WNS = 0.007 ns`、`WHS = 0.048 ns`；Implementation utilization 為 2603 LUT、2072 registers、262 F7、10 F8、14 BRAM tile、1 DSP。
- `v0.9.6-cnn-stream-mac3` PDF 官方 Area = `5227`，Processing Time = `140670 ns`，AT product = `735681090`；相比 `v0.1.2` baseline AT 改善約 `56.05%`，相比 `v0.9.4/v0.9.5` AT 再改善約 `0.862%`。
- 本節點尚未產生 bitstream；`scripts/run_vivado_checks.tcl` 目前刻意不產生 bitstream，若要作正式提交仍需另跑 bitstream flow 與必要 timing simulation。
- `v0.9.5-pdf-verified` 是上一個 PDF compliance verification tag：此版不改 RTL datapath，新增 `PDF_COMPLIANCE_CHECK.md`，確認 `v0.9.4-rank1-pipeline` 的 top-level interface、BRAM IP 設定、TA 檔案與 prohibited behavior 皆符合目前 PDF/TA 0524 更新方向。
- `v0.9.5-pdf-verified` 沿用 `v0.9.4-rank1-pipeline` 的 RTL/implementation 結果與 bitstream：`final/bit_temp/at_rank1_adopted_pipeline_20260525_233131.bit`。
- `PDF_COMPLIANCE_CHECK.md` 確認：`test_circuit_bram_ip.v` 與 `tb/post_sim_tb.v` 和 `助教給的檔案/0524更新/` SHA256 相同；`Instruction_Memory` 為 Always Enabled 且 RTL 未接 `.ena(1'b1)`；`Data_mem` 使用 ENA/ENB pin；top-level `FPGA_clk/rstn/tc/mode/st/all_done/seven_seg/anode` 與 XDC pinout 對齊 PDF v5。
- `v0.9.3-at-fullcache` 已產生 bitstream 並通過 non-project implementation timing，但 AT product 明顯差於 `v0.9.4`，保留為實驗紀錄。
- `v0.9.2` 已整合 TA 2026-05-24 update 的 top-level `FPGA_clk` 與 `all_done` 介面，並同步新版 `test_circuit_bram_ip.v` / `post_sim_tb.v`。
- `v0.9.2` RTL simulation 已通過：`score_bcd = 0100`、`cycle_count = 25746`、`result_valid = 7fff`、`result_pass = 7fff`、`FINALPROJECT_SIM_PASS`。
- `v0.9.2` 尚未重新跑 full implementation / #5 post-implementation timing simulation；上一個 clean post-impl timing PASS 節點仍是 `v0.9.1`/`v0.9.0` datapath。
- `v0.9.1` 補上 Vivado GUI simulation compatibility：testbench 預設不再讀 post-synth/post-impl timing netlist 中可能被最佳化掉的 RTL internal signals；RTL batch flow 需要 cycle_count 時改由 `RTL_INTERNAL_CHECK` 明確啟用。
- `v0.9.0` 修正 post-implementation timing simulation：CPU instruction fetch 改為 register capture、CNN `web` 改為 registered pulse、finish event 改用 registered `done`，並停用 post-impl timing 下會造成 CNN mismatch 的 row-cache reuse path。
- `RISCV_CNN.v` 的 `Simple_CPU` 已移除先前硬寫在 RTL 裡的 `S_HOST_*` bias/start host states，CPU 現在只從 `Instruction_Memory` fetch/execute instruction；bias/start machine code 仍由 `.coe` load 進 `Instruction_Memory`。
- 根目錄 `instr_mem_cpucheck.coe` 目前是專案整合版：前 36 筆保留 TA CPU-check instruction，後面追加 15 筆 bias/start/halt instruction，共 51 筆。TA 原始 `instr_mem_cpucheck.coe` 保留在 `助教給的檔案/` 作為 baseline/reference。
- 已同步 `Instruction_Memory` 相關 COE/MIF 複本：`final/final.ip_user_files/mem_init_files/instr_mem_cpucheck.coe`、`final/final.gen/sources_1/ip/Instruction_Memory/Instruction_Memory.mif`、`final/final.ip_user_files/mem_init_files/Instruction_Memory.mif`。
- `v0.9.0` RTL simulation 已通過：`score_bcd = 0100`、`cycle_count = 25746`、`FINALPROJECT_SIM_PASS`。
- COE-based bias/start 版本 post-synthesis fast functional simulation 已通過：`post_synth_score_bcd = 0100`，`FINALPROJECT_POST_SYNTH_PASS`。
- `v0.9.0` full #5 post-implementation timing simulation 已通過：`post_impl_score_bcd = 0100`、`FINALPROJECT_POST_IMPL_PASS`。
- `v0.9.0` full Vivado implementation timing 已通過：route 0 errors，post-route `WNS = 0.731 ns`、`TNS = 0.000 ns`、`WHS = 0.033 ns`。
- `v0.7.0` 將根目錄使用中的助教檔案恢復為 `助教給的檔案/` 官方版本，並移除 CNN 中對 feature size `24/28/30` 的舊重映射，官方測資 RTL display-based regression 回到 100 分。
- `v0.6.0` 對齊 `Memory_setting.pdf` 的 BRAM IP 名稱與設定，將 instruction ROM component/module 改為 `Instruction_Memory`，並更新 full check route flow 讓 post-route timing 穩定通過。
- `v0.5.0` 在 CNN 內加入 3-row previous-pixel word cache，重用相鄰 output pixel 的 input word，減少 BRAM read wait cycles，以降低 ranking 用 AT product。
- `v0.4.0` 將 CNN 最後一個 kernel row 的 accumulate、rounding、packing 合併，移除每個 output pixel 的 `C_FINISH_PIXEL` 額外週期，以降低 ranking 用 AT product。
- `v0.3.0` 加入 CNN BRAM read prefetch pipeline，以降低 ranking 用 AT product。
- RTL simulation 已通過全部 15 個 testcase。
- Testbench 已改成只透過 top-level `seven_seg/anode` 驗證結果，可支援 behavioral 與 post-synthesis/post-implementation netlist 類 simulation。
- `v0.8.0` 本次正式驗證包含 RTL display-based regression 與 full Vivado synthesis/place/route/timing checks；post-synthesis fast functional simulation 另列為輔助驗證。
- Synthesis、placement、routing、post-route timing 皆已完成並通過。
- 2026-05-17 已將 `Simple_CPU` 與 `CNN` 從 `src/student_fp_core.v` 整合進 `RISCV_CNN.v`；Vivado project 與 Tcl scripts 不再把 `student_fp_core.v` 加入 sources。
- 整合後 RTL simulation 通過，`cycle_count = 25660`；這是 source 結構維護，未建立新的正式效能版本，速度與面積表仍以 `v0.3.0` 為準。
- `scripts/run_vivado_checks.tcl` 目前刻意不產生 bitstream。
- Vivado journal/log 與暫存工作檔集中放在 `tmp/`。
- 舊的 `FinalProject` 資料夾已刪除；有保留價值的舊檔已搬到 `legacy_artifacts/FinalProject_deprecated/`。
- 助教提供的測試檔不可修改；官方原始檔依釋出日期保留在 `助教給的檔案/0518更新/` 與 `助教給的檔案/0524更新/`。根目錄 `instr_mem_cpucheck.coe` 已依 TA 要求改成專案整合版，不再與 TA 原始檔完全相同。

## 版本紀錄

- `v0.9.6-cnn-stream-mac3` - 2026-05-26 Asia/Taipei
  - `RISCV_CNN.v`：先備份舊檔為 `RISCV_CNN.before_cnn_pipeline.v`，再重構 CNN coprocessor；top module 仍為 `RISCV_CNN`，CPU pipeline 不改。
  - CNN pipeline 改為 streaming 結構：config/bias/weights 先載入暫存器，input/intermediate feature map 以 mem_reader + unpacker 串流進 2-line-buffer 3-row sliding window，再送入 parameterized `CNN_MAC_Engine`、`CNN_Quantizer`、packer 與 mem_writer。
  - Memory layout：input base `16`，intermediate base `272`，final output base `600`；done word 寫 `Data_mem[13] = 0x000004b1`，代表 `addr13[10:1] = 600`、`addr13[0] = 1`。輸出寫入避開 `0..15` 與 `960..1023` reserved range。
  - `MAC_PARALLEL=3` 作為預設採用版：3 個乘法器每次處理 1 row，最後一列 row sum 額外 register 一級，避免 true 3-mul datapath 的 post-route critical path 失敗。`MAC_PARALLEL=1` 與 `MAC_PARALLEL=9` 程式路徑存在，但尚未獨立驗證。
  - RTL simulation 通過：`score_bcd = 0100`、`cycle_count = 14067`、`result_valid = 7fff`、`result_pass = 7fff`、`addr13 = 000004b1`、`FINALPROJECT_SIM_PASS`。
  - Full Vivado checks 通過：post-route `WNS = 0.007 ns`、`TNS = 0`、`WHS = 0.048 ns`、`THS = 0`。
  - Implementation utilization：2603 Slice LUTs、2072 Slice Registers、262 F7 Muxes、10 F8 Muxes、14 Block RAM Tiles、1 DSP。
  - PDF 官方 AT product：`735681090`，比 baseline 改善約 `56.05%`；相比 `v0.9.4/v0.9.5`，cycle 從 `14268` 降到 `14067`，AT product 從 `742078680` 降到 `735681090`，約再改善 `0.862%`。
  - 捨棄/暫存嘗試：較早的 product-upfront 版本達到 `cycle_count = 12383`、Area `5150`、AT `637724500` 且 timing pass，但不是乾淨的 true `MAC_PARALLEL=3` row-MAC 架構，因此沒有作為目前預設版；可留待後續作為 aggressive DSP/LUT variant 重新整理。
  - 尚未產生本節點 bitstream；目前先記錄為已 RTL/full Vivado pass 的 CNN streaming pipeline 工作節點。
- `v0.9.5-pdf-verified` - 2026-05-25 Asia/Taipei
  - 新增 `PDF_COMPLIANCE_CHECK.md`，逐項記錄 PDF v5 / `Memory_setting.pdf` / TA 0524 update 對應狀態。
  - 檢查項目包含 top-level port、XDC pinout、TA test circuit/post-sim TB hash、BRAM XCI 設定、Instruction_Memory RTL instantiation、Data_mem ENA/ENB 使用、COE/MIF 同步與禁止特判事項。
  - 此版不改 RTL datapath、不重產 bitstream，沿用 `v0.9.4-rank1-pipeline` 的 bitstream 與 metrics：`cycle_count = 14268`、Official Area `5201`、AT product `742078680`、post-route `WNS = 0.013 ns`。
  - 採用判定：採用為 PDF compliance verification tag。尚未宣稱 full #3/#5 timing simulation 重新通過。
- `v0.9.4-rank1-pipeline` - 2026-05-25 23:39 Asia/Taipei
  - `RISCV_CNN.v`：`Simple_CPU` 在 decode 階段提前送出下一個 `Instruction_Memory` address，讓 ALU/I-type/branch/default instruction 少掉一個 fetch-address bubble；load/store 也保留下一指令 prefetch，並在 write-back/store 後直接進入 capture/decode。
  - `RISCV_CNN.v`：CNN 將最後一個 kernel row 的 accumulate、rounding、packing、write decision 合併到 `C_ACCUM_ROW`，移除 `C_FINISH_PIXEL` state；同時將 CNN accumulator/product datapath 收斂為 19-bit，符合 8-bit feature/weight、3x3 MAC 與 bias Q6 range 的上界，降低 post-route critical path。
  - `instr_mem_cpucheck.coe` 與 `Instruction_Memory.mif` 複本：保留 TA 前 36 筆 CPU-check instruction；只縮短追加的 bias/start setup sequence，移除一條無條件 branch 與一條最後 halt 前的 redundant `lw x0,0(x0)`。這仍是 CPU 執行的一般 machine-code setup，不是 RTL host state 或 testcase 特判。
  - RTL simulation 通過：`score_bcd = 0100`、`cycle_count = 14268`、`result_valid = 7fff`、`result_pass = 7fff`、`FINALPROJECT_SIM_PASS`。
  - Bitstream：`final/bit_temp/at_rank1_adopted_pipeline_20260525_233131.bit`。
  - Non-project implementation route 0 errors；post-route timing met：setup slack `0.013 ns`、hold slack `0.072 ns`。
  - Implementation utilization：2305 Slice LUTs、2065 Slice Registers、261 F7 Muxes、10 F8 Muxes、14 Block RAM Tiles、2 DSPs。
  - PDF 官方 AT product：`742078680`，比 baseline 改善約 `55.67%`，比 `v0.8.0` 高 `1713780`，約差 `0.231%`。考量 `v0.8.0` 不是 clean #5 PASS 節點，此版採用為接近 v0.8 的 timing-aware pipeline 版本。
  - 捨棄嘗試：`S_FETCH_WAIT` 直接 capture 造成 RTL score 只到 `0030`；full prefetch 在 accumulator narrowing 前 post-route WNS 約 `-0.383 ns`；partial prefetch timing 可過但 AT product 變差；PC10/PC12 裁剪功能與 timing 可過但 area 變大，因此不採用。
- `v0.9.3-at-fullcache` - 2026-05-25 16:48 Asia/Taipei
  - `RISCV_CNN.v`：將 CNN row-cache reuse 改為 full sliding-window cache hit rule。當目前 input word 可由上一個 output pixel 的相鄰 lane cache 提供時，直接重用 cache；lane 2 仍走 read-B path，其餘 cache hit lane 不額外發 BRAM read。
  - 這是 general datapath reuse：判斷只使用 feature word/lane 與 kernel row 的相鄰關係，不讀取 testcase id、score、golden data 或輸出答案，不是特定 testcase 特判。
  - `scripts/write_bit_temp.tcl`：新增 non-project bitstream 產生流程，將每個正式實驗版輸出到 `final/bit_temp/`，並把 timing/utilization report 輸出到 `reports/bit_temp/`。
  - RTL simulation 通過：`score_bcd = 0100`、`cycle_count = 16022`、`result_valid = 7fff`、`result_pass = 7fff`、`FINALPROJECT_SIM_PASS`。
  - Bitstream：`final/bit_temp/at_fullcache_20260525_164220.bit`。
  - Non-project implementation route 0 errors；post-route timing met：setup slack `0.983 ns`、hold slack `0.038 ns`。
  - Implementation utilization：2355 Slice LUTs、2078 Slice Registers、261 F7 Muxes、2 F8 Muxes、14 Block RAM Tiles、2 DSPs。
  - 此版尚未重新跑 full #3/#5 timing simulation；目前定位是更激進 AT product 實驗版，不取代已知 clean #5 PASS 的 `v0.9.0`/`v0.9.1` 穩定 datapath。
- `v0.9.2` - 2026-05-24 22:38 Asia/Taipei
  - 整合 TA 2026-05-24 update：top-level port 從舊 `clk` 改為新版 template 使用的 `FPGA_clk`，並新增 output `all_done`。
  - `RISCV_CNN.v`：新增 `output all_done`，內部以 `wire clk = FPGA_clk` 保留既有 datapath clock 命名；`test_circuit` instance 接上 `.all_done(all_done)`。
  - `test_circuit_bram_ip.v`：同步為 `助教給的檔案/0524更新/test_circuit_bram_ip.v` 官方新版，未手改其內容。
  - `tb/post_sim_tb.v`：新增官方 0524 `post_sim_tb.v` 副本，供 GUI/report waveform 量測 `st` falling 到 `all_done` rising 的 processing time。
  - `tb/tb_finalproject.v`：更新 DUT instantiation 為 `.FPGA_clk(FPGA_clk)` 並接出 `all_done`，保留既有 batch display-based regression。
  - `constraints/RISCV_CNN.xdc`：clock constraint 改套用 `[get_ports FPGA_clk]`，新增 `all_done` package pin `K2` 與 `LVCMOS33`。
  - `scripts/create_final_project.tcl`、`scripts/update_final_project.tcl`：將官方 `tb/post_sim_tb.v` 加入 simulation fileset，但保留 `tb_finalproject` 為 batch regression top。
  - `README.md`、`RISCV_CNN_EXPLAINED.md`、`RISCV_CNN_ANNOTATED_CODE.md`：同步更新新版 port 與 `all_done` 說明。
  - RTL simulation 已通過：`score_bcd = 0100`、`cycle_count = 25746`、`result_valid = 7fff`、`result_pass = 7fff`、`addr13 = 00000401`、`FINALPROJECT_SIM_PASS`。
  - 官方 `tb/post_sim_tb.v` 已 compile/elaborate 通過：`Built simulation snapshot post_sim_tb_elab`。
  - 此版是 interface/test-circuit update；CNN/CPU datapath 不變。尚未重新跑 full implementation / #5 post-impl timing，因此 utilization、WNS 與 AT product 暫沿用 `v0.9.1` 參考值，正式報告前需重跑 implementation。
- `v0.9.1` - 2026-05-24 15:52 Asia/Taipei
  - 修正 Vivado GUI `Run Post-Synthesis Timing Simulation` elaborate failure：GUI 不會帶 batch script 的 `POST_SYNTH_DISPLAY_CHECK` macro，原 testbench 因此嘗試讀取 `dut.u_test_circuit.captured_addr13`，但該 internal reg 在 timing netlist 中可能被最佳化/改名。
  - `tb/tb_finalproject.v`：RTL-only internal snapshot 改為只在明確定義 `RTL_INTERNAL_CHECK` 時啟用；GUI behavioral/post-synth/post-impl 預設只透過 top-level `seven_seg/anode` 檢查分數。
  - `scripts/run_rtl_xsim.tcl`：batch RTL regression 明確加上 `-d RTL_INTERNAL_CHECK`，保留 `cycle_count` 與 internal pass bitmap 輸出。
  - GUI post-synthesis timing elaborate 已驗證通過：`final/final.sim/sim_1/synth/timing/xsim/elaborate.log` 顯示 `Built simulation snapshot tb_finalproject_time_synth`。
  - 此版本不修改 RTL datapath，不影響 synthesis/implementation utilization、WNS 或 AT product；速度與面積沿用 `v0.9.0`。
- `v0.9.0` - 2026-05-24 15:22 Asia/Taipei
  - 修正 #5 post-implementation timing simulation：full fast timing sim 達到 `post_impl_score_bcd = 0100` 與 `FINALPROJECT_POST_IMPL_PASS`。
  - `Simple_CPU` instruction fetch 增加 `S_FETCH_CAP`，將 `Instruction_Memory` 輸出先 capture 到 `instr_reg` 再 decode，避免 timing netlist 直接組合 decode。
  - `CNN.web` 改為 registered pulse，`cnn_finish_event` 改用 registered `cnn_done`，讓 Data_mem write enable/data/address 與 finish event 在 timing sim 下對齊。
  - 停用 CNN row-cache reuse fast path；focused post-impl 診斷顯示該 path 會在 timing netlist 造成中間 feature word mismatch，改回穩定 BRAM read path。這是 general datapath 修正，不改 testcase、不改 golden data、也不做特定 case 特判。
  - 維持 `MEMORY_SETTING.md` 要求：`Instruction_Memory` 為 Always Enabled，RTL 不接 `.ena(1'b1)`；`Data_mem` 維持 ENA/ENB pin。
  - RTL simulation 通過：`score_bcd = 0100`、`cycle_count = 25746`、`result_valid = 7fff`、`result_pass = 7fff`、`FINALPROJECT_SIM_PASS`。
  - Focused post-impl timing TC0/TC1/TC5/TC9 通過：皆為 `valid=1`、`pass=1`、`mismatches=0`。
  - Full #5 post-impl timing simulation 通過：`tmp/full5_post_impl_fast_fresh_bg.log` 顯示 `post_impl_score_bcd = 0100`、`FINALPROJECT_POST_IMPL_PASS`，wrapper exit code `0`。
  - Implementation utilization：2154 Slice LUTs、1862 Slice Registers、261 F7 Muxes、2 F8 Muxes、14 Block RAM Tiles、2 DSPs。
  - Implementation timing：`WNS = 0.731 ns`、`TNS = 0.000 ns`、`WHS = 0.033 ns`、`THS = 0.000 ns`。
  - PDF 官方 AT product：`1245848940`，相比 `v0.1.2` baseline 改善約 25.58%；因停用 row-cache reuse，效能低於 `v0.8.0`，但此版是目前 clean post-impl timing PASS 的正式版本。
- `v0.8.0` - 2026-05-22 10:17 Asia/Taipei
  - 依 TA 回覆，將 bias generation/start CNN 改為 instruction memory program，不再用 RTL host state 硬寫結果。
  - `RISCV_CNN.v`：移除 `Simple_CPU` 中的 `S_HOST_*` bias/start states 與 `host_word16/host_word17/host_bias1` 等硬寫資料路徑；CPU store 後會 park Data_mem port A，再回 fetch。
  - `instr_mem_cpucheck.coe`：保留原 36 筆 CPU-check instruction，追加 17 筆 machine code，用 `lw/add/sub/blt/beq/sw/addi` 完成 `Data_mem[14]`、`Data_mem[15]`、`Data_mem[11]`、`Data_mem[6]` 的 bias/start setup，最後進入 halt loop。
  - 已同步 `Instruction_Memory` 的 COE/MIF 副本，確認 COE/MIF instruction count 皆為 53。
  - `tb/tb_finalproject.v` 補回 RTL-only internal snapshot，讓 display-based regression 仍可印出 `cycle_count`，但 post-synth/post-impl netlist flow 不會引用被最佳化的內部階層。
  - RTL simulation 通過：`tmp/v080_rtl_cycle.log` 顯示 `score_bcd = 0100`、`cycle_count = 14290`、15 個 testcase status display 皆為 pass，`FINALPROJECT_SIM_PASS`。
  - Post-synthesis fast functional simulation 通過：`tmp/codex_post_synth_cpu_bias_from_coe.log` 顯示 `post_synth_score_bcd = 0100` 與 `FINALPROJECT_POST_SYNTH_PASS`。
  - Full Vivado checks 通過：`tmp/codex_full_checks_rerun_escalated.log` 顯示 route 0 errors，post-route `WNS = 0.045 ns`、`TNS = 0.000 ns`、`WHS = 0.039 ns`。
  - Implementation utilization：2347 Slice LUTs、2011 Slice Registers、261 F7 Muxes、2 F8 Muxes、14 Block RAM Tiles、2 DSPs。
  - PDF 官方 AT product：`740364900`，相比 `v0.1.2` baseline 改善約 55.77%。
  - 先前 post-implementation fast SDF timing simulation 會被 `Instruction_Memory` RAMB36E1 `ENARDEN` setup/hold warning 淹沒；此 diagnostic flow 未作為正式發版條件，正式時序以重新 implementation 後的 static timing report 為準。
- `v0.7.0` - 2026-05-19 13:56 Asia/Taipei
  - 將根目錄 `test_circuit_bram_ip.v`、`golden_rom.coe`、`init_rom.coe`、`instr_mem_cpucheck.coe` 與 Vivado/IP/sim 相關 `.coe` 副本同步回 `助教給的檔案/` 官方版本。
  - 移除 `CNN.effective_fmap_size` 對 `24/28/30` 的舊重映射，改為直接使用官方 test circuit 寫入的 feature size。
  - 補強 `tb/tb_finalproject.v`：若總分不是 100，仍繼續列出 `tc=0..14` 的 status display，再統一輸出 fail_count，方便定位錯誤 testcase。
  - RTL display-based regression 通過：`score_bcd = 0100`，15 個 testcase status display 皆為 pass，`FINALPROJECT_SIM_PASS`。
  - Full Vivado checks 通過：route 0 errors，post-route `WNS = 0.129 ns`、`TNS = 0.000 ns`、`WHS = 0.103 ns`。
  - Implementation utilization：2480 Slice LUTs、2137 Slice Registers、261 F7 Muxes、10 F8 Muxes、14 Block RAM Tiles、2 DSPs。
  - PDF 官方 AT product：`776448960`，相比 `v0.1.2` baseline 改善約 53.62%。
- `v0.6.0` - 2026-05-18 22:26 Asia/Taipei
  - 以 `Memory_setting.pdf` 為準整理 BRAM 設定，新增 `MEMORY_SETTING.md`。
  - 將 instruction ROM 的 Vivado IP/component/module 名稱由舊 `instr_mem` 改為 PDF 指定的 `Instruction_Memory`。
  - `Instruction_Memory` 設為 Single Port ROM、32-bit width、depth 1024、Write First、Always Enabled；RTL instantiation 已移除 `ena` port。
  - `Data_mem` 維持 True Dual Port RAM、Read First、Use ENA/ENB Pin，Byte Size 改為 9。
  - `init_rom` 與 `golden_rom` 改為 Write First；`golden_rom` depth 改為 2156。
  - `scripts/run_vivado_checks.tcl` 的 route flow 改為 `NoTimingRelaxation` 後再 post-route phys_opt/route，讓此版本 full check timing pass。
  - RTL display-based regression 通過：`score_bcd = 0100`，15 個 testcase status display 皆為 pass，`FINALPROJECT_SIM_PASS`。
  - Full Vivado checks 通過：route 0 errors，post-route `WNS = 0.010 ns`、`TNS = 0.000 ns`、`WHS = 0.108 ns`。
  - Post-synthesis functional simulation 在建立此版本前被使用者中止，因此不列為 `v0.6.0` 通過條件。
- 2026-05-18 display-based testbench 補強
  - 不建立新效能版本；未修改 `RISCV_CNN.v` datapath/CPU/CNN 行為。
  - 將 `tb/tb_finalproject.v` 改為單一路徑 display-based checker，只由 top-level `seven_seg/anode` 讀回 score/status，不再讀 `dut.u_test_circuit.*` 內部 RTL reg，避免 post-synth/post-impl netlist 中階層名稱被最佳化後無法 elaboration。
  - 此 TB 不使用 compile-time macro；Vivado GUI 五種 simulation mode 皆可編譯同一份 testbench。
  - RTL regression：
    `vivado.bat -mode batch -source scripts\run_rtl_xsim.tcl -journal tmp\tmp_unified_tb_rtl.jou -log tmp\tmp_unified_tb_rtl.log`
    結果：`score_bcd = 0100`，15 個 testcase status display 皆為 pass，`FINALPROJECT_SIM_PASS`。
  - 新增 `scripts\run_post_synth_xsim.tcl` 作為 post-synthesis functional simulation helper；`v0.6.0` 推版前該 simulation 被中止，未作為本版驗證結果。
- `v0.5.0` - 2026-05-17 23:06 Asia/Taipei
  - 在 CNN datapath 加入 3-row previous-pixel word cache，讓相鄰 output pixel 可重用上一個 pixel 已讀出的 input word。
  - RTL simulation 通過，`cycle_count = 14252`。
  - Implementation timing 通過，`WNS = 0.017 ns`。
  - 相比 `v0.1.2` baseline，PDF 官方 AT product 約改善 53.82%。
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
8. 長時間 Vivado / post-synth / post-impl / xsim job 一律預設使用者可能會斷網：啟動後放背景執行，只回報 PID 與 log path，不持續輪詢、不反覆讀 log；等使用者回來要求狀態時再檢查。
9. 每個新 RTL 版本或正式實驗版本都要產生一份 bitstream，輸出到 `final/bit_temp/`，檔名需包含版本或實驗名稱與時間戳；bitstream 產生也視為長時間 Vivado job，背景執行並回報 PID/log path。

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
| `v0.5.0` | 2026-05-17 23:06 | 14252 | 142520 ns | cycles -19828 / -58.18% | 5424 | +512 / +10.42% | 2458 | 2134 | 262 | 10 | 15 | 2 | 0.017 ns | 773028480 | -900981120 / -53.82% |
| `v0.6.0` | 2026-05-18 22:26 | 14252 | 142520 ns | cycles -19828 / -58.18% | 5458 | +546 / +11.12% | 2489 | 2137 | 262 | 10 | 14 | 2 | 0.010 ns | 777874160 | -896135440 / -53.53% |
| `v0.7.0` | 2026-05-19 13:56 | 14252 | 142520 ns | cycles -19828 / -58.18% | 5448 | +536 / +10.91% | 2480 | 2137 | 261 | 10 | 14 | 2 | 0.129 ns | 776448960 | -897560640 / -53.62% |
| `v0.8.0` | 2026-05-22 10:17 | 14290 | 142900 ns | cycles -19790 / -58.07% | 5181 | +269 / +5.48% | 2347 | 2011 | 261 | 2 | 14 | 2 | 0.045 ns | 740364900 | -933644700 / -55.77% |
| `v0.9.0` | 2026-05-24 15:22 | 25746 | 257460 ns | cycles -8334 / -24.45% | 4839 | -73 / -1.49% | 2154 | 1862 | 261 | 2 | 14 | 2 | 0.731 ns | 1245848940 | -428160660 / -25.58% |
| `v0.9.1` | 2026-05-24 15:52 | 25746 | 257460 ns | cycles -8334 / -24.45% | 4839 | -73 / -1.49% | 2154 | 1862 | 261 | 2 | 14 | 2 | 0.731 ns | 1245848940 | -428160660 / -25.58% |
| `v0.9.2` | 2026-05-24 22:38 | 25746 | 257460 ns | cycles -8334 / -24.45% | not rerun | not rerun | not rerun | not rerun | not rerun | not rerun | not rerun | not rerun | not rerun | not rerun | RTL only after TA interface update |
| `v0.9.3-at-fullcache` | 2026-05-25 16:48 | 16022 | 160220 ns | cycles -18058 / -52.99% | 5256 | +344 / +7.00% | 2355 | 2078 | 261 | 2 | 14 | 2 | 0.983 ns | 842116320 | -831893280 / -49.69% |
| `v0.9.4-rank1-pipeline` | 2026-05-25 23:39 | 14268 | 142680 ns | cycles -19812 / -58.13% | 5201 | +289 / +5.88% | 2305 | 2065 | 261 | 10 | 14 | 2 | 0.013 ns | 742078680 | -931930920 / -55.67% |
| `v0.9.5-pdf-verified` | 2026-05-25 | 14268 | 142680 ns | cycles -19812 / -58.13% | 5201 | +289 / +5.88% | 2305 | 2065 | 261 | 10 | 14 | 2 | 0.013 ns | 742078680 | PDF compliance docs only; same bit as v0.9.4 |
| `v0.9.6-cnn-stream-mac3` | 2026-05-26 | 14067 | 140670 ns | cycles -20013 / -58.72% | 5227 | +315 / +6.41% | 2603 | 2072 | 262 | 10 | 14 | 1 | 0.007 ns | 735681090 | -938328510 / -56.05% |

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
- `v0.5.0` 以 row-word cache 重用相鄰 output pixel 的 input word，最後 testcase 的 `cycle_count` 比 baseline 少 19828 cycles，約下降 58.18%。
- `v0.5.0` Official Area 比 baseline 增加 512，約增加 10.42%；主要代價是 cache registers 與控制邏輯，BRAM、DSP 維持不變，implementation timing 仍通過 10 ns clock。
- 以 PDF 官方完整公式計算，`v0.5.0` AT product 比 baseline 改善約 53.82%；相比 `v0.4.0`，PDF AT product 從 `1199998800` 降到 `773028480`，再改善約 35.58%。
- `v0.6.0` 不改 CNN datapath，cycle_count 沿用 `v0.5.0`；此版本主要是 BRAM IP 設定與名稱對齊 PDF。
- `v0.6.0` Official Area 比 baseline 增加 546，約增加 11.12%；相比 `v0.5.0` 增加 34，但 Block RAM Tile 從 15 降到 14。
- 以 PDF 官方完整公式計算，`v0.6.0` AT product 比 baseline 改善約 53.53%；相比 `v0.5.0` 因 Official Area 稍增，AT product 小幅變差約 0.63%。
- `v0.7.0` 移除只為舊測資存在的 feature size 重映射，官方助教檔案下 `tc=6,7,8` 回到 pass；最後 testcase `cycle_count` 維持 `14252`。
- `v0.7.0` Official Area 比 baseline 增加 536，約增加 10.91%；相比 `v0.6.0` 少 10，主要是 LUT/F7 Mux 小幅下降。
- 以 PDF 官方完整公式計算，`v0.7.0` AT product 比 baseline 改善約 53.62%；相比 `v0.6.0` 小幅改善約 0.18%。
- `v0.8.0` 將 bias/start setup 改由 `Instruction_Memory` 中的 machine code 執行，移除 RTL host state；AT product 比 baseline 改善約 55.77%，但當時 post-impl timing diagnostic flow 仍未 clean pass。
- `v0.9.0` 修正 #5 post-impl timing simulation，full timing sim 達到 `post_impl_score_bcd = 0100`；因停用 row-cache reuse，cycle_count 回升到 25746，但 Official Area 低於 baseline 73。
- 以 PDF 官方完整公式計算，`v0.9.0` AT product 為 `1245848940`，比 baseline 改善約 25.58%；這版優先作為 clean post-impl timing PASS 的正式提交版本。
- `v0.9.1` 只修正 Vivado GUI simulation elaborate compatibility，不修改 RTL datapath；AT product、area 與 timing 數字沿用 `v0.9.0`。
- `v0.9.2` 只整合 TA 2026-05-24 top-level `FPGA_clk/all_done` 介面與新版 test circuit；RTL regression 已通過，但 implementation utilization、WNS 與正式 AT product 需重新跑 full Vivado flow 後更新。
- `v0.9.3-at-fullcache` 重新啟用更激進的 full sliding-window row-cache reuse，cycle_count 降到 16022；Official Area 比 baseline 增加 344，但 PDF AT product 仍比 baseline 改善約 49.69%。此版已產生 bitstream 並通過 non-project implementation timing，但尚未重跑 full #3/#5 timing simulation。
- `v0.9.4-rank1-pipeline` 進一步把 CPU fetch、load/store overlap、CNN final-row finish 與 accumulator narrowing 合併，cycle_count 降到 14268；PDF AT product 比 baseline 改善約 55.67%，只比 `v0.8.0` 高約 0.231%。因 `v0.8.0` 並非 clean #5 PASS 節點，此版定位為接近 v0.8 的 timing-aware 採用版。
- `v0.9.5-pdf-verified` 不改 RTL/bitstream，只新增 PDF compliance 檢查紀錄；效能、面積與 timing 數字沿用 `v0.9.4-rank1-pipeline`。
- `v0.9.6-cnn-stream-mac3` 將 CNN 改成 streaming line-buffer pipeline 與 true parameterized MAC；預設 3-mul 加 final row-sum register，full Vivado timing 通過，cycle_count 比 `v0.9.4/v0.9.5` 少 201 cycles，PDF AT product 約再改善 0.862%。此版尚未產生 bitstream，且 `MAC_PARALLEL=1/9` 尚未獨立簽核。

## 版本改動詳細部分

### v0.9.6 CNN streaming line-buffer MAC3 節點

修改檔案：

```text
RISCV_CNN.v
RISCV_CNN.before_cnn_pipeline.v
reports\utilization_impl.rpt
reports\timing_impl.rpt
reports\timing_synth.rpt
reports\route_status.rpt
reports\utilization_synth.rpt
CODEX_WORKLOG.md
```

修正內容：

- 保留 top module `RISCV_CNN` 與既有 `Data_mem` / `Instruction_Memory`；沒有新增 BRAM。`Simple_CPU` pipeline 不改，只讓既有 CPU flow 負責 start polling、clear start、bias/config/start CNN。
- CNN coprocessor 改成 streaming pipeline：`mem_reader -> CNN_Unpacker -> CNN_LineBuffer -> CNN_MAC_Engine -> CNN_Quantizer -> packer -> mem_writer`。
- `CNN_LineBuffer` 使用兩組 `(* ram_style = "distributed" *)` 8-bit line buffers 加 row shift registers 形成 3x3 window；此為 LUT/distributed storage，不新增 BRAM tile。
- `CNN_MAC_Engine` 支援 `MAC_PARALLEL=1/3/9`。目前採用 `MAC_PARALLEL=3`，每次處理 3 個 product row，並加 `M3_FINISH` register 切斷最後 row sum 到 accumulator 的 timing path。
- `CNN_Quantizer` 保留 full precision Q?.12 accumulation 後轉 Q1.6 的 round-to-nearest ties-to-even，再 clamp 到 signed 8-bit `[-128, 127]`。
- Packer 依 big-endian lane 寫回 32-bit word；每 4 個 output 或 layer end flush 一次。Final output base 固定 `600`，intermediate base 固定 `272`，皆避開 `0..15` 與 `960..1023`。

CNN FSM 狀態：

```text
C_IDLE          : 等待 CPU/CNN start。
C_LOAD_CFG_*    : 讀 Data_mem[12] feature size。
C_LOAD_B0_*     : 讀 Data_mem[14] bias0。
C_LOAD_B1_*     : 讀 Data_mem[15] bias1。
C_LOAD_W_*      : 讀 weights0/weights1 word，載入暫存器，避免 convolution loop 重複讀 weight。
C_LAYER_SETUP   : 設定 layer input/output size、base address、stream/output counters，清 pack word。
C_STREAM_NEXT   : mem_reader 排下一個 packed word address；lane 0 發 BRAM read，其餘 lane 重用 stream_word。
C_READ_WAIT     : 同步 memory read latency wait。
C_READ_CAP      : capture doutb 到 stream_word。
C_UNPACK        : big-endian unpack 目前 lane。
C_WINDOW        : line buffer accept pixel；若 3x3 window valid，帶著 out_index/last flag 啟動 MAC。
C_MAC_WAIT      : 等 MAC valid；valid、active_out_index、active_last 一起維持到 quantize/pack/write decision。
C_WRITE_OUT     : mem_writer flush packed 32-bit word。
C_LAYER_NEXT    : layer0 完成後切到 intermediate；layer1 完成後寫 addr13 done/output base。
C_WRITE_DONE    : done pulse register。
C_FINISHED      : 保持 done。
```

MAC cycle estimate：

```text
令單層 input side = S，output side = P = S - 2。
目前 streaming FSM 粗估：
layer_cycles(S) ~= 3*S*S + 2*ceil(S*S/4) + Lmac*P*P + ceil(P*P/4)

Lmac roughly:
MAC_PARALLEL=1 : 9  (1 multiplier, 9 term serial MAC; not yet separately verified)
MAC_PARALLEL=3 : 4  (3 row-MAC cycles plus registered finish/consumer latency; current verified default)
MAC_PARALLEL=9 : 2  (9 multipliers plus 2-stage adder tree; not yet separately verified)

N=32 rough CNN-only estimate:
MAC_PARALLEL=1 : about 22.3k cycles
MAC_PARALLEL=3 : about 14.1k cycles, measured full RTL cycle_count = 14067 with CPU/test flow
MAC_PARALLEL=9 : about 10.6k cycles, expected higher LUT/DSP/timing cost
```

驗證結果：

```text
RTL simulation command:
vivado.bat -mode batch -source scripts\run_rtl_xsim.tcl -journal tmp\cnn_pipeline_mac3_piped_rtl.jou -log tmp\cnn_pipeline_mac3_piped_rtl.log

RTL simulation result:
score_bcd    = 0100
result_valid = 7fff
result_pass  = 7fff
cycle_count  = 14067
addr13       = 000004b1
FINALPROJECT_SIM_PASS

Full Vivado checks command:
vivado.bat -mode batch -source scripts\run_vivado_checks.tcl -journal tmp\cnn_pipeline_mac3_piped_full_checks.jou -log tmp\cnn_pipeline_mac3_piped_full_checks.log

Implementation:
Slice LUTs      = 2603
Slice Registers = 2072
F7 Muxes        = 262
F8 Muxes        = 10
Block RAM Tile  = 14
DSPs            = 1
WNS             = 0.007 ns
WHS             = 0.048 ns
```

採用判定：

- 採用為目前 CNN coprocessor pipeline 優化工作節點。此版比 `v0.9.4/v0.9.5` 面積增加 26 official area，但少 201 cycles，PDF AT product 從 `742078680` 降到 `735681090`。
- 尚未作為最終交付節點：需要補產 bitstream，並視需求分別驗證 `MAC_PARALLEL=1` 與 `MAC_PARALLEL=9` 的 correctness/timing/AT。

### v0.9.4 rank1 pipeline timing-aware 採用版

修改檔案：

```text
RISCV_CNN.v
instr_mem_cpucheck.coe
final\final.ip_user_files\mem_init_files\instr_mem_cpucheck.coe
final\final.gen\sources_1\ip\Instruction_Memory\Instruction_Memory.mif
final\final.ip_user_files\mem_init_files\Instruction_Memory.mif
scripts\write_bit_temp.tcl
README.md
CODEX_WORKLOG.md
```

修正內容：

- CPU fetch pipeline：decode 時就送出下一個 instruction address，讓非 load/store instruction 少掉 `S_FETCH_ADDR` bubble；load/store 則把 Data_mem wait/write-back 與下一條 instruction memory read 重疊。
- CNN finish pipeline：最後一個 kernel row 累加完成後同 cycle 進行 rounding、packing 與 write decision，移除 `C_FINISH_PIXEL`。
- CNN accumulator narrowing：依 8-bit feature/weight、3x3 MAC 與 bias Q6 範圍，將 accumulator/product datapath 從 32-bit 收斂到 19-bit，降低 timing pressure。
- Instruction image：追加的 bias/start setup machine code 移除 redundant branch/no-op，但仍由 CPU 一般指令完成 bias/start，不改 TA test circuit、不讀 golden、不特判 testcase。
- `scripts/write_bit_temp.tcl`：每次 bitstream 使用獨立 timestamp work directory，避免 Vivado 重用 `.Xil` 暫存目錄造成刪除/鎖定錯誤。

驗證結果：

```text
RTL simulation:
score_bcd    = 0100
result_valid = 7fff
result_pass  = 7fff
cycle_count  = 14268
FINALPROJECT_SIM_PASS

Non-project implementation:
bitstream = final/bit_temp/at_rank1_adopted_pipeline_20260525_233131.bit
route errors = 0
WNS = 0.013 ns
WHS = 0.072 ns
```

採用判定：

- 採用。`v0.8.0` 的 AT product 略低，但不是 clean #5 PASS 節點；此版 AT product 僅比 `v0.8.0` 高約 `0.231%`，且保留 `v0.9.x` 的 timing-simulation 修正方向與通過 implementation timing。
- 未宣稱 full #3/#5 timing simulation 已重新通過；正式交付前仍需依 GUI 或 batch flow 補跑。

### v0.9.1 Vivado GUI simulation compatibility 修正版

修改檔案：

```text
tb\tb_finalproject.v
scripts\run_rtl_xsim.tcl
CODEX_WORKLOG.md
```

修正內容：

- 原 testbench 預設啟用 RTL-only internal check；Vivado GUI post-synth/post-impl timing simulation 不會自動帶 `POST_SYNTH_DISPLAY_CHECK` / `POST_IMPL_DISPLAY_CHECK` macro，因此會在 timing netlist elaborate 時讀到不存在的 `dut.u_test_circuit.captured_addr13`。
- 改成只有明確定義 `RTL_INTERNAL_CHECK` 時才啟用 internal snapshot；GUI simulation 預設走 top-level display checker。
- Batch RTL regression script 加上 `-d RTL_INTERNAL_CHECK`，保留 RTL regression 的 `cycle_count` 輸出。

驗證結果：

```text
GUI-generated post-synthesis timing elaborate:
Built simulation snapshot tb_finalproject_time_synth
```

採用判定：

- 採用此版本作為目前正式版本，因為它保留 `v0.9.0` 的 clean post-impl timing 修正，同時讓 Vivado GUI post-synthesis timing simulation 可 elaborate。

### v0.9.0 post-impl timing clean PASS 修正版

修改檔案：

```text
RISCV_CNN.v
CODEX_WORKLOG.md
```

修正內容：

- `Simple_CPU` 增加 `S_FETCH_CAP`，將 `Instruction_Memory` 輸出先 register 到 `instr_reg` 再 decode。
- `CNN.web` 由組合 assign 改為 registered pulse；`cnn_finish_event` 改用 `cnn_done`。
- 停用 CNN row-cache reuse path，讓 timing netlist 回到穩定 BRAM read path；focused post-impl 診斷確認舊 cache path 會造成 CNN 中間 feature word mismatch。
- 保持 `Instruction_Memory` Always Enabled，不在 RTL 加 `.ena(1'b1)`；未修改 `test_circuit_bram_ip.v`、testcase 或 golden data。

驗證結果：

```text
RTL simulation: PASS
score_bcd: 0100
cycle_count: 25746
result_valid: 7fff
result_pass: 7fff

Focused post-impl timing:
TC0/TC1/TC5/TC9 all valid=1, pass=1, mismatches=0

Full #5 post-impl timing:
post_impl_score_bcd = 0100
FINALPROJECT_POST_IMPL_PASS
```

Implementation 結果：

```text
Slice LUTs:      2154
Registers:       1862
F7 Muxes:         261
F8 Muxes:           2
Block RAM Tile:    14
DSPs:               2
WNS:         0.731 ns
TNS:         0.000 ns
WHS:         0.033 ns
THS:         0.000 ns
```

PDF 官方 AT product：

```text
cycle_count       = 25746
Processing Time   = 257460 ns
Official Area     = 2154 + 1862 + 261 + 2 + 280*2 = 4839
PDF AT product    = 4839 * 257460 = 1245848940
vs baseline       = -428160660 / -25.58%
```

採用判定：

- 採用此版本作為目前正式版本，因為 RTL、focused post-impl timing 與完整 #5 post-impl timing 都 clean PASS。
- 此版 AT product 比 `v0.8.0` 變差，原因是停用 row-cache reuse；但 `v0.8.0` 的 post-impl timing diagnostic flow 不 clean，因此 `v0.9.0` 是目前可交付的 timing-correct 版本。

### work-2026-05-22 COE bias-generation integration

狀態：

- 已收斂為 `v0.8.0` / `v0.9.0` 正式版本紀錄。
- RTL 與 post-synthesis fast functional simulation 已通過；完整 #5 post-implementation timing simulation 在 `v0.9.0` 達到 clean PASS。
- 本小節保留為 COE bias-generation integration 的過程紀錄；正式 AT/面積以 `v0.9.0` 表格列為準。

修改檔案：

```text
RISCV_CNN.v
tb\tb_finalproject.v
instr_mem_cpucheck.coe
final\final.ip_user_files\mem_init_files\instr_mem_cpucheck.coe
final\final.gen\sources_1\ip\Instruction_Memory\Instruction_Memory.mif
final\final.ip_user_files\mem_init_files\Instruction_Memory.mif
final\final.runs\Instruction_Memory_synth_1\Instruction_Memory.mif
scripts\run_post_synth_fast_xsim.tcl
scripts\run_post_impl_fast_xsim.tcl
tmp\run_post_impl_diag_quick_after_fix.tcl
tmp\run_post_impl_mismatch_quick_after_fix.tcl
```

修正內容：

- 依 TA 回覆，bias generation 需要由 instruction sequence 自行轉成 machine code，再寫入 `.coe` load 到 `Instruction_Memory`。
- `Simple_CPU` 移除先前的 `S_HOST_*` hard-coded bias/start states；CPU 現在固定由 `Instruction_Memory` fetch instruction。
- `instr_mem_cpucheck.coe` 由 TA 原本 36 筆 CPU-check instruction 追加為 53 筆，後 17 筆負責 bias generation 與 start CNN。
- 同步產生/更新 `Instruction_Memory` 使用的 COE/MIF 副本，避免 behavioral、post-synth、post-impl 使用不同 instruction image。
- `tb/tb_finalproject.v` 與 fast sim scripts 加入較快 timeout/進度輸出，方便定位 post-synth/post-impl 是否卡住。

追加的 bias/start instruction：

```text
04002803  lw   x16, 64(x0)     ; Data_mem[16]
04402883  lw   x17, 68(x0)     ; Data_mem[17]
04802903  lw   x18, 72(x0)     ; Data_mem[18]
011809B3  add  x19, x16, x17
012989B3  add  x19, x19, x18
03302C23  sw   x19, 56(x0)     ; Data_mem[14]
0108C663  blt  x17, x16, +12
FF100A13  addi x20, x0, -15
00000663  beq  x0, x0, +12
41180A33  sub  x20, x16, x17
001A0A13  addi x20, x20, 1
03402E23  sw   x20, 60(x0)     ; Data_mem[15]
02002623  sw   x0, 44(x0)      ; Data_mem[11] = 0
00100A93  addi x21, x0, 1
01502C23  sw   x21, 24(x0)     ; Data_mem[6] = 1
00002003  lw   x0, 0(x0)       ; park Data_mem port A
00000063  beq  x0, x0, 0       ; halt loop
```

驗證結果：

```text
vivado.bat -mode batch -source scripts\run_rtl_xsim.tcl -journal tmp\codex_rtl_cpu_bias_from_coe.jou -log tmp\codex_rtl_cpu_bias_from_coe.log

score_bcd = 0100
FINALPROJECT_SIM_PASS
```

```text
vivado.bat -mode batch -source scripts\run_post_synth_fast_xsim.tcl -journal tmp\codex_post_synth_cpu_bias_from_coe.jou -log tmp\codex_post_synth_cpu_bias_from_coe.log

post_synth_score_bcd = 0100
FINALPROJECT_POST_SYNTH_PASS
```

Post-implementation fast timing simulation 狀態：

```text
vivado.bat -mode batch -source scripts\run_post_impl_fast_xsim.tcl -journal tmp\codex_post_impl_cpu_bias_from_coe.jou -log tmp\codex_post_impl_cpu_bias_from_coe.log

Result: stopped before PASS.
Observed repeated timing violation:
Instruction_Memory RAMB36E1 ENARDEN setup/hold
```

未完成事項：

- 無；post-impl timing clean PASS 已由 `v0.9.0` 補齊。

### v0.7.0 官方助教檔案恢復與 feature size 修正版

修改檔案：

```text
RISCV_CNN.v
tb\tb_finalproject.v
test_circuit_bram_ip.v
golden_rom.coe
init_rom.coe
instr_mem_cpucheck.coe
coe備份檔\golden_rom.coe
final\final.ip_user_files\mem_init_files\golden_rom.coe
final\final.gen\sources_1\ip\golden_rom\golden_rom.mif
reports\timing_impl.rpt
reports\timing_synth.rpt
reports\utilization_impl.rpt
reports\utilization_synth.rpt
reports\route_status.rpt
CODEX_WORKLOG.md
```

修正內容：

- 將根目錄使用中的 `test_circuit_bram_ip.v`、`golden_rom.coe`、`init_rom.coe`、`instr_mem_cpucheck.coe` 與 `助教給的檔案/` 官方版本比對並同步為完全一致。
- 同步 `final/final.ip_user_files/mem_init_files/golden_rom.coe` 等 Vivado/IP/sim 副本，避免後續 simulation 使用舊 golden data。
- 移除 `CNN.effective_fmap_size` 中將官方 feature size `24/28/30` 改成 `22/24/26` 的舊邏輯；CNN 現在直接使用 test circuit 寫入的 `data_mem[12][6:1]`。
- `tb/tb_finalproject.v` 保留 display-based checker，但在總分不是 100 時不立刻停止，會繼續列出每個 testcase 的 status display，以便定位失敗 testcase。

驗證結果：

```text
vivado.bat -mode batch -source scripts\run_vivado_checks.tcl -journal tmp\v070_full_checks.jou -log tmp\v070_full_checks.log

score_bcd = 0100
tc = 0..e all pass by display BCD
FINALPROJECT_SIM_PASS

route_design completed successfully
Post Routing Timing Summary | WNS=0.129 | TNS=0.000 | WHS=0.103 | THS=0.000
Route status: fully routed nets = 4605, routing errors = 0
```

Implementation utilization：

```text
Slice LUTs       = 2480 / 20800  (11.92%)
Slice Registers  = 2137 / 41600  (5.14%)
Block RAM Tile   = 14 / 50       (28.00%)
DSPs             = 2 / 90        (2.22%)
F7 Muxes         = 261
F8 Muxes         = 10
```

速度與 AT：

```text
cycle_count       = 14252
Processing Time   = 142520 ns
Official Area     = 2480 + 2137 + 261 + 10 + 280*2 = 5448
PDF AT product    = 5448 * 142520 = 776448960
```

採用判定：

- 採用此版本作為目前正式版本，因為官方助教檔案下 RTL display-based regression 通過 100 分，且 synthesis/place/route/post-route timing 全部通過。
- 本版不是新的 ranking datapath 優化；主要價值是移除舊測資相容邏輯，恢復官方 feature size 行為。
- Post-synthesis functional simulation 未列入此版本通過條件。

### v0.6.0 Memory_setting.pdf BRAM 對齊版

修改檔案：

```text
RISCV_CNN.v
tb\tb_finalproject.v
MEMORY_SETTING.md
final\final.xpr
final\final.srcs\sources_1\ip\Instruction_Memory\Instruction_Memory.xci
final\final.srcs\sources_1\ip\golden_rom\golden_rom.xci
scripts\create_final_project.tcl
scripts\run_rtl_xsim.tcl
scripts\run_vivado_checks.tcl
scripts\update_final_project.tcl
reports\timing_impl.rpt
reports\timing_synth.rpt
reports\utilization_impl.rpt
reports\utilization_synth.rpt
reports\route_status.rpt
```

修正內容：

- 新增 `MEMORY_SETTING.md`，保存 `Memory_setting.pdf` 可見的 Vivado Block Memory Generator 設定。
- 將 instruction memory IP/module 名稱改為 `Instruction_Memory`，並從 `RISCV_CNN.v` 移除舊 `instr_mem` instance 的 `.ena(1'b1)`。
- `Instruction_Memory` 設為 Always Enabled，因此產生的 wrapper ports 為 `clka/addra/douta`，沒有 `ena`。
- 將 instruction address 改為 10-bit，對應 PDF depth 1024。
- `Data_mem` Byte Size 設為 9，Port A/B 保留 Use ENA/ENB Pin 與 Read First。
- `init_rom`、`golden_rom` 設為 Write First，`golden_rom` depth 設為 2156。
- `run_vivado_checks.tcl` route flow 改成 `NoTimingRelaxation`、post-route `phys_opt_design`、再 `NoTimingRelaxation`，讓此版本 full check 可穩定 meet timing。

驗證結果：

```text
vivado.bat -mode batch -source scripts\run_vivado_checks.tcl -journal tmp\v060_full_checks_final.jou -log tmp\v060_full_checks_final.log

score_bcd = 0100
tc = 0..e all pass by display BCD
FINALPROJECT_SIM_PASS

route_design completed successfully
Post Routing Timing Summary | WNS=0.010 | TNS=0.000 | WHS=0.108 | THS=0.000
Route status: fully routed nets = 4608, routing errors = 0
```

Implementation utilization：

```text
Slice LUTs       = 2489 / 20800  (11.97%)
Slice Registers  = 2137 / 41600  (5.14%)
Block RAM Tile   = 14 / 50       (28.00%)
DSPs             = 2 / 90        (2.22%)
F7 Muxes         = 262
F8 Muxes         = 10
```

採用判定：

- 採用此版本作為 PDF memory setting 對齊版，因為 RTL display-based regression 通過、implementation route/timing 通過，且 Vivado IP 名稱已對齊 `Memory_setting.pdf`。
- 此版本沒有新增 CNN ranking datapath 優化；cycle_count 沿用 `v0.5.0`。
- Post-synthesis functional simulation 曾啟動但在使用者要求先推版本時中止，因此未列入此版本通過條件。

### v0.5.0 CNN row-word cache ranking 優化

修改檔案：

```text
RISCV_CNN.v
tb\tb_finalproject.v
reports\timing_impl.rpt
reports\timing_synth.rpt
reports\utilization_impl.rpt
reports\utilization_synth.rpt
reports\route_status.rpt
CODEX_WORKLOG.md
```

修正內容：

- 在 `CNN` 內新增三列 `cache_word0/cache_word1/cache_lane/cache_valid`，分別保存上一個 output pixel 在三個 kernel row 讀出的 input word 與 lane。
- 在 `C_PIXEL_START`、`C_MAC`、`C_ACCUM_ROW` 判斷下一個 kernel row 是否可直接由 cache 組合出 `word0/word1`，可命中時跳過 `C_ROW_WAIT_A` 或只保留必要的 B-word read。
- 在 layer 開始與 row boundary 清除 `cache_valid`，避免跨 row/layer 重用錯誤資料。
- 將 `tb/tb_finalproject.v` 的 start hold 從 `1100000` cycles 調為 `1000100` cycles；這只影響模擬觀測時間，不改 DUT，目的是避免更快版本在 testbench 釋放 start 前已完成全部 testcase 而讓最後印出的 `cycle_count` 被清為 0。

驗證結果：

```text
vivado.bat -mode batch -source scripts\run_rtl_xsim.tcl -journal tmp\tmp_cache1_formal_rtl.jou -log tmp\tmp_cache1_formal_rtl.log

result_valid = 7fff
result_pass  = 7fff
cycle_count  = 14252
addr13       = 00000401
FINALPROJECT_RTL_PASS
```

```text
vivado.bat -mode batch -source scripts\run_vivado_checks.tcl -journal tmp\tmp_cache1_formal_checks.jou -log tmp\tmp_cache1_formal_checks.log

result_valid = 7fff
result_pass  = 7fff
cycle_count  = 14252
addr13       = 00000401
FINALPROJECT_RTL_PASS

route_design completed successfully
Post Routing Timing Summary | WNS=0.017 | TNS=0.000 | WHS=0.036 | THS=0.000
```

Implementation utilization：

```text
Slice LUTs       = 2458 / 20800  (11.82%)
Slice Registers  = 2134 / 41600  (5.13%)
Block RAM Tile   = 15 / 50       (30.00%)
DSPs             = 2 / 90        (2.22%)
F7 Muxes         = 262
F8 Muxes         = 10
```

採用判定：

- 採用此版本作為目前正式 ranking 版本，因為 RTL 全測通過、implementation timing 通過，且 PDF AT product 從 `v0.4.0` 的 `1199998800` 降到 `773028480`。
- 相比 `v0.4.0`，cycle 減少 9724，Official Area 增加 419；PDF AT product 仍改善約 35.58%。

### v0.4.0 CNN finish-cycle ranking 優化

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

### RTL source 整合

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

### v0.3.0 CNN pipeline ranking 優化

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

### v0.2.1 PDF clock / COE 修正

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

### v0.2.0 CNN row pipeline 優化與工作區整理

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

#### Script 與工作區整理

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

#### 舊檔保存與刪除

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

### v0.1.2 Baseline project / workspace sync

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
final\final.srcs\sources_1\ip\Instruction_Memory\Instruction_Memory.xci
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
MEMORY_SETTING.md
README.md
CODEX_WORKLOG.md
```

## 2026-05-23 post-impl timing debug note

- Must follow `MEMORY_SETTING.md`.
- Do not modify `test_circuit_bram_ip.v`.
- Do not change testcase/golden data and do not special-case individual cases.
- Long Vivado/post-synth/post-impl/xsim jobs should be launched in background when practical; report PID and log path, then stop polling until asked.
- #3 post-synthesis timing has reached clean PASS after restoring `Instruction_Memory` to Always Enabled.
- #5 post-implementation timing previously showed CNN-only mismatches while CPU tests passed; no current timing violation/collision warnings were found in the failing runs.
- The temporary `keep_hierarchy` / `dont_touch` workaround was removed and should not be used as the final fix.
- Current fix direction: register CPU instruction fetch output, use the CNN registered `done` event for finish, pulse CNN `web` from a register, and disable the CNN row-cache reuse path that diverged after post-impl timing.
- Verification after disabling cache reuse:
  - RTL full simulation: `score_bcd = 0100`, `result_valid = 7fff`, `result_pass = 7fff`, `cycle_count = 25746`, `FINALPROJECT_SIM_PASS`.
  - Focused post-impl timing TC0: `valid=1`, `pass=1`, `mismatches=0`; formerly bad words now match (`addr=281 din=27859626`, `addr=516 din=7f7e7f80`).
  - Focused post-impl timing TC1/TC5/TC9: all `valid=1`, `pass=1`, `mismatches=0`.
  - Full #5 post-impl timing simulation: `tmp/full5_post_impl_fast_fresh_bg.log` reached `post_impl_score_bcd = 0100` and `FINALPROJECT_POST_IMPL_PASS`; wrapper exit code `0`.
  - Focused post-impl timing report met timing: `WNS = 0.731 ns`, `TNS = 0.000 ns`, `WHS = 0.033 ns`, `THS = 0.000 ns`.
