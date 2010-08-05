###
# ENV
export EDITOR=vim
export PAGER=less

set -o vi

## Go
#export GOROOT=`brew --cellar`/go/HEAD
export GOROOT="$HOME/code/go"
export GOOS="darwin"
export GOARCH="amd64"
export GOBIN="$HOME/code/go/bin"

## Path
export PATH="./:$GOBIN:/opt/ruby/bin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"


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

if [ "$(hostname)" = 'Phobos.local' ]; then
  prompt_color='2' # green
else
  prompt_color='5' # purple
fi

export PS1='\[\e[3$prompt_color;1m\]\w\[\e[0m\]\[\e[36;1m\]$(parse_git_branch)\[\e[0m\]\n\[\e[90;1m\]>\[\e[0m\] '


###
# RVM
if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi


###
# j (http://github.com/rupa/j/)
. ~/.j.sh
