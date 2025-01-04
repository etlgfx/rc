local none = require("null-ls")

none.setup({
	sources = {
		none.builtins.formatting.stylua,
		-- none.builtins.diagnostics.stylua, -- TODO lua LSP

        -- none.builtins.formatting.rubocop,
        -- none.builtins.diagnostics.rubocop,

		none.builtins.formatting.prettierd,
		-- require('none-ls.diagnostics.eslint-lsp'),

		none.builtins.completion.spell,
	},
})

vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
