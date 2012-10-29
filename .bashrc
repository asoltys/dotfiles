# Use vi mode instead of Emacs for readline
set -o vi

export TERM=xterm-256color
export GREP_OPTIONS='--color=auto'
export EDITOR=vim
export HISTCONTROL=erasedups
export HISTSIZE=9999
export HISTIGNORE="&:[ ]*:exit"

PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/local/bin
if [ -d ~/bin ]; then
  PATH=$PATH:~/bin
fi
if [ -d ~/.rvm/bin ]; then
  PATH=$PATH:~/.rvm/bin
fi
export PATH 

# Load aliases
. ~/.bash_aliases

# Disable control flow capture
if [ -t 0 ]; then   # only run if stdin is a terminal
  stty -ixon
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Timestamped terminal
# PS1='\t \u@\h $(__git_ps1 "%s"):\W\$ '

# Passwords n' tokens
if [ -f ~/.mysql_credentials ]; then
	. ~/.mysql_credentials
fi

if [ -f ~/.github_credentials ]; then
	. ~/.github_credentials
fi

if [ -f ~/.dropbox_credentials ]; then
	. ~/.dropbox_credentials
fi

if [ -f ~/.ldap_credentials ]; then
	. ~/.ldap_credentials
fi

# Git Completion with 'g'

source ~/.git-completion.sh
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null

# Bashmarks script for fave'ing directories
. ~/bin/bashmarks.sh
export NODE_PATH="/usr/local/lib/node_modules"

# Preserve bash functions for overriding/extending
save_function() {
  declare -f $2 > /dev/null
  if [ $? -eq 1 ]; then 
    local ORIG_FUNC=$(declare -f $1)
    local NEWNAME_FUNC="$2${ORIG_FUNC#$1}"
    eval "$NEWNAME_FUNC"
  fi
}

# List dir contents after changing into it
save_function cd rvm_cd
function cd() {
  rvm_cd "$*"
  ls
  grep `pwd` ~/.dirs > /dev/null
  if [ $? -eq 1 ]; then
    pwd | cat - ~/.dirs > /tmp/out && head -n 10 /tmp/out > ~/.dirs
  fi
  for i in `seq 1 9`; do
    alias $i="cd $(head -$i ~/.dirs | tail -n 1)"
  done
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
