set guifont=Inconsolata\ 10
set guioptions=acig
set lines=54
set columns=194
"set list
"set listchars=trail:!,tab:\\_
colorscheme pablo
"hi SpecialKey guifg=#b00 guibg=#600
hi Type guifg=#7f3
hi StorageClass guifg=#d10
hi Typedef guifg=#d10
hi Structure guifg=#d10
hi Constant guifg=#f53
hi Special guifg=#57f
hi Pmenu guifg=#fff guibg=#45a
hi PmenuSel guifg=#000 guibg=#fff
hi phpIdentifier guifg=#acf gui=bold
hi MatchParen guifg=#5f5 guibg=#444
hi Visual guibg=#3f3 guifg=#000
hi Comment gui=italic
hi javaScriptValue gui=bold

hi ExtraWhitespace ctermbg=red guibg=red
"au BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t\|^\t*\zs \+\ze[^\*]/
au BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t/
"Show tabs that are not at the start of a line:
"match ExtraWhitespace /[^\t]\zs\t\+/
