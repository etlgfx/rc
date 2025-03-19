return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim", lazy = false, config = true },
        opts = {
            ensure_installed = {
                'ts_ls',
                'lua_ls',
                'pylsp',
                -- 'sqls', requires go & db connection
            },

            handlers = {
                function (server_name)
                    require('lspconfig')[server_name].setup {}
                end,

                -- Next, you can provide a dedicated handler for specific servers.
                -- For example, a handler override for the `rust_analyzer`:
                -- ["rust_analyzer"] = function ()
                --     require("rust-tools").setup {}
                -- end
            },
        }
    }
}
