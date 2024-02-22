local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.lsp" },
	},
	checker = {
		enabled = true,
		notify = true,
		frequency = 86400, -- check for updates daily
	},
	change_detection = { notify = false },
	ui = {
		border = "rounded",
		title = "lazy.nvim",
	},
	install = { colorscheme = { "tokyonight" } },
	dev = {
		path = "~/Developer/side-projects/nvim",
		patterns = { "lutzzdias" },
		fallback = true, -- Fallback to git when local plugin doesn't exist
	},
})

-- keymaps
local opts = { noremap = true, silent = true }

opts.desc = "Toggle Lazy"
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<CR>", opts)
