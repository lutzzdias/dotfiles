return {
	"windwp/nvim-ts-autotag",
	event = { "InsertEnter" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local ts_configs = require("nvim-treesitter.configs")

		ts_configs.setup({
			autotag = {
				enable = true,
			},
		})
	end,
}
