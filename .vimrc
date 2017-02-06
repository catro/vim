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
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'vim-scripts/snipMate'
"Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/Auto-Pairs'
Plugin 'vim-scripts/python-imports.vim'     "<C-f> to append necessary import.
Plugin 'asins/vim-dict'
"Plugin 'vim-syntastic/syntastic'
Plugin 'aperezdc/vim-template'
Plugin 'Chiel92/vim-autoformat'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic configuration                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on                       " Syntax highlighting.
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
set complete+=k                 " Add dictionary completion source.
set scrolloff=3                 " Minimal number of screen lines to keep above and below the cursor.
set laststatus=2                " Display status line always.
set autowrite                   " Write the contents of the file, if it has been modified and token to another file.
set mouse=a                     " Enable the mouse in all modes.
set cursorline                  " Highlight the screen line of the cursor with CursorLine.
set cursorcolumn                " Highlight the screen column of the cursor with CursorColumn.
set ruler                       " Show the line and column number of the cursor position
set showcmd                     " Show (partial) command in the last line of the screen.
set encoding=utf-8              " Sets the character encoding used inside Vim.
set history=1000                " Count of history.
set autoread                    " When a file has been detected to have been changed outside of Vim, automatically read it again.
set backspace=2                 " Let backspace handle indent, eol and start.
set whichwrap+=<,>,h,l          " Allow specified keys that move the cursor left/right to move to the previous/next line.
set report=0                    " Always report number of lines changed.

" Set format program.
autocmd FileType c,cpp,hpp set formatprg=astyle\ --style=ansi

" Restore the position of last closed file.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized colorscheme                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme solarized
let g:solarized_termcolors=256


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline colorscheme                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#syntastic#enabled=1
" unicode symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymap                                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F1> :Tlist<cr>
nmap <F2> :NERDTreeToggle<CR>
set pastetoggle=<F4>
nmap <F5> :make<cr>             "Remapped if filetype is python.
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>
nmap <F9> :tabnew<cr>
nmap <F11> :%s/\s\+$//e<CR>
nmap <F12> :Autoformat<CR>

" Split navigations.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Folding.
nmap ` za

" Replace TAB with four spaces.
nmap tt :%s/\t/    /g<CR>

" Copy/Paste.
map <C-a> ggVG$"+y
vmap <C-c> "+y
imap <C-v> <Esc>"*pa

" Keymap for VIM tab.
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD-Tree configuration                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Close vim if the only window left is a NERDTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore=['\.pyc', '\.pyo']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic configuration                                                     "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_ignore_files = ['.c$', '.h$']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" flake8 configuration                                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let no_flake8_maps = 1
autocmd FileType python nmap <F5> :call Flake8()<CR>
