if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'dikiaap/minimalist'
Plug 'mhinz/vim-startify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'jonsmithers/vim-html-template-literals'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

set nocompatible
set noexrc

filetype on
filetype plugin on
filetype indent on

syntax enable

set autoindent
set autoread
set backspace=indent,eol,start
set completeopt=longest,menu
set cursorline
set encoding=utf-8
set expandtab
set foldmethod=marker
set foldmarker={,}
set foldlevelstart=100
set hidden
set history=100
set hlsearch
set incsearch
set ignorecase
set infercase
set laststatus=2
set mouse=ar
set noswapfile
set nowrap
set number
set ruler
set shiftwidth=2
set showcmd
set showmatch
set showmode
set smartcase
set smartindent
set smarttab
set softtabstop=2
set tabstop=2
set title
set ttyfast
set visualbell
set wildignore=.svn,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.gif,tags,node_modules,bower_components
set wildmenu
set wildmode=list:longest,full

set background=dark
colorscheme minimalist

let mapleader = ','
let html_no_rendering = 1
let html_indent_script1 = "inc"
let html_indent_style1 = "inc"

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

""" toggle show spaces
map <leader>s :set list!<CR>

""" toggle search highlight
map <leader>h :set hlsearch!<CR>

""" php lint
map <leader>p :!php -l %<CR>

""" ctrlp
map <C-b> :CtrlPMRU<CR>
let ctrlp_working_path_mode = 0
let ctrlp_by_filename = 1
let ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:50'
let ctrlp_max_files = 0

""" ack
if executable('ag')
  let ackprg = 'ag --vimgrep'
endif

""" ale
let g:ale_linters = {'javascript': ['eslint'], 'html': ['eslint']}
let g:ale_linter_aliases = {'html': ['html', 'javascript']}
let g:ale_fixers = {'javascript': ['prettier'], 'html': ['prettier'], 'css': ['prettier']}
let g:ale_open_list = 1
let g:ale_fix_on_save = 1

""" nerdtree
let NERDTreeMinimalUI = 1
let NERDTreeMouseMode = 3
map <leader>n :NERDTreeFind<CR>
map <leader>m :NERDTreeToggle<CR>

autocmd vimenter * NERDTree | wincmd p
autocmd bufwritepre * :%s/\s\+$//e
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
