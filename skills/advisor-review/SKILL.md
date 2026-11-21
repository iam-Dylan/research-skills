---
name: advisor-review
description: Review a paper draft the way the advisor does, against the five things every paper must have — A sound assumptions, B real novelty, C evidence as wide as the claims, D rigorous process and internal consistency, E clarity — and write reviewer-style issues (the "red" layer) built from the paper's own sentences and numbers, ranked by severity and by whether text can fix them. Use when the user asks to review or self-review a paper or draft, find its weaknesses before submission, play the reviewer, "review như thầy", "soát paper theo 5 mục / ABCDE", "tìm lỗi reviewer sẽ bắt", or types /advisor-review. Fixes are written by the advisor-revise skill, not here.
---

# Advisor review: năm điều một paper phải có

Skill này tái tạo **lớp đỏ** trong cách thầy review: đọc bài như một reviewer khó tính, đi dọc chuỗi lập luận của bài và đo mỗi mắt xích bằng thước khó nhất. Kết quả là danh sách vấn đề theo năm mục A–E. Không viết đề xuất sửa ở đây; sửa là việc của skill `advisor-revise`.

## Năm điều

| Mục | Điều bài phải có | Câu hỏi tổng của reviewer | Tiêu chí review tương ứng |
|---|---|---|---|
| **A** | Mỗi giả định có lý do | Thế giới có đơn giản như mô hình không? Giả định chỉ đúng gần đúng thì phương pháp còn có ích không? | Soundness |
| **B** | Mỗi đóng góp đúng tầm | Cái gì thật sự mới, so với kết quả cổ điển và các thành phần có sẵn? | Novelty |
| **C** | Mỗi claim có bằng chứng rộng bằng nó | Bằng chứng có thật, có tổng quát, có thực tế bằng chữ trong claim không? | Significance / evidence |
| **D** | Quy trình và logic không kẽ hở | Có chọn gì sau khi xem test không? Giả định có mâu thuẫn với chính số liệu của bài không? | Rigor |
| **E** | Cơ chế hiểu được ngay, thấy được chỗ hỏng | Đọc 10 giây có hiểu cơ chế không? Phương pháp hỏng ở đâu? | Clarity |

## Quy trình

### Bước 0. Đọc trọn bài và dựng chuỗi lập luận

Đọc toàn bộ nguồn (`main.tex` hoặc PDF), kể cả phụ lục và caption. Ghi ra, mỗi dòng một mắt xích:

1. **Bài toán:** bài giải quyết gì, cho ai.
2. **Giả định:** mọi giả định mô hình, kể cả ngầm (không gian trạng thái, cấu trúc nhiễu, tham số coi như biết, độc lập, prior, điều kiện dữ liệu).
3. **Lý thuyết:** từng mệnh đề, định lý, và điều kiện của nó.
4. **Phương pháp:** các thành phần, cái nào có sẵn, cái nào mới.
5. **Bằng chứng:** dữ liệu, mô hình được thử, baseline, số chính.
6. **Claim:** các chữ lớn trong title, abstract, contributions, conclusion ("training-free", "general", "robust", "correct", "lightweight"...).
7. **Lời tự khai:** mọi câu Limitations, Scope, "post hoc", "after reading results", "too rare to evaluate", "we first tried...".

Chuỗi này là bản đồ để tấn công. Mỗi vấn đề sau này phải chỉ được vào một mắt xích.

### Bước 1. Sinh vấn đề theo từng mục

Với mỗi mục, chạy các thao tác dưới đây trên chuỗi lập luận. Mỗi thao tác có thể sinh 0 hoặc nhiều vấn đề.

**A. Giả định**
- Liệt kê từng giả định; với mỗi cái, tìm **một phản ví dụ cụ thể ngoài đời** (một loại dữ liệu, một bệnh, một tình huống) làm nó sai.
- Hỏi: khi giả định lệch thì kết quả đổi ra sao? Bài có đo độ nhạy không?
- Hỏi: tham số bài coi như biết (tỷ lệ lỗi, prior, ngưỡng) thì ngoài đời có biết không?
- Hỏi: ở mức tham số **thực tế** (không phải mức bài chọn để minh hoạ), lợi ích còn bao nhiêu? Dùng chính số của bài.

**B. Tính mới**
- Với mỗi mệnh đề, **gọi tên kết quả cổ điển** nó áp dụng (Neyman–Pearson, tính lồi của Bayes risk, Jensen, bất đẳng thức đã biết...).
- **Tả phương pháp bằng câu kém hấp dẫn nhất** có thể ("ensemble 5 mô hình có sẵn + logistic regression + argmax"). Hỏi còn lại gì là mới.
- Hỏi: không có kiến trúc, hàm mất mát, hay công thức hoá mới thì đóng góp nằm ở đâu?

**C. Bằng chứng**
- Với mỗi chữ lớn trong claim, hỏi: **cần bằng chứng gì để nói chữ này, và bài đã có chưa?**
- Soát ba trục:
  - *Thật:* dữ liệu, lỗi, nhiễu là tổng hợp hay tự nhiên? Tổng hợp thì có bỏ sót dạng lỗi thật nào không?
  - *Tổng quát:* chạy trên bao nhiêu hệ thống, mô hình, tập dữ liệu? Claim có rộng hơn không?
  - *Thực tế:* chi phí suy luận, bộ nhớ, latency có trái với chữ "nhẹ", "training-free", "deployable" không?
- Mô hình hay hệ thống được nhắc trong Introduction để dựng vấn đề mà không có trong thí nghiệm là một đòn sẵn.

**D. Quy trình và logic**
- **Thu hết lời tự khai** ở Bước 0. Mỗi câu "chọn sau khi xem kết quả", "đọc trên tập đánh giá rồi thêm..." là một vấn đề rò rỉ test tiềm năng.
- Hỏi: lựa chọn nào (đặc tả, ngưỡng, siêu tham số, tập con) được làm sau khi thấy số? Có tập validation tách riêng không? Tập "external" có thật sự chưa bị đọc không?
- **Tìm con số trái giả định**: một tỷ lệ, một phân bố trong chính bài mâu thuẫn với điều bài áp đặt (ví dụ prior 0.5 trong khi dữ liệu 61.5%).
- Hỏi: hai phần của bài có nói hai điều khác nhau về cùng một thứ không (số, định nghĩa, tên)?

**E. Trình bày**
- Phương trình nào dồn nhiều ký hiệu mà không có câu diễn giải?
- Có phân tích lỗi không? Có ví dụ hoặc thống kê về chỗ phương pháp sai không?
- Dàn trang: **render PDF và nhìn trang**, không suy từ text extract. Câu bị "đảo" trong text extract thường chỉ là câu liền nhau qua một tiêu đề.

### Bước 2. Làm đòn mạnh nhất

- **Ưu tiên vấn đề dựng từ chữ và số của chính bài.** Trích nguyên câu, nguyên số. Tác giả không chối được những đòn này.
- Mỗi vấn đề viết theo khuôn ba nhịp:
  1. **Chuẩn**: thực tế lâm sàng, chuẩn ngành, hoặc điều reviewer mong đợi.
  2. **Bài làm gì**: bài làm hay bỏ điều đó ở đâu (trích câu, số, section).
  3. **Hệ quả**: nếu đem dùng thật thì sao, hoặc reviewer sẽ kết luận gì.

### Bước 3. Kiểm từng vấn đề trước khi ghi

- Câu trích có **đúng nguyên văn** trong nguồn không? (grep nguồn.)
- Số trích có khớp bài không?
- Vấn đề có phải do text extract hay đọc nhầm không? (render trang nếu là dàn trang.)
- Vấn đề có chỉ được vào một mắt xích không? Không chỉ được thì bỏ.

Vấn đề không qua kiểm thì không ghi, hoặc ghi rõ là "không phải lỗi thật" kèm lý do.

### Bước 4. Xếp hạng

Mỗi vấn đề gắn hai nhãn:
- **Mức nặng:** *Cao* (đánh vào claim trung tâm hoặc độ tin cậy), *Trung bình* (đánh vào định vị đóng góp), *Thấp* (trình bày).
- **Cách chữa:** *Chữ* (lập luận, định vị lại, số đã có), *Dữ liệu* (cần chạy thêm), *Không phải lỗi*.

Mặc định: mục C thường nặng nhất và hay cần dữ liệu; mục D nặng vì chạm uy tín; mục E nhẹ.

## Đầu ra

Viết theo đúng thứ tự A → E. Trích dẫn từ bài giữ nguyên ngôn ngữ của bài; phần còn lại theo ngôn ngữ người dùng.

```markdown
## A. <Tên mục>

**Câu hỏi tổng:** <một câu>

1. **<Tên vấn đề>** (Mức: Cao · Chữa: Chữ | Dữ liệu)
   - Chuẩn: ...
   - Bài: "<trích nguyên văn>" (§x.y) / số <...>
   - Hệ quả: ...

2. ...
```

Kết thúc bằng bảng tổng:

| Mục | Tiêu chí | Số vấn đề | Mức nặng nhất | Chữa bằng chữ được không |
|---|---|---|---|---|

và một câu nói vấn đề nào reviewer chắc chắn sẽ hỏi lại dù bài viết khéo đến đâu (thường là các vấn đề "Dữ liệu" của mục C).

Sau đó gợi ý chạy `advisor-revise` để viết đề xuất sửa cho từng vấn đề.

## Không làm

- Không đề xuất sửa, không viết câu thay thế (việc của `advisor-revise`).
- Không bịa vấn đề không chỉ được vào chữ hoặc số của bài.
- Không coi lỗi do text extract là lỗi dàn trang khi chưa render trang.
- Không gộp hai vấn đề khác mắt xích thành một.

## Ví dụ tham chiếu (ACIIDS 2027, latent-side paper)

| Mục | Vấn đề | Thao tác đã sinh ra nó |
|---|---|---|
| A.1 | S ∈ {L, R} bỏ câu hai bên và đường giữa | Phản ví dụ ngoài đời: tràn dịch hai bên, tim to |
| A.2 | Kênh lỗi đối xứng | Phản ví dụ: lỗi lệch theo giải phẫu, ngữ cảnh |
| A.3 | ε phải biết; ở m ≈ 0.1% lợi ích +0.006, flag đúng 1/22 | Dùng chính số của bài ở mức tham số thực tế |
| B.1 | Prop. 1, 2 là Neyman–Pearson và tính lồi Bayes | Gọi tên kết quả cổ điển |
| B.2 | Chỉ là ensemble + LR + argmax | Tả bằng câu kém hấp dẫn nhất |
| C.1 | Chỉ lỗi tổng hợp | Trích lời tự khai "every wrong side word in this study is synthetic" |
| C.2 | Chỉ CURE làm box writer, MAIRA-2 chỉ ở Intro | Hệ thống ở Intro không có trong thí nghiệm |
| C.3 | 5 mô hình mỗi truy vấn vs "training-free" | Chữ lớn trong claim vs chi phí suy luận |
| D.1 | U_j(k) chọn sau khi đọc kết quả | Trích lời tự khai "read that version on the evaluation rows" |
| D.2 | Prior 0.5 vs 61.5% bên trái | Con số trong bài trái giả định |
| E.1 | "Dàn trang vỡ" | *Không phải lỗi:* reviewer đọc text extract; render trang thì không vỡ |
| E.2 | Eq. 3 dày ký hiệu | Phương trình không có câu diễn giải |
| E.3 | Không có phân tích lỗi | Thiếu chỗ phương pháp hỏng |
