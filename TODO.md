# Dotfiles TODO

Deferred decisions from the chezmoi migration (Oct 2026).

## To discuss
- **Casks.** How brew casks work (vs. hand-installed apps, updates, App Store)
  before adding any. Candidates: wezterm, karabiner-elements, input-source-pro,
  raycast, 1password, obsidian.
- **Keyboard tweaks** for the macOS defaults script:
  - Faster key repeat (`InitialKeyRepeat 15`, `KeyRepeat 2`). Currently system default.
  - Auto-correct / smart quotes / smart dashes / auto-capitalize /
    double-space-period. Auto-capitalize and period substitution are currently ON.

## Follow-ups
- Switched from `pt` to `ripgrep` (FZF_DEFAULT_COMMAND done). Decide whether to
  drop `dot_ptconfig.toml`.
- Removed from the Brewfile but still installed here (no auto-uninstall):
  the_platinum_searcher, glslang, odin, ols, rust, dotnet, exercism, ddev,
  postgresql@15, caddy, cloudflared, yt-dlp, mpv, graphviz, d2, qpdf, fontforge,
  qemu, gptfdisk, sdl12-compat, ollama, odinfmt, nodenv, node-build; npm likec4,
  @likec4/lsp, opencode-ai, corepack. Uninstall manually if unwanted
  (`brew bundle cleanup --file=Brewfile` lists them).
- nvim config still references glslang, likec4, odinfmt and odin tooling. Decide whether
  to keep those plugins now that the packages aren't in the Brewfile.
- Git `includeIf` for a work identity: depends on where Viget repos live.
- Whether to manage `~/.claude/settings.json` (it holds the chezmoi guard hook).
- Linux portability: hardcoded `/opt/homebrew` paths in `config.fish`,
  `wezterm.lua`, and `dot_gitconfig`.
