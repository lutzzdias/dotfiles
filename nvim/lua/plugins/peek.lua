return {
	"toppair/peek.nvim",
	event = "VeryLazy",
	build = "deno task --quiet build:fast",
	config = function()
		local peek = require("peek")

		peek.setup({
			app = "browser",
			filetype = {
				"markdown",
				"telekasten",
			},
		})

		-- Keymaps
		local opts = { noremap = true, silent = true }

		opts.desc = "Open markdown preview"
		vim.keymap.set("n", "<leader>mp", peek.open, opts)
	end,
}
