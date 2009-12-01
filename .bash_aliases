###
# Aliases
if [ "$(uname)" = Darwin ]; then
  alias lal="ls -AlFG"
else
  alias lal="ls -AlF --color=auto"
fi

alias cl="clear"
alias httpd-restart="sudo /opt/local/apache2/bin/apachectl restart"
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
alias rdb="rake db:blast"
alias rdm="rake db:migrate"
