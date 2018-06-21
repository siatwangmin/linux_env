#!/bin/bash

sudo apt-get install vim


echo "cp vimrc to home"
cp ./.vimrc ~/

echo "installing vim vundle"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
if true
then
	sudo apt-get install build-essential cmake
	sudo apt-get install python-dev python3-dev

	#

	cd ~/.vim/bundle/YouCompleteMe
	./install.py --clang-completer

	cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/


	echo "Finish You Completeme"

fi

sudo apt-get install exuberant-ctags

vim +PluginInstall +qall

echo "install finished"

exit 0
