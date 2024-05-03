--[[

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

set statusline=
set statusline+=%#PmenuSel#
if GitBranch() != '' " TODO put all of this in a function to optimize the double system call away
    set statusline+=↯\ %{StatuslineGit()}\ 
    set statusline+=%{GitStatus()}
endif
set statusline+=\ ▶\ 
set statusline+=%*
set statusline+=%8.64f\  "relative filename
set statusline+=%1.1M\  "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
" set statusline+=⋙\ ⌥\ ↯\ ▶\ ➤\ ➢\ ⨠\ %{StatuslineGit()}\ 
set statusline+=%=      "left/right separator
set statusline+=%#PmenuSel#
set statusline+=%2c,\      "cursor column
set statusline+=%3l/%3L   "cursor line/total lines
set statusline+=\ (%P)\ "percent through file
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag

]]--
