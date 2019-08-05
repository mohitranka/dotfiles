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

nmap <leader>l ;set list!<CR>
nmap <silent> <leader>/ ;nohlsearch<CR>

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
inoremap ff <c-o>:w<cr><ESC>`^
nnoremap<silent> ff <c-o>:w<cr>

"Write and quit
inoremap fg <c-o>:wq<cr><ESC>`^
nnoremap<silent> fg <c-o>:wq<cr>

"quit and ask
inoremap gg <c-o>:qa<cr><ESC>`^
nnoremap<silent> gg <c-o>:qa<cr>

"quit and discard
inoremap qq <c-o>:q!<cr><ESC>`^
nnoremap<silent> qq <c-o>:q!<cr>

" Go to the end of the line
nnoremap<silent> ll $

" Ctrl-j/k inserts blank line below.
nnoremap <silent><S-o> o <ESC>`^

" Save as sudo
cmap w!! w !sudo tee > /dev/null %
 
" Statusline

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set laststatus=2

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\
