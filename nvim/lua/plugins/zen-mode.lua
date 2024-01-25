return {
	"folke/zen-mode.nvim",
	event = "VeryLazy",
	config = function()
		local zen = require("zen-mode")

		zen.setup({
			window = {
				options = {
					signcolumn = "no", -- disable signcolumn
					number = false, -- disable number column
					relativenumber = false, -- disable relative number
					cursorcolumn = false, -- disable cursor column
				},
			},

			plugins = {
				tmux = false,
			},

			on_open = function()
				vim.opt.textwidth = vim.fn.winwidth(0)
			end,

			on_close = function()
				vim.opt.textwidth = 0
			end,
		})
	end,
}
