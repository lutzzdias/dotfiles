return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- imports
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				lua = { "stylua" },
				python = { "isort", "black" }, -- sort imports then apply lint
			},

			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		-- keymaps
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file" })
	end,
}
