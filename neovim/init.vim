call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'preservim/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" based on vim-ipython. Still need to research how to use :IPython not working
Plug 'bfredl/nvim-ipy'

call plug#end()

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
" the extra 'i' is to go to insert mode
"map <Leader>tp :vs term://bash<CR>ipython<CR><C-\>H

" Enable folding
set foldmethod=indent
set foldlevel=99

"Enable folding with the spacebar
nnoremap <space> za

"set using nerd font (airline, nerdtree, devicons)
set guifont=Hack\ NF\ 12

au BufNewFile,BufRead *.py,*.java,*.cpp,*.c,*.h,*.md,*.html,*.css,*.js
    \ set expandtab |
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=120 | " this with automatically add a line break when writing long lines
    \ set autoindent |
    \ set fileformat=unix |

"extra line for noting since neovim use utf-8 as default encoding
set encoding=utf-8

" turn on the syntax highlighting
syntax on

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

highlight Comment cterm=italic gui=italic

" ctrlp.vim mapping ctrl + p to invoke, find, and open the file
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra' "When invoked without an explicit starting directory, CtrlP will set its local working directory according to this variable

" NERDRTree shortcut mapping
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" vim-nerdtree-syntax-highlighting config
let s:lightGreen = '42B883'
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:WebDevIconsDefaultFolderSymbolColor = s:lightGreen " sets the color for folders that did not match any rule

set laststatus=2
" set showtabline=2


"---------------------- asthetic ---------------------

" true colours
set background=dark
set t_Co=256

" set bg to be transparent so we can see acrylic
au ColorScheme * hi Normal ctermbg=none guibg=none

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
    set termguicolors
endif

colorscheme gruvbox
"nnoremap <leader>cl set cursorline!


"-------------------------------------------------------

set nu rnu " relative line numbering
set clipboard=unnamed " public copy/paste register
set ruler
set showcmd
set noswapfile " doesn't create swap files
set noshowmode
set shortmess+=c
set omnifunc=syntaxcomplete#Complete

set autoindent " enable auto indentation of lines
filetype plugin indent on
set pastetoggle=<F2> " enable paste mode

set wildmenu "graphical auto complete menu
set lazyredraw "redraws the screne when it needs to
set showmatch "highlights matching brackets
set incsearch "search as characters are entered
set hlsearch "highlights matching searches

" buffer setting
set hidden " switch buffer without prompt even if the current one is modified and unsaved

"clears highlights
nnoremap // :noh<return>
" moves current line down or up
nnoremap <leader>- ddp
nnoremap <leader>_ ddkP
" open vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" update changes into current buffer
nnoremap <leader>sv :source $MYVIMRC<cr>
" enable or disable line wrapping in current buffer
nnoremap <buffer> <localleader>w :set wrap!<cr>
" allow quickly switching buffers by entering the buffer number
nnoremap <F9> :buffers<CR>:buffer<Space>

" toggle built-in spell check in neovim
set spelllang=en_us
nnoremap <leader>sc :set spell!<cr>
" <c-o> is similar with <esc> but it switches back to insert mode after execute one command
inoremap <leader>sc <C-O>:set spell!<cr> 

" c++11 support in syntastic (error checking)
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'


"set powershell to be the default shell permanently (Windows default is cmd.exe)
"set shell=powershell.exe shellquote= shellpipe=\| shellxquote=
"set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
"set shellredir=\|\ Out-File\ -Encoding\ UTF8

" run code
augroup compileandrun
    autocmd!
    autocmd filetype python nnoremap <buffer> <f8> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
    "autocmd filetype python nnoremap <f9> :w <bar> :!time python % <cr>
    autocmd filetype cpp nnoremap <f8> :w <CR> :!g++ -std=c++11 % -o run && .\run.exe <CR> :!del run.exe <CR>
    autocmd filetype c nnoremap <f8> :w <bar> !make %:r && ./%:r <cr>
    autocmd filetype java nnoremap <f8> :w <bar> !javac % && java %:r <cr>
augroup END
