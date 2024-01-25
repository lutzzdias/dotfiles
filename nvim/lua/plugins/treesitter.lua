return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import
		local treesitter = require("nvim-treesitter.configs")
		local ts_comment = require("ts_context_commentstring")

		treesitter.setup({
			highlight = {
				enable = true, -- enable syntax highlighting
			},

			indent = { enable = true }, -- enable indentation

			autotag = {
				enable = true, -- enable autotagging (w/ nvim-ts-autotag plugin)
			},

			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"lua",
				"dockerfile",
				"gitignore",
			},

			-- TODO: learn what this does
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},

			-- enable commenting in tsx and jsx
			ts_comment.setup({}),
		})

		-- enable commenting in tsx and jsx
		vim.g.skip_ts_context_commentstring_module = true
	end,
}
