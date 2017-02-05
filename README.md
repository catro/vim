# vim Configuration

### Install by script

Open terminal and execute:

`wget -qO- https://raw.github.com/catro/vim/master/install.sh | sh -x`

### Install manually：(Ubuntu as example)

1. Install ctags: `sudo apt-get install ctags`
- Install other softwares: `sudo apt-get install xclip astyle python-setuptools`
- Install format tool for python: `sudo easy_install -ZU autopep8`
- Backup old configuration if exists: 
 - `[ -d ~/.vim ] && mv -f ~/.vim ~/.vim_old`
 - `[ -f ~/.vimrc ] && mv -f ~/.vimrc ~/.vimrc_old`
- Clone the configuration: `git clone git@github.com:catro/vim.git ~/.vim`
- Create vimrc: `ln -s ~/.vim/.vimrc ~/`
- Clone bundle: `git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle`
- vim +BundleInstall +qall
