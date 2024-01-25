return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		-- import
		local devicons = require("nvim-web-devicons")

		devicons.setup({
			override = {},
			default = true,
		})
	end,
}
