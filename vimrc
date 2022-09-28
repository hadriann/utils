if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'dense-analysis/ale'
"Plug 'editorconfig/editorconfig-vim'
Plug 'jonsmithers/vim-html-template-literals'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

set nocompatible

filetype plugin indent on
syntax on

runtime macros/matchit.vim

set autoindent
set autoread
set backspace=indent,eol,start
set cmdheight=2
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
set listchars+=tab:>-,trail:·
set mouse=ar
set noswapfile
set nowrap
set number
"set path=.,,src/**,scripts/**,public/**,common/**,packages/**,demo/**,styles/**,components/**,elements/**
set path=.,,**
set ruler
set shiftround
set shiftwidth=2
set shortmess-=S
set shortmess-=l
set shortmess-=f
set showcmd
set showmatch
set showmode
set smartcase
set smartindent
set smarttab
set softtabstop=2
"set statusline=%f%=%l
set tabstop=2
set title
set updatetime=1000
"set viminfo+=%
set visualbell
set wildcharm=<C-z>
set wildmenu
set wildignore+=*/.git/*,*/node_modules/*,*/dist/*,*/_modules/*
set wildignore+=tags,*.png,*.jpg,*.gif,*.so,*.swp,*.o,*.a,*.class

set background=dark
colorscheme desert

if has("gui_running")
  set lines=999 columns=9999
  if has("gui_gtk")
    set guifont=Liberation\ Mono\ 13
  else
    set guifont=Menlo:h15
  endif
endif

let html_no_rendering = 1
let html_indent_script1 = "inc"
let html_indent_style1 = "inc"
let g:mapleader = ","

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

""" remap Ex-mode switching to text formatting
nnoremap Q gq

""" misc mappings
nnoremap <Leader>v :source $MYVIMRC<CR>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>l :set list!<CR>

""" buffers
"nnoremap <Leader>b :ls<CR>:buffer<Space>
"nnoremap <Leader>b :buffer <C-z><S-Tab>
nnoremap <Leader>b :buffer <C-Z>
nnoremap <Leader>m :bnext<CR>
nnoremap <BS> :buffer#<CR>

""" files
nnoremap <Leader>f :find *

""" netrw
nnoremap <Leader>e :Rexplore<CR>
let g:netrw_liststyle=3

""" ctrlp
nnoremap <Leader>r :CtrlPMRU<CR>
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:20,results:50'
let g:ctrlp_max_files = 0
let g:ctrlp_show_hidden = 1
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

iabbrev Lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum

""" ack
if executable('ag')
  let ackprg = 'ag --vimgrep'
endif

""" ale
"let g:ale_linters = {'javascript': ['eslint'], 'html': ['eslint']}
"let g:ale_linter_aliases = {'html': ['html', 'javascript']}
"let g:ale_fixers = {'javascript': ['prettier'], 'html': ['prettier'], 'css': ['prettier']}
"let g:ale_open_list = 1
"let g:ale_fix_on_save = 1

augroup lint
  autocmd!
  autocmd FileType javascript,html,css,json,yaml,markdown setlocal formatprg=npx\ prettier\ --stdin-filepath\ %
  autocmd BufWritePre *.js,*.mjs,*.html,*.css,*.json,*.yaml,*.md normal gggqG`^
augroup END

"autocmd FileType javascript setlocal makeprg=npx\ denolint
"autocmd BufWritePost *.js,*.mjs silent make! <afile> | silent redraw!

augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
augroup END

"let &grepprg='grep -rIn --exclude=tags --exclude-dir={.git,node_modules,dist,_modules} $*'
