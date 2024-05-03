local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>ft', builtin.treesitter)

require("telescope").setup{
    defaults = {
        path_display = {
            shorten = {
                len = 1,
                exclude = {1, -2, -1}
            }
        }
    }
}

