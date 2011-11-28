# .bashrc

# Use vi mode instead of Emacs for readline
set -o vi

# Disable control flow capture
if [ -t 0 ]; then   # only run if stdin is a terminal
  stty -ixon
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Color terminal
TERM=xterm-color
LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;33:do=01;33:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;33:*.jpeg=01;33:*.gif=01;33:*.bmp=01;33:*.pbm=01;33:*.pgm=01;33:*.ppm=01;33:*.tga=01;33:*.xbm=01;33:*.xpm=01;33:*.tif=01;33:*.tiff=01;33:*.png=01;33:*.mov=01;33:*.mpg=01;33:*.mpeg=01;33:*.avi=01;33:*.fli=01;33:*.gl=01;33:*.dl=01;33:*.xcf=01;33:*.xwd=01;33:*.ogg=01;33:*.mp3=01;33:*.wav=01;33:'; 
export LS_COLORS
export GREP_OPTIONS='--color=auto'

# Timestamped terminal
# PS1='\t \u@\h $(__git_ps1 "%s"):\W\$ '

# Setup PATH
PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/local/bin
if [ -d ~/bin ]; then
  PATH=$PATH:~/bin
fi
export PATH 


source ~/.git-completion.sh
source ~/.mysql_credentials
source ~/.github_credentials
source ~/.dropbox_credentials

export HISTCONTROL=erasedups
export HISTSIZE=9999
export HISTIGNORE="&:[ ]*:exit"

# Superquick bare repo creation
function gi() { sudo ~/create_git_repo.sh "$@"; } 

alias more=less
alias sd=sudo

alias brc='vim ~/.bashrc'
alias src='source ~/.bashrc'

alias inst='./configure && make && sudo make install'
alias hist='history'

alias dbg='rdebug -c'
alias rs='bundle exec thin start'
alias rsd='bundle exec thin start -D'
alias rsp='bundle exec thin start -e production'
alias rs3='rails s'
alias rc='ruby script/console'
alias my='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD'

alias ngx='vim /opt/nginx/conf/nginx.conf'
alias ngxr='sudo /etc/init.d/nginx restart'

alias rst='sudo /etc/init.d/thin restart'
alias my='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD'
alias myli='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D land_info'
alias myred='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D redmine'
alias myreda='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D redmine_amitos'
alias myredi='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D redmine_ircan'
alias bured='mysqldump redmine -u $MYSQL_USER -p$MYSQL_PASSWORD > backup.sql'
alias reda='rm /var/www/redmine && ln -s /var/www/redmine_amitos /var/www/redmine && cd /var/www/redmine'
alias reds='rm /var/www/redmine && ln -s /var/www/redmine_stock /var/www/redmine && cd /var/www/redmine'
alias redi='rm /var/www/redmine && ln -s /var/www/redmine_ircan /var/www/redmine && cd /var/www/redmine'
alias ch='cd /var/www/chiliproject'
alias ref='git fetch edavis10'
alias reb='git rebase edavis10/master'
alias rem='git merge edavis10/master'

alias rv='cd app/views'
alias rl='cd app/views/layouts'
alias rp='cd vendor/plugins'
alias pb='cd public'

alias g=hub
alias git=hub
alias gs='git status'
alias gp='git push'
alias gl='git pull'
alias ga='git add -A'
alias gai='git add -i'
alias gc='git commit'
alias gn='git clean -fd'
alias gf='git fetch'
alias gg='git config -l'
alias gr='git reset --hard HEAD'
alias gu='git submodule update'
alias gm='git checkout master'
alias gmm='git merge master'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias gam='git checkout amitos'
alias gd='git diff'
alias gdc='git diff --cached'
alias gb='git branch -a'
alias gog='git log'
alias gi='git rebase HEAD~10 -i'

alias bump='git commit -am "Bumping submodule(s)"'
alias cu='git commit -am "Content update"'
alias dp='ssh as ~/deploy.sh'
alias cfs='sudo /opt/coldfusion9/bin/coldfusion start'
alias cfstop='sudo /opt/coldfusion9/bin/coldfusion stop'
alias gdmr='sudo /etc/init.d/gdm restart'

alias ~='cd ~'
alias h='cd ~'
alias opt='cd /opt'
alias w='cd /var/www'
alias cfw='cd /opt/coldfusion8/wwwroot'
alias a='cd /var/www/adam_soltys'
alias k='cd ~/linux-2.6'
alias dwn='cd ~/Downloads'
alias dsk='cd ~/Desktop'

alias dev='cd /mnt/gtisdev'
alias pac='cd /mnt/pac-apps'
alias ed='cd /mnt/extdev/web/extranet'

alias cic='cd /opt/coldfusion8/wwwroot/cic'
alias bil='cd /opt/coldfusion8/wwwroot/egd_billing'
alias bk='cd /opt/coldfusion8/wwwroot/egdbooking'
alias nps='cd /opt/coldfusion8/wwwroot/nps'
alias r='cd /opt/coldfusion8/wwwroot/pacific_renewal'
alias staf='cd /opt/coldfusion8/wwwroot/pacific_renewal/applications/staffing'
alias comp='cd /opt/coldfusion8/wwwroot/pacific_renewal/applications/competency'
alias qms='cd /opt/coldfusion8/wwwroot/pacific_renewal/applications/qms'
alias cms='cd /opt/coldfusion8/wwwroot/pacific_renewal/applications/cms'

alias ext='cd /var/www/extranet'
alias wet='cd /var/www/wet'
alias wr='cd /var/www/wet-boew-ruby-rails'
alias li='cd /var/www/land_info'
alias mas='cd /var/www/masquerade'

alias red='cd /var/www/redmine'
alias bud='cd /var/www/redmine/vendor/plugins/budget_plugin'
alias ts='cd /var/www/redmine/vendor/plugins/timesheet_plugin'
alias rw='cd /var/www/redmine_w3h'
alias rb='cd /var/www/redmine-bulk_time_entry_plugin'
alias clf='cd /var/www/redmine_clf2'
alias ptv='cd /var/www/projects_tree_view'

alias ls='ls -F --color --group-directories-first'
alias lsa='ls -Fla --color --group-directories-first'
alias lsl='ls -Fl --color --group-directories-first'
alias p='sudo pkill -f localhost; ssh -N -f sircan -D 1080'
alias pl='sudo pkill -f sircan; ssh -N -f localhost -D 1080'
alias p3='sudo ssh -f -N -l root -L 80:localhost:3000 root@localhost'
alias k3='sudo pkill -f localhost:3000'
alias rd='ssh ircan -N -f -L 3389:184.106.250.111:3389'
alias krd='sudo pkill -f 3389'

alias 1='pushd +1 > /dev/null ; dirs -v'
alias 2='pushd +2 > /dev/null ; dirs -v'
alias 3='pushd +3 > /dev/null ; dirs -v'
alias 4='pushd +4 > /dev/null ; dirs -v'
alias 5='pushd +5 > /dev/null ; dirs -v'
alias 6='pushd +6 > /dev/null ; dirs -v'
alias 7='pushd +7 > /dev/null ; dirs -v'
alias 8='pushd +8 > /dev/null ; dirs -v'

# Git Completion with 'g' and 'gits'
complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null
complete -o bashdefault -o default -o nospace -F _git gits 2>/dev/null

# RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
# if [ -e "`pwd`/.rvmrc" ]; then 
#   source "`pwd`/.rvmrc" 
# fi
