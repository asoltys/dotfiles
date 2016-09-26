# Use vi mode instead of Emacs for readline
set -o vi

export EDITOR=vim
export HISTCONTROL=erasedups
export HISTSIZE=9999
export HISTIGNORE="&:[ ]*:exit"
export NODE_PATH="$(npm root -g)"

PATH=$PATH:/usr/sbin
PATH=$PATH:/home/adam/jre1.7.0_09/bin$
PATH=$PATH:/usr/local/bin
PATH="$HOME/.node_modules/bin:$PATH"

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
if [ -d /usr/local/go/bin ]; then
  PATH=$PATH:/usr/local/go/bin
  GOPATH=~/gocode
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
. ~/.git-completion.sh
. ~/hub-completion.sh
complete -o bashdefault -o default -o nospace -F _hub g 2>/dev/null
