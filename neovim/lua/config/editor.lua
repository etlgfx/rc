vim.cmd.highlight('link', 'ExtraWhitespace', 'Error')

vim.opt.termguicolors = true
vim.opt.ts = 4
vim.opt.sw = 4
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.cinoptions:append('j1,J1')
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.dir = "/tmp/"
vim.opt.linebreak = true
vim.opt.formatoptions:append('tcqor')
vim.opt.wrap = false
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.wildignore = {'*.obj','*.o','.git','.svn','.class'}
vim.opt.diffexpr="diff -w"
vim.opt.list = true
vim.opt.listchars = {eol = '¬', tab = '>·', trail = '~', extends = '>', precedes = '<'}
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
