###
# ENV
export EDITOR=vim
export PAGER=less

set -o vi

## Go
#export GOROOT=`brew --cellar`/go/HEAD
export GOROOT="/usr/local/go"
#export GOOS="darwin"
#export GOARCH="amd64"
export GOBIN="$GOROOT/bin"

## Path
export PATH="$GOBIN:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="./:$PATH"
export PATH="$PATH:/usr/hla"
export PATH="$PATH:/usr/local/lib/node_modules"
export PATH="$PATH:/usr/local/lib/node_modules"

## Ruby GC settings
#export RUBY_HEAP_MIN_SLOTS=2000000
#export RUBY_HEAP_SLOTS_INCREMENT=500000
#export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
#export RUBY_GC_MALLOC_LIMIT=100000000
#export RUBY_HEAP_FREE_MIN=500000

## HLA
export hlalib=/usr/hla/hlalib
export hlainc=/usr/hla/include

export NODE_PATH=/usr/local/lib/node_modules

###
# Aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

###
# Git completion
. ~/.git.bash

complete -o default -o nospace -F _git_checkout gco
complete -o default -o nospace -F _git_branch gb

###
# Prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "☹"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ [\1$(parse_git_dirty)]/"
}

function rbenv_version {
  rbenv versions 2> /dev/null | awk '/^\* / { print "(" $2 ")" }'
}

function hostname_for_prompt {
  if [ "$(hostname)" != 'Callisto.local' ]; then
    echo "$(hostname):"
  fi
}

if [ "$(hostname)" = 'Phobos.local' ]; then
  prompt_color='2' # green
else
  prompt_color='5' # purple
fi

export PS1='\[\e[3$prompt_color;1m\]$(hostname_for_prompt)\w\[\e[0m\]\[\e[36;1m\]$(parse_git_branch)\[\e[0m\] \[\e[36;1m\]$(rbenv_version)\[\e[0m\]\n\[\e[38;1m\]>\[\e[0m\] '

###
# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export RBENV_ROOT=/usr/local/var/rbenv

###
# j (http://github.com/rupa/j/)
. ~/.j.sh


function cpssh() {
  cat ~/.ssh/id_rsa.pub | pbcopy
}

export NVM_DIR="/Users/Chris/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
