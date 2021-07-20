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
alias gcp='git cherry-pick --continue'
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
alias bp="cd ~/bitcoincoop.org"
alias pos="cd ~/coinos-ui"
alias ass="cd ~/assignment"
alias n="nautilus"
alias pops="cd ~/pops"
alias r="npm run dev"
alias st="yarn start"
alias ad="cd /var/www/pops/packages/usaid"
alias egd="cd ~/egdbooking_v2"
alias vf='vim $(fzf)'
alias cf='cat $(fzf)'
alias gf='cd $(fzf)'
alias tm='tmux -2 new-session -A -s main'
alias cc='cd ~/ccog'
alias y='yarn'
alias q='quasar'
alias b='yarn build'
alias bb='nice ./build.sh'
alias bm='npm run build-mobile'
alias hp='hyper'
alias sc='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'
alias upd='sudo apt-get update'
alias am='git commit --amend'
alias t='npm test'
alias wrd='cd ~/wrd/Source/WaterResourceData.Web.UI'
alias x='exit'
alias bc='bitcoin-cli'
alias br="bitcoin-cli -rpcwallet='' -conf=/home/adam/coinos-server/config/bitcoin/bitcoin.conf"
alias bcs="bitcoin-cli -conf=/home/adam/data/.bitcoin_signet/bitcoin.conf"
alias bcr="bitcoin-cli -rpcwallet='' -regtest -conf=/home/adam/coinos-server/config/bitcoin/bitcoin.conf"
alias bct="bitcoin-cli -rpcwallet='test' -regtest -conf=/home/adam/coinos-server/config/bitcoin/bitcoin.conf"
alias lcr="litecoin-cli -regtest -conf=/home/adam/data/.litecoin_regtest/litecoin.conf"
alias bcrb="/home/adam/bitcoin/src/bitcoin-cli -regtest -conf=/home/adam/data/.bitcoin19_regtest/bitcoin.conf"
alias bcp="bitcoin-cli -conf=/home/adam/data/.bitcoin_pruned/bitcoin.conf" 
alias lc="litecoin-cli"
alias l="lncli"
alias lta="lncli --lnddir=/home/adam/.lnd.testa --network=testnet --chain=bitcoin --rpcserver=localhost:10001"
alias ltb="lncli --lnddir=/home/adam/.lnd.testb --network=testnet --chain=bitcoin --rpcserver=localhost:10002"
alias la="docker exec -it la lightning-cli"
alias lb="docker exec -it lb lightning-cli"
#alias la="lncli --lnddir=/home/adam/.lnd.sima --network=regtest --chain=bitcoin --rpcserver=localhost:10003"
#alias lb="lncli --lnddir=/home/adam/.lnd.simb --network=regtest --chain=bitcoin --rpcserver=localhost:10004"
alias lc="lncli --lnddir=/home/adam/.lnd.simc --network=regtest --chain=bitcoin --rpcserver=localhost:10005"
alias bss="btcctl --simnet"
alias vag="vagrant"
alias a="ssh-keygen -f /home/adam/.ssh/known_hosts -R 192.168.10.1; ssh a"
alias hr="heroku"
alias ec="elements-cli -datadir=$HOME/data/.elements"
alias er="elements-cli -rpcwallet=a -conf=/home/adam/coinos-server/config/liquid/elements.conf"
alias ers="elements-cli -rpcwallet=swapserver"
alias erl="elements-cli -conf=$HOME/la/hasura/liquidregtest/liquid-config/elements.conf"
alias ei="elements-cli -conf=$HOME/if/server/liquid/elements.conf"
alias brn="bitcoin-cli -datadir=$HOME/.nigiri/resources/volumes/liquidregtest/config -rpcport=18433"
alias ern="elements-cli -datadir=$HOME/.nigiri/resources/volumes/liquidregtest/liquid-config -rpcport=7041"
# alias el="elements-cli -datadir=$HOME/la/hasura/liquidregtest/liquid-config -rpcport=7045"
alias bl="bitcoin-cli -datadir=$HOME/la/hasura/liquidregtest/config -rpcport=18433 -rpcuser=admin1 -rpcpassword=123"
alias lna="lightning-cli"
alias lnb="lightning-cli --lightning-dir=/home/adam/.lightningb"
alias lra="lightning-cli --lightning-dir=/home/adam/.lightningreg"
alias lrb="lightning-cli --lightning-dir=/home/adam/.lightningregb"
alias lar="sudo lightning-cli --lightning-dir=/home/adam/coinos-server/config/lightning"

alias b-dae="bitcoind -datadir=$HOME/bitcoindir"
alias b-cli="bitcoin-cli -datadir=$HOME/bitcoindir"

alias e1-dae="$HOME/elements/src/elementsd -datadir=$HOME/elementsdir1"
alias e1-cli="$HOME/elements/src/elements-cli -datadir=$HOME/elementsdir1"

alias e2-dae="$HOME/elements/src/elementsd -datadir=$HOME/elementsdir2"
alias e2-cli="$HOME/elements/src/elements-cli -datadir=$HOME/elementsdir2"

alias lr="cd ~/la"
alias t="tdex-cli"
alias dc="el decoderawtransaction"
alias raw="el getrawtransaction"
alias ub="el unblindrawtransaction"
alias addr="el getnewaddress"
alias send="el sendtoaddress"
alias snd="bitcoin-cli -rpcwallet='' -regtest -conf=/home/adam/coinos-server/config/bitcoin/bitcoin.conf sendtoaddress"
sendcad() {
elements-cli -datadir=$HOME/la/hasura/liquidregtest/liquid-config -rpcport=7045 sendtoaddress $1 $2 "" "" false false 1 "UNSET" 1e31485c787e7432c7d09a4e38d893982cebfdafcf70ec5c82bf632363fdc90f
} 
alias gen="el generatetoaddress"
alias bal="el getbalance"
alias sr="el sendrawtransaction"
alias dp="el decodepsbt"
alias info="el getaddressinfo"
alias fdn="fd --no-ignore"
alias rgn="rg --no-ignore"
alias dev="yarn dev"
alias lbp="lb payinvoice"
alias dup="docker-compose up -d --remove-orphans"
alias down="docker-compose down"
