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
		})
	end,
}
