return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- imports
		local mason = require("mason")
		local lspconfig = require("mason-lspconfig")
		local tool_installer = require("mason-tool-installer")

		mason.setup()

		lspconfig.setup({
			ensure_installed = {
				"clangd", -- c/c++
				"ts_ls", -- typescript
				"lua_ls", -- lua
				"html", -- html
				"cssls", -- css
				"tailwindcss", -- tailwind
				"eslint", -- js linter
			},

			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python import sorting
				"black", -- python formatter
				"flake8", -- python linter
			},
		})

		-- keymaps
		local opts = { noremap = true, silent = true }

		opts.desc = "Toggle Mason"
		vim.keymap.set("n", "<leader>m", "<cmd>Mason<CR>", opts)
	end,
}
