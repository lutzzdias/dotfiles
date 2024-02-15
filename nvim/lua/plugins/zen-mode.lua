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
				tmux = false, -- disabled because it does not show again after exiting zen mode
			},

			on_open = function()
				vim.opt.textwidth = 80
			end,

			on_close = function()
				vim.opt.textwidth = 0
			end,
		})

		-- keymaps
		local opts = { noremap = true, silent = true }

		opts.desc = "Toggle ZenMode"
		vim.keymap.set("n", "<leader>b", "<cmd>ZenMode<CR>", opts)
	end,
}
