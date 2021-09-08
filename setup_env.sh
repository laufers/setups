#! /usr/bin/env sh

# execute git config global settings

git config --global user.name 'Mark Laufersweiler'
git config --global core.autocrlf input
git config --global init.defaultBranch main

echo 'Enter your email you wish to use with Git and GitHub: '
read email
git config  --global user.email $email

# get bash-git-prompt

if [ ! -d ~/.bash-git-prompt ]; then
	git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
fi
