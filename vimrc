execute pathogen#infect()

set nocompatible
set noexrc

filetype on
filetype plugin on
filetype indent on

syntax enable

set mouse=a
set ttyfast
set encoding=utf-8
set novisualbell
set title
set history=500
set autoread
set wildmenu
set wildmode=list:longest
set wildignore=.svn,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.gif

set ruler
set number
set cursorline

set showmatch
set showcmd

set autoindent
set smartindent
set backspace=indent,eol,start

set hlsearch
set incsearch
set ignorecase
set infercase
set smartcase

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

set completeopt=longest,menuone
set wrap
set wrapscan

let html_no_rendering=1
let mapleader=','

set foldmethod=marker
set foldmarker={,}
set foldlevelstart=100

" Auto commands
autocmd BufWritePre * :%s/\s\+$//e

" Colors
set background=dark
if has("gui_running")
    colorscheme solarized
else
    colorscheme default
endif

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
map <S-H> gT
map <S-L> gt

" Show spaces
nmap <leader>s :set list!<CR>

" Show highlighting
nmap <leader>h :set hlsearch!<CR>

" PHP lint
nmap <leader>p :!php -l %<CR>

" JS lint
nmap <leader>j :!jslint --terse --vars --browser --this --continue %<CR>

" Tagbar
nmap <leader>t :TagbarToggle<CR>

" CtrlP
let g:ctrlp_map = '<leader>c'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:50'
let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("e")': ['<c-t>'],
\ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
\ }
