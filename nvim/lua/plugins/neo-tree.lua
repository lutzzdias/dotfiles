return {
	"nvim-neo-tree/neo-tree.nvim",
	event = { "VimEnter", "BufReadPre", "BufNewFile" },
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},

	config = function()
		local neotree = require("neo-tree")

		-- settings
		neotree.setup({
			close_if_last_window = true,
		})

		-- keymaps
		local opts = { noremap = true, silent = true }

		opts.desc = "Open/focus file explorer"
		vim.keymap.set("n", "<leader>e", "<cmd>Neotree<CR>", opts)
	end,
}
