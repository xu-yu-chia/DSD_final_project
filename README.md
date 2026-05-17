# DSD Final Project

本專案是 EE3044 Digital System Design and Implementation final project：`RISC-V RV32 CPU with a Memory-Mapped CNN Coprocessor`。

目前實作以 `114_DSD_Final_Project_v3.pdf` 為主要規格。`v1`、`v2` 留作版本差異追蹤，避免舊版 PDF 的 memory map、pin assignment、CPU 要求和新版混用。

## 專案檔案

| 類別 | 檔案 |
|---|---|
| 目前主要規格 | `114_DSD_Final_Project_v3.pdf` |
| 舊版規格 | `114_DSD_Final_Project_v2.pdf` |
| 更舊版規格 | `legacy_artifacts/FinalProject_deprecated/114_DSD_Final_Project_v1.pdf` |
| Top RTL | `RISCV_CNN.v` |
| CPU/CNN core | integrated in `RISCV_CNN.v` |
| Test circuit | `test_circuit_bram_ip.v` |
| Testbench | `tb/tb_finalproject.v` |
| Constraints | `constraints/RISCV_CNN.xdc` |
| Vivado project | `final/final.xpr` |
| Work log | `CODEX_WORKLOG.md` |

## PDF 版本要求

| PDF 版本 | CPU 要求 | Memory map / 控制位 | Board I/O / testcase | Report / 評分差異 |
|---|---|---|---|---|
| `v1` | 基於提供的 multi-cycle RV32 CPU；原本已有 `lw`、`sw`、`add`、`sub`，主要補完 `addi`、`beq`、`blt`。CNN coprocessor 由學生設計。 | Data memory 為 1024 x 32-bit。Weight0 在 address `0..2`。Config 使用 address `12..13`。Start bit 是 `data_mem[12][0]`，CPU 開始後需清 0。Feature map size 在 `data_mem[12][6:1]`。Input feature map 從 address `16` 開始。完成前寫 `data_mem[13][10:1]` 為 output feature map 起始位址，完成後設 `data_mem[13][0] = 1`。`960..1023` 保留不可覆寫。 | `rstn` pin 為 `S6`。`tc = 0..10` 為 testcase，`11..14` 未定義，`15` 跑全部。`anode[0..3] = G2, C2, C1, H1`。 | Report 10% 內容包含 architecture block diagram、design technique、STA summary、behavior/post-synthesis/post-implementation simulation screenshots。尚未列 Hardware Utilization。 |
| `v2` | 仍以提供的 CPU 為基礎，主要補 `addi`、`beq`、`blt`；CNN coprocessor 由學生設計。 | Config 改成 address `11..13`。Start bit 改為 `data_mem[11][0]`，CPU 開始後需清 0。橘色 TA 預設區唯獨 `11[0]` 可寫；其他 read-only。Feature map size 仍在 `data_mem[12][6:1]`。Output 起始位址和 done bit 仍在 `data_mem[13][10:1]`、`data_mem[13][0]`。 | `rstn` pin 改為 `P15`。`tc = 0..9` 為 CNN testcase，`10..14` 為 CPU testcase，`15` 跑全部。`anode[0..3] = H1, C1, C2, G2`。 | Report 10% 新增 `Hardware Utilization`。評分架構維持 Functionality 60%、Ranking 30%、Report 10%。 |
| `v3` | CPU 要求升級：學生需自行設計 multi-cycle RV32 CPU，完整支援 `lw`、`sw`、`add`、`addi`、`sub`、`beq`、`blt`。CNN coprocessor 仍由學生設計。 | 與 `v2` 相同：Start bit 在 `data_mem[11][0]`，feature map size 在 `data_mem[12][6:1]`，output start/done 在 `data_mem[13]`，`960..1023` 保留不可覆寫。 | 與 `v2` 相同：`rstn = P15`，`tc = 0..9` CNN、`10..14` CPU、`15` all，`anode[0..3] = H1, C1, C2, G2`。 | 與 `v2` 相同，Report 需包含 Hardware Utilization。這是目前專案採用的最新規格。 |

## 共通設計要求

Top module 必須命名為 `RISCV_CNN`。

系統架構為 RV32 RISC-V CPU 加 memory-mapped CNN coprocessor。Data memory 是 CPU/test circuit 與 CNN 共用的 dual-port memory，深度 1024 words、寬度 32 bits。Port A 供 CPU 與 test circuit 使用，Port B 供 CNN 使用。

CPU 作為 host processor，負責讀取 start/config、產生 bias、啟動 CNN coprocessor，並配合 memory-mapped status 回報完成。Instruction memory 以連續 32-bit word 儲存 instruction，但 CPU 的 PC 仍需照 byte addressing 使用 `PC + 4`，而且至少保留 150 個 instruction addresses 給測試指令。

CNN model 是兩層 3x3 convolution，stride = 1、padding = 0，不含 activation function。Feature map size 可變，範圍 `10..32`。Input feature、weight、output feature 使用 signed 8-bit Q1.6 two's complement 格式，32-bit word 內用 big-endian 方式一次打包 4 個 8-bit value。

## 目前 v3 Memory Map

| Address | 用途 | 權限 / 備註 |
|---:|---|---|
| `0..2` | Weight0 | TA 初始化，read-only |
| `3..5` | Weight1 | TA 初始化，read-only |
| `11` | Start control | `data_mem[11][0]` 由 test circuit 拉高，CPU 開始後清 0 |
| `12` | Feature map size | `data_mem[12][6:1]`，範圍 `10..32` |
| `13` | Output status | `data_mem[13][10:1]` 放 output feature map 起始 address，`data_mem[13][0]` 為 done bit |
| `14` | Bias0 | CPU 寫入，CNN 使用 bits `[7:0]` |
| `15` | Bias1 | CPU 寫入，CNN 使用 bits `[7:0]` |
| `16..271` | Input feature map | 最大 32 x 32 feature map，以 4 個 8-bit value 打包成 1 word |
| `272..959` | Student-defined / output 可用區 | 需避免覆寫 TA read-only 區與 reserved 區 |
| `960..1023` | Reserved for grading | 不可覆寫 |

## Bias 產生要求

Bias 由 CPU 在 CNN 開始前產生，並寫回 data memory：

| Bias | 位置 | 產生方式 |
|---|---:|---|
| `Bias0` | `data_mem[14]` | `data_mem[16] + data_mem[17] + data_mem[18]` |
| `Bias1` | `data_mem[15]` | 若 `data_mem[17] < data_mem[16]`，則為 `data_mem[16] - data_mem[17] + 1`；否則為 `-15` |

CNN 使用 bias 時，只取 `data_mem[14][7:0]` 與 `data_mem[15][7:0]` 作為實際 bias 值。

## 數值格式要求

- 所有 signed number 使用 two's complement，MSB 為 sign bit。
- Input feature、weights、output feature 使用 signed Q1.6。
- Intermediate values 要保留 full precision。
- 每次 convolution computation 完成後，才做 saturation 與 rounding 回 signed Q1.6。
- Saturation 使用 clamp，範圍為 `[-2.0, 1.984375]`，也就是 8-bit code `-128..127`。
- Rounding 使用 round-to-nearest, ties-to-even。

## 評分要求

總分 100：

| 項目 | 比重 | 重點 |
|---|---:|---|
| Functionality | 60% | Behavioral simulation 20%、post-synthesis simulation 10%、post-implementation simulation 10%、on-board 20%。CPU instruction correctness 與 CNN correctness 都會計分。 |
| Ranking | 30% | 依完成層級與 AT product 排名。Level A 需通過 RTL simulation、synthesis、implementation、post-implementation timing simulation，並以 AT 排名。 |
| Report | 10% | 架構圖、設計技巧、STA summary、Hardware Utilization、behavior/post-synthesis/post-implementation simulation screenshots。 |

官方 AT product 定義為 `Area x Processing Time`。Area 公式包含 `Slice LUTs + Slice Registers + F7 Muxes + F8 Muxes + 280 x DSPs`。

限制與禁止事項：

- Student design 不可額外使用 BRAM，只能使用 Data Memory 與 Instruction Memory 作為 BRAM。
- TA test circuit 只用於驗證，不列入 student design resource constraint。
- 不可修改 test circuit 或直接輸出 expected answer 取代實際運算。

## 繳交要求

截止時間：`2026/06/04 17:59:59`，遲交不收。

需上傳三個檔案到 ee-class：

| 檔案 | 命名 |
|---|---|
| Source code | `studID_name_FP.v`，若有多個相依 Verilog 檔需合併成單一檔案 |
| Bitstream | `FP_studID.bit` |
| Report | `studID_FP_report.pdf`，只接受 PDF |

Report 至少描述完成度、設計/實作方式、遇到的困難與解法、對作業的建議。

## 目前專案狀態

目前 RTL simulation 已通過全部 15 個 testcase，且 synthesis、implementation、post-route timing 皆已通過。詳細版本紀錄、效能與面積比較請看 `CODEX_WORKLOG.md`。

目前實作對齊 `v2/v3` 的 memory map 與 pin assignment：

- Start bit 使用 `data_mem[11][0]`。
- Feature map size 使用 `data_mem[12][6:1]`。
- Output start/done 使用 `data_mem[13][10:1]` 與 `data_mem[13][0]`。
- `rstn` pin 使用 `P15`。
- `anode[0..3]` 使用 `H1, C1, C2, G2`。
