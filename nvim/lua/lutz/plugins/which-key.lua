return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		-- import
		local key = require("which-key")

		key.register(
			{}, -- mappings
			{} -- opts
		)
	end,
}
