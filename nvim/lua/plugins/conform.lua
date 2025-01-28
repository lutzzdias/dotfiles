return {
	"stevearc/conform.nvim",
	dependencies = { "williamboman/mason.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- imports
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" }, -- sort imports then apply lint
				go = { "goimports-reviser", "gofumpt" },
			},

			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		-- keymaps
		local opts = { noremap = true, silent = true }

		opts.desc = "Format file"
		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, opts)
	end,
}
