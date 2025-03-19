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
    { 'neovim/nvim-lspconfig' },
    -- {
    --     'neovim/nvim-lspconfig',
    --     dependencies = { 'saghen/blink.cmp' },
    --
    --     config = function ()
    --         local capabilities = require('blink.cmp').get_lsp_capabilities()
    --         require('lspconfig').lua_ls.setup {
    --             capabilities = capabilities
    --         }
    --     end,
    -- },
--    { 'editorconfig/editorconfig-vim' }, -- TODO: default?
}
-- 'editorconfig/editorconfig-vim',
-- TODO 'nvimtools/none-ls.nvim',
