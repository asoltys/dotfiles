# Use vi mode instead of Emacs for readline
set -o vi

export TERM=xterm-256color
export TERM=xterm-color
export GREP_OPTIONS='--color=auto'
export EDITOR=vim
export HISTCONTROL=erasedups
export HISTSIZE=9999
export HISTIGNORE="&:[ ]*:exit"
export NODE_PATH="/usr/local/lib/node_modules"

PATH=$PATH:/usr/sbin
PATH=$PATH:/home/adam/jre1.7.0_09/bin$
PATH=$PATH:/usr/local/bin

if [ -d ~/bin ]; then
  PATH=$PATH:~/bin
fi
if [ -d /var/www/bitcoin/src ]; then
  PATH=$PATH:/var/www/bitcoin/src
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d ~/.rvm/bin ]; then
  PATH=$PATH:~/.rvm/bin
fi
export PATH 

. ~/.bash_aliases

# Disable control flow capture
if [ -t 0 ]; then   # only run if stdin is a terminal
  stty -ixon
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.github_credentials ]; then
	. ~/.github_credentials
fi

if [ -f ~/.dropbox_credentials ]; then
	. ~/.dropbox_credentials
fi

# Git Completion with 'g'
source ~/.git-completion.sh
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null
