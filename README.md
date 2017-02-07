# VIM Configuration

- [Screen captures](#screen-captures)
- [Install](#install)
 - [Install by script in Linux](#install-by-script-in-linux)
 - [Install manually：(Ubuntu as example)](#install-manuallyubuntu-as-example)
 - [Install in Windows for GVIM](#install-in-windows-for-gvim)
- [Features](#features)
- [Keymaps](#keymaps)
- [Plugins](#plugins)
- [Others](#others)
 - [Patched font for statusline](#patched-font-for-statusline)

## Screen captures

![Capture1](http://i.imgur.com/RVBGbzH.png)

## Install

### Install by script in Linux

Open terminal and execute:

`wget -qO- https://raw.github.com/catro/vim/master/install.sh | sh -x`

### Install manually：(Ubuntu as example)

1. Install ctags: `sudo apt-get install ctags`
- Install other softwares: `sudo apt-get install xclip astyle python-setuptools`
- Install format tool for python: `sudo easy_install -ZU autopep8 flake8 markdown2`
- Backup old configuration if exists:
 - `[ -d ~/.vim ] && mv -f ~/.vim ~/.vim_old`
 - `[ -f ~/.vimrc ] && mv -f ~/.vimrc ~/.vimrc_old`
- Clone the configuration: `git clone git@github.com:catro/vim.git ~/.vim`
- Create vimrc: `ln -s ~/.vim/.vimrc ~/`
- Clone bundle: `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
- Install bundles: `vim +BundleInstall +qall`

### Install in Windows for GVIM

1. Install the following tools and add them to PATH:
 - [msys2](http://www.msys2.org/)
 - [git](https://git-scm.com/)
 - [ctags](http://ctags.sourceforge.net/)
 - [astyle](http://astyle.sourceforge.net/)
 - [python](https://www.python.org/)
 - [setuptools](https://pypi.python.org/pypi/setuptools)
 - `easy_install -ZU autopep8 flake8 markdown2`
- Clear *\_vimrc* in VIM install folder. The default path of 64 bit Windows is:
    *C:\Program Files (x86)\Vim\\_vimrc*
- Open a cmd,
 - `cd %USERPROFILE%`
 - `git clone git@github.com:catro/vim.git vimfiles`
 - `git clone https://github.com/VundleVim/Vundle.vim.git vimfiles/bundle/Vundle.vim`
 - `echo source $HOME/vimfiles/.vimrc>_vimrc`
- Start GVIM and execute: `:BundleInstall`
- Restart GVIM

## Features

1. vimrc supports both Linux and Windows with the same UI.
- Plugin is managed by [vundle](https://github.com/VundleVim/Vundle.vim.git).
- A few bundles for C/C++/Python developer.
- Wonderful theme: [Solarized](https://github.com/altercation/vim-colors-solarized).
- Beautiful statusbar: [airline](https://github.com/vim-airline/vim-airline) with wombat theme.
- Keymaps for commands used frequently.

##Keymaps
1. **\<F1\>**: Open the Tagbar window if it is closed, or close it if it is open.
- **\<F2\>**: Open the NERD-tree window if it is closed, or close it if it is open.
- **\<F3\>**: Start/Stop paste mode.
- **\<F5\>**: 
 - Mapped to make by default.
 - For filetype markdown, convert it to html by markdown2.
 - For filetype python, invoke Flake8 plugin to check syntax and code style.
- **\<F6\>**: Mapped to cn. Display the next error in the list.
- **\<F7\>**: Mapped to cp. Display the previous error in the list.
- **\<F9\>**: Open a new tab.
- **\<F11\>**: Remove trailing spaces.
- **\<F12\>**: Invoke Autoformat plugin to format code.
- **tt**: Replace TAB with four spaces.
- **Ctrl+N**: Go to next tab.
- **Ctrl+P**: Go to previous tab.
- **\<leader\>+1~9**: Go to Nth tab.

## Plugins
- ~~[TagList](https://github.com/vim-scripts/taglist.vim): Provide an overview of the structure of source code files.~~
- [The-NERD-tree](https://github.com/vim-scripts/The-NERD-tree): The NERD tree allows you to explore your filesystem and to open files and directories.
- [snipMate](https://github.com/vim-scripts/snipMate): TextMate's snippets features in Vim.
- ~~[AutoComplPop](https://github.com/vim-scripts/AutoComplPop): Automatically opens popup menu for completions when you enter characters or move the cursor in Insert mode.~~
- [Auto-Pairs](https://github.com/vim-scripts/Auto-Pairs): Insert or delete brackets, parens, quotes in pair.
- [python-imports.vim](https://github.com/vim-scripts/python-imports.vim): This plugin automates the insertion of import statements at the top of a python script.
- [vim-dict](https://github.com/asins/vim-dict): Dictionary files.
- ~~[syntastic](https://github.com/vim-syntastic/syntastic): Syntax checking plugin for Vim.~~
- [vim-template](https://github.com/aperezdc/vim-template): This is a simple plugin for Vim that will allow you to have a set of templates for certain file types.
- [vim-autoformat](https://github.com/Chiel92/vim-autoformat): Format code with one button press.
- [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized): Solarized Colorscheme for Vim.
- [vim-airline](https://github.com/vim-airline/vim-airline): Lean & mean status/tabline for vim that's light as air.
- [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes): Themes for airline.
- [nerdcommenter](https://github.com/scrooloose/nerdcommenter): Comment functions so powerful—no comment necessary.
- [vim-flake8](https://github.com/nvie/vim-flake8): A static syntax and style checker for Python source code.
- [vim-signify](https://github.com/mhinz/vim-signify): It uses signs to indicate added, modified and removed lines based on data of an underlying version control system.
- [tagbar](https://github.com/majutsushi/tagbar): Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure.

## Others

### Patched font for statusline
- To achieve better UI of statusline, you have to install patched font. The default font set in vimrc is [DejaVuSansMono](https://github.com/powerline/fonts/tree/master/DejaVuSansMono).
- Putty setup:

![Select font](http://i.imgur.com/utzwyHA.png)
![Character set](http://i.imgur.com/ifDJcxo.png)

- Xshell setup:

![Font options](http://i.imgur.com/SZ2RcUx.png)
![Disable wide characters](http://i.imgur.com/TY5xwS0.png)
