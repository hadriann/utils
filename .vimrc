if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"Plug 'mileszs/ack.vim'
"Plug 'dense-analysis/ale'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'editorconfig/editorconfig-vim'
"Plug 'preservim/nerdtree'
"Plug 'tpope/vim-commentary'
"Plug 'airblade/vim-gitgutter'
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'jonsmithers/vim-html-template-literals'
Plug 'pangloss/vim-javascript'
"Plug 'tpope/vim-surround'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

set nocompatible

filetype plugin indent on
syntax on

runtime macros/matchit.vim

set autoindent
set autoread
set backspace=indent,eol,start
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
set shiftround
set shiftwidth=2
set showmatch
set showmode
set smartcase
set smartindent
set smarttab
set softtabstop=2
set tabstop=2
set title
set visualbell
set wildmenu
set wildignore+=.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.swp,*.jpg,*.png,*.gif,tags,node_modules,*/_modules/*
set path+=src/**,scripts/**,public/**,common/**,packages/**

set background=light

if has("gui_running")
  set guifont=Menlo:h15
  set lines=999 columns=9999
endif

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
"map <leader>p :!php -l %<CR>

""" ctrlp
map <C-b> :CtrlPMRU<CR>
let ctrlp_working_path_mode = 0
let ctrlp_by_filename = 1
let ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:50'
let ctrlp_max_files = 0

""" ack
"if executable('ag')
"  let ackprg = 'ag --vimgrep'
"endif

""" ale
"let g:ale_linters = {'javascript': ['eslint'], 'html': ['eslint']}
"let g:ale_linter_aliases = {'html': ['html', 'javascript']}
"let g:ale_fixers = {'javascript': ['prettier'], 'html': ['prettier'], 'css': ['prettier']}
"let g:ale_open_list = 1
"let g:ale_fix_on_save = 1

""" nerdtree
"xlet NERDTreeMinimalUI = 1
"let NERDTreeMouseMode = 3
"map <leader>n :NERDTreeFind<CR>
"map <leader>m :NERDTreeToggle<CR>

"autocmd vimenter * NERDTree | wincmd p
"autocmd bufwritepre * :%s/\s\+$//e

augroup lint
  autocmd!

  autocmd FileType javascript setlocal makeprg=npx\ denolint
  autocmd BufWritePost *.js silent make! <afile> | silent redraw!

  autocmd FileType javascript,html,css,json,yaml,markdown setlocal formatprg=npx\ prettier\ --stdin-filepath\ %
  autocmd BufWritePre *.js,*.html,*.css,*.json,*.yaml,*.md normal gggqG`^

  autocmd QuickFixCmdPost [^l]* cwindow
augroup END
