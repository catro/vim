# vim Configuration

## Install in \*nix

### Install by script

Open terminal and execute:

`wget -qO- https://raw.github.com/catro/vim/master/install.sh | sh -x`

### Install manually：(Ubuntu as example)

1. Install ctags: `sudo apt-get install ctags`
- Install other softwares: `sudo apt-get install xclip astyle python-setuptools`
- Install format tool for python: `sudo easy_install -ZU autopep8 flake8`
- Backup old configuration if exists:
 - `[ -d ~/.vim ] && mv -f ~/.vim ~/.vim_old`
 - `[ -f ~/.vimrc ] && mv -f ~/.vimrc ~/.vimrc_old`
- Clone the configuration: `git clone git@github.com:catro/vim.git ~/.vim`
- Create vimrc: `ln -s ~/.vim/.vimrc ~/`
- Clone bundle: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
- Install bundles: `vim +BundleInstall +qall`

## Install in Windows for GVIM

1. Install the following tools and add them to PATH:
 - [msys2](http://www.msys2.org/)
 - [git](https://git-scm.com/)
 - [ctags](http://ctags.sourceforge.net/)
 - [astyle](http://astyle.sourceforge.net/)
 - [python](https://www.python.org/)
 - [setuptools](https://pypi.python.org/pypi/setuptools)
 - autopep8: `easy_install -ZU autopep8`
 - flake8: `easy_install -ZU flake8`
- Clear *\_vimrc* in VIM install folder. The default path of 64 bit Windows is:
    *C:\Program Files (x86)\Vim\_vimrc*
- Open a cmd,
 - `cd %USERPROFILE%`
 - `git clone git@github.com:catro/vim.git vimfiles`
 - `git clone https://github.com/VundleVim/Vundle.vim.git vimfiles/bundle/Vundle.vim`
 - `echo source $HOME/vimfiles/.vimrc>_vimrc`
- Start GVIM and execute: `:BundleInstall`
- Restart GVIM

