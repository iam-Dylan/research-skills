# Mẫu văn phong: một khối của thầy và bản đã kiểm, cùng giọng

Nguồn: phần xanh của thầy trong review bài ACIIDS 2027 (`PNDuy-ACIIDS.pdf`, mục A, Part 3), chép nguyên văn, chỉ dựng lại ký hiệu toán. Bên dưới là bản viết lại **cùng khung, cùng giọng**, nhưng mọi số đều truy được và đã bỏ cụm quá tay. Đọc hai bản cạnh nhau để thấy: khung câu, nhãn đậm, lời huấn luyện ("You already have the data…!") giữ nguyên; chỉ nội dung sai bị thay.

---

## A. Bản của thầy (nguyên văn)

### Part 3. Issue: Unknown ε & Marginal Gains at Ultra-Low Error Rates (m < 0.01)

**The Reviewer's Concern**

"In real clinical practice, m is unknown, and natural errors are rare (~0.1%). At m = 0.001, IoU gain is negligible and precision is very low (1 in 22). Why is this useful?"

**The Persuasion Strategy**

1. **Robustness to Misspecified ε**: You **already have the data in Section 4.4 and Figure 2**! Emphasize that fixing ε = 0.05 costs virtually nothing (0.001–0.002 IoU) when m = 0, but provides strong insurance if errors occur.
2. **Context of Generative AI vs. Final Verified Reports**: While **human expert radiologists** make side errors at ~0.1–0.5% in final reports, **generative vision-language models** (like LLaVA-Med, MAIRA-2, MedGemma) hallucinate or swap lateralities at much higher rates (5% to 20%) during automated draft generation. ⚠ *số không có nguồn*
3. **Framing Flag Precision as Asymmetric Clinical Triage**: When m is low, the goal of automated systems is not autonomous silent swapping, but **high-recall triage** (catching the critical 1-in-1000 surgical hazard) while maintaining false alarms low enough (1.4%) not to cause alert fatigue.

**Specific Revisions in Paper**

- **Location:** Section 4.4 (Ablations – Misspecified error rate)
  - **Strengthen the concluding sentences of this paragraph:**
    "In real deployments, the ground-truth error rate m is rarely known. However, our ablation confirms that the policy is remarkably robust to misspecified ε: fixing a conservative prior of ε = 0.05 incurs an imperceptible penalty of ≤ 0.002 IoU when all input side words are perfectly correct (m = 0), while retaining massive IoU safeguards (+0.078 to +0.081 over CURE) if error bursts occur. Thus, practitioner knowledge of the exact m is not required; setting ε ∈ [0.01, 0.05] serves as a near-costless 'seatbelt' for grounding models." ⚠ *"remarkably", "imperceptible", "massive", "seatbelt" là tính từ cường độ; khoảng [0.01, 0.05] sai: ε = 0.01 chỉ hơn CURE 0.030/0.040 ở m = 0.5*
- **Location:** Section 5 (Discussion – Use for report checking)
  - **Current Text:** "Wrong side words are rare in final reports, so the precision of a flag is low at any realistic false-alarm rate, and the gain in IoU, which scales with m, is small. …"
  - **Rewrite to persuade:**
    "**Clinical Context: Diagnostic Triage vs. Generative Hallucination.** Two distinct deployment regimes govern our method: (1) **Generative AI Drafting:** When modern VLMs draft preliminary radiology reports, unprompted hallucinations and laterality confusions occur in 5% to 15% of complex sentences. … (2) **Human Verification & Sentinel Triage:** In verified reports from attending radiologists, laterality slips are rare (m ≈ 0.001), making autonomous rewriting inappropriate. Here, our model operates strictly in its flagging regime …" ⚠ *5–15% không có nguồn*

**Summary Checklist of Changes to Apply**

| Reviewer Doubt | Paper Location | The Persuasive Frame |
|---|---|---|
| What if ε is unknown? | Sec 4.4 | Conservative setting (ε = 0.05) costs ≤ 0.002 IoU when inputs are clean, providing a near-costless safety net. |
| Why care about m < 0.01? | Sec 5 | Distinguish human reports (sentinel flagging to catch rare catastrophic wrong-sided interventions) from LLM/VLM generation (where hallucinations reach 5–15%). |

---

## B. Bản đã kiểm (cùng giọng, số truy được)

### Part 3. Issue: Unknown ε & Marginal Gains at Ultra-Low Error Rates (m < 0.01)

**The Reviewer's Concern**

"In real clinical practice, m is unknown, and natural errors are rare. At m = 0.001, the IoU gain is negligible and only about one flag in 22 is true. Why is this useful?"

**The Persuasion Strategy**

1. **Robustness to Misspecified ε**: You **already have the data in Section 4.4 and Figure 2**! Emphasize that fixing ε = 0.05 costs at most 0.002 IoU when m = 0, and still keeps about two thirds of the gain over CURE at m = 0.5. Be precise about the lower end: ε = 0.01 gives most of that gain away, so do not promise a range.
2. **Where Correction Pays vs. Where Flagging Pays**: The gain grows with m. Point out that automatic correction pays most where side words are often wrong, and let the reader judge where that is; do not quote an error rate for generative models unless you can cite it.
3. **Framing Flag Precision as Asymmetric Clinical Triage**: When m is low, the goal is not silent swapping but **triage**: at the transferred threshold the flag fires on 1.4 of every 100 correct sentences and catches about two thirds of wrong ones.

**Specific Revisions in Paper**

- **Location:** Section 4.4 (Ablations – Misspecified error rate)
  - **Strengthen the concluding sentences of this paragraph:**
    "In use the share of wrong side words is unknown. However, the policy does not need it exactly: fixing ε = 0.05 costs at most 0.002 IoU against CURE when every side word is right (m = 0), and still exceeds CURE by 0.078 and 0.081 at m = 0.5, about two thirds of the gain. Setting ε well below the true share gives up most of it: ε = 0.01 exceeds CURE by only 0.030 and 0.040 at m = 0.5."
- **Location:** Section 5 (Discussion – Use for report checking)
  - **Current Text:** "Wrong side words are rare in final reports, so …"
  - **Rewrite to persuade:**
    "Wrong side words are rare in final reports, and there the flag serves best as a triage signal for the report's reader: when the model would swap a side word, it can ask instead. At the transferred threshold of Section 4.2, it flags 1.4 of every 100 correct side-naming sentences and about two thirds of wrong ones; at one wrong side word in a thousand, about one flag in 22 would be true. The gain grows with m, so automatic correction pays most where side words are often wrong."

**Summary Checklist of Changes to Apply**

| Reviewer Doubt | Paper Location | The Persuasive Frame |
|---|---|---|
| What if ε is unknown? | Sec 4.4 | ε = 0.05 costs ≤ 0.002 IoU on clean inputs and keeps about two thirds of the gain at m = 0.5; ε far below m gives the gain away. |
| Why care about m < 0.01? | Sec 5 | Low m: triage flag (1.4% false alarms, two thirds caught). High m: automatic correction, where the gain grows. |

**Evidence Ledger**

| Claim | Source | Check |
|---|---|---|
| ε = 0.05 costs ≤ 0.002 at m = 0 | `results.json` › `{fresh,pad}.fixed_eps["0.05"]["0.0"].CURE` | ✓ |
| +0.078 / +0.081 over CURE at m = 0.5 | `results.json` › `{fresh,pad}.fixed_eps["0.05"]["0.5"].CURE` | ✓ |
| ε = 0.01: +0.030 / +0.040 | `results.json` › `{fresh,pad}.fixed_eps["0.01"]["0.5"].CURE` | ✓ |
| 1.4% false alarms, 66.3% caught, 1 in 22 | `results.json` › `pad.fixed_thr.rule` (`fpr`, `tpr`, `ppv["0.001"]`) | ✓ |
| 5–15% / 5–20% VLM error rates | — | ✗ bỏ, không nguồn |
