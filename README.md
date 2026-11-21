# research-skills

The Claude Code skills I use for research: ideas, literature, experiments, paper writing, review, rebuttal, slides.
Snapshot of `~/.claude/skills/` taken on 2026-11-21; the files are copied unchanged.

**Which skill for which task: [USAGE.md](USAGE.md).**

## Install

```bash
cp -R skills/* ~/.claude/skills/
cat >> ~/.claude/CLAUDE.md <<'EOF'

# Research skills
For any research task, follow the routing below and call the listed skill before doing the work yourself.
@~/Documents/research-skills/USAGE.md
EOF
```

The import makes Claude load `USAGE.md` in every session and project. It assumes the repository is cloned to
`~/Documents/research-skills`.

A `UserPromptSubmit` hook repeats the core rules with every prompt, so they stay in view in long sessions. It
prints [`hooks/reminder.txt`](hooks/reminder.txt). Add it to `~/.claude/settings.json`; this keeps any hooks
already there:

```bash
S=~/.claude/settings.json
jq '.hooks.UserPromptSubmit = ((.hooks.UserPromptSubmit // []) + [{"hooks":[{"type":"command","command":"cat \"$HOME/Documents/research-skills/hooks/reminder.txt\" 2>/dev/null || true","timeout":5}]}])' "$S" > "$S.tmp" && mv "$S.tmp" "$S"
```

To change the reminder, edit `hooks/reminder.txt`; the hook reads it fresh each time. To turn it off, use `/hooks`.

Keep `shared-references/` next to the other skills, because the ARIS skills read it through `../shared-references/`.

### ARIS, with Claude as the reviewer

The ARIS skills also need the ARIS checkout, for its `tools/` helpers and reviewer bridges. Their default reviewer is
Codex; here it is switched to Claude Code through ARIS's own `claude-code` route.

```bash
git clone https://github.com/wanshuiyin/Auto-claude-code-research-in-sleep ~/.claude/Auto-claude-code-research-in-sleep
git -C ~/.claude/Auto-claude-code-research-in-sleep checkout 4ba94ae   # version these skills were copied from
mkdir -p ~/.aris && echo "$HOME/.claude/Auto-claude-code-research-in-sleep" > ~/.aris/repo

claude mcp add claude-review -s user \
  -e CLAUDE_BIN=$HOME/Documents/research-skills/aris/claude-reviewer.sh \
  -e ANTHROPIC_DEFAULT_HAIKU_MODEL=claude-opus-5-5 \
  -e CLAUDE_REVIEW_DEBUG_LOG=$HOME/.aris/claude-review-debug.log \
  -e CLAUDE_REVIEW_STATE_DIR=$HOME/.aris/claude-review \
  -- python3 ~/.claude/Auto-claude-code-research-in-sleep/mcp-servers/claude-review/server.py
```

Then, in each project's git root:

```bash
mkdir -p .aris && echo '{"backend": "claude-code"}' > .aris/reviewer.json
```

- [`aris/claude-reviewer.sh`](aris/claude-reviewer.sh) starts the reviewer with no hooks (user, project or
  plugin, including the prompt reminder below), no `CLAUDE.md` or `AGENTS.md` files and no auto-memory. The
  author's setup and saved writing preferences never reach the reviewer. It sees only the prompt and the files it
  is asked to read.
- `ANTHROPIC_DEFAULT_HAIKU_MODEL` keeps the reviewer session on a single model. If Haiku also runs, the bridge cannot
  report which model reviewed, and `review_gate.py` returns `review_unavailable`.
- The debug log holds full prompts, so it is moved from `/tmp` to `~/.aris`.
- Claude reviewing Claude is same-family. ARIS records a positive verdict as `provisional`, not `accepted`.
- `— reviewer: codex` on a single call still selects Codex, if a Codex MCP is installed.

### Plugins

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
| academic-search | source not recorded |
| advisor-review, advisor-revise | mine: review a draft against the advisor's five criteria A–E, then write the revisions in the advisor's format |

`advisor-review` and `advisor-revise` quote an advisor's review and a paper under double-blind review. Keep this
repository private, or remove those examples before sharing it.
