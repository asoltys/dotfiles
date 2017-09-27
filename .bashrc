# Use vi mode instead of Emacs for readline
[[ $- == *i* ]] || return
set -o vi
shopt -s histappend
export EDITOR=vim
export HISTCONTROL=ignoredups:erasedups:ignorespace
export HISTSIZE=9999
export HISTIGNORE="&:[ ]*:exit"
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export DISPLAY=:0
export LESS="--RAW-CONTROL-CHARS"
[[ -f ~/.LESS_TERMCAP ]] && . ~/.LESS_TERMCAP

PATH=$PATH:/usr/sbin
PATH=$PATH:~/jre1.7.0_09/bin$
PATH=$PATH:/usr/local/bin

NPM_PACKAGES="$HOME/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH  
MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"

if [ -x "$(command -v yarn)" ]; then
  PATH="$PATH:$(yarn global bin)"
fi
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
else
  export GOPATH=~/go
fi

if [ -d /usr/lib/jvm/java-8-openjdk-amd64 ]; then
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
fi

if [ -d ~/Android/Sdk ]; then
  export ANDROID_HOME=$HOME/Android/Sdk
  PATH=$PATH:$ANDROID_HOME/tools
  PATH=$PATH:$ANDROID_HOME/platform-tools
fi

# Strip duplicate paths
if [ -n "$PATH" ]; then
  old_PATH=$PATH:; PATH=
  while [ -n "$old_PATH" ]; do
    x=${old_PATH%%:*}       # the first remaining entry
    case $PATH: in
      *:"$x":*) ;;         # already there
      *) PATH=$PATH:$x;;    # not there yet
    esac
    old_PATH=${old_PATH#*:}
  done
  PATH=${PATH#:}
  unset old_PATH x
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
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--reverse --height 80%"
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/HATCON.local/asoltys/google-cloud-sdk/path.bash.inc' ]; then source '/home/HATCON.local/asoltys/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/HATCON.local/asoltys/google-cloud-sdk/completion.bash.inc' ]; then source '/home/HATCON.local/asoltys/google-cloud-sdk/completion.bash.inc'; fi
# added by Miniconda3 4.3.21 installer
export PATH="/home/adam/miniconda3/bin:$PATH"

fix() { 
  vim +/"<<<<<<<" $( git diff --name-only --diff-filter=U | xargs ) 
}

dsf() { 
  git diff --no-index --color "$@" | diff-so-fancy 
}
