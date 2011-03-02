# .bashrc
WEB=/var/www

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/local/bin
if [ -d ~/bin ]; then
  PATH=$PATH:~/bin
fi
export PATH 
CDPATH=$CDPATH:$WEB:~:/opt/coldfusion8/wwwroot

source ~/.git-completion.sh
source ~/.mysql_credentials

alias brc='vim ~/.bashrc'
alias src='source ~/.bashrc'
alias inst='./configure && make && sudo make install'

alias rs='ruby script/server -u'
alias rs3='rails s -u'
alias rc='ruby script/console'
alias my='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD'

alias ngx='vim /opt/nginx/conf/nginx.conf'
alias ngxr='sudo /etc/init.d/nginx restart'

alias rst='sudo /etc/init.d/thin restart'
alias myli='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D land_info'
alias myred='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D redmine'
alias myreda='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D redmine_amitos'
alias myredi='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D redmine_ircan'
alias bured='mysqldump redmine -u $MYSQL_USER -p$MYSQL_PASSWORD > backup.sql'
alias reda='rm $WEB/redmine && ln -s $WEB/redmine_amitos $WEB/redmine && cd $WEB/redmine'
alias reds='rm $WEB/redmine && ln -s $WEB/redmine_stock $WEB/redmine && cd $WEB/redmine'
alias redi='rm $WEB/redmine && ln -s $WEB/redmine_ircan $WEB/redmine && cd $WEB/redmine'
alias ch='cd $WEB/chiliproject'
alias ref='git fetch edavis'
alias reb='git rebase edavis10/master'
alias rem='git merge edavis10/master'

alias git=hub
alias gs='git status'
alias gp='git push'
alias gl='git pull'
alias gaa='git add -A'
alias gai='git add -i'
alias gc='git commit'
alias gn='git clean -fd'
alias gf='git fetch'
alias gg='git config -l'
alias gr='git reset --hard HEAD'
alias gu='git submodule update'
alias gm='git checkout master'
alias gmm='git merge master'
alias grm='git rebase master'
alias ga='git checkout amitos'
alias gd='git diff'

alias bump='git commit -am "Bumping submodule(s)"'
alias c='git commit -am "Content update"'
alias d='ssh as ~/deploy.sh'
alias cfs='sudo /opt/coldfusion8/bin/coldfusion start'
alias gdmr='sudo /etc/init.d/gdm restart'

alias ~='cd ~'
alias h='cd ~'
alias w='cd $WEB'
alias a='cd $WEB/adam_soltys'
alias k='cd ~/linux-2.6'
alias dwn='cd ~/Downloads'
alias dsk='cd ~/Desktop'

alias dev='cd /mnt/gtisdev'
alias pac='cd /mnt/pac-apps'
alias ed='cd /mnt/extdev/web/extranet'

alias cic='cd /opt/coldfusion8/wwwroot/cic'
alias b='cd /opt/coldfusion8/wwwroot/egd_billing'
alias nps='cd /opt/coldfusion8/wwwroot/nps'
alias r='cd /opt/coldfusion8/wwwroot/pacific_renewal'
alias staf='cd /opt/coldfusion8/wwwroot/pacific_renewal/applications/staffing'
alias comp='cd /opt/coldfusion8/wwwroot/pacific_renewal/applications/competency'
alias qms='cd /opt/coldfusion8/wwwroot/pacific_renewal/applications/qms'

alias ext='cd $WEB/extranet'
alias wet='cd $WEB/wet'
alias li='cd $WEB/land_info'

alias red='cd $WEB/redmine'
alias bud='cd $WEB/redmine/vendor/plugins/budget_plugin'
alias ts='cd $WEB/redmine/vendor/plugins/timesheet_plugin'
alias rw='cd $WEB/redmine/vendor/plugins/redmine_w3h'
alias clf='cd $WEB/redmine/vendor/plugins/redmine_clf2'

function gi() { sudo ~/create_git_repo.sh "$@"; } 

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 
