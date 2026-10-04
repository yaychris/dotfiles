# dotfiles

Managed with [chezmoi](https://www.chezmoi.io/). Source state lives in `home/`
(see `.chezmoiroot`). Files that apps rewrite are symlinked from `linked/`.
Details: [AGENTS.md](AGENTS.md).

## New machine

```sh
brew install chezmoi
git clone git@github.com:yaychris/dotfiles.git ~/code/dotfiles
chezmoi init --source ~/code/dotfiles   # prompts: machine type, name, email, GPG key
chezmoi diff                            # review
chezmoi apply
```

## Day to day

```sh
chezmoi status            # anything drifted?
chezmoi edit ~/.foo       # edit source for a target (or edit home/… directly)
chezmoi diff && chezmoi apply
chezmoi re-add ~/.foo     # pull a live edit back into the repo
```
