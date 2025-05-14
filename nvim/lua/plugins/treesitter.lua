return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		-- import
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			highlight = { enable = true },

			indent = { enable = true },

			ensure_installed = {
				"javascript",
				"typescript",
				"tsx",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"latex",
				"lua",
				"cpp",
				"python",
			},

			-- context aware selection
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<leader>ss",
					node_incremental = "<leader>si",
					scope_incremental = "<leader>sc",
					node_decremental = "<leader>sd",
				},
			},
		})
	end,
}
