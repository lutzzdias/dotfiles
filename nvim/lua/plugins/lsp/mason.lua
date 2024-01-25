return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- imports
        local mason = require('mason')
		local lspconfig = require("mason-lspconfig")
		local tool_installer = require("mason-tool-installer")

        mason.setup()

		lspconfig.setup({
			ensure_installed = {
				"clangd", -- c/c++
				"tsserver", -- typescript
				"lua_ls", -- lua
				"html", -- html
				"cssls", -- css
				"tailwindcss", -- tailwind
			},

			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		tool_installer.setup({
			ensure_installed = {
				"prettierd", -- prettierd formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
			},
		})
	end,
}
