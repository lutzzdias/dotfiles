return {
	"kdheepak/lazygit.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- import
		local telescope = require("telescope")
		local lazy_utils = require("lazygit.utils")

		telescope.load_extension("lazygit")

		-- keymaps
		local opts = { noremap = true, silent = true }

		opts.desc = "Open lazygit"
		vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", opts)

		opts.desc = "Open current git repos with telescope"
		vim.keymap.set("n", "<leader>gr", function()
			lazy_utils.project_root_dir()
			telescope.extensions.lazygit.lazygit()
		end, opts)
	end,
}
