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
alias gr='git reset --hard origin/master'
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
alias bp="cd ~/bitcoincoop.org"
alias pos="cd ~/coinos.io"
alias ass="cd ~/assignment"
alias n="nautilus"
alias pops="cd ~/pops"
alias r="npm run dev"
alias st="npm start"
alias ad="cd /var/www/pops/packages/usaid"
alias egd="cd ~/egdbooking_v2"
alias vf='vim $(fzf)'
alias cf='cat $(fzf)'
alias gf='cd $(fzf)'
alias tm='tmux -2 new-session -A -s main'
alias cc='cd ~/ccog'
alias y='yarn'
alias q='quasar'
alias b='npm run build'
alias bm='npm run build-mobile'
alias hp='hyper'
alias sc='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'
alias upd='sudo apt-get update'
alias am='git commit --amend'
alias t='npm test'
alias wrd='cd ~/wrd/Source/WaterResourceData.Web.UI'
alias x='exit'
alias bc='bitcoin-cli'
alias bct="bitcoin-cli -testnet -conf=/mnt/disks/sdb/.bitcoin_testnet/bitcoin.conf"
alias lc="litecoin-cli"
alias l="lncli"
alias la="lncli -c bitcoin -n mainnet --rpcserver=localhost:10001 --tlscertpath=/home/adam/.lnd/tls.cert"
alias lb="lncli -c bitcoin -n mainnet --rpcserver=localhost:10002 --tlscertpath=/home/adam/.lndb/tls.cert --lnddir=/home/adam/.lndb"
alias lta="lncli --rpcserver=localhost:10003 --macaroonpath=/home/adam/.lndtest1/admin.macaroon --tlscertpath=/home/adam/.lndtest1/tls.cert"
alias ltb="lncli --rpcserver=localhost:10004 --macaroonpath=/home/adam/.lndtest2/admin.macaroon --tlscertpath=/home/adam/.lndtest2/tls.cert"
alias bss="btcctl --simnet"
alias vag="vagrant"
alias a="ssh-keygen -f /home/adam/.ssh/known_hosts -R 192.168.10.1; ssh a"
alias hr="heroku"
alias ec="elements-cli"
alias lna="lightning-cli"
alias lnb="lightning-cli --lightning-dir=/home/adam/.lightningb"
