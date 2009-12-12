###
# ENV
export EDITOR=vim
export PAGER=less

## Go
export GOROOT="/Users/Chris/code/go"
export GOOS="darwin"
export GOARCH="amd64"
export GOBIN="/Users/Chris/code/go/bin"
export PATH="$GOBIN:$PATH"

## Path
export PATH="./:/opt/ruby-enterprise-1.8.7-2009.10/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"


###
# Aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

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
