" Basics
set nocompatible
set noexrc

filetype on
filetype plugin on
filetype indent on

syntax enable

" General
set encoding=utf-8
set autoread
set backspace=indent,eol,start
set wildmenu
set wildmode=list:longest
set wildignore=.svn,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.gif
set history=500
set title
set ttyfast
set hidden
set mouse=a
set pastetoggle=<F2>

set ruler
set number
set cursorline

set showmatch
set showcmd

set incsearch
set ignorecase
set infercase
set smartcase

set novisualbell
set hlsearch

" Text format
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround

set autoindent
set smartindent

set completeopt=longest,menuone
set wrap
set wrapscan

let html_no_rendering=1

" Folding
set foldenable
set foldmethod=marker
set foldmarker={,}
set foldlevelstart=100

" Auto commands
autocmd BufWritePre * :%s/\s\+$//e

" Key maps
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

map <S-H> gT
map <S-L> gt

" Saving
nmap <F2> :w<CR>
imap <F2> <ESC>:w<CR>a

" Toggle highlighting
nmap ,h :set hls!<CR>

" Colorscheme
set background=dark
set t_Co=256
if has("gui_running")
    colorscheme solarized
else
    let g:solarized_termcolors=256
    colorscheme solarized
endif
