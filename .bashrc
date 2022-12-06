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
base16_darktooth
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# export PATH="$HOME/.nodenv/bin:$HOME/.nodenv/shims:$PATH"

if [ $(command -v rlwrap) ] ; then
  alias node='NODE_NO_READLINE=1 rlwrap node'
fi

alias sudo='sudo '

# pnpm
export PNPM_HOME="/home/adam/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS
