return {
    {
        'habamax/vim-gruvbit',
        lazy = false,
        priority = 1000,
        config = function ()
            vim.cmd([[colorscheme gruvbit]])
        end,
    },
    { 'nvim-tree/nvim-web-devicons' },
    { 'nvim-lua/plenary.nvim' },
    { 'airblade/vim-gitgutter' },
    { 'editorconfig/editorconfig-vim' },
}
-- 'airblade/vim-gitgutter',
-- 'editorconfig/editorconfig-vim',
-- 'nvim-telescope/telescope.nvim',
-- TODO 'nvimtools/none-ls.nvim',
-- {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'}
