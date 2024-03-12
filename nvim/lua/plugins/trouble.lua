return {
	"folke/trouble.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- import
		local trouble = require("trouble")

		-- config
		trouble.setup({})

		-- keymaps
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		opts.desc = "Open trouble"
		keymap.set("n", "<leader>ct", "<cmd>TroubleToggle<cr>", opts)
	end,
}
