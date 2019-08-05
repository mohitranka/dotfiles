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

nmap<silent> <leader>l ;set list!<CR>
nmap<silent> <leader>/ ;nohlsearch<CR>

nno : ;
nno ; :
vno : ;
vno ; :

" Make sure the arrow keys behave properly
" in insert mode.

inoremap<silent> <Esc>A <up>
inoremap<silent> <Esc>B <down>
inoremap<silent> <Esc>C <right>
inoremap<silent> <Esc>D <left>

" disable arrow keys in normal mode

noremap<silent> <Up> <NOP>
noremap<silent> <Down> <NOP>
noremap<silent> <Left> <NOP>
noremap<silent> <Right> <NOP>

" Disable Esc key in insert mode
inoremap<silent> <ESC> <NOP>
" `jj` is used as Esc key in insert mode 
inoremap<silent> jj <ESC>`^ " Come back to the normal mode

"Write
inoremap<silent> ff <c-o>:w<cr><ESC>`^
nnoremap<silent> ff <c-o>:w<cr>

"Write and quit
inoremap<silent> fg <c-o>:wq<cr><ESC>`^
nnoremap<silent> fg <c-o>:wq<cr>

"quit and ask
inoremap<silent> gg <c-o>:qa<cr><ESC>`^
nnoremap<silent> gg <c-o>:qa<cr>

"quit and discard
inoremap<silent> <leader>g <c-o>:q!<cr><ESC>`^
nnoremap<silent> <leader>g <c-o>:q!<cr>

" Go to the end of the line
nnoremap<silent> ll $

" Ctrl-j/k inserts blank line below/above.
nnoremap<silent> <leader>o o <ESC>`^
nnoremap<silent> <leader>0 O <ESC>`^

" Save as sudo
cmap w!! w !sudo tee > /dev/null %
 
" Statusline

set laststatus=2

set statusline=
set statusline+=%#CursorColumn#
set statusline+=\ %f
set statusline+=%m
set statusline+=%r
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ Line\ %l\ of\ %L:\ Column\ %c\  
