return {
    {
        'nvim-telescope/telescope.nvim',
        init = function () 
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files)
            vim.keymap.set('n', '<leader>ft', builtin.treesitter)
            vim.keymap.set('n', '<leader>fg', builtin.live_grep)
        end,

        opts = {
            defaults = {
                path_display = {
                    shorten = {
                        len = 1,
                        exclude = {1, -2, -1}
                    }
                }
            }
        }
    }
}
