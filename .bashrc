[[ $- == *i* ]] || return
set -o vi
shopt -s histappend
export EDITOR=vim
export HISTCONTROL=ignoredups:erasedups:ignorespace
export HISTSIZE=99999
export HISTIGNORE="&:[ ]*:exit"
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export LESS="--RAW-CONTROL-CHARS"
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/local/bin
NPM_PACKAGES="$HOME/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

if [ -d ~/bin ]; then
  PATH=$PATH:~/bin
fi
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
if [ -d /usr/local/go/bin ]; then
  PATH=$PATH:/usr/local/go/bin
fi
if [ -d ~/go/bin ]; then
  export GOPATH=~/go
  PATH=$PATH:$GOPATH/bin
fi
if [ -d ~/gocode/bin ]; then
  PATH=$PATH:~/gocode/bin
fi

export PATH 

# Pretty colors
export PS1="(\[\]15:13:57) ○ [\[\e[0;34m\]\u\[\e[39m\]@\[\e[0;32m\]\H\[\e[39m\]] \[\e[0;33m\]\w\[\e[39m\] \[\e[39m\]"
export PS4='$0.$LINENO+ '

BASE16_SHELL=$HOME/.config/base16-shell/
source $BASE16_SHELL/profile_helper.sh
base16_framer
force_color_prompt=yes

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

# Git Completion with 'g'
. ~/.git-completion.sh
. ~/.hub-completion.sh
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null

. ~/.bash_aliases

eval "`dircolors ~/.dircolors`"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_HIDDEN="--hidden"
export FZF_DEFAULT_COMMAND='fd --type file --color=always --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--reverse --height 80% --ansi"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'tree -C {} | head -200'"
export FZF_ALT_V_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_V_OPTS="$FZF_ALT_C_OPTS"
export FZF_CTRL_R_OPTS="--sort --exact --reverse --preview 'echo {}' --preview-window down:3:hidden --bind '?:toggle-preview'"


if [[ -n "$SSH_CLIENT" ]] && [[ -n "$SSH_TTY" ]] && [[ $- =~ "i" ]] && command -v tmux>/dev/null; then
 [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux new-session -A -s main
fi

fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

source ~/fzf-jump/fzf-jump.plugin.bash

unalias s
unalias zz
zz() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

v() {
  local file
  if [ -f "$1" ]; then
    vim $1
  else
    if [ $# -gt 0 ]; then
      local f=$(fasd -Rfl -b viminfo "$1" -1)
      echo $f
      if [ -f $f ]; then
        vim $f
      fi
    else
      file="$(fasd -Rfl -b viminfo "$1" | fzf -1 -0 --no-sort +m)" && vi "${file}" || return 1
    fi
  fi
}

fh() {
  [ "$FZF_HIDDEN" = "--hidden" ] && export FZF_HIDDEN="" || export FZF_HIDDEN="--hidden"
}

bind -x '"\C-f": "fzf-file-widget"'
bind -x '"\C-o": "o"'

dsf() { 
  git diff --no-index --color "$@" | diff-so-fancy 
}

o() {
  local files
  if [ "$#" -eq 1 ]; then xdg-open "$1"; return 1; fi
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

if [ $(command -v rlwrap) ] ; then
  alias node='NODE_NO_READLINE=1 rlwrap node'
fi

alias sudo='sudo '

# pnpm
export PNPM_HOME="/home/adam/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end