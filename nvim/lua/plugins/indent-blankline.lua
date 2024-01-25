return {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
	config = function()
		-- import
		local blankline = require("ibl")

		blankline.setup({
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = {
				enabled = false,
			},
		})
	end,
}
