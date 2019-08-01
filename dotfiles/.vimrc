set nocompatible
scriptencoding utf-8
set encoding=utf-8

let mapleader=","
syntax enable
filetype plugin indent on

set hidden
set nobackup nowritebackup noswapfile

set hlsearch noincsearch smartcase
set number relativenumber

set nowrap
set backspace=indent,eol,start
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab 
set listchars=tab:▸\ ,eol:¬,trail:.,extends:#,nbsp:.
set clipboard^=unnamed,unnamedplus

set history=1000 undolevels=1000
set ruler
set noerrorbells
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
set rtp+=/usr/local/opt/fzf

nmap <LEADER>l :set list!<CR>
nmap <silent> <LEADER>/ :nohlsearch<CR>

nnoremap ; :
nnoremap i :nohlsearch<CR>i
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <ESC> <NOP>
inoremap jj <ESC>`^

inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>
