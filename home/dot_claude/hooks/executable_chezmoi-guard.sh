#!/usr/bin/env bash
# Claude Code PreToolUse hook: block edits to chezmoi-managed files in $HOME
# and point the agent at the source file in the dotfiles repo instead.
# Managed by chezmoi: home/dot_claude/hooks/executable_chezmoi-guard.sh

export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"

f=$(jq -r '.tool_input.file_path // .tool_input.notebook_path // empty')
[ -z "$f" ] && exit 0

case "$f" in
  "~/"*) f="$HOME/${f#\~/}" ;;
  /*) ;;
  *) f="$PWD/$f" ;;
esac

# Fast path: chezmoi targets are always dotfiles/dotdirs directly under $HOME.
case "$f" in
  "$HOME"/.*) ;;
  *) exit 0 ;;
esac

# Managed symlinks point into the repo (linked/), so editing through them is fine.
[ -L "$f" ] && exit 0

command -v chezmoi >/dev/null || exit 0
src=$(chezmoi source-path "$f" 2>/dev/null) || exit 0

reason="$f is managed by chezmoi; edits there are overwritten by 'chezmoi apply'. Edit the source instead: $src — then run 'chezmoi diff' and 'chezmoi apply'. See AGENTS.md in the dotfiles repo."
jq -n --arg r "$reason" '{hookSpecificOutput: {hookEventName: "PreToolUse", permissionDecision: "deny", permissionDecisionReason: $r}}'
