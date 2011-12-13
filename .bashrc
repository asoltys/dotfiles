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
. ~/.mysql_credentials
. ~/.github_credentials
. ~/.dropbox_credentials

# Git Completion with 'g'
source ~/.git-completion.sh
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
	|| complete -o default -o nospace -F _git g

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# Bashmarks script for fave'ing directories
. ~/bin/bashmarks.sh

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
  pwd >> ~/.dirs
  tail -n 9 ~/.dirs > ~/.tmpdirs; sort ~/.tmpdirs | uniq > ~/.dirs; rm ~/.tmpdirs;
  for i in `seq 1 9`; do
    alias $i="cd $(head -$i ~/.dirs | tail -n 1)"
  done
}
