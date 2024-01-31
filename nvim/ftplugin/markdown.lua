local opts = { buffer = true, noremap = true, silent = true }

-- ! depends on markdown-toc.nvim
opts.desc = "Generate Table of Contents"
vim.keymap.set("n", "<leader>tc", "<cmd>Mtoc<CR>", opts)
