" designed for vim 8+


set nocompatible

"####################### Vi Compatible (~/.exrc) #######################

" automatically indent new lines
set autoindent " (alpine)

" replace tabs with spaces automatically
set expandtab " (alpine)

" number of spaces to replace a tab with when expandtab
set tabstop=2 " (alpine)

" use case when searching
set noignorecase

" automatically write files when changing when multiple files open
set autowrite

" deactivate line numbers
set nonumber

" turn col and row position on in bottom right
set ruler " see ruf for formatting

" show command and insert mode
set showmode

"#######################################################################

" disable visual bell (also disable in .inputrc)
set t_vb=

let mapleader=","

set softtabstop=2

" mostly used with >> and <<
set shiftwidth=2

set smartindent

set smarttab

if v:version >= 800
  " stop vim from silently messing with files that it shouldn't
  set nofixendofline

  " better ascii friendly listchars
  set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>

  " i hate automatic folding
  set foldmethod=manual
  set nofoldenable
endif

" mark trailing spaces as errors
match IncSearch '\s\+$'

" enough for line numbers + gutter within 80 standard
set textwidth=72
"set colorcolumn=73

" disable relative line numbers, remove no to sample it
set norelativenumber

" makes ~ effectively invisible
"highlight NonText guifg=bg

" turn on default spell checking
"set spell

" disable spellcapcheck
set spc=

" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

set icon

" center the cursor always on the screen
"set scrolloff=999

" highlight search hits
set hlsearch
set incsearch
set linebreak

" avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtTI

" prevents truncated yanks, deletes, etc.
set viminfo='20,<1000,s1000

" not a fan of bracket matching or folding
if has("eval") " vim-tiny detection
  let g:loaded_matchparen=1
endif
set noshowmatch

" wrap around when searching
set wrapscan
set nowrap

" Just the formatoptions defaults, these are changed per filetype by
" plugins. Most of the utility of all of this has been superceded by the use of
" modern simplified pandoc for capturing knowledge source instead of
" arbitrary raw text files.

set backspace=indent,eol,start

" stop complaints about switching buffer with changes
set hidden

" command history
set history=100

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

" high contrast for streaming, etc.
set cinoptions+=:0

"set ruf=%30(%=%#LineNr#%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))

  " github.com/junegunn/vim-plug

  call plug#begin('~/.local/share/vim/plugins')
  Plug 'conradirwin/vim-bracketed-paste'
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'dahu/vim-asciidoc'
  Plug 'preservim/nerdtree'
  Plug 'dense-analysis/ale'
  call plug#end()

  let g:ale_sign_error = '☠'
  let g:ale_sign_warning = '🙄'
  let g:ale_linters = {'go': ['gometalinter', 'gofmt','gobuild']}
endif

" make Y consistent with D and C (yank til end)
map Y y$

" better command-line completion
set wildmenu

" better cursor movement
"set virtualedit=all
set wrap

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

" enable omni-completion
set omnifunc=syntaxcomplete#Complete
imap <tab><tab> <c-x><c-o>

"fix bork bash detection
if has("eval")  " vim-tiny detection
fun! s:DetectBash()
    if getline(1) == '#!/usr/bin/bash' || getline(1) == '#!/bin/bash'
        set ft=bash
        set shiftwidth=2
    endif
endfun
autocmd BufNewFile,BufRead * call s:DetectBash()
endif

nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" disable arrow keys (vi muscle memory)
" noremap <up> :echoerr "Umm, use k instead"<CR>
" noremap <down> :echoerr "Umm, use j instead"<CR>
" noremap <left> :echoerr "Umm, use h instead"<CR>
" noremap <right> :echoerr "Umm, use l instead"<CR>
" inoremap <up> <NOP>
" inoremap <down> <NOP>
" inoremap <left> <NOP>
" inoremap <right> <NOP>

" better use of arrow keys, number increment/decrement
" nnoremap <up> <C-a>
" nnoremap <down> <C-x>

" Better page down and page up
noremap <C-n> <C-d>
noremap <C-p> <C-b>

syntax off
