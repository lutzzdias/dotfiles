return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		-- snippet engine
		{
			"L3MON4D3/LuaSnip",
			dependencies = "rafamadriz/friendly-snippets", -- useful snippets
			config = function()
				local luasnip = require("luasnip")

				-- load snippets
				require("luasnip.loaders.from_vscode").lazy_load()
				require("luasnip.loaders.from_snipmate").lazy_load()
				require("luasnip.loaders.from_lua").lazy_load()

				-- setup
				luasnip.setup({
					history = true,
					updateevents = "TextChanged,TextChangedI",
				})
			end,
		},

		-- completion sources
		{
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},

	config = function()
		-- imports
		local cmp = require("cmp")
		local luasnip = require("luasnip")

		-- TODO: make wait before showing the completion menu
		cmp.setup({
			completion = {
				completeopt = "menu,menuone",
				autocomplete = false,
			},

			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "buffer" },
				{ name = "path" },
			},

			window = {
				completion = {
					side_padding = 1,
					-- TODO: make pretty
					winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
					scrollbar = false,
				},
				documentation = {
					border = {
						{ "╭", "CmpDocumentationBorder" },
						{ "─", "CmpDocumentationBorder" },
						{ "╮", "CmpDocumentationBorder" },
						{ "│", "CmpDocumentationBorder" },
						{ "╯", "CmpDocumentationBorder" },
						{ "─", "CmpDocumentationBorder" },
						{ "╰", "CmpDocumentationBorder" },
						{ "│", "CmpDocumentationBorder" },
					},
					winhighlight = "Normal:CmpDocumentation",
				},
			},

			-- TODO: add icons
			-- formatting = {
			-- 	fields = { "abbr", "kind", "menu" },
			-- 	format = function(_, item)
			-- 		local icon = " " .. item.kind .. " "
			-- 		item.kind = string.format("%s %s", icon, item.kind)
			-- 		return item
			-- 	end,
			-- },

			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			-- TODO: these definitions are not working
			-- keymaps
			mapping = {
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-U>"] = cmp.mapping.scroll_docs(-4),
				["<C-D>"] = cmp.mapping.scroll_docs(4),
				["<C-space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.close(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			},
		})

		-- Setup delayed completion
		local timer = nil
		vim.api.nvim_create_autocmd({ "TextChangedI", "CmdlineChanged" }, {
			pattern = "*",
			callback = function()
				if timer then
					vim.loop.timer_stop(timer)
					timer = nil
				end

				timer = vim.loop.new_timer()
				timer:start(
					200,
					0,
					vim.schedule_wrap(function()
						cmp.complete({ reason = cmp.ContextReason.Auto })
					end)
				)
			end,
		})
	end,
}
