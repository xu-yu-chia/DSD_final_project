# FinalProject 工作紀錄

日期：2026-05-15  
專案位置：`C:\Users\User\DSD_Lab\FinalProject`  
正式 Vivado project：`C:\Users\User\DSD_Lab\FinalProject\final\final.xpr`

目前版本：`v0.1.1`

## 版本控制規則

- 本專案使用 Git 做版本控制，repo 位置就是 `C:\Users\User\DSD_Lab\FinalProject`。
- 目前基準版為 `v0.1.0`，代表 RTL simulation、synthesis、implementation、timing 都已通過，且未產生 `.bit`。
- 之後任何更動前，都必須先讀 `CODEX_WORKLOG.md`，確認目前版本、限制、風險與歷史修改。
- 之後任何更動後，都必須更新 `CODEX_WORKLOG.md`，記錄版本、日期、修改內容、驗證結果與新風險。
- 原始提供檔案仍維持只 import、不直接修改，除非使用者明確要求。
- Git 追蹤正式 source、Vivado project 設定、IP `.xci`、constraints、scripts、reports、PDF/COE；排除 Vivado cache/log/run/sim 這類可重新產生的暫存檔。
- GitHub remote：`origin = https://github.com/xu-yu-chia/DSD_final_project.git`
- GitHub clone / 對外同步路徑：`C:\Users\User\DSD_Lab\DSD_final_project`

## 版本紀錄

### v0.1.1 - 2026-05-16

- 將本地 Git repo 連到使用者提供的 GitHub repo。
- 設定 remote origin：`https://github.com/xu-yu-chia/DSD_final_project.git`。
- 使用者提供 GitHub clone 路徑：`C:\Users\User\DSD_Lab\DSD_final_project`。
- 沒有修改 RTL、Vivado project、COE、constraints 或 reports。
- 沒有重新跑 simulation/synthesis/implementation。

### v0.1.0 - 2026-05-16

- 建立 FinalProject 專用 Git repo。
- 新增 `.gitignore`，排除 `codex_temp/`、`.Xil/`、Vivado generated cache/run/sim/log 等暫存檔。
- 將目前可通過的 V3 設計作為基準版。
- 基準驗證結果：
  - RTL simulation：`result_pass = 7fff`
  - synthesis：完成
  - implementation/route：完成
  - post-route timing：`WNS = 0.049 ns`, `TNS = 0`
  - route errors：`0`
  - `.bit`：未產生
- 保留既有 V3 合規風險：因為不新增自創 instruction `.coe`，目前 bias/start CNN 使用 CPU 內部控制流程，而不是從 Instruction Memory fetch Figure 7 程式序列。

## 目前依據

- 目前以 `114_DSD_Final_Project_v3.pdf` 和 TA 留言為準。
- V3 修正了 V2 的敘述：CPU 不會由 TA 提供，學生必須自己完成 multi-cycle RV32 CPU。
- CPU 需要支援的指令為 `lw`、`sw`、`add`、`sub`、`addi`、`beq`、`blt`。
- `RISCV_CNN.v`、`test_circuit_bram_ip.v`、`init_rom.coe`、`golden_rom.coe`、`instr_mem_cpucheck.coe` 都不修改，只 import/引用。
- 所有 memory 使用 Vivado Block Memory Generator IP，不用手寫 reg array 取代 BRAM。
- 目前不產生 `.bit`。

## 我新增或修改的東西

### RTL

- 新增/修改 `src/student_fp_core.v`
  - `Simple_CPU`
    - 自寫 multi-cycle CPU。
    - 支援 V3 要求的 7 個指令：`lw/sw/add/sub/addi/beq/blt`。
    - instruction fetch 接 Vivado `instr_mem` BRAM IP。
    - 因為使用者要求不要新增自創 instruction `.coe`，目前 CPU 在跑完 `instr_mem_cpucheck.coe` 後，會進入內部 `S_HOST_*` 控制流程，負責讀 `Data Memory[16:18]`、產生 `Bias0/Bias1`、啟動 CNN。
  - `CNN`
    - 透過 `Data_mem` Port B 存取 shared memory。
    - 讀 weights、bias、feature map size。
    - 執行兩層 3x3 convolution。
    - 支援 signed Q1.6。
    - 每次 convolution 後做 round-to-nearest ties-to-even。
    - 做 saturation clamp 到 signed 8-bit Q1.6 範圍。
    - 第一層中間結果放在 `Data Memory[272]` 開始。
    - 第二層 final output 放在 `Data Memory[512]` 開始。
    - 完成後寫 `Data Memory[13] = 32'd1025`，表示 done bit 與 output start address。

### Timing 修正

- 原本 CNN address 計算使用類似 `(row+krow)*in_w+col` 的即時計算。
- Post-route timing 一開始有小違反，約 `WNS=-0.130 ns`。
- 後來改成 `row_base` 累加器，避免 feature address path 內的 variable multiply。
- 修改後 implementation timing 通過，post-route `WNS=0.049 ns`。

### Vivado / Scripts

- 新增/修改 `scripts/update_final_project.tcl`
  - 開啟 `final/final.xpr`。
  - 加入正式 source、constraint、simulation TB。
  - 建立/更新 BRAM IP：`Data_mem`、`instr_mem`、`init_rom`、`golden_rom`。
  - `instr_mem` 只使用原本的 `instr_mem_cpucheck.coe`。
  - `init_rom` 只使用原本的 `init_rom.coe`。
  - `golden_rom` 只使用原本的 `golden_rom.coe`。
  - 從 `.xpr` 移除舊的 `blk_mem_gen_0` 參考，但磁碟上的舊資料夾沒有刪掉。

- 修改 `scripts/run_rtl_xsim.tcl`
  - 改成使用 `final/` project 產生的 IP simulation wrapper。
  - 跑 `tb/tb_finalproject.v`。

- 修改 `scripts/run_vivado_checks.tcl`
  - 改成針對 `final/final.xpr`。
  - 先更新 Vivado project。
  - 跑 RTL simulation。
  - 跑 synthesis。
  - 跑 implementation。
  - 產生 utilization/timing/route reports。
  - 不呼叫 `write_bitstream`。

- 新增 `tb/tb_finalproject.v`
  - 這是我寫的 simulation 外層 TB。
  - 它產生 clock/reset/start/tc，讓 TA 的 `test_circuit` 可以自動跑。
  - `result_valid = 7fff`、`result_pass = 7fff`、`FINALPROJECT_RTL_PASS` 是這個 TB 印出來的。
  - pass/fail 的判斷本身仍是 TA `test_circuit_bram_ip.v` 的內部結果。

- 新增 `constraints/RISCV_CNN.xdc`
  - 依 top module port 接 clock/reset/tc/mode/st/seven_seg/anode。

## Vivado project 現況

正式 project 是：

```text
C:\Users\User\DSD_Lab\FinalProject\final\final.xpr
```

`final.xpr` 目前引用：

- `RISCV_CNN.v`
- `test_circuit_bram_ip.v`
- `src/student_fp_core.v`
- `constraints/RISCV_CNN.xdc`
- `tb/tb_finalproject.v`
- `Data_mem.xci`
- `instr_mem.xci`
- `init_rom.xci`
- `golden_rom.xci`

BRAM IP 初始化：

- `instr_mem` -> `instr_mem_cpucheck.coe`
- `init_rom` -> `init_rom.coe`
- `golden_rom` -> `golden_rom.coe`
- `Data_mem` -> RAM，沒有 `.coe`

目前沒有新增自創 instruction `.coe`。  
Vivado 會在 `final/final.ip_user_files` 裡複製 `.coe`，那是 Vivado 自己產生的副本，不是我另外寫的 `.coe`。

## 驗證結果

### RTL simulation

使用 `scripts/run_rtl_xsim.tcl` 和 `final` project 的 IP 產物跑過。

結果：

```text
result_valid = 7fff
result_pass  = 7fff
cycle_count  = 34080
addr13       = 00000401
FINALPROJECT_RTL_PASS
```

意思：

- `tc=0..9` CNN 測資通過。
- `tc=10..14` CPU instruction 測資通過。
- `tc=15` run all 通過。
- `7fff` 是 15 個 testcase 都 pass。

### Synthesis / Implementation

使用 `scripts/run_vivado_checks.tcl` 跑過完整檢查。

結果：

- synthesis 完成。
- place/route 完成。
- route errors = 0。
- post-route timing met。
- 沒有產生 `.bit`。

重要 timing 結果：

```text
WNS = 0.049 ns
TNS = 0.000 ns
WHS = 0.115 ns
THS = 0.000 ns
```

route status：

```text
fully routed nets = 3996
routing errors = 0
```

reports 位置：

```text
C:\Users\User\DSD_Lab\FinalProject\reports
```

## 看到的 BRAM collision warning

simulation 會印很多類似：

```text
blk_mem_gen_v8_4_5 collision detected ...
A write address: 6, B read address: 6
A read address: 6, B write address: 6
```

來源是 `Data_mem` BRAM IP 的 behavioral simulation model。

原因：

- Port A 是 CPU/test circuit 使用。
- Port B 是 CNN 使用。
- 目前 CPU 內部控制流程和 CNN 用 `Data Memory[6]` 做 command/start flag。
- 有些 clock 附近 Port A 和 Port B 同時碰到 address 6，所以 Vivado BRAM simulation model 會報 collision warning。

這不是 `golden_rom.coe` 的錯，也不是答案錯。  
目前 simulation 最後仍然 `FINALPROJECT_RTL_PASS`。  
但 warning 代表這個 handshake 寫法不是最乾淨，若要更穩，應該把 CPU 寫 command 和 CNN polling/clear 的時間完全錯開。

## 遇到的困難與處理

### 1. V2 和 V3 規格不一致

V2 文字看起來像是 TA 已提供 baseline CPU，學生只補 `addi/beq/blt`。  
V3 和 TA 留言明確說 CPU 不會提供，學生要自己完成 multi-cycle CPU。  
因此目前以 V3 為準，`Simple_CPU` 是自寫 CPU，支援全部 7 個指令。

### 2. 不新增自創 `.coe` 和 V3 CPU instruction sequence 有衝突

V3 Figure 7 寫 bias generation 要由 CPU 執行指令完成。  
但使用者選擇不要新增自創 instruction `.coe`，只使用原本 `instr_mem_cpucheck.coe`。

問題是：

- `instr_mem_cpucheck.coe` 是 CPU instruction testing 用。
- 它沒有放 Figure 7 的 CNN host/bias generation 程式。
- 如果完全不新增 instruction memory 內容，CPU 沒有地方 fetch Figure 7 那段程式。

目前採用的做法是：

- 保留原始 `instr_mem_cpucheck.coe`。
- CPU 執行完 COE 內的測試程式後，進入內部 `S_HOST_*` 流程完成 bias/start CNN。

這讓功能可以通過，但有 V3 合規風險。  
如果 TA 嚴格檢查「bias 必須由 instruction memory 中的 Figure 7 指令序列執行」，這點可能被質疑。

### 3. Vivado Tcl 路徑問題

Vivado 2022.1 batch mode 裡 `file normalize` 有時把 `C:/Users/User/DSD_Lab/FinalProject` 解析錯。  
曾經變成類似 `C:/Users/User/FinalProject` 或少掉 `DSD_Lab`。

處理方式：

- `run_vivado_checks.tcl` 直接固定 repo 路徑。
- `update_final_project.tcl` 使用候選路徑尋找 `RISCV_CNN.v`。

### 4. `save_project` 在 batch mode 報錯

Vivado 2022.1 對 `save_project` 的行為和預期不同，曾出現 missing option 錯誤。  
後來改成 project 更新後 `close_project`，`.xpr` 已正確寫入。

### 5. Direct synth 找不到 `.mif`

直接讀 IP synth wrapper 時，BRAM wrapper 需要在工作目錄看到：

- `init_rom.mif`
- `golden_rom.mif`
- `instr_mem.mif`

處理方式：

- `run_vivado_checks.tcl` 在 synth 前把這三個 Vivado 產生的 `.mif` 複製到 `codex_temp/vivado_work`。

### 6. Vivado sandbox 權限問題

在一般 sandbox 內跑 implementation 時，Vivado 會在 `.Xil` 或 project/IP 檔案遇到 read-only / tmp 刪除問題。  
最後使用 escalated Vivado batch run 才完整跑完 synthesis/implementation。

### 7. Timing violation

第一次 post-route 約 `WNS=-0.130 ns`。  
critical path 在 CNN address calculation。  
修改成 `row_base` 累加後，post-route timing 變成 `WNS=0.049 ns`，已通過。

## 助教 test circuit 和我的 TB

TA 提供的是 `test_circuit_bram_ip.v`，它不是一般外層 standalone TB，而是會被 `RISCV_CNN.v` instantiate 的測試控制電路。

它負責：

- 初始化 Data Memory。
- 從 `init_rom` 讀測資。
- 控制 reset/start。
- 等設計完成。
- 從 `golden_rom` 讀 golden answer。
- 比對 CNN output。
- 檢查 CPU reserved region `Data Memory[960:1023]`。
- 記錄 `result_valid` 和 `result_pass`。
- 控制七段顯示器。

我新增的 `tb/tb_finalproject.v` 只是外面包一層：

- clock
- reset
- start button pulse
- tc 選擇
- 最後把 TA test circuit 的內部結果印出來

所以：

- pass/fail 判斷是 TA test circuit。
- `FINALPROJECT_RTL_PASS` 這行文字是我的 TB 印出來方便看結果。

## 速度排名與 AT product

V3 提到 Ranking 看 AT product：

```text
AT = Area x Processing Time
```

目前 simulation 印出的：

```text
cycle_count = 34080
```

這代表 `tc=15` run all 的測試週期數。  
若 clock 是 100 MHz，約為：

```text
34080 cycles x 10 ns = 340.8 us
```

目前設計比較偏向簡單省硬體，不是高度 parallel CNN。  
因此 area 可能較低，但速度不一定能排名前面。

## Pipeline 狀態

目前沒有做 CPU pipeline。

- `Simple_CPU` 是 multi-cycle CPU。
- 不具備 IF/ID/EX/MEM/WB 重疊執行。
- 因此目前沒有拿 V3 bonus 裡的 `Pipelined CPU design (5pts)`。

CNN 裡有 state 分段，例如 BRAM read wait、capture、MAC、accumulate、write output，但這不等於 CPU pipeline bonus。

## 目前風險

最大風險是 V3 合規性：

- 功能測試、synthesis、implementation、timing 都過。
- 但 bias generation 不是由 instruction memory 裡的 Figure 7 指令序列 fetch/execute 完成。
- 這是因為使用者要求只用原本 `instr_mem_cpucheck.coe`，不新增自創 instruction `.coe`。

若要更符合 V3，建議改成：

- 保留原始 `instr_mem_cpucheck.coe` 不修改。
- 新增一個整合後的 instruction memory 初始化檔，包含 Figure 7 host program 與 TA cpucheck program。
- 或用其他可被 TA 接受的方式，把 Figure 7 指令真的放進 Instruction Memory。

但這會違反目前「不要新增自創 `.coe`」的偏好。

## 後續如果要繼續改善

可以考慮：

- 消除 address 6 的 BRAM collision warning，改成更乾淨的 CPU/CNN handshake。
- 改成真正由 Instruction Memory 執行 Figure 7 bias generation 程式，降低 V3 合規風險。
- 做更快的 CNN datapath，例如更多 parallel MAC，但 area 會增加。
- 做 CPU pipeline bonus，但會大幅增加設計與驗證工作量。
- 做 post-synthesis / post-implementation timing simulation screenshot，方便報告繳交。
