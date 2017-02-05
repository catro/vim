#!/bin/bash
echo "Installing..."
if which apt-get >/dev/null; then
	sudo apt-get install -y git ctags xclip astyle python-setuptools python-dev
elif which yum >/dev/null; then
	sudo yum install -y git ctags xclip astyle python-setuptools python-devel
elif which brew >/dev/null;then
    brew install ctags git astyle
elif which pacman >/dev/null;then
    sudo pacman -S --noconfirm --needed git ctags xclip astyle python-setuptools python
fi

sudo easy_install -ZU autopep8 
[ -d ~/.vim ] && mv -f ~/.vim ~/.vim_old
[ -f ~/.vimrc ] && mv -f ~/.vimrc ~/.vimrc_old
git clone git@github.com:catro/vim.git ~/.vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
ln -s ~/.vim/.vimrc ~/
vim +BundleInstall +qall
echo "Done"
