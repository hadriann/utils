set nocompatible
set encoding=utf-8
let g:mapleader = ","

if empty(glob('~/.vim/autoload/plug.vim'))
  if executable('curl')
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  else
    echohl WarningMsg | echo "curl not found, skipping vim-plug installation" | echohl None
  endif
endif

call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'github/copilot.vim'
Plug 'jonsmithers/vim-html-template-literals'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
call plug#end()

let g:markdown_fenced_languages = ['html', 'css', 'javascript', 'sh', 'json', 'js=javascript', 'bash=sh']
let g:javascript_plugin_jsdoc = 1
let g:htl_css_templates = 1
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
" let g:htl_all_templates = 1

silent! packadd! comment
silent! packadd! editorconfig
silent! packadd! matchit
silent! packadd! hlyank

filetype plugin indent on
syntax on
colorscheme slate " (or desert)

set autoindent
set autoread
set backspace=indent,eol,start
set completeopt=menuone,noinsert,noselect
set cursorline
set expandtab
set foldmethod=marker
set foldmarker={,}
set foldlevelstart=100
set hidden
set history=1000
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
set path=.,,**
set ruler
set shiftround
set shiftwidth=2
set shortmess-=Slf
set showcmd
set showmatch
set showmode
set smartcase
set smarttab
set softtabstop=-1  " same as shiftwidth
set tabstop=2
set title
set updatetime=300  " Makes git gutter diff markers update in 300ms
set viminfo+=%
set visualbell
set wildcharm=<C-z>
set wildmenu
set wildmode=longest:full,full,lastused
set wildignore+=*/.git/*,*/node_modules/*,*/dist/*,*/build/*,*/_modules/*,*/coverage/*,*/.cache/*
set wildignore+=tags,*.png,*.jpg,*.gif,*.so,*.swp,*.o,*.a,*.class,*.DS_Store
set wildignorecase  " Case-insensitive file name matching (:find *button matches Button.js)
set wildoptions+=pum

if has("gui_running")
  set guifont=Menlo:h15,Liberation\ Mono\ 12,DejaVu\ Sans\ Mono\ 11
endif

map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Share clipboard with macOS and Linux desktop
if has('clipboard')
  set clipboard^=unnamed,unnamedplus
endif

""" files
nnoremap <Leader>f :find *

""" completion
" Trigger Omni-completion with Ctrl-Space (matching VS Code; <C-@> is sent on macOS/BSD terminals)
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-x><C-o>

""" buffers
nnoremap <Leader>b :buffer <C-Z>
nnoremap <Leader><Space> :buffer#<CR>
nnoremap <BS> :bprevious<CR>
" CTRL-^ switch to alternate (previous) buffer

""" format text
nnoremap Q gq

""" misc mappings
nnoremap <Leader>v :source $MYVIMRC<CR>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>l :set list!<CR>

""" netrw (configured as a split/buffer explorer)
let g:netrw_banner = 0          " Remove the noisy header banner (press 'I' to toggle)
let g:netrw_liststyle = 3       " Tree style (collapsible folders; press 'i' to cycle styles)
let g:netrw_browse_split = 0    " 0 = open file in current split (replaces netrw cleanly)
let g:netrw_altv = 1            " Open vertical split to the right (when pressing 'v' or :Vexplore)
let g:netrw_alto = 1            " Open horizontal split below (when pressing 'o' or :Sexplore)
let g:netrw_keepdir = 1         " Keep project root locked
let g:netrw_list_hide = '^\..*$,^node_modules/$,\(\.pyc\|\.swp\)$'
let g:netrw_hide = 1            " Hide dotfiles/node_modules by default (press 'a' or 'gh' to toggle)

" '-' opens netrw in current window at the current file's directory (press '-' again to go up)
nnoremap <silent> - :Explore<CR>

" Auto-clean netrw buffers so they do not pollute the buffer list (:ls / :bprevious)
augroup netrw_split
  autocmd!
  autocmd FileType netrw setlocal bufhidden=wipe
  " Press 'q' inside netrw to cancel and go back to previous buffer
  autocmd FileType netrw nnoremap <buffer> <silent> q :bdelete<CR>
augroup END

iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum

""" format on save: local prettier if present, otherwise native indent (=)
function! s:format_file() abort
  let l:prettier = findfile('node_modules/.bin/prettier', expand('%:p:h') . ';')
  let l:view = winsaveview()

  if executable(l:prettier)
    let l:cmd = fnameescape(l:prettier) . ' --stdin-filepath ' . fnameescape(expand('%:p'))
    let l:lines = getline(1, '$')
    let l:output = systemlist(l:cmd, l:lines)

    if v:shell_error == 0 && l:output != l:lines
      silent! undojoin
      call setline(1, l:output)
    endif
  else
    if &filetype !=# 'markdown'
      silent! undojoin
      normal! gg=G
    endif
  endif

  call winrestview(l:view)
endfunction

command! Format call s:format_file()
nnoremap <Leader>= :call <SID>format_file()<CR>

augroup format_on_save
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.html,*.json,*.md,*.yaml call s:format_file()
augroup END

""" project search (ripgrep + quickfix)
if executable('rg')
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --glob\ '!.git'
  set grepformat=%f:%l:%c:%m
elseif executable('git')
  set grepprg=git\ grep\ -n\ --column\ --untracked
  set grepformat=%f:%l:%c:%m
else
  set grepprg=grep\ -rn\ --exclude-dir=node_modules\ --exclude-dir=.git
  set grepformat=%f:%l:%m
endif

" Search mappings: ,g (type query) and ,G (word under cursor)
nnoremap <Leader>g :silent grep! ""<Left>
nnoremap <Leader>G :silent grep! <cword><CR>

" Result navigation (next / previous match)
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>

" Auto-open results window and allow 'q' to close it
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l* lwindow
  autocmd FileType qf nnoremap <buffer> <silent> q :cclose<CR>
augroup END

" :set makeprg=npx\ oxlint\ -f\ unix
" :set makeprg=npm\ test
