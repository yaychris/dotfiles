# Dotfiles — agent instructions

These dotfiles are managed by [chezmoi](https://www.chezmoi.io/). The files in
`$HOME` are **generated copies**. This repo is the source of truth.

## The one rule

**Never edit a managed file in `$HOME` directly.** Edit its source in this repo,
then apply. To find the source for a target:

```bash
chezmoi source-path ~/.config/fish/config.fish
# → /Users/chris/code/dotfiles/home/dot_config/fish/config.fish
```

If that command errors with "not managed", the file is not in the repo (see
"Adding a new file" below, or "Symlinked paths").

## Workflow

1. Edit the source file under `home/` (or `linked/`, see below).
2. `chezmoi diff` to preview what will change in `$HOME`.
3. `chezmoi apply` (or `chezmoi apply <target>` to apply a single file).
4. Commit in this repo. Never commit secrets.

Before starting work, run `chezmoi status`. Any output means `$HOME` has drifted
from the repo. Resolve it first with `chezmoi re-add <target>` (live → repo),
`chezmoi merge <target>`, or `chezmoi apply <target>` (repo → live, which
discards the live change). Ask the user which one when it's unclear.

## Layout

```
.chezmoiroot          → "home": chezmoi's source state lives in home/
home/                 → mirrors $HOME, using chezmoi naming (below)
  .chezmoi.toml.tmpl  → per-machine prompts (kind, name, email, signingkey)
  .chezmoiignore      → target paths never managed; OS-conditional ignores
linked/               → real files that $HOME symlinks to (see below)
AGENTS.md, README.md  → docs (outside home/, so chezmoi ignores them)
```

## Naming in `home/`

| Source name                   | Target in `$HOME`                       |
|-------------------------------|-----------------------------------------|
| `dot_foo`                     | `.foo`                                  |
| `executable_foo`              | `foo` with `+x`                         |
| `private_foo`                 | `foo` with `0600`/`0700` permissions    |
| `foo.tmpl`                    | `foo`, rendered as a Go text/template   |
| `symlink_foo.tmpl`            | symlink `foo`, target is file contents  |
| `run_onchange_*.sh[.tmpl]`    | script, re-run when its contents change |

Prefixes stack: `home/dot_bin/executable_prj` → `~/.bin/prj` (executable).
Nested dotfiles are renamed too: `home/dot_config/nvim/dot_stylua.toml`.

## Adding a new file

Create it in `$HOME` first, then run `chezmoi add <target>`. That copies it into
`home/` with the correct name. Alternatively, create it under `home/` with the
correct name and run `chezmoi apply`. Avoid `private_` unless the permissions
really matter.

## Symlinked paths (`linked/`)

Some files are rewritten by their apps, so `$HOME` holds a **symlink into this
repo** instead of a copy. Those edits land in git automatically, so commit them.

| Target                                   | Real file                                |
|------------------------------------------|------------------------------------------|
| `~/.config/wezterm/workspaces/`          | `linked/config/wezterm/workspaces/`      |
| `~/.config/karabiner/`                   | `linked/config/karabiner/`               |
| `~/.config/nvim/nvim-pack-lock.json`     | `linked/config/nvim/nvim-pack-lock.json` |

Editing these through either path is fine; no `chezmoi apply` needed. To add
another path like this:
1. Move the real file or dir into `linked/`.
2. Add `home/.../symlink_<name>.tmpl` containing
   `{{ .chezmoi.workingTree }}/linked/<path>`.

## Per-machine differences

Keep files plain. When something differs per machine, use the tool's own
include mechanism and template only a small `.local` file:

- git: `dot_gitconfig` ends with `[include] path = ~/.gitconfig.local`, and
  `dot_gitconfig.local.tmpl` renders the identity from `.chezmoi.toml.tmpl` data.
- zsh: `~/.zshrc.local` is sourced if present (untracked).
- fish: `~/.config/fish/secrets.fish` is sourced if present (untracked, and
  holds API keys).

Available template data: `.kind` (`personal`|`work`), `.name`, `.email`,
`.signingkey`, plus chezmoi built-ins such as `.chezmoi.os` (`darwin`|`linux`).
OS-specific files are excluded in `home/.chezmoiignore`.

## Secrets: never commit

- `~/.config/fish/secrets.fish`, `~/.config/gh/hosts.yml`, any `*.local`
  file, API tokens, keys.
- Check `git diff --cached` before every commit.

## Not managed (by design)

- fish `fish_variables`: machine state. Shared fish settings go in
  `home/dot_config/fish/conf.d/settings.fish` as `set -g`.
- `~/.vim/plugged`: run `:PlugInstall`.
- App state in `~/.config` (raycast, iterm2, etc.).
