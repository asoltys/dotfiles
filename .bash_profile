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

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
