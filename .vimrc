"NeoBundle stuff

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'JuliaLang/julia-vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'YorickPeterse/Autumn.vim'
if v:version > 703
  NeoBundle 'vim-pandoc/vim-pandoc'
else
  NeoBundle 'vim-pandoc/vim-pandoc-syntax', '7.3'
endif
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'farseer90718/vim-taskwarrior'
NeoBundle 'elzr/vim-json'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" End NeoBundle

augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

set nocompatible
set foldmethod=marker

"filetype on
"filetype plugin on
"filetype plugin indent on

set grepprg=grep\ -nH\ $*

set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=4
set softtabstop=4
set tabstop=4

set wildmenu
set wildmode=list:longest,full

set mouse=a
set ruler

set incsearch
highlight MatchParen ctermbg=4

"tabs
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-t> :tabnew<CR>

"persistent undo
"set undodir=~/.vim/undodir
"set undofile
"set undolevels = 1000 "maximum number of changes that can be undone
"set undoreload = 10000 "maximum number lines to save for undo on a buffer reload


"fix backspace on mac
set backspace=indent,eol,start
fixdel

"Disable arrow keys
nmap <right> <nop>
nmap <left> <nop>
nmap <up> <nop>
nmap <down> <nop>
imap <right> <nop>
imap <left> <nop>
imap <up> <nop>
imap <down> <nop>


"solarized colorscheme
set t_Co=256
syntax enable
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

"Some stuff for latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'

"Use pandoc for markdown files by default
au BufNewFile,BufRead *.md   set filetype=markdown.pandoc

"use JSON formating for params files
au BufNewFile,BufRead *.params   set filetype=json


