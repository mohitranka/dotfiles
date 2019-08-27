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
inoremap<silent> zz <c-o>:w<cr><ESC>`^
nnoremap<silent> zz <c-o>:w<cr>

"Write and quit
inoremap<silent> sq <c-o>:wq<cr><ESC>`^
nnoremap<silent> sq <c-o>:wq<cr>

"quit and ask
inoremap<silent> qq <c-o>:qa<cr><ESC>`^
nnoremap<silent> qq <c-o>:qa<cr>

"quit and discard
inoremap<silent> <leader>q <c-o>:q!<cr><ESC>`^
nnoremap<silent> <leader>q <c-o>:q!<cr>

" Go to the end of the line
nnoremap<silent> ll $b

" inserts blank line below/above.
nnoremap<silent> <leader>o o <ESC>`^
nnoremap<silent> <leader>0 O <ESC>`^

" Open terminal in a buffer quickly
nnoremap<silent> <leader>t :vnew<cr><c-o>:terminal ++curwin<cr>

" Split buffers quickly
nnoremap<silent> <leader>\| :vnew<cr>
nnoremap<silent> <leader>_ :new<cr>

" buffer shortcuts
nnoremap<silent> <tab> <c-w>w
nnoremap<silent> <leader>f <c-w><bar>
nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

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

" Read aliases
let $BASH_ENV = "~/.alias"

" Background highlight
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

" Go specific config
" vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_addtags_transform = "snakecase"

" Use deoplete.
if has('nvim')
    let g:deoplete#auto_complete_start_length = 1
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
    set completeopt-=preview


    " Plugin key-mappings.
    imap <silent><C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <silent><C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <silent><C-k>     <Plug>(neosnippet_expand_target)

    imap <expr><TAB>
    \ pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

endif 

" Load all plugins now.
packloadall
" Load all of the helptags now, after plugins have been loaded.
silent! helptags ALL
