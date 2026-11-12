set nocompatible
set encoding=utf-8
let g:mapleader = ","

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
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
silent! packadd! hlyank
silent! packadd! matchit
filetype plugin indent on
syntax on
colorscheme slate " (or desert)

""" UI & Appearance
set number
set cursorline
set cmdheight=2
set laststatus=2
set shortmess-=S shortmess-=l shortmess-=f
set ruler
set showcmd
set showmode
set title
set visualbell
set listchars+=tab:>-,trail:·
if has("gui_running")
  set guifont=Menlo:h15,Liberation\ Mono\ 12,DejaVu\ Sans\ Mono\ 11
endif

""" Indentation & Formatting
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=-1  " follows shiftwidth
set shiftround
set smarttab
set nowrap

" format text
nnoremap Q gq

""" Search & Matching
set hlsearch
set incsearch
set ignorecase
set smartcase
set infercase
set showmatch
nnoremap <Leader>h :nohlsearch<CR>

""" Files, Backups & History
set path=.,,**
set autoread
set hidden
set history=1000
set noswapfile
set updatetime=300  " Makes git gutter diff markers update in 300ms
set viminfo+=%

""" Wildmenu / Command-line completion
set wildcharm=<C-z>
set wildmenu
set wildmode=longest:full,full,lastused
set wildignore+=*/.git/*,*/node_modules/*,*/dist/*,*/build/*,*/_modules/*,*/coverage/*,*/.cache/*
set wildignore+=tags,*.png,*.jpg,*.gif,*.so,*.swp,*.o,*.a,*.class,*.DS_Store
set wildignorecase  " Case-insensitive file name matching (:find *button matches Button.js)
set wildoptions+=pum

""" Folding
set foldmethod=marker
set foldmarker={,}
set foldlevelstart=100

""" Mouse & Clipboard
set mouse=ar
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>
if has('clipboard')
  set clipboard^=unnamed,unnamedplus
endif

""" autocomplete
set completeopt=menuone,noinsert,noselect
inoremap <C-Space> <C-x><C-o>

" needed for MacOS/BSD terminals
inoremap <C-@> <C-x><C-o>

""" misc
nnoremap <Leader>v :source $MYVIMRC<CR>
nnoremap <Leader>l :set list!<CR>
iabbrev lorem Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum

""" buffers
nnoremap <Leader>b :buffer <C-Z>
nnoremap <Leader><Space> :buffer#<CR>
nnoremap <BS> :bprevious<CR>
" CTRL-^ switch to alternate (previous) buffer

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

""" search files by name (using ripgrep / git into quickfix)
if executable('rg')
  let g:findprg = 'rg --files --hidden -g "!.git"'
elseif executable('git')
  let g:findprg = 'git ls-files --cached --others --exclude-standard'
else
  let g:findprg = 'find . -type f -not -path "*/.git/*" -not -path "*/node_modules/*"'
endif

command! -nargs=1 Find call setqflist([], ' ', {'lines': systemlist(g:findprg . ' | grep -i ' . shellescape(<q-args>)), 'efm': '%f'}) | cwindow
nnoremap <Leader>f :Find<Space>

""" search across files
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
  autocmd BufWritePre *.js,*.jsx,*.ts,*.tsx,*.css,*.html,*.json,*.md,*.yaml,*.yml call s:format_file()
augroup END

""" quickfix navigation
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap <Leader>q :copen<CR>

" Auto-open results window and allow 'q' to close it
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l* lwindow
  autocmd FileType qf nnoremap <buffer> <silent> q :cclose<CR>
augroup END

" :set makeprg=npx\ oxlint\ -f\ unix
" :set makeprg=npm\ test
