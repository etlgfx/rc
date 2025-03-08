return {
    {
        'nvim-tree/nvim-tree.lua',
        init = function()
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1
            vim.keymap.set('n', '<Leader>nn', '<cmd>NvimTreeFindFile<CR>')
        end,
        opts = {
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                centralize_selection = true,
                width = {
                    min = 30,
                    max = 60,
                },
            },
            renderer = {
                group_empty = true,
                full_name = true,
            },
            filters = {
                dotfiles = true,
            },
        }
    }
}
