#!/bin/bash
echo "Installing..."
if which apt-get >/dev/null; then
    sudo apt-get install -y git ctags astyle python-setuptools python-dev
elif which yum >/dev/null; then
    sudo yum install -y git ctags astyle python-setuptools python-devel
elif which brew >/dev/null;then
    brew install ctags git astyle
elif which pacman >/dev/null;then
    sudo pacman -S --noconfirm --needed git ctags astyle python-setuptools python
fi

sudo easy_install -ZU autopep8 flake8 markdown2
[ -d ~/.vim ] && mv -f ~/.vim ~/.vim_old
[ -f ~/.vimrc ] && mv -f ~/.vimrc ~/.vimrc_old
git clone https://github.com/catro/vim.git ~/.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -s ~/.vim/.vimrc ~/
vim +BundleInstall +qall
echo "Done"
