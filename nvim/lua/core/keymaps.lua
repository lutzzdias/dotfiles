-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

------------------- General Keymaps -------------------

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

opts.desc = "Exit insert mode with jk"
keymap.set("i", "jk", "<ESC>", opts)

opts.desc = "Clear search highlights"
keymap.set("n", "<leader>nh", ":nohl<CR>", opts)

opts.desc = "Increment number"
keymap.set("n", "+", "<C-a>", opts)

opts.desc = "Decrement number"
keymap.set("n", "-", "<C-x>", opts)

------------------- Window Management Keymaps -------------------

opts.desc = "Split window vertically"
keymap.set("n", "<leader>sv", "<C-w>v", opts)

opts.desc = "Split window horizontally"
keymap.set("n", "<leader>sh", "<C-w>s", opts)

opts.desc = "Make splits equal size"
keymap.set("n", "<leader>se", "<C-w>=", opts)

opts.desc = "Close current split"
keymap.set("n", "<leader>sx", "<cmd>close<CR>", opts)

-- tab management
opts.desc = "Create new tab"
keymap.set("n", "<leader>tc", "<cmd>tabnew<CR>", opts)

opts.desc = "Close current tab"
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", opts)

opts.desc = "Jump to tab"
keymap.set("n", "<leader>t", function()
	local tabnum = vim.fn.nr2char(vim.fn.getchar())
	vim.cmd("tabn" .. tabnum)
end, opts)

opts.desc = "Go to next tab"
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", opts)

opts.desc = "Go to previous tab"
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", opts)

opts.desc = "Open current buffer in new tab"
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", opts)
