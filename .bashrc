# Use vi mode instead of Emacs for readline
set -o vi

export EDITOR=vim
export HISTCONTROL=erasedups
export HISTSIZE=9999
export HISTIGNORE="&:[ ]*:exit"
PATH=$PATH:/usr/sbin
PATH=$PATH:~/jre1.7.0_09/bin$
PATH=$PATH:/usr/local/bin

NPM_PACKAGES="$HOME/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH  
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

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
fi
if [ -d ~/gocode/bin ]; then
  PATH=$PATH:~/gocode/bin
  export GOROOT=~/gocode
  export GOPATH=~/gocode
fi

if [ -d /usr/lib/jvm/java-8-openjdk-amd64 ]; then
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
fi

if [ -d ~/Android/Sdk ]; then
  export ANDROID_HOME=$HOME/Android/Sdk
  PATH=$PATH:$ANDROID_HOME/tools
  PATH=$PATH:$ANDROID_HOME/platform-tools
fi

export PATH 

# Pretty colors
export PS1="(\[\]15:13:57) ○ [\[\e[0;34m\]\u\[\e[39m\]@\[\e[0;32m\]\H\[\e[39m\]] \[\e[0;33m\]\w\[\e[39m\] \[\e[39m\]"
export PS4='$0.$LINENO+ '
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
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

if [ -f ~/.dropbox_credentials ]; then
	. ~/.dropbox_credentials
fi

# Git Completion with 'g'
. ~/.git-completion.sh
. ~/.hub-completion.sh
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

. ~/.bash_aliases

eval "`dircolors ~/.dircolors`"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_HIDDEN="--hidden"
export FZF_DEFAULT_COMMAND="pt $FZF_HIDDEN -g ''"
export FZF_DEFAULT_OPTS=""
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_ALT_C_OPTS="--select-1 --exit-0 --preview 'tree -C {} | head -200'"
export FZF_ALT_V_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_V_OPTS="$FZF_ALT_C_OPTS"
export FZF_CTRL_R_OPTS="--sort --exact --reverse --preview 'echo {}' --preview-window down:3:hidden --bind '?:toggle-preview'"

if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux new-session -A -s main
fi

fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

unalias f
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
    file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && vi "${file}" || return 1
  fi
}

fh() {
  [ "$FZF_HIDDEN" = "--hidden" ] && export FZF_HIDDEN="" || export FZF_HIDDEN="--hidden"
}
