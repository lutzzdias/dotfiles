return {
	"leoluz/nvim-dap-go",
	ft = "go",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		local go_dap = require("dap-go")

		go_dap.setup()

		-- keymaps
		local opts = { noremap = true, silent = true }

		opts.desc = "Debug go test"
		vim.keymap.set("n", "<leader>dgt", function()
			go_dap.debug_test()
		end, opts)

		opts.desc = "Debug last go test"
		vim.keymap.set("n", "<leader>dgl", function()
			go_dap.debug_last()
		end, opts)
	end,
}
