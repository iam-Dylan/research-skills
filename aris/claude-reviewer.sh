#!/bin/sh
# CLAUDE_BIN for the ARIS claude-review bridge. The reviewer session starts with no hooks
# (user, project or plugin), no CLAUDE.md files and no auto-memory, so nothing from the
# executor's setup or the author's saved preferences reaches the reviewer.
exec "$HOME/.local/bin/claude" --settings "{\"disableAllHooks\":true,\"autoMemoryEnabled\":false,\"claudeMdExcludes\":[\"$HOME/.claude/CLAUDE.md\",\"**/CLAUDE.md\",\"**/CLAUDE.local.md\",\"**/AGENTS.md\",\"**/AGENTS.local.md\",\"**/.claude/CLAUDE.md\",\"**/.claude/rules/**\"]}" "$@"
