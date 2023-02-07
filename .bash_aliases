#!/usr/bin/env bash

alias ..='cd ..'
alias more=less
alias ba='vim ~/.bash_aliases'
alias brc='vim ~/.bashrc'
alias src='. ~/.bashrc'
alias inst='./configure && make && sudo make install'
alias hist='history'
alias ngxr='sudo /etc/init.d/nginx restart'
alias g='hub'
alias gs='git status'
alias gp='git push'
alias gcp='git cherry-pick --continue'
alias gcs='git cherry-pick --skip'
alias gca='git cherry-pick --abort'
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
alias gog='git lg'
alias gi='git rebase HEAD~10 -i'
alias gst='git stash'
alias gsa='git stash apply'

alias ~='cd ~'
alias h='cd ~'
alias D='cd ~/Downloads'
alias cv='cd ~/.vim'
alias w='cd /var/www'

alias ls='ls -F --color --group-directories-first'
alias lsa='ls -Flah --color --group-directories-first'
alias lsl='ls -Flh --color --group-directories-first'
alias pos="cd ~/coinos-ui"
alias st="npm run start"
alias vf='vim $(fzf)'
alias cf='cat $(fzf)'
alias gf='cd $(fzf)'
alias tm='tmux -2 new-session -A -s main'
alias y='yarn'
alias b='pnpm run build'
alias upd='sudo apt-get update'
alias am='git commit --amend'
alias x='exit'
alias dx="docker exec -it"
alias rd="docker exec -it redis redis-cli"
alias db="docker exec -it db keydb-cli"
alias la="docker exec -it cl lightning-cli"
alias lb="docker exec -it clb lightning-cli"
alias lc="docker exec -it clc lightning-cli"
alias ld="docker exec -it cld lightning-cli"
alias lr="cd ~/la"
alias dc="docker compose"
alias dcd="el decoderawtransaction"
alias raw="el getrawtransaction"
alias ub="el unblindrawtransaction"
alias addr="el getnewaddress"
alias send="el sendtoaddress"
alias bal="el getbalance"
alias sr="el sendrawtransaction"
alias dp="el decodepsbt"
alias info="el getaddressinfo"
alias fdn="fd --no-ignore"
alias rgn="rg --no-ignore"
alias dev="pnpm run dev"
alias lm="cp ~/bin/lm ~/bin/el"
alias dup="docker compose up -d --remove-orphans"
alias down="docker compose down --remove-orphans"
alias btc="cp ~/bin/btc ~/bin/el"
alias ex="cp ~/bin/ex ~/bin/el"
alias exl="cp ~/bin/exl ~/bin/el"
alias elem="cp ~/bin/elem ~/bin/el"
alias lt="cp ~/bin/lt ~/bin/el"
alias ltc="cp ~/bin/ltc ~/bin/el"
alias gca="git cherry-pick --abort"
alias lg="docker logs -fn 200"
alias qr="docker exec -it postgres psql -U postgres -x -c"
alias qrr="docker exec -it postgres psql -U raretoshi -x -c"
alias fix='vim +/HEAD `git diff --name-only | uniq`'
alias rst="docker restart"
alias psql="docker exec -it postgres psql -U postgres"
alias psqlr="docker exec -it postgres psql -U raretoshi"
alias dk="docker"
alias cj="curl -H 'content-type: application/json'"
