return {
	"nvim-neo-tree/neo-tree.nvim",
	event = { "BufReadPre", "BufNewFile" },
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
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
	end,
}
