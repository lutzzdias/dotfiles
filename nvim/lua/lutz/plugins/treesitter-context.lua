-- TODO: Figure out why this plugin is not working
return {
	"nvim-treesitter/nvim-treesitter-context",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		-- import
		local tsc = require("treesitter-context")

		tsc.setup({})

		-- keymaps
		local opts = { desc = "Jump upwards to context" }
		vim.keymap.set("n", "<leader>K", function()
			tsc.go_to_context()
		end, opts)
	end,
}
