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
			uuid_type = "rand",

			new_note_filename = "title-uuid",
			filename_space_subst = "-",

			home = vim.fn.expand("~/Documents/notes"),

			template_new_note = vim.fn.expand("~/Documents/notes/template.md"),

			calendar_opts = {
				weeknm = 5,
				calendar_monday = 0,
			},
		})

		-- keymaps
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		opts.desc = "Launch telekasten panel"
		keymap.set("n", "<leader>z", telekasten.panel, opts)

		opts.desc = "Find notes"
		keymap.set("n", "<leader>zf", telekasten.find_notes, opts)

		opts.desc = "Search in notes"
		keymap.set("n", "<leader>zs", telekasten.search_notes, opts)

		opts.desc = "Go to today's note"
		keymap.set("n", "<leader>zd", telekasten.goto_today, opts)

		opts.desc = "Go to link under cursor"
		keymap.set("n", "<leader>zz", telekasten.follow_link, opts)

		opts.desc = "Create new note"
		keymap.set("n", "<leader>zn", telekasten.new_note, opts)

		opts.desc = "Show calendar on side panel"
		keymap.set("n", "<leader>zc", telekasten.show_calendar, opts)

		opts.desc = "Show backlinks from current buffer"
		keymap.set("n", "<leader>zb", telekasten.show_backlinks, opts)

		opts.desc = "Insert image link"
		keymap.set("n", "<leader>zI", telekasten.insert_img_link, opts)

		opts.desc = "Automatically call insert_link"
		keymap.set("i", "[[", telekasten.insert_link, opts)

		opts.desc = "Choose vault"
		keymap.set("n", "<leader>zv", telekasten.switch_vault, opts)

		opts.desc = "Show tags"
		keymap.set("n", "<leader>zt", telekasten.show_tags, opts)
	end,
}
