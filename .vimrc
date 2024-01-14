set nocompatible

filetype plugin indent on

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': 'yarn install' }
call plug#end()

let mapleader ='.'

set autoindent

" automatically write files when changing when multiple files open
set autowrite

set number
set list listchars=tab:»·,trail:·,nbsp:·

set cursorline
hi cursorline cterm=none term=none

" turn col and row position on in bottom right
set ruler " see ruf for formatting

" show command and insert mode
set showmode

set tabstop=2

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

  " i hate automatic folding
  set foldmethod=manual
  set nofoldenable
endif

" mark trailing spaces as errors
match IncSearch '\s\+$'

set laststatus=0

" enough for line numbers + gutter within 80 standard
set textwidth=72
"set colorcolumn=73

" replace tabs with spaces automatically
set expandtab

" disable relative line numbers, remove no to sample it
set norelativenumber

" turn on default spell checking
"set spell

" disable spellcapcheck
set spc=

" more risky, but cleaner
set nobackup
set noswapfile
set nowritebackup

set icon

set hlsearch
set incsearch
set linebreak

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

set fo-=t   " don't auto-wrap text using text width
set fo+=c   " autowrap comments using textwidth with leader
set fo-=r   " don't auto-insert comment leader on enter in insert
set fo-=o   " don't auto-insert comment leader on o/O in normal
set fo+=q   " allow formatting of comments with gq
set fo-=w   " don't use trailing whitespace for paragraphs
set fo-=a   " disable auto-formatting of paragraph changes
set fo-=n   " don't recognized numbered lists
set fo+=j   " delete comment prefix when joining
set fo-=2   " don't use the indent of second paragraph line
set fo-=v   " don't use broken 'vi-compatible auto-wrapping'
set fo-=b   " don't use broken 'vi-compatible auto-wrapping'
set fo+=l   " long lines not broken in insert mode
set fo+=m   " multi-byte character line break support
set fo+=M   " don't add space before or after multi-byte char
set fo-=B   " don't add space between two multi-byte chars
set fo+=1   " don't break a line after a one-letter word

" stop complaints about switching buffer with changes
set hidden

" command history
set history=100

" here because plugins and stuff need it
if has("syntax")
  syntax enable
endif

set so=20

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

" high contrast for streaming, etc.
set background=dark
let &statusline='%#Normal# '

let maplocalleader = ","
nnoremap <esc><esc> :noh<return>
nnoremap <C-f> :call CocAction("doQuickfix")<CR>

let g:indentLine_char = "▏"
let g:indent_blankline_space_char = " "
let g:indent_blankline_filetype_exclude = [
  \ "help",
  \ "term",
  \ "packer",
  \ "dashboard",
  \ "NvimTree",
  \ ]

let g:indent_blankline_show_first_indent_level = v:true
let g:indent_blankline_show_trailing_blankline_indent = v:false

let g:coc_global_extensions = [
  \ 'coc-json',
  \ 'coc-emmet',
  \ 'coc-python',
  \ 'coc-eslint',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-snippets',
  \ 'coc-explorer',
  \ ]

let g:coc_explorer_global_presets = {
  \ 'floating': {
  \   'position': 'floating',
  \ },
  \ }

let g:endoflines = {
  \ 'unix': 'lf',
  \ 'windows': 'crlf'
  \ }

let g:ctrlp_map = '<leader>pp'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
	\ 'dir': '\v[\/](build|node_modules|target|dist)|(\.(swp|ico|git|svn))$',
	\ 'file': '\v\.(dll|min.js|min.css|jpg|png|mp4)$'
	\ }

nmap <silent> <leader><left> :tabprev<CR>
nmap <silent> <leader><right> :tabnext<CR>

nmap <F2> <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gp <Plug>(coc-diagnostic-info)
nmap <silent> gs <Plug>(coc-search)

nmap <silent> <leader>nn :CocCommand explorer<CR>
nmap <silent> <leader>ss :call SynStack()<CR>
nmap <silent> <leader>coc :CocConfig<CR>

noremap <silent> K :call ShowDocumentation()<CR>

autocmd BufNewFile,BufRead *.hh set tabstop=4 softtabstop=0 expandtab shiftwidth=4
autocmd BufNewFile,BufRead *.cc set tabstop=4 softtabstop=0 expandtab shiftwidth=4

autocmd BufNewFile,BufRead *.h set tabstop=4 softtabstop=0 expandtab shiftwidth=4
autocmd BufNewFile,BufRead *.c set tabstop=4 softtabstop=0 expandtab shiftwidth=4
