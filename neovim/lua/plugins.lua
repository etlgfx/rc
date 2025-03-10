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
    { 'airblade/vim-gitgutter' },
    { 'editorconfig/editorconfig-vim' },
}
-- 'editorconfig/editorconfig-vim',
-- TODO 'nvimtools/none-ls.nvim',
