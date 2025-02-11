return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
	config = function()
		vim.cmd([[do FileType]])

		-- keymaps
		local keymap = vim.keymap
		local opts = { noremap = true, silent = true }

		opts.desc = "Start markdown preview"
		keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", opts)
	end,
}
