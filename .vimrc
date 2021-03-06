call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'jsborjesson/vim-uppercase-sql'

call plug#end()

filetype plugin indent on

" lightline plugin - display the status bar
set laststatus=2

" ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" nerdtree config
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" ----------------- linux customization ---------------
" diable bells/visualbells altogether
set vb
set t_vb = 
" set cursorline when entering insert mode
hi CursorLine cterm=NONE ctermbg=black guibg=#313738 " set highlght bg instead of default  underline
:autocmd InsertEnter * set cursorline
:autocmd InsertLeave * set nocursorline

" mapping backspace in vim to delete chars
noremap! <C-?> <C-h>
"solved by run `stty erase ^?` in bash shell instead

" convert file format from DOS(Windows) to Unix
set ff=unix

" -----------------------------------------------------

set encoding=utf-8

syntax on

set exrc
set guicursor=
set nu relativenumber
set cmdheight=1
set hlsearch
set hidden
set noerrorbells

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set textwidth=80

set wrap
set smartcase
set noswapfile
set incsearch

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=500

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" since we're using lightline. do not show default -- INSERT --
set noshowmode
set scrolloff=5 " Keep 5 lines below and above the cursor"
"set mouse+=a " copy with mouse without including the line numbersa & tailing space


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


"---------------------- asthetic ---------------------

" true colours
set background=dark
set t_Co=256

if (has("termguicolors"))
    set termguicolors
endif

" Lighline theme config
let g:lightline = {'colorscheme': 'seoul256'}

colorscheme gruvbox
" transparent bg
hi Normal guibg=NONE ctermbg=NONE

"-------------------------------------------------------

autocmd filetype c nnoremap <f8> :w <bar> :!clear <CR>:!gcc -Wall % -o run && ./run <CR> :!rm run <CR>
