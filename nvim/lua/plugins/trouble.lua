return {
	"folke/trouble.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- import
		local trouble = require("trouble")

		-- config
		trouble.setup({})
	end,
}
