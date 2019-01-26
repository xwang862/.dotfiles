" activate pathogen 
execute pathogen#infect()

if has('syntax') && (&t_Co > 2)
  syntax on
endif
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This disables automatic indentation as you type. Use 'on' to turn it on
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
let g:TexDefaultTargetFormat='pdf'

" Show line number by default
set number

" Turn on highlight color for searching
set hlsearch!

" Disable auto comment
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Enable cpplint 
autocmd BufRead * map <F7> :w<enter>:!/usr/local/bin/cpplint %<enter>

" Customize colorscheme for vimdiff
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Customize status line
set laststatus=2        "show status line always
set statusline=%t     "tail of the filename
set statusline+=\ col:\ %c     "cursor column
set statusline+=\ line:\ %l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Some abbreviations
ab nhs nohlsearch

" define a calculator in vim editor command line, using embedded python 
:command! -nargs=+ Calc :py print <args>
:py from math import *
