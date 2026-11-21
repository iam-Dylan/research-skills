---
name: advisor-revise
description: Write or judge advisor-style revisions for reviewer issues on a paper (the "blue" layer), in the advisor's own voice and format — English, per issue "The Reviewer's Concern" / "The Persuasion Strategy" / "Specific Revisions in Paper" with Location, Current Text and Replace-with text, then a summary checklist per group A–E — shifting the yardstick and answering with principle + evidence + boundary; query the knowledge each claim needs (own artifacts, theorem conditions, computable re-analyses, literature precedent, domain facts, external model properties) and verify every sentence, keeping the voice while replacing unsupported content. Use when the user has review comments (from advisor-review, a real reviewer, or an advisor's marked-up PDF) and wants fixes, a rebuttal written into the paper, an assessment of suggested rewrites, "sửa theo góp ý", "viết phần xanh", "viết như thầy", "ý nào hợp lý thì sửa", or types /advisor-revise.
---

# Advisor revise: viết phần xanh như thầy, với số truy được

Skill này tái tạo **lớp xanh** trong review của thầy: thuyết phục mềm để reviewer chấp nhận, viết **đúng văn phong của thầy** (khung tài liệu, nhãn, giọng huấn luyện, kiến trúc câu), cộng thêm **lớp kiểm tra** để mọi câu đưa vào paper đúng với dữ liệu. Nguyên tắc: **giữ giọng của thầy, chỉ đổi nội dung sai.**

Đầu vào: danh sách vấn đề theo A–E (từ `advisor-review` hoặc reviewer thật), cùng nguồn paper và các artifact kết quả.

Hai chế độ:
- **Viết:** soạn phần xanh cho từng vấn đề, như thầy.
- **Thẩm định:** nhận phần xanh của người khác (ví dụ PDF của thầy), chấm từng ý Green/Purple, viết lại ý Green trong đúng giọng người góp ý, rồi sửa bài khi người dùng đồng ý.

Trước khi viết, đọc [references/exemplar.md](references/exemplar.md): một khối nguyên văn của thầy đặt cạnh bản đã kiểm cùng giọng.

## Nguyên lý gốc: đổi thước đo

Mỗi vấn đề = bài bị đo bằng thước **X** mà bài không đạt. Câu trả lời = lập luận rằng thước đúng cho bài là **Y**, bài đạt Y bằng một con số, còn X được nói thẳng và khoanh lại ở Scope. Không bao giờ nói reviewer sai; nhận mối lo là có thật, rồi đổi cái dùng để chấm.

Đổi thước **chỉ hợp lệ** khi đủ bốn điều kiện:
1. **Chính danh:** người đọc của venue thật sự quan tâm đến Y. Có tiền lệ thì trích.
2. **Đạt thật:** bài đạt Y bằng một con số truy được nguồn.
3. **Nhất quán:** Y khớp với điều title và abstract đã hứa. Không khớp là dời cột gôn.
4. **Không giấu:** X vẫn được nêu ở Scope hoặc Limitations.

## Quy trình

### Bước 1. Nói lại mối lo bằng giọng reviewer

Viết "The Reviewer's Concern": 1–3 câu trong ngoặc kép, như reviewer đang nói, nén số của vấn đề đỏ vào, thường kết bằng một câu hỏi tu từ ("Why is this useful?", "What is the theoretical novelty?"). Nếu không nói lại được, vấn đề chưa rõ; quay lại `advisor-review`.

### Bước 2. Gọi tên thước X và tìm thước Y

- X là chuẩn ngầm reviewer dùng ("xử lý mọi loại", "định lý mới", "lỗi tự nhiên", "ít FLOPs", "chốt trước khi xem test").
- Tìm Y từ bốn nguồn: **mục đích** của phương pháp, **nguyên lý thiết kế**, **bảo đảm lý thuyết** đã chứng minh, **tiền lệ** trong tài liệu.
- Không tìm được Y hợp lệ → nước "Nhận và sửa", hoặc đánh dấu **cần dữ liệu**.

### Bước 3. Chọn nước đi và nhãn đậm

Mỗi nước đi có kiểu nhãn đậm thầy hay dùng trong "The Persuasion Strategy".

| Kiểu đòn của reviewer | Nước đi | Nhãn đậm kiểu thầy |
|---|---|---|
| Phản ví dụ cho giả định | Thu hẹp phạm vi về tập con thuần nhất + hướng mở rộng ở Scope | "Frame your method not as …, but as a **targeted …**" |
| Tả phương pháp kém hấp dẫn | Biến điểm yếu thành lựa chọn có nguyên lý | **Separation of Concerns**, "Reframe … not as an arbitrary …, but as an **orthogonal …**" |
| "Giả định lệch thì sao?" | Chỉ vào số độ nhạy đã có | **Data-Backed Proof of Robustness**, **Robustness to Misspecified ε** |
| Lựa chọn làm sau khi xem kết quả | Suy ra từ nguyên lý + bản thô cũng thắng; **vẫn khai thứ tự** | **First-Principles Derivation**, **The Baseline Already Won Anyway** |
| "Lợi ích nhỏ ở mức thực tế" | Chia chế độ sử dụng | **Framing X as Asymmetric Clinical Triage**, "Two distinct deployment regimes…" |
| "Chỉ là kết quả cổ điển" | Nhận một phần rồi nâng tầm, kèm điều kiện | "Explicitly state that these are **theoretical characterizations**, rather than…" |
| "Quá nặng" | Tách loại chi phí + phương án nhẹ hơn **đã đo** | **Differentiate Development Cost vs. Inference Cost** |
| Ký hiệu dày | Giảm tải nhận thức: một câu diễn giải hoặc bảng | **The Persuasive Fix**: "Keep Equation (N) for formal rigor, but immediately follow it with…" |
| Thiếu ví dụ thất bại | Thống kê lỗi có cấu trúc từ dữ liệu đã lưu | **Explain the Scientific Value of Empirical Rigor**, **Add a Structured Error Taxonomy** (chỉ với lỗi đã đo) |
| Lỗi thật | Nhận và sửa | "Fixing …", "Actionable Fix" |
| Không phải lỗi | Bác, kèm bằng chứng (render trang, trích nguồn) | — |

### Bước 4. Dựng bộ ba và đặt chỗ

Mỗi câu trả lời có đủ **Nguyên lý** (vì sao lựa chọn đúng), **Bằng chứng** (một con số), **Biên** (điều không claim, hướng mở rộng). Đặt ở 2–3 Location: **chỗ giả định xuất hiện** (Method), **chỗ có số** (Results, Ablations), **Discussion hoặc Scope**.

### Bước 5. Tra kiến thức cho từng claim

Tách mọi câu sẽ vào paper thành claim nguyên tử, mỗi claim tra theo loại. **Thứ tự: của mình → suy ra → tính từ output đã lưu → nguồn ngoài đã đọc → không có thì bỏ.**

| Loại | Claim kiểu gì | Tra ở đâu, tra thế nào | Nếu không có |
|---|---|---|---|
| **K1. Số của bài** | "AUC 0.936", "≤ 0.002", "+0.078 over CURE" | `grep` số trong nguồn bài; tìm artifact sinh ra nó (`results.json`, `run_summary.json`, CSV, script tạo bảng); ghi `file:key`; làm tròn một lần từ giá trị gốc | Không có trong artifact → không dùng, kể cả khi người góp ý nhớ là có |
| **K2. Toán, định lý** | "Pareto-optimal", "never degrades", "minimax", "max-entropy" | Viết giả thiết của định lý; so lượng từ (any, never, strictly, guarantees) với giả thiết; tự suy khẳng định nhỏ | Chỉ đúng có điều kiện → viết kèm điều kiện; không chứng minh được → bỏ |
| **K3. Tính được từ output đã lưu** | độ nhạy theo tham số khác, lỗi theo nhóm, tỷ lệ cùng sai | Thêm phân tích vào **pipeline kết quả**, chạy lại, kiểm khoá cũ không đổi; kiểm nhiễu do cách dựng | Cần chạy mô hình mới → **cần dữ liệu**, hỏi người dùng trước |
| **K4. Quy trình của mình** | "chốt trước", "tập ngoài chưa bị đọc" | Doc thiết kế, ghi chép chạy, `git log -S` | Hồ sơ không ghi → không khẳng định |
| **K5. Tiền lệ tài liệu** | "as in …", "standard stress-testing" | `academic-search` hoặc WebSearch; **mở bài** xác nhận; bib từ DOI, arXiv, ACL Anthology | Không có → bỏ "gold standard", "standard practice" |
| **K6. Sự kiện miền** | "bệnh không ưu tiên bên nào", "VLM sai 5–15%" | Ưu tiên số của chính dữ liệu mình; rồi guideline, review có trích dẫn | Không nguồn → viết lại không có số |
| **K7. Hệ thống ngoài** | "SOTA", "draws boxes", "clinically validated" | Paper gốc, model card, bảng benchmark | Không trích được → bỏ |

### Bước 6. Kiểm từng câu

Năm câu hỏi cho mỗi câu sẽ vào paper:
1. Số này nằm ở file nào, khoá nào?
2. Có từ tuyệt đối không? Điều kiện đã nêu chưa?
3. Sự kiện được nêu có kiểm chứng được không?
4. Có tả thứ chưa từng đo không (cơ chế lỗi, latency, "retaining over 95%")?
5. Có làm người đọc hiểu sai quy trình không (giấu thứ tự, bỏ câu khai)?

Không qua → giữ khung câu, thay nội dung theo bảng "Giữ giọng, đổi nội dung" dưới đây; tính được thì tính (K3); cần chạy mới, cần kiểm thêm hoặc cần tác giả trả lời thì dùng nhãn **Keep as written / Hold / Replace with the … the author confirms** và ghi rõ cần gì; không được nữa thì bỏ và khoanh ở Scope.

### Bước 7. Áp vào bài (khi người dùng đồng ý)

- Chỉ sửa title, abstract, keywords khi người dùng đồng ý riêng.
- Giữ giới hạn trang: cắt chữ ở đoạn có dòng cuối ngắn; xoá câu lặp trước khi xoá nội dung.
- Build lại; kiểm số trang, overfull, tham chiếu chưa định nghĩa.
- Mọi số mới truy được đến artifact; mọi câu trích trong ghi chú khớp nguồn bài.

## Văn phong của thầy

### Hai giọng

- **Giọng huấn luyện** (The Persuasion Strategy, nói với tác giả): ngôi thứ hai, mệnh lệnh, tự tin, nhãn đậm, được dùng dấu chấm than: "You **already have the data in Section 4.4 and Figure 2**!", "Emphasize that…", "Point to…", "Frame…", "Reframe … not as …, but as…", "Highlight…", "Explicitly state that…", "Argue that…", "State clearly that…", "Pitch this as…". Giọng này được nhiệt tình, nhưng chỉ chỉ vào dữ liệu có thật: "You already have the data in X!" chỉ khi X thật sự chứa số đó (K1).
- **Giọng paper** (câu trong ngoặc kép sẽ vào bài): học thuật trang trọng, dùng kiến trúc câu của thầy (dưới đây), **số thay cho tính từ cường độ**.

### Khung tài liệu (viết bằng tiếng Anh, như thầy)

Tiêu đề nhóm, theo tên thầy dùng:
- **A. Weaknesses in Core Ideas & Modeling Assumptions**
- **B. Novelty and Theoretical Contribution**
- **C. Weaknesses in Experimental Design & Contributions**
- **D. Illogical Flows & Methodological Gaps**
- **E. Presentation, Formatting & Structural Issues**

Khung theo nhóm, giữ đúng biến thể thầy dùng:

| Nhóm | Tiêu đề vấn đề | Ba mục con | Bảng cuối nhóm |
|---|---|---|---|
| A | `Part N. Issue: <Name> (<symbol>) vs. <tension>` | The Reviewer's Concern · The Persuasion Strategy · Specific Revisions in Paper | **Summary Checklist of Changes to Apply**: Reviewer Doubt \| Paper Location \| The Persuasive Frame |
| B | `Part N. Addressing "<reviewer's label>" (<what it covers>)` | The Reviewer's Pushback · The Persuasion Strategy · Specific Revisions in Paper | **Summary Checklist of Revisions for Problem B**: Issue \| Target Section \| Recommended Framing & Action |
| C | `N. Issue: <Name> vs. <tension>` | The Reviewer's Concern · The Persuasive Frame · Exact Text to Add/Rewrite: | **Summary Table for Problem C Revisions**: Reviewer Doubt \| Paper Section \| Persuasive Pivot |
| D | `Part N. Issue: <Name> (<the contradiction in numbers>)` | The Reviewer's Concern · The Persuasive Frame · Specific Revisions in Paper | **Summary Checklist for Problem D**: Reviewer Doubt \| Paper Section \| Persuasive Frame |
| E | `N. Fixing …` / `N. Resolving "<label>" in <place>` / `N. Addressing the "<label>" (Without New Experiments)` | The Reviewer's Concern hoặc The Problem · The Persuasion Strategy hoặc The Persuasive Fix · Exact Text (and Table) to Insert in <place>: | **Quick Implementation Checklist for Problem E**: Action Item \| Location in Paper \| Method |

- Ô "Reviewer Doubt" là câu hỏi ngắn: "Why binary S?", "What if ε is unknown?", "Why only CURE for box writing?", "Did you peek at test data to add k?". Nhóm B dùng mệnh đề: "Propositions 1 & 2 are classical", "Just an ensemble pipeline".
- Mỗi Location: `**Location:** Section N (<Section name> – <sub-location>)`, ví dụ "Section 4.4 (Ablations – Misspecified error rate)", "Section 3.2 (Flagging – Right before / after Proposition 1)", "Introduction (Contributions bullet points)".
- Dưới Location, dùng đúng nhãn hành động của thầy:
  - **Current Text:** / **Current Contribution Bullet:** (trích nguyên văn bài)
  - **Add after this sentence:** / **Add right after <X>:** / **Add at the end of Section N:** / **Add to the Scope paragraph:** / **Add a concise note:** / **Add a dedicated paragraph titled '<Title>':**
  - **Replace / Expand with:** / **Replace with:** / **Rewrite to:** / **Rewrite to persuade:** / **Rewrite the introductory lines of Section N:** / **Strengthen the concluding sentences of this paragraph:** / **Reinforce with a bridging sentence:**
  - Nhãn thêm của skill (thầy không có, vì thầy luôn viết câu, kể cả khi thiếu số), dùng khi câu cần một thứ chưa có:
    - **Keep as written** until <run>; then replace with its result. Bài đã khai đúng, chỉ chờ dữ liệu để nói hơn.
    - **Hold** until <check>; then add <what>. Số có nhưng chưa kiểm xong (log, trạng thái PARTIAL, khoá chưa rõ).
    - **No change now.** <why>. Bài đã có lập luận; sửa thêm thì tốn trang hơn là được.
    - **Replace with** the <X> the author confirms. Câu phụ thuộc một sự kiện quy trình mà hồ sơ không ghi (K4).
  - Không bao giờ viết câu có chỗ trống (`N minutes`, `<keeps/swaps>`) hay số đoán vào phần trích dẫn sẽ dán vào bài.
- "The Persuasion Strategy" có 2–4 ý, đánh số hoặc gạch đầu dòng, mỗi ý `**<Bold Label>**: <1–3 câu>`, trong câu bôi đậm cụm khung. Có thể mở bằng một đoạn thay cho danh sách ("Frame your method not as …, but as a **…** within …").
- Mẫu nhãn đậm: `<Adjective> <Noun>` (Rigorous Controlled Stress-Testing, Linguistic Independence), `X vs. Y` (Reflection Equivariance vs. Dataset Artifact), `X as the Y` (CURE as the Representative Exemplar), `Refocus from "X" to "Y"`, `The X Already Y` (The Baseline Already Won Anyway), `Framing X as Y`.

### Kiến trúc câu trong giọng paper

| Kiến trúc | Khuôn |
|---|---|
| Nhận rồi xoay | "In reality, … may …. However, …: it … and …" |
| Bối cảnh → thu hẹp → lý do | "In <field>, … fall into …. Here, we restrict our focus to …, where …. Formulating … isolates …" |
| Cơ chế cổ điển → ý nghĩa thực hành | "While the mathematical mechanics inherit from …, <result> carries immediate practical significance for …: it establishes that …. This gives practitioners …" |
| Lựa chọn có chủ đích | "Rather than proposing …, we deliberately frame … as …. By decoupling … from …, our framework acts as …" |
| Tách vai | "Importantly, our decision framework enforces a strict separation of concerns: … is decoupled from …" |
| Ablation có cấu trúc | "To quantify the value of …, Table N reports an ablation using …. Even this … formulation …. However, incorporating … yields …" |
| Kết bằng số | "…, while … (+0.078 to +0.081 over CURE) …. Thus, …" |
| Hai chế độ | "Two distinct deployment regimes govern our method: (1) **<Name>:** … (2) **<Name>:** …" |
| Đoạn mới có tiêu đề | "**<Noun Phrase> and/vs. <Noun Phrase>:** …" hoặc "**<Title>.** …" |
| Chốt độ bền | "This demonstrates that … dominates …, validating … as …" |

### Giữ giọng, đổi nội dung

Kiến trúc câu, nhãn đậm, tiêu đề đoạn, lời huấn luyện thì giữ. Chỉ thay những thứ không qua Bước 6:

| Thầy hay viết | Viết thay (giữ vị trí trong câu) |
|---|---|
| remarkably robust, imperceptible penalty, virtually nothing | costs at most 0.002 |
| massive safeguards, leaps | still exceeds CURE by 0.078 and 0.081 |
| guarantees that … never degrades | when r is exact, … is never below … |
| strictly dominates any static strategy | attains the upper envelope of all fixed policies on the same evidence |
| completely decoupled | decoupled, except that … (khi chỉ đúng một phần) |
| gold standard, standard practice | as in CorBenchX and ReXErr [cite] |
| naturally generalizes, readily consumes | extends to … through … |
| proves zero overfitting, uncompromised | the first version also … (số) |
| X% of … (không nguồn) | the gain grows with m, so … |
| principled minimax prior | maximizes H(w\|S) for a given overall rate (điều chứng minh được) |
| Never describe … chronologically | giữ câu khai, thêm lý do từ nguyên lý |

## Đầu ra

### Chế độ Viết

Tài liệu tiếng Anh, theo đúng khung trên, nhóm A → E. Mỗi vấn đề:

```markdown
### Part 1. Issue: <Name> (<symbol>) vs. <tension>

**The Reviewer's Concern**

"<1–3 sentences in the reviewer's voice, ending with a question>"

**The Persuasion Strategy**

1. **<Bold Label>**: <coaching sentence, second person>. You **already have the data in Section X / Table Y**!
2. **<Bold Label>**: ...

**Specific Revisions in Paper**

- **Location:** Section 3.1 (Setting – right after introducing S)
  - **Current Text:** "<verbatim from the paper>"
  - **Add after this sentence:** "<paper-voice text with verified numbers>"
- **Location:** Section 5 (Scope)
  - **Add to the Scope paragraph:** "<...>"
```

Cuối mỗi nhóm: bảng checklist đúng tên và cột của nhóm, rồi **Evidence Ledger** (phần thêm của skill, đặt sau bảng để thân tài liệu giữ nguyên giọng thầy):

| Claim | Source | Check |
|---|---|---|
| <claim nguyên tử> | `<file>` › `<key>` / <citation> / derivation | ✓ / ✗ bỏ |

Câu nào ✗ thì không xuất hiện trong text đề xuất.

Cuối tài liệu, một mục cho tác giả:

```markdown
## Summary for the author

- N issues: a with text ready to apply, b held for data (<list: issue → run>), c held for a check, d waiting for the author's answer, e with no change.
- Edits that touch the title, abstract or keywords (need approval), with the current word count.
- Page budget: about <n> lines added; where to trim.
- Questions for the author: <one line each, from every K4 gap>.
```

Sau đó tóm tắt cho người dùng trong chat, bằng ngôn ngữ của họ: các con số trên, câu hỏi cần họ trả lời, và đường dẫn file.

### Lưu ở đâu

- Repo có thư mục docs của dự án chứa paper → `<project>/docs/<paper-slug>_advisor_revise_<YYYY-MM-DD>.md`. Theo quy ước ngôn ngữ của repo cho tên file (ví dụ không hậu tố = tiếng Anh, `_vi` = tiếng Việt).
- Không có docs → cạnh nguồn paper, cùng mẫu tên.
- Không ở trong repo, hoặc người dùng chỉ muốn xem nhanh → thư mục scratchpad của phiên.
- Chế độ Thẩm định: bảng ghi chép `<paper-slug>_advisor_review_vi.md` cùng chỗ; PDF tô lại màu (nếu người dùng muốn) đặt cạnh PDF gốc, thêm hậu tố `_reviewed`.
- Đã có file cùng tên → thêm hậu tố `-2`, không ghi đè. Không commit; báo đường dẫn cho người dùng.

### Chế độ Thẩm định

Bảng ghi chép (lưu thành file `_vi.md` khi người dùng muốn):

| Mục | Ý góp ý (trang) | Kết quả | Ghi chú |
|---|---|---|---|
| A.2 | Lập luận "minimax / max-entropy" (tr. 2) | Green | Max-entropy đúng với tỷ lệ lỗi tổng cho trước, đã thêm sau Eq. 2; bỏ "minimax" |
| C.3 | "VECL alone AUC 0.901" (tr. 13) | Purple | Không có trong `results.json`; một reader đơn chưa đo |

- **Green:** ý đúng khi nêu đúng điều kiện, và đã có hoặc đã đưa vào bài. Khi viết lại để đưa vào bài, **giữ kiến trúc câu và từ khung của người góp ý, đổi ít chữ nhất**, ghi cụm đã bỏ.
- **Purple:** vẫn sai dù nêu đúng điều kiện, không có dữ liệu đỡ, hoặc trình bày sai việc đã làm. Ghi lý do cụ thể.
- Ý lẫn đúng sai: tách. Phần đúng Green, cụm sai Purple. Không gạt cả ý vì một cụm sai, không nhận cả ý vì khung hay.

Kết thúc: số Green / Purple, vấn đề **còn mở vì cần dữ liệu**, file đã sửa.

## Ví dụ D.1 trong giọng thầy, đã kiểm

### Part 1. Issue: Methodological Feedback / Risk of Overfitting on U_j(k)

**The Reviewer's Concern**

"Writing 'We first used a single expected IoU per query type, read that version on the evaluation rows, and then added k' looks like post-hoc tuning on the test set. Did you peek?"

**The Persuasive Frame**

1. **First-Principles Derivation**: State clearly that conditioning on k is forced by the action space: removing the side word returns CURE's side-free box, which is known before the decision, and when that box is absent or in the other half, removing scores zero under the hypothesis.
2. **The Baseline Already Won Anyway**: Point to the last two columns of Table 2: on PadChest-GR the version without k already lies above every training-free baseline.
3. **Disclosure as Strength**: Keep the sentence that says when k was added. A reviewer who finds the order alone will doubt everything; one who reads it next to the geometric reason will not.

**Specific Revisions in Paper**

- **Location:** Section 4.4 (Ablations – Expected IoU given the side-free box)
  - **Rewrite to:** "Removing the side word returns that box, known before the decision: when it is absent or lies wholly in the other half, removing scores zero under the hypothesis, since the reference boxes lie in the hypothesised half, and on ChestX-Det10 it gives 0.282 when the box is on that half. We first used a single expected IoU per query type, read that version on the evaluation rows, and then added k. … on PadChest-GR against every training-free baseline, its intervals lie above zero."

Purple trong ví dụ này: "Never describe model formulation as a chronological sequence" (che quy trình) và "PadChest-GR … proves zero test-set overfitting" (K4: hồ sơ không ghi PadChest-GR chưa bị đọc).
