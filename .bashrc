# Use vi mode instead of Emacs for readline
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
PATH=$PATH:/usr/lib/jvm/jdk-13.0.2/bin
PATH="$PATH:/home/adam/.dat/releases/dat-14.0.2-linux-x64"
NPM_PACKAGES="$HOME/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"

if [ -x "$(command -v yarn)" ]; then
  PATH="$PATH:$HOME/.yarn/bin"
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
if [ -d ~/go/bin ]; then
  export GOPATH=~/go
  PATH=$PATH:$GOPATH/bin
fi
if [ -d ~/gocode/bin ]; then
  PATH=$PATH:~/gocode/bin
fi

if [ -d ~/Android/Sdk ]; then
  export ANDROID_HOME=$HOME/Android/Sdk
  PATH=$ANDROID_HOME/emulator:$PATH
  PATH=$ANDROID_HOME/tools:$PATH
  PATH=$ANDROID_HOME/tools/bin:$PATH
  PATH=$ANDROID_HOME/platform-tools:$PATH
  export ANDROID_SDK=$HOME/Android/Sdk
fi
export JAVA_HOME=/usr/lib/jvm/jdk-13.0.2

export PATH 

# Pretty colors
export PS1="(\[\]15:13:57) ○ [\[\e[0;34m\]\u\[\e[39m\]@\[\e[0;32m\]\H\[\e[39m\]] \[\e[0;33m\]\w\[\e[39m\] \[\e[39m\]"
export PS4='$0.$LINENO+ '

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_default-dark
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

BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

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

fix() { 
  vim +/"<<<<<<<" $( git diff --name-only --diff-filter=U | xargs ) 
}

dsf() { 
  git diff --no-index --color "$@" | diff-so-fancy 
}

o() {
  local files
  if [ "$#" -eq 1 ]; then xdg-open "$1"; return 1; fi
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# export PATH="$HOME/.nodenv/bin:$HOME/.nodenv/shims:$PATH"


complete -C /home/adam/bin/mc mc

if [ $(command -v rlwrap) ] ; then
  alias node='NODE_NO_READLINE=1 rlwrap node'
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/adam/.sdkman"
[[ -s "/home/adam/.sdkman/bin/sdkman-init.sh" ]] && source "/home/adam/.sdkman/bin/sdkman-init.sh"

alias sudo='sudo '

# pnpm
export PNPM_HOME="/home/adam/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/adam/google-cloud-sdk/path.bash.inc' ]; then . '/home/adam/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/adam/google-cloud-sdk/completion.bash.inc' ]; then . '/home/adam/google-cloud-sdk/completion.bash.inc'; fi
