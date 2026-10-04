# Init Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

###
# Aliases
alias cl "clear"

alias l "ls"
alias ll "ls -AlFG"
alias lal "ls -AlFG"
alias cl "clear"
alias fn "find . -name"

# Docker
alias d "docker"
alias dc "docker compose"

# Git
alias amend "git commit --amend"
alias gai   "git add -i"
alias gap   "git add --patch"
alias gb    "git branch"
alias gba   "git branch -a"
alias gcav  "git commit -av"
alias gco   "git checkout"
alias gcp   "git cherry-pick"
alias gcv   "git commit -v"
alias gd    "git diff"
alias gds   "git diff --staged"
alias glod  "git log --oneline --decorate"
alias grp   "git remote prune"
alias grpo  "git remote prune origin"
alias grsp  "git restore --staged -p"
alias gst   "git status"
alias gsts  "git status -s"
alias tiga  "tig --all"

# Ruby
alias ss "script/server"
alias sc "script/console"
alias sg "script/generate"
alias rtu "rake test:units"
alias rtf "rake test:functionals"
alias rti "rake test:integration"
alias rtr "rake test:remote"
alias rta "rake test:all"
alias rc "rails console"
alias rs "rails server"
alias rsc "rake spec:coverage"
alias rtc "rake test:coverage"
alias rdm "rake db:migrate"
alias ttr "touch tmp/restart.txt"
alias rb "rbenv"
alias be "bundle exec"
alias cap "bundle exec cap"
alias oci "open coverage/index.html"

# Make
alias m "make"
alias mr "make rebuild"
alias mc "make clean"
alias vg "valgrind --leak-check=full --dsymutil=yes"

# Ansible
# alias ag "ansible-galaxy"
alias ap "ansible-playbook"
alias av "ansible-vault"

# DevOps
alias tf "terraform"
alias q-new "$HOME/viget/devops/q-new/target/debug/q-new"

# neovim
alias nvb "XDG_DATA_HOME=~/.config/nvb/share XDG_CONFIG_HOME=~/.config/nvb nvim"

set -x LC_CTYPE en_US.UTF-8

# set -x GOPATH $HOME/go
# set -x GOBIN $GOPATH/bin

# set PATH $HOME/.phpenv/bin $PATH
set PATH $HOME/Applications/WezTerm.app/Contents/MacOS $PATH
set PATH $HOME/.local/bin $PATH
set PATH /usr/local/bin $PATH
set PATH /usr/local/sbin $PATH
# set PATH $GOBIN $PATH
set PATH ./bin $PATH
set PATH $HOME/.bin $PATH
# set PATH $HOME/.cargo/bin $PATH
# set PATH $HOME/Library/Haskell/bin $PATH
set PATH $HOME/viget/devops/q/bin $PATH
set PATH $HOME/bun/bin $PATH

set -x EDITOR /usr/local/bin/vim

# .NET nonsense
set PATH $HOME/.dotnet/tools $PATH
set -x DOTNET_ROOT /opt/homebrew/opt/dotnet/libexec


set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git"'

set -x TERM screen-256color

set -x HOMEBREW_NO_INSTALL_CLEANUP 1

set -x GPG_TTY (tty)

####
## nvm setup
#set -x NVM_DIR $HOME/.nvm
#set -U fish_user_paths

###
# rbenv setup
# rbenv init - --no-rehash fish | source

####
## asdf
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# if not contains $_asdf_shims $PATH
  set -gx --prepend PATH $_asdf_shims
# end
set --erase _asdf_shims

####
# phpenv setup
# status --is-interactive; and source (phpenv init -|psub)

###
# nodenv setup
# nodenv init - --no-rehash fish | source

# source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# if which swiftenv > /dev/null; status --is-interactive; and source (swiftenv init -|psub); end

# # pnpm
# set -gx PNPM_HOME "/Users/chris/Library/pnpm"
# if not string match -q -- $PNPM_HOME $PATH
#   set -gx PATH "$PNPM_HOME" $PATH
# end
# # pnpm end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Local secrets (not committed to git)
if test -f ~/.config/fish/secrets.fish
    source ~/.config/fish/secrets.fish
end
