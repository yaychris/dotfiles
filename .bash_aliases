###
# Aliases
if [ "$(uname)" = Darwin ]; then
  # OS X
  alias lal="ls -AlFG"
  alias chromium-gl="/Applications/Chromium.app/Contents/MacOS/Chromium --no-sandbox --enable-webgl &"
else
  # others
  alias lal="ls -AlF --color=auto"
fi

alias cl="clear"
alias fn="find . -name"

## Git
alias gcav="git commit -av"
alias gst="git status"
alias gb="git branch"
alias gco="git checkout"
alias gai="git add -i"

## Ruby
alias ss="script/server"
alias sc="script/console"
alias sg="script/generate"
alias rtu="rake test:units"
alias rtf="rake test:functionals"
alias rti="rake test:integration"
alias rtr="rake test:remote"
alias rta="rake test:all"
alias rc="rake cucumber"
alias rdb="rake db:blast"
alias rdm="rake db:migrate"
