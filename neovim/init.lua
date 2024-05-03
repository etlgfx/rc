local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'airblade/vim-gitgutter',
	'habamax/vim-gruvbit',
	'editorconfig/editorconfig-vim',
	'nvim-tree/nvim-web-devicons',
	'nvim-tree/nvim-tree.lua',
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'}
})

-- 'prettier/vim-prettier', { 'do': 'yarn install' }

require('config/editor')
require('config/nvim-tree')

vim.cmd.colorscheme('gruvbit')
