return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		-- imports
		local ts_configs = require("nvim-treesitter.configs")

		-- config
		ts_configs.setup({
			textobjects = {
				select = {
					enable = true,

					-- Automatically jump forward to textobj, similar to targets.vim
					lookahead = true,

					keymaps = {
						["af"] = { query = "@function.outer", desc = "Select function" },
						["if"] = { query = "@function.inner", desc = "Select within function" },
						["ac"] = { query = "@class.outer", desc = "Select class" },
						["ic"] = { query = "@class.inner", desc = "Select within class" },
						["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
					},

					selection_modes = {
						["@parameter.outer"] = "v", -- charwise
						["@function.outer"] = "V", -- linewise
						["@class.outer"] = "<c-v>", -- blockwise
					},

					include_surrounding_whitespace = true,
				},
			},
		})
	end,
}
