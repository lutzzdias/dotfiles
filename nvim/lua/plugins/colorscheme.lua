return {
	"folke/tokyonight.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- import
		local theme = require("tokyonight")

		theme.setup({
			style = "night",
			transparent = "true",
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})

		vim.cmd.colorscheme("tokyonight") -- load colorscheme
	end,
}
