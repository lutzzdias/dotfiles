return {
	"mfussenegger/nvim-dap",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"rcarriga/nvim-dap-ui",
		-- virtual text for the debugger
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {},
		},
	},
	config = function()
		vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

		-- keymaps
		local opts = { noremap = true, silent = true }

		opts.desc = "Add breakpoint"
		vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", opts)

		opts.desc = "Open debugging sidebar"
		vim.keymap.set("n", "<leader>ds", function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.open()
		end, opts)
	end,
}
