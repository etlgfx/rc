return {
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 1000 ,
        config = true,
        init = function ()
            vim.cmd([[colorscheme gruvbox]])
        end,
        opts = ...
    },
    --{  },
    { 'airblade/vim-gitgutter' },
    { 'editorconfig/editorconfig-vim' },
}
-- 'airblade/vim-gitgutter',
-- 'editorconfig/editorconfig-vim',
-- 'nvim-telescope/telescope.nvim',
-- TODO 'nvimtools/none-ls.nvim',
-- {'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'}
