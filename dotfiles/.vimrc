set nocompatible

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

set noerrorbells

set rtp+=/usr/local/opt/fzf

nmap <LEADER>l :set list!<CR>
nmap <silent> <LEADER>/ :nohlsearch<CR>

nnoremap ; :

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
