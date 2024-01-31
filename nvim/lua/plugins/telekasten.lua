return {
	"renerocksai/telekasten.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"mattn/calendar-vim",
	},
	config = function()
		local telekasten = require("telekasten")

		-- config
		telekasten.setup({
			home = vim.fn.expand("~/Documents/notes"),
		})

		-- keymaps
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		opts.desc = "Launch telekasten panel"
		keymap.set("n", "<leader>z", "<cmd>Telekasten panel<CR>", opts)

		opts.desc = "Find notes"
		keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>", opts)

		opts.desc = "Search in notes"
		keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>", opts)

		opts.desc = "Go to today's note"
		keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>", opts)

		opts.desc = "Go to link under cursor"
		keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>", opts)

		opts.desc = "Create new note"
		keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>", opts)

		opts.desc = "Show calendar on side panel"
		keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>", opts)

		opts.desc = "Show backlinks from current buffer"
		keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>", opts)

		opts.desc = "Insert image link"
		keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>", opts)

		opts.desc = "Automatically call insert_link"
		keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>", opts)
	end,
}