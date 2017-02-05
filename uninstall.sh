#!/bin/sh
rm -f ~/.vimrc
rm -rf ~/.vim
[ -f ~/.vimrc_old ] && mv -f ~/.vimrc_old ~/.vimrc
[ -d ~/.vim_old ] && mv -f ~/.vim_old ~/.vim
