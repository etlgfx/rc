set t_Co=256

au BufWritePost *.php !php -l <afile>
au BufWritePost *.js !jshint <afile>

hi ExtraWhitespace ctermbg=red
"hi PmenuSel ctermbg=3 ctermfg=4
"hi javaScriptValue cterm=bold
"hi phpIdentifier cterm=bold

let g:CommandTMaxHeight=20
let g:CommandTMatchWindowReverse=1
let g:netrw_sort_sequence='[\/]$,node_modules,\<core\%(\.\d\+\)\=,\.[a-np-z]$,\.h$,\.c$,\.cpp$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'
let g:PHP_vintage_case_default_indent=1

"map  l
"map  k
"map   j
"map  h

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

execute pathogen#infect()
syntax on
filetype plugin indent on

"let g:seoul256_background=236
colorscheme lucius
LuciusDark
"colorscheme twilight

hi Todo guifg=#d0ff1a
hi Search guifg=#000000 guibg=#c0c000

