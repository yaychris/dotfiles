# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/). Source state lives in `home/`
(see `.chezmoiroot`). Files that apps rewrite are symlinked from `linked/`.
Details: [AGENTS.md](AGENTS.md).

## New machine

1. Install [Homebrew](https://brew.sh), then chezmoi, and clone this repo:
   ```sh
   brew install chezmoi
   git clone git@github.com:yaychris/dotfiles.git ~/code/dotfiles
   ```
2. Set up chezmoi and apply the dotfiles. This also installs the `Brewfile`.
   ```sh
   chezmoi init --source ~/code/dotfiles   # prompts: machine type, name, email, GPG key
   chezmoi diff                            # review
   chezmoi apply
   ```
3. Apply macOS settings (Dock, Finder, keyboard shortcuts, Colemak, trackpad…):
   ```sh
   ~/code/dotfiles/setup/macos-defaults.sh
   ```
4. In Mission Control, create desktops until there are 4.
5. Assign apps to desktops:
   ```sh
   ~/code/dotfiles/setup/space-bindings.sh
   ```
6. Log out and back in, so the input source, dark mode, and trackpad settings
   take full effect.

The `setup/` scripts are never run automatically. They're safe to re-run, e.g.
after adding a setting.

## Day to day

```sh
chezmoi status            # anything drifted?
chezmoi edit ~/.foo       # edit source for a target (or edit home/… directly)
chezmoi diff && chezmoi apply
chezmoi re-add ~/.foo     # pull a live edit back into the repo
```
