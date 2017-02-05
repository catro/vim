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
Plugin 'asins/vim-dict'
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
set statusline=%f%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]
                                " Content of statusline

" Set highlight cursor line and column.
hi CursorLine cterm=None term=reverse ctermbg=0 guibg=Grey40
hi CursorColumn cterm=None term=reverse ctermbg=0 guibg=Grey40

" Restore the position of last closed file.
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymap                                                                      " 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F1> :Tlist<cr>
nmap <F2> :NERDTreeToggle<CR>
set pastetoggle=<F4>
nmap <F5> :make<cr>
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>
nmap <F12> :call FormartSrc()<CR><CR>

" Replace TAB with four spaces.
nmap tt :%s/\t/    /g<CR>

" Copy/Paste
map <C-a> ggVG$"+y
vmap <C-c> "+y
imap <C-v> <Esc>"*pa

" Keymap for VIM tab.
nmap <CR> :tabnew<cr>
nmap <C-n> :tabn<cr>
nmap <C-p> :tabp<cr>

" Function to format source code.
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc


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
" NERD-Tree configuration                                                       " 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Close vim if the only window left is a NERDTree.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeWinPos = "right"
let NERDTreeIgnore=['\.pyc', '\.pyo']
