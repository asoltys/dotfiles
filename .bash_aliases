#!/usr/bin/env bash

alias ..='cd ..'
alias more=less
alias sd=sudo

alias ba='vim ~/.bash_aliases'
alias brc='vim ~/.bashrc'
alias src='. ~/.bashrc'

alias inst='./configure && make && sudo make install'
alias hist='history'

alias dbg='rdebug -c'
alias rs='bundle exec thin start'
alias rsd='bundle exec thin start -D'
alias rsp='bundle exec thin start -e production'
alias mig='bundle exec rake db:migrate'
alias rc='ruby script/console'
alias my='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD'
alias grd='bundle exec guard -n f'

alias ngx='vim /opt/nginx/conf/nginx.conf'
alias ngxr='sudo /etc/init.d/nginx restart'

alias rst='sudo /etc/init.d/thin restart'
alias my='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD'
alias myli='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D land_info'
alias myred='mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -D chiliproject'
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

alias gtis='rdesktop gtisdev.pac.pwgsc.gc.ca -u "$PWGSC_USER" -p "$PWGSC_PASSWORD" -g 1280x960 -D -K &'
alias pa='rdesktop pac-apps.pac.pwgsc.gc.ca -u "$PWGSC_USER" -p "$PWGSC_PASSWORD" -g 1280x960 -D -K &'
alias ad='rdesktop localhost -u "$AVADEPTH_USER" -p "$AVADEPTH_PASSWORD" -g 1280x960 -D -K &'

alias rv='cd app/views'
alias rl='cd app/views/layouts'
alias rp='cd vendor/plugins'
alias pb='cd public'

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
alias D='cd ~/Downloads'
alias cv='cd ~/.vim'
alias d='cat -n ~/.dirs'
alias opt='cd /opt'
alias w='cd /var/www'
alias cfw='cd /opt/coldfusion9/wwwroot'
alias a='cd /var/www/adam_soltys'
alias dwn='cd ~/Downloads'
alias dsk='cd ~/Desktop'

alias dev='cd /mnt/gtisdev'
alias pac='cd /mnt/pac-apps'
alias ed='cd /mnt/extdev/web/extranet'

alias cic='cd /opt/coldfusion9/wwwroot/cic'
alias bil='cd /opt/coldfusion9/wwwroot/egd_billing'
alias bk='cd /opt/coldfusion9/wwwroot/egdbooking'
alias nps='cd /opt/coldfusion9/wwwroot/nps'
alias r='cd /opt/coldfusion9/wwwroot/pacific_renewal'
alias staf='cd /opt/coldfusion9/wwwroot/pacific_renewal/applications/staffing'
alias comp='cd /opt/coldfusion9/wwwroot/pacific_renewal/applications/competency'
alias qms='cd /opt/coldfusion9/wwwroot/pacific_renewal/applications/qms'
alias cms='cd /opt/coldfusion9/wwwroot/pacific_renewal/applications/cms'

alias ext='cd /var/www/extranet'
alias wet='cd /var/www/wet'
alias wr='cd /var/www/wet-boew-ruby-rails'
alias li='cd /var/www/land_info'
alias mas='cd /var/www/masquerade'
alias ipmg='cd /var/www/webdev02/ggpfi-ipmg'
alias egd='cd /var/www/webdev02/pac/cse-egd'

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
alias p='sudo pkill -9 ssh; ssh -N -f sircan -D 1080'
alias pl='sudo pkill -9 ssh; sleep 1; ssh -N -f localhost -D 1080'
alias p3='sudo ssh -f -N -l root -L 80:localhost:3000 root@localhost'
alias k3='sudo pkill -f localhost:3000'
alias rd='ssh ircan -N -f -L 3389:184.106.250.111:3389'
alias krd='sudo pkill -f 3389'

alias ht="sudo cp /etc/hosts /etc/hosts.tmp && sudo mv /etc/hosts.bak /etc/hosts && sudo mv /etc/hosts.tmp /etc/hosts.bak"

alias tag="ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*"
alias bp="cd /var/www/vanbtc.ca"
alias om="cd /var/www/om"
