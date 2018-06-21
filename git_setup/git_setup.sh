#!/bin/bash

echo "Setup git"

sudo apt-get update

sudo apt-get install git

sudo apt-get install gitk


git config --global user.email "csustwangmin@163.com"
git config --global user.name "wangmin"
git config --global core.editor "vim"


echo "Git Setup Finished"

exit 0
