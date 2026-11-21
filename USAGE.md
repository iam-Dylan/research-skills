# When to use which skill

This file has two jobs. It tells the user which skill fits a task, and it tells Claude which skill to call.
`~/.claude/CLAUDE.md` imports it, so it is loaded in every session.

## Rules for Claude

1. **Use the skill.** When a task matches a row below, call that skill with the Skill tool before starting the work.
   If two rows fit, take the narrower one. If no row fits, work as usual.
2. **The project comes first.** A project's `CLAUDE.md` and the user's saved feedback override a skill's defaults:
   wording rules, frozen or locked passages, statistics, where experiments run, and what may be pushed. If a skill
   step conflicts with them, skip that step and say which one.
3. **Ask before long autonomous runs.** Skills marked **(explicit)** run many rounds and edit files on their own.
   Start one only when the user asks for it or for that whole workflow. For a smaller request, use the one-step
   skill in the same section.
4. **Claude is the reviewer.** ARIS skills take their reviewer from `.aris/reviewer.json`. If the project has no
   such file, add `— reviewer: claude` to the call. Do not fall back to Codex.
5. **Missing sub-skills are skipped.** When a skill points to one that is not installed (`experiment-bridge`,
   `run-experiment`, `proof-checker`, `overleaf-sync`, `paper-illustration`, `deepxiv`, `exa-search`), skip that step
   and say so.
6. **Some skills are off.** The user turned off `ml-paper-writing`, `research-paper-writing`, `human` and
   `academic-search`. Do not use them.

## Literature and ideas

| Task | Skill | Notes |
|---|---|---|
| Related work, literature review, "what does this field say" | `research-lit` | First stop for any search |
| Explain or summarize one paper (arXiv ID or URL) | `alphaxiv` | One paper only |
| Download arXiv PDFs to the local library | `arxiv` | |
| Published venue papers, citation counts | `semantic-scholar` | |
| Citation graph, affiliations, funding | `openalex` | |
| "Has anyone done this?" | `novelty-check` | Before committing to an idea |
| Brainstorm and rank directions | `idea-creator` | `idea-discovery` runs the full chain **(explicit)** |
| Turn a vague direction into a method plan | `research-refine` | `research-refine-pipeline` adds the experiment plan **(explicit)** |
| Keep a persistent map of papers, ideas and claims | `research-wiki` | `wiki-enrich` fills the TODO paper pages |

## Experiments and results

| Task | Skill | Notes |
|---|---|---|
| Experiment roadmap: runs, baselines, ablations, budget | `experiment-plan` | Plans only; experiments run wherever the project says |
| Ablations once the main result holds | `ablation-planner` | |
| Statistics and comparison tables from finished runs | `analyze-results` | |
| Check experiment code for leakage, fake ground truth, wrong normalization | `experiment-audit` | Before any claim |
| Which claims the results support and which they don't | `result-to-claim` | After runs, before writing |

## Writing

| Task | Skill | Notes |
|---|---|---|
| Paper outline from results | `paper-plan` | |
| Draft or rewrite LaTeX sections | `paper-write` | |
| From narrative report to finished PDF | `paper-writing` | **(explicit)** |
| Compile LaTeX and fix build errors | `paper-compile` | |
| Plots and tables from result files | `paper-figure` | |
| Architecture or pipeline diagram | `figure-spec` | `mermaid-diagram` for quick flow or sequence diagrams |
| Remove AI tells from English prose | `humanizer` | `avoid-ai-writing` for a detect-only audit |
| Strip AI metadata, invisible Unicode, watermarks | `remove-ai-marks` | Only when the user asks |

## Review before submission

| Task | Skill | Notes |
|---|---|---|
| Self-review the way the advisor does (A–E) | `advisor-review` | **Default for "review my paper"** |
| Write fixes for review comments, in the advisor's format | `advisor-revise` | Input: comments from `advisor-review`, the advisor, or a reviewer |
| Simulated panel of five reviewers with an editorial decision | `academic-paper-reviewer` | Before submitting, after `advisor-review` |
| Critique of an idea, design or result (not a whole paper) | `research-review` | |
| Strongest possible rejection paragraph, then its defence | `kill-argument` | Last check before submission or rebuttal |
| Every number in the paper against the result files | `paper-claim-audit` | |
| Citations exist and support the sentence they are cited for | `citation-audit` | |
| `.bib` fields (authors, year, venue, DOI) against web records | `citation-crosscheck` | |
| Review, fix, re-review in a loop | `auto-review-loop` (whole project), `auto-paper-improvement-loop` (paper only) | **(explicit)** |
| Integrity forensics sweep | `integrity-forensics` | Do not use: it requires GPT auditors and cannot use Claude |

A typical order before submission: `advisor-review` → `advisor-revise` → `paper-claim-audit` → `citation-audit` →
`academic-paper-reviewer` → `kill-argument`.

## After review

| Task | Skill | Notes |
|---|---|---|
| Reply to venue reviewers (rebuttal letter) | `rebuttal` | Changes inside the paper go through `advisor-revise` |
| Move a finished paper to another venue, text only | `resubmit-pipeline` | **(explicit)** |

## Talks and posters

| Task | Skill | Notes |
|---|---|---|
| Whole talk: outline, slides, notes, checks | `paper-talk` | **(explicit)** |
| Beamer and PPTX slides from a paper | `paper-slides` | |
| Polish an existing deck page by page | `slides-polish` | |
| Conference poster | `paper-poster-html` | |
| Render an ARIS report (Markdown or JSON) as HTML | `render-html` | |

## Other

| Task | Skill | Notes |
|---|---|---|
| Search the web for a software error or API problem | `web-debug-search` | Results are not citable evidence |
