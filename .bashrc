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

alias rs='ruby script/server -u'
alias red='cd $WEB/redmine'
alias bud='cd $WEB/redmine/vendor/plugins/budget_plugin'
alias ts='cd $WEB/redmine/vendor/plugins/timesheet_plugin'
alias rst='sudo /etc/init.d/thin restart'
alias myred='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D redmine'
alias bured='mysqldump redmine -u $MYSQL_USER -p$MYSQL_PASSWORD > backup.sql'
alias reda='rm $WEB/redmine && ln -s $WEB/redmine_amitos $WEB/redmine && cd $WEB/redmine'
alias reds='rm $WEB/redmine && ln -s $WEB/redmine_stock $WEB/redmine && cd $WEB/redmine'
alias reb='git rebase edavis/master'

alias d='ssh as $WEB/deploy.sh'
alias cfs='sudo /opt/coldfusion8/bin/coldfusion start'

alias brc='vim ~/.bashrc'
alias src='source ~/.bashrc'

alias ngx='vim /opt/nginx/conf/nginx.conf'

alias gs='git status'
alias gp='git push'
alias gl='git pull'
alias ga='git add -A'
alias gc='git commit'
alias gu='git submodule update'
alias gm='git checkout master'
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

alias b='cd /opt/coldfusion8/wwwroot/egd_billing'

alias r='cd /opt/coldfusion8/wwwroot/pacific_renewal'
alias staf='cd /opt/coldfusion8/wwwroot/pacific_renewal/applications/staffing'
alias qms='cd /opt/coldfusion8/wwwroot/pacific_renewal/applications/qms'
alias trn='cd $WEB/trainsim'
alias trni='cd $WEB/trainsim_interface'

[[ -s /home/adam/.rvm/scripts/rvm ]] && source /home/adam/.rvm/scripts/rvm 
