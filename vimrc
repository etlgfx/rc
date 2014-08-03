set t_Co=256

au BufWritePost *.php !php -l <afile>
au BufWritePost *.js !jshint <afile>

hi ExtraWhitespace ctermbg=red
hi PmenuSel ctermbg=3 ctermfg=4
hi javaScriptValue cterm=bold
hi phpIdentifier cterm=bold

let g:CommandTMaxHeight=20
let g:CommandTMatchWindowReverse=1

set ts=4
set sw=4
set hlsearch
set incsearch
set smartindent
set autoindent
set cindent
set cinoptions+=j1,J1
set ignorecase
set smartcase
set dir=/tmp/
set linebreak
set formatoptions+=tcqor
set nowrap
set wildmenu
set wildignorecase

execute pathogen#infect()
syntax on
filetype plugin indent on

let g:seoul256_background=236
colorscheme seoul256
