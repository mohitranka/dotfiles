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

nno : ;
nno ; :
vno : ;
vno ; :

" Make sure the arrow keys behave properly
" in insert mode.

inoremap <Esc>A <up>
inoremap <Esc>B <down>
inoremap <Esc>C <right>
inoremap <Esc>D <left>

" disable arrow keys in normal mode

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Disable Esc key in insert mode
inoremap <ESC> <NOP>
" `jj` is used as Esc key in insert mode 
inoremap jj <ESC>`^ " Come back to the normal mode

"Write
inoremap ss <c-o>:w<cr><ESC>`^
nnoremap ss <c-o>:w<cr>

"Write and quit
inoremap sq <c-o>:wq<cr><ESC>`^
nnoremap sq <c-o>:wq<cr>

"quit and ask
inoremap qq <c-o>:qa<cr><ESC>`^
nnoremap qq <c-o>:qa<cr>

"quit & discard
inoremap q1 <c-o>:q!<cr><ESC>`^
nnoremap q1 <c-o>:q!<cr>

" Ctrl-j/k inserts blank line below/above.
nnoremap <silent><C-j> o <ESC>`^
nnoremap <silent><C-k> O <ESC>`^

" Save as sudo
cmap w!! w !sudo tee > /dev/null %
