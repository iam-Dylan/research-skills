#!/bin/sh
# CLAUDE_BIN for the ARIS claude-review bridge: the reviewer session runs with no hooks
# (user, project or plugin), so the executor's hook text never reaches the reviewer.
exec "$HOME/.local/bin/claude" --settings '{"disableAllHooks":true}' "$@"
