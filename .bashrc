# Use vi mode instead of Emacs for readline
set -o vi

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

# List dir contents after changing into it
function cdl() {
  builtin cd "$*"
  ls
}

# Git Completion with 'g' and 'gits'
. ~/.git-completion.sh
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null
complete -o bashdefault -o default -o nospace -F _git gits 2>/dev/null

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
# if [ -e "`pwd`/.rvmrc" ]; then 
#   source "`pwd`/.rvmrc" 
# fi

# Bashmarks script for fave'ing directories
. ~/bin/bashmarks.sh
export NODE_PATH="/usr/local/lib/node_modules"
