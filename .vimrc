"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle configuration                                                        " 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " be iMproved, required
filetype off                    " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'vim-scripts/taglist.vim'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" All of your Plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic configuration                                                         " 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                       " Syntax highlighting.
colorscheme desert              " Colorscheme.
set autochdir                   " Change the current working directory.
set hlsearch                    " When there is a previous search pattern, highlight all its matches.
set incsearch                   " While typing a search command, show where the pattern, as it was typed so far, matches.
set ignorecase                  " Ignore case in search patterns.
set smartcase                   " Override the 'ignorecase' option if the search pattern contains upper case characters.
set wildmenu                    " Command-line completion operates in an enhanced mode.
set wildmode=longest:full       " Completion mode. Complete till longest common string.
set expandtab                   " Insert spaces instead of TAB.
set softtabstop=4               " Number of spaces that a <Tab> counts.
set shiftwidth=4                " Number of spaces to use for each step of (auto)indent.
set tabstop=4                   " Number of spaces that a <Tab> in the file counts for.
set nobackup                    " Disable backup.
set nowritebackup               " Disable backup.
set autoindent                  " Copy indent from current line when starting a new line.
set cindent                     " Enables automatic C program indenting. 
set number                      " Print line number.
set list                        " Display tab
set listchars=tab:--            " Disable tab as --
set go=                         " Disable GUI effect
set completeopt=longest,menu    " Options for Insert mode completion.
set scrolloff=3                 " Minimal number of screen lines to keep above and below the cursor.
set laststatus=2                " Display status line always.
set autowrite                   " Write the contents of the file, if it has been modified and token to another file.
set mouse=a                     " Enable the mouse in all modes.

" Restore the position of last closed file.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymap                                                                      " 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F1> :Tlist<cr>
set pastetoggle=<F4>
nmap <F5> :make<cr>
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>

" Replace TAB with four spaces.
nmap tt :%s/\t/    /g<CR>

" Copy/Paste
map <C-a> ggVG$"+y
vmap <C-c> "+y
imap <C-v> <Esc>"*pa

" Keymap for VIM tab
nmap <CR> :tabnew<cr>
nmap <C-n> :tabn<cr>
nmap <C-p> :tabp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" QuickFix configuration                                                      " 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Taglist configuration                                                       " 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Sort_Type="name"
let Tlist_Process_File_Always=0
let Tlist_WinWidth=50
