###
# ENV
export EDITOR=vim
export CLICOLOR=1

## Go
export GOROOT="/Users/Chris/code/go"
export GOOS="darwin"
export GOARCH="amd64"
export GOBIN="/Users/Chris/code/go/bin"
export PATH="$GOBIN:$PATH"

## Path
export PATH="./:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"


###
# Aliases
alias lal="ls -AlF"
alias cl="clear"
alias yay="ssh yay"
alias basrc="vim ~/.bashrc && source ~/.bash_profile"
alias httpd-restart="sudo /opt/local/apache2/bin/apachectl restart"
alias fn="find . -name"

## Git
alias gcav="git commit -av"
alias gst="git status"
alias gb="git branch"
alias gco="git checkout"
alias gai="git add -i"

## Ruby
alias sgi="sudo gem install"
alias sgu="sudo gem update"
alias spi="sudo port install"
alias ss="script/server"
alias sc="script/console"
alias sg="script/generate"
alias rc="rake cucumber"
alias rtu="rake test:units"
alias rtf="rake test:functionals"
alias rti="rake test:integration"
alias rtr="rake test:remote"
alias rta="rake test:all"
alias rdb="rake db:blast"
alias rdm="rake db:migrate"
alias cfn="cucumber features -n"
alias cf="cucumber features"


###
# Prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "☹"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ [\1$(parse_git_dirty)]/"
}

export PS1='\[\e[32;1m\]\w\[\e[0m\]\[\e[36;1m\]$(parse_git_branch)\[\e[0m\]\n\[\e[90;1m\]>\[\e[0m\] '


###
# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi


###
# j (http://github.com/rupa/j/)
. ~/.j.sh
