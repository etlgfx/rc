return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            { 'saghen/blink.cmp' },
        },
        opts = {
            ensure_installed = {
                'ts_ls',
                'lua_ls',
                'pylsp',
                -- 'sqls', requires go & db connection
            },

            handlers = {
                function (server_name)
                    require('lspconfig')[server_name].setup {
                        capabilities = require('blink.cmp').get_lsp_capabilities()
                    }
                end,

                -- Next, you can provide a dedicated handler for specific servers.
                -- For example, a handler override for the `rust_analyzer`:
                -- ["rust_analyzer"] = function ()
                --     require("rust-tools").setup {}
                -- end
                --
                -- ['lua_ls'] = function ()
                --     -- vim.print(require('blink.cmp').get_lsp_capabilities())
                --     require('lspconfig').lua_ls.setup {
                --         settings = {
                --             Lua = {
                --                 diagnostics = {
                --                     globals = {"vim"}
                --                 },
                --             },
                --         },
                --         capabilities = require('blink.cmp').get_lsp_capabilities()
                --     }
                -- end,
            },
        }
    }
}
