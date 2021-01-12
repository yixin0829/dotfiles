call plug#begin('~/.vim/plugged')


call plug#end()

set encoding=utf-8

syntax on
filetype plugin indent on
noremap! <C-?> <C-h>
set ff=unix

set exrc
set guicursor=
set nu relativenumber
set hlsearch
set hidden
set noerrorbells

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=120

set nowrap
set smartcase
set noswapfile
set incsearch

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" ----------------- window splits --------------------
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Enable folding
set foldmethod=indent
set foldlevel=99

"Enable folding with the spacebar
nnoremap <space> za

"clears highlights
nnoremap // :noh<return>
" moves current line down or up
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP
" open vimrc in vertical split
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
" enable or disable line wrapping in current buffer
nnoremap <buffer> <localleader>w :set wrap!<cr>
" allow quickly switching buffers by entering the buffer number
nnoremap <F9> :buffers<CR>:buffer<Space>



" ------------------ Plugin config --------------------


"---------------------- asthetic ---------------------

" true colours
set background=dark
set t_Co=256

if (has("termguicolors"))
    set termguicolors
endif

"-------------------------------------------------------
