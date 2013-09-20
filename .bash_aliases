###
# Aliases
if [ "$(uname)" = Darwin ]; then
  # OS X
  alias lal="ls -AlFG"
  alias chromium-gl="/Applications/Chromium.app/Contents/MacOS/Chromium --no-sandbox --enable-webgl &"
else
  # others
  alias lal="ls -AlF --color=auto"
  alias pacman="pacman-color"
fi

alias cl="clear"
alias fn="find . -name"
alias oocaml="$(which ocaml)"
alias ocaml="rlwrap ocaml"
alias sar="sudo apachectl restart"

## Git
alias gcav="git commit -av"
alias gcv="git commit -v"
alias gst="git status"
alias gsts="git status -s"
alias gb="git branch"
alias gba="git branch -a"
alias gco="git checkout"
alias gai="git add -i"
alias gap="git add --patch"
alias gcp="git cherry-pick"
alias glod="git log --oneline --decorate"
alias amend="git commit --amend"
alias tiga="tig --all"

## Ruby
alias ss="script/server"
alias sc="script/console"
alias sg="script/generate"
alias rtu="rake test:units"
alias rtf="rake test:functionals"
alias rti="rake test:integration"
alias rtr="rake test:remote"
alias rta="rake test:all"
alias rc="rails console"
alias rg="rails generate"
alias rs="rails server"
alias rsc="rake spec:coverage"
alias rdm="rake db:migrate"
alias ttr="touch tmp/restart.txt"
alias rcr="rake cruise"
alias rb="rbenv"

## Make
alias m="make"
alias mr="make rebuild"
alias mc="make clean"
alias vg="valgrind --leak-check=full --dsymutil=yes"
