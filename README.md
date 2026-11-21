# research-skills

The Claude Code skills I use for research: ideas, literature, experiments, paper writing, review, rebuttal, slides.
Snapshot of `~/.claude/skills/` taken on 2026-11-21; the files are copied unchanged.

## Install

```bash
cp -R skills/* ~/.claude/skills/
```

Keep `shared-references/` next to the other skills, because the ARIS skills read it through `../shared-references/`.

These are installed as plugins, not copied here:

```
/plugin marketplace add blader/humanizer
/plugin install humanizer@humanizer
/plugin marketplace add conorbronsdon/avoid-ai-writing
/plugin install avoid-ai-writing@conorbronsdon-skills
```

## Sources

Most of these are third-party. Each skill keeps the license file it came with, if it had one. Check the upstream
license before making this repository public.

| Skills | Source |
|---|---|
| ablation-planner, alphaxiv, analyze-results, arxiv, auto-paper-improvement-loop, auto-review-loop, citation-audit, citation-crosscheck, experiment-audit, experiment-plan, figure-spec, idea-creator, idea-discovery, integrity-forensics, kill-argument, mermaid-diagram, novelty-check, openalex, paper-claim-audit, paper-compile, paper-figure, paper-plan, paper-poster-html, paper-slides, paper-talk, paper-write, paper-writing, rebuttal, render-html, research-lit, research-refine, research-refine-pipeline, research-review, research-wiki, resubmit-pipeline, result-to-claim, semantic-scholar, slides-polish, web-debug-search, wiki-enrich, `shared-references/` | ARIS, [wanshuiyin/Auto-claude-code-research-in-sleep](https://github.com/wanshuiyin/Auto-claude-code-research-in-sleep) (paper-slides edited locally) |
| academic-paper-reviewer | [Imbad0202/academic-research-skills](https://github.com/Imbad0202/academic-research-skills) |
| ml-paper-writing | Orchestra Research, [orchestra-research/AI-research-SKILLs](https://github.com/orchestra-research/AI-research-SKILLs) |
| research-paper-writing | [master-cai/Research-Paper-Writing-Skills](https://github.com/master-cai/Research-Paper-Writing-Skills) @ 77e7c2c |
| human | [mindangg/human-skill](https://github.com/mindangg/human-skill) @ 0a5dea8 (MIT) |
| remove-ai-marks | Guillaume Meyer and contributors (MIT) |
| paper-reviewer | Aaron Storey |
| paper-review-pipeline, academic-search | source not recorded |
| advisor-review, advisor-revise | mine: review a draft against the advisor's five criteria A–E, then write the revisions in the advisor's format |

`advisor-review` and `advisor-revise` quote an advisor's review and a paper under double-blind review. Keep this
repository private, or remove those examples before sharing it.
