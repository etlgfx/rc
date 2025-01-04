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
    'nvimtools/none-ls.nvim',
    'williamboman/mason.nvim',
    {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'}
})

require('config/editor')
require('config/nvim-tree')
require('config/nvim-telescope')
require('config/treesitter')
require('config/mason')
require('config/none-ls')
-- TODO
-- require('config/status')

