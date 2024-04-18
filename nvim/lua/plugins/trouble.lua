return {
	"folke/trouble.nvim",
	branch = "dev",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- keymaps
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		opts.desc = "Diagnostics"
		keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)

		opts.desc = "Buffer diagnostics"
		keymap.set("n", "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", opts)

		opts.desc = "Quickfix list"
		keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", opts)

		opts.desc = "Locations list"
		keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", opts)

		opts.desc = "LSP definitions / references / ..."
		keymap.set("n", "<leader>xd", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", opts)

		opts.desc = "Symbols"
		keymap.set("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", opts)
	end,
}
