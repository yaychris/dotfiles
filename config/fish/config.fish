source ~/.config/fish/functions/j.fish

###
# Aliases
alias cl "clear"

alias lal "ls -AlFG"
alias cl "clear"
alias fn "find . -name"
alias d "docker"

## Git
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
alias gst   "git status"
alias gsts  "git status -s"
alias tiga  "tig --all"

## Ruby
alias ss "script/server"
alias sc "script/console"
alias sg "script/generate"
alias rtu "rake test:units"
alias rtf "rake test:functionals"
alias rti "rake test:integration"
alias rtr "rake test:remote"
alias rta "rake test:all"
alias rc "rails console"
alias rg "rails generate"
alias rs "rails server"
alias rsc "rake spec:coverage"
alias rtc "rake test:coverage"
alias rdm "rake db:migrate"
alias ttr "touch tmp/restart.txt"
alias rb "rbenv"
alias be "bundle exec"
alias cap "bundle exec cap"
alias oci "open coverage/index.html"

## Make
alias m "make"
alias mr "make rebuild"
alias mc "make clean"
alias vg "valgrind --leak-check=full --dsymutil=yes"

set -x LC_CTYPE en_US.UTF-8

set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin

set PATH /usr/local/bin $PATH
set PATH $GOBIN $PATH
set PATH ./bin $PATH
set PATH $HOME/bin $PATH


set -x FZF_DEFAULT_COMMAND 'pt --hidden --ignore .git -g ""'

set -x TERM screen-256color

set -x GPG_TTY (tty)

###
# rbenv setup
rbenv init - --no-rehash fish | source

setenv EDITOR vim

set -x J_COMMAND $GOBIN/jgo
set -x J_DATA "$HOME/.j"
