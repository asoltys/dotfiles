#!/usr/bin/env bash

alias ..='cd ..'
alias more=less
alias sd=sudo

alias ba='vim ~/.bash_aliases'
alias brc='vim ~/.bashrc'
alias src='. ~/.bashrc'

alias inst='./configure && make && sudo make install'
alias hist='history'

alias ngxr='sudo /etc/init.d/nginx restart'

alias g='hub'
alias gs='git status'
alias gp='git push'
alias gfp='git ftp push'
alias gfpp='git ftp push -s prod'
alias gl='git pull'
alias gaa='git add -A'
alias gai='git add -i'
alias gc='git commit'
alias gn='git clean -fd'
alias gf='git fetch'
alias gg='git config -l'
alias gr='git reset --hard HEAD'
alias gu='git submodule update'
alias gui='git submodule update --init'
alias gm='git checkout master'
alias gmm='git merge master'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gd='git diff'
alias gdc='git diff --cached'
alias gb='git branch -a'
alias gog='git log'
alias gi='git rebase HEAD~10 -i'

alias ~='cd ~'
alias h='cd ~'
alias D='cd ~/Downloads'
alias cv='cd ~/.vim'
alias w='cd /var/www'

alias ls='ls -F --color --group-directories-first'
alias lsa='ls -Flah --color --group-directories-first'
alias lsl='ls -Flh --color --group-directories-first'
alias bp="cd ~/bitcoincoop.org"
alias pos="cd ~/coinos.io"
alias ass="cd ~/assignment"
alias n="nautilus"
alias pops="cd ~/pops"
alias r="npm run dev"
alias ad="cd /var/www/pops/packages/usaid"
alias egd="cd ~/egdbooking_v2"
alias vf='vim $(fzf)'
alias cf='cat $(fzf)'
alias gf='cd $(fzf)'
alias tm='tmux new-session -A -s main'
alias cc='cd ~/ccog'
alias y='yarn'
