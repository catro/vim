"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle configuration                                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " be iMproved, required
filetype off                    " required

" set the runtime path to include Vundle and initialize
if has('win32')
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$HOME/vimfiles/bundle/')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugin on GitHub repo
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'vim-scripts/snipMate'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'vim-scripts/Auto-Pairs'
"Plugin 'vim-scripts/python-imports.vim'     "<C-f> to append necessary import.
Plugin 'asins/vim-dict'
"Plugin 'vim-syntastic/syntastic'
Plugin 'aperezdc/vim-template'
Plugin 'Chiel92/vim-autoformat'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'nvie/vim-flake8'
Plugin 'mhinz/vim-signify'
Plugin 'majutsushi/tagbar'

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
set foldmethod=manual           " Create fold marker manually.
set foldlevelstart=99           " Disable most of folders.
set fileformats=dos,unix        " Set the end-of-line formats.

" Maximize the window.
if has('win32')
    au GUIEnter * simalt ~x
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=.git/*,.hg/*,.svn/*
endif
set wildignore+=*.o,*~,*.pyc,*.pyo,*.swp

" Set text width and fileformats
autocmd BufRead,BufNewFile *.py setlocal textwidth=80

" Use TAB for Makefile
autocmd BufRead,BufNewFile Makefile setlocal noexpandtab

" Set unix file format
autocmd BufRead,BufNewFile Makefile,*.py,*.sh setlocal fileformat=unix

" Set format program.
autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.hpp set formatprg=astyle\ --style=ansi

" Restore the position of last closed file.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized colorscheme                                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
try
    colorscheme solarized
catch
    colorscheme desert
endtry
let g:solarized_termcolors=256




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymap                                                                      "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F1> :Tlist<cr>
"nmap <F1> :TagbarToggle<cr>
nmap <F2> :NERDTreeToggle<CR>
set pastetoggle=<F4>
nmap <F5> :make<cr>
autocmd BufRead,BufNewFile *.markdown,*.mk,*.mkd nmap <F5> :!markdown2 %>%.html<CR><CR>
autocmd BufRead,BufNewFile *.py nmap <F5> :call Flake8()<CR>
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>
nmap <F8> :setlocal spell! spelllang=en_us<CR>
imap <F8> <C-\><C-O>:setlocal spelllang=en_us spell! spell?<CR>
nmap <F9> :tabnew<cr>
nmap <F11> :%s/\s\+$//e<CR>
nmap <F12> :Autoformat<CR>

" Split navigations.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

" Folding.
nmap <leader>f :set foldmethod=syntax<cr>
nmap - zf%
nmap + zo
nmap ` za

" Replace TAB with four spaces.
nmap tt :%s/\t/    /g<CR>

" Copy/Paste/Save.
map <C-a> ggVG$"+y
vmap <C-c> "+y
imap <C-v> <Esc>"+gP
vmap <C-v> "+gP
cmap <C-v> <C-R>+
nmap <C-s> :w<cr>
imap <C-s> <Esc>:w<cr>
vmap <C-s> <Esc>:w<cr>

" Keymap for VIM tab.
nmap <C-n> :tabn<cr>
nmap <C-p> :tabp<cr>
nmap <leader>1 1gt<cr>
nmap <leader>2 2gt<cr>
nmap <leader>3 3gt<cr>
nmap <leader>4 4gt<cr>
nmap <leader>5 5gt<cr>
nmap <leader>6 6gt<cr>
nmap <leader>7 7gt<cr>
nmap <leader>8 8gt<cr>
nmap <leader>9 9gt<cr>

" Disable highlighed maches
nmap <leader><space> :nohlsearch<CR>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" jk is escape
inoremap jk <esc>

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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar configuration                                                        "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tagbar_foldlevel = 1
let g:tagbar_left = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline colorscheme                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_section_c = '%f%m'
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
"Airline theme
let g:airline_theme='wombat'
"Patched font
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h11
"tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#tab_nr_type = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" signify colorscheme                                                         "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:signify_update_on_focusgained = 1
