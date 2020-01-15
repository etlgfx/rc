set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/vim-plug')

Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'jonathanfilip/vim-lucius'
Plug 'scrooloose/nerdtree'
Plug 'zchee/nvim-go', { 'do': 'make'}
Plug 'svermeulen/nvim-marksman', { 'do': ':UpdateRemotePlugins' }
Plug 'ripxorip/bolt.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()
filetype plugin indent on    " required


set t_Co=256

" au BufWritePost *.php !php -l <afile>
" au BufWritePost *.js !jshint <afile>

hi ExtraWhitespace ctermbg=red

let g:netrw_sort_sequence='[\/]$,node_modules,\<core\%(\.\d\+\)\=,\.[a-np-z]$,\.h$,\.c$,\.cpp$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'
let g:PHP_vintage_case_default_indent=1

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
colorscheme lucius
LuciusDark
"colorscheme twilight

hi Todo guifg=#d0ff1a
hi Search guifg=#000000 guibg=#c0c000

