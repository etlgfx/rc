set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/vim-plug')

" colors
Plug 'jonathanfilip/vim-lucius'
Plug 'habamax/vim-gruvbit'
" Plug 'co1ncidence/mountaineer'
Plug 'megantiu/true.vim'

Plug 'editorconfig/editorconfig-vim'

Plug 'scrooloose/nerdtree'
" Plug 'zchee/nvim-go', { 'do': 'make'}
Plug 'svermeulen/nvim-marksman', { 'do': ':UpdateRemotePlugins' }
Plug 'ripxorip/bolt.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'ianks/vim-tsx'
" Plug 'leafgarland/typescript-vim'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'airblade/vim-gitgutter'

call plug#end()

set t_Co=256

" au BufWritePost *.php !php -l <afile>
" au BufWritePost *.js !jshint <afile>

hi ExtraWhitespace ctermbg=red

let g:python3_host_prog = '~/.pyenv/versions/3.10.0/bin/python'
let g:loaded_python_provider = 0
let g:netrw_sort_sequence='[\/]$,node_modules,\<core\%(\.\d\+\)\=,\.[a-np-z]$,\.h$,\.c$,\.cpp$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'
let g:PHP_vintage_case_default_indent=1
let g:deoplete#enable_at_startup=1

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
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set scrolloff=8
set sidescrolloff=8

syntax on
filetype plugin indent on

set termguicolors
colorscheme gruvbit

hi Todo guifg=#d0ff1a
hi Search guifg=#000000 guibg=#c0c000

" yank Y like D
nnoremap Y y$

" keep cursor when joining
nnoremap J mzJ`z

" undo checkpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap / /<c-g>u
inoremap - -<c-g>u

" moving text visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

noremap gf :e <cfile><CR>

try
" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ ',
\ 'statusline': 0,
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap ; :Denite buffer<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  call deoplete#custom#buffer_option('auto_complete', v:false)

  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction


nnoremap <silent><unique> <leader>ng :NERDTreeVCS <CR>
nnoremap <silent><unique> <leader>nn :NERDTreeFind <CR>
nnoremap <silent><unique> <leader>nf :NERDTreeFocus <CR>

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

