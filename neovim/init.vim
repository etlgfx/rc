" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'jonathanfilip/vim-lucius'
Plug 'editorconfig/editorconfig-vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'

" Initialize plugin system
call plug#end()

set ts=4
set sw=4
set hlsearch
set incsearch
set smartindent
set autoindent
set cindent
set cinoptions+=j1,J1
set expandtab
set ignorecase
set smartcase
set dir=/tmp/
set linebreak
set formatoptions+=tcqor
set nowrap
set wildmenu
set wildignorecase
set wildignore=*.obj,*.o,.git,.svn,.class
set diffexpr="diff -w"

syntax on
filetype plugin indent on

"let g:seoul256_background=236
"colorscheme lucius
"LuciusDark
"colorscheme twilight

"hi Todo guifg=#d0ff1a
"hi Search guifg=#000000 guibg=#c0c000

