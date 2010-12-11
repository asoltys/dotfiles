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

source ~/.git-completion.sh
source ~/.mysql_credentials

alias git=hub
alias inst='./configure && make && sudo make install'

alias rs='ruby script/server -u'
alias rc='ruby script/console'
alias red='cd $WEB/redmine'
alias bud='cd $WEB/redmine/vendor/plugins/budget_plugin'
alias ts='cd $WEB/redmine/vendor/plugins/timesheet_plugin'
alias rw='cd $WEB/redmine/vendor/plugins/redmine_w3h'
alias clf='cd $WEB/redmine/vendor/plugins/redmine_clf2'
alias rst='sudo /etc/init.d/thin restart'
alias myred='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D redmine'
alias myreda='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D redmine_amitos'
alias bured='mysqldump redmine -u $MYSQL_USER -p$MYSQL_PASSWORD > backup.sql'
alias reda='rm $WEB/redmine && ln -s $WEB/redmine_amitos $WEB/redmine && cd $WEB/redmine'
alias reds='rm $WEB/redmine && ln -s $WEB/redmine_stock $WEB/redmine && cd $WEB/redmine'
alias ref='git fetch edavis'
alias reb='git rebase edavis/master'
alias rem='git merge edavis/master'

alias c='git commit -am "Content update"'
alias d='ssh as ~/deploy.sh'
alias cfs='sudo /opt/coldfusion8/bin/coldfusion start'
alias gdmr='sudo /etc/init.d/gdm restart'

alias brc='vim ~/.bashrc'
alias src='source ~/.bashrc'

alias ngx='vim /opt/nginx/conf/nginx.conf'
alias ngxr='sudo /etc/init.d/nginx restart'

alias gs='git status'
alias gp='git push'
alias gl='git pull'
alias gaa='git add -A'
alias gai='git add -i'
alias gc='git commit'
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

alias ~='cd ~'
alias h='cd ~'
alias w='cd $WEB'
alias a='cd $WEB/adam_soltys'
alias k='cd ~/Projects/linux-2.6'
alias dwn='cd ~/Downloads'

alias dev='cd /mnt/gtisdev'
alias pac='cd /mnt/pac-apps'
alias ed='cd /mnt/extdev/web/extranet'

alias b='cd /opt/coldfusion8/wwwroot/egd_billing'

alias r='cd /opt/coldfusion8/wwwroot/pacific_renewal'
alias staf='cd /opt/coldfusion8/wwwroot/pacific_renewal/applications/staffing'
alias comp='cd /opt/coldfusion8/wwwroot/pacific_renewal/applications/competency'
alias qms='cd /opt/coldfusion8/wwwroot/pacific_renewal/applications/qms'
alias trn='cd $WEB/trainsim'
alias trni='cd $WEB/trainsim_interface'
alias trt='cd $WEB/traintracks'
alias ext='cd $WEB/extranet'

[[ -s /home/adam/.rvm/scripts/rvm ]] && source /home/adam/.rvm/scripts/rvm 
