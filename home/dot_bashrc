#!/usr/bin/env bash

local_hostname="Charon.local"

###
# ENV
export EDITOR=/usr/local/bin/vim
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
export PATH="$PATH:$HOME/viget/devops/q/bin"

###
# Aliases
if [ -f ~/.bash_aliases ]; then
  # shellcheck disable=SC1090
  . ~/.bash_aliases
fi

###
# Git completion
if [ -f ~/.git.bash ]; then
  # shellcheck disable=SC1090
  . ~/.git.bash
fi

complete -o default -o nospace -F _git_checkout gco
complete -o default -o nospace -F _git_branch gb

###
# Prompt
prompt_git_dirty() {
  if [ -e .git ]; then
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo " ☠️ "
  fi
}

prompt_git_branch() {
  if [ -e .git ]; then
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \\(.*\\)/ [\\1$(prompt_git_dirty)]/"
  fi
}

prompt_rbenv_version() {
  if [ -e .ruby_version ]; then
    rbenv versions 2> /dev/null | awk '/^\* / { print "(" $2 ")" }'
  fi
}

# green='\e[32;1m'
# purple='\[\e[35;1m]\]'
# nc='\[\e[0m]\]'

green="\\e[0;32m"
yellow='\e[0;33m'
purple='\e[0;35m'
cyan='\e[0;36m'
nc="\\e[0m"

prompt_hostname() {
  local color

  if [ "$(hostname)" = "$local_hostname" ]; then
    color="$green"
  else
    color="$purple"
  fi

  if [ "$(hostname)" != "$local_hostname" ]; then
    echo -e "$color$(hostname):$nc "
  fi
}

# export PS1='\[$green\]\w\[$nc\]\[\e[0m\]\[\e[36;1m\]$(prompt_git_branch)\[\e[0m\] \[\e[36;1m\]$(prompt_rbenv_version)\[\e[0m\]\n\[\e[38;1m\]→\[\e[0m\] '
export PS1='$(prompt_hostname)\[$(echo -e $green)\]\w\[$(echo -e $nc)\] \n→ '

###
# rbenv
if command -v rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export RBENV_ROOT="$HOME/.rbenv"

###
# j (http://github.com/rupa/j/)
if [ -f ~/.j.sh ]; then
  # shellcheck disable=SC1090
  . ~/.j.sh
fi


cpssh() {
  pbcopy < ~/.ssh/id_rsa.pub
}

if [ -f ~/.fzf.bash ]; then
  # shellcheck disable=SC1090
  . ~/.fzf.bash
fi

export PATH="$HOME/.yarn/bin:$PATH"
