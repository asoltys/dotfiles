#!/bin/bash
cd /var/git
mkdir "$1.git"
cd $1.git
git init --bare
cd ../
chown -R git:git "$1.git"
chmod -R g=u "$1.git"
