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

		local symbols = {
			Namespace = "󰌗",
			Text = "󰉿",
			Method = "󰆧",
			Function = "󰆧",
			Constructor = "",
			Field = "󰜢",
			Variable = "󰀫",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "󰜢",
			Unit = "󰑭",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈚",
			Reference = "󰈇",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "󰙅",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰊄",
			Table = "",
			Object = "󰅩",
			Tag = "",
			Array = "[]",
			Boolean = "",
			Number = "",
			Null = "󰟢",
			String = "󰉿",
			Calendar = "",
			Watch = "󰥔",
			Package = "",
			Copilot = "",
			Codeium = "",
			TabNine = "",
		}

		cmp.setup({
			-- disable pre select
			preselect = cmp.PreselectMode.None,

			-- where to draw suggestions from
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "nvim_lua" },
				{ name = "buffer" },
				{ name = "path" },
			},

			-- window style
			window = {
				completion = {
					winhighlight = "Normal:Pmenu,CursorLine:PmenuSel,Search:None",
					scrollbar = false,
				},
				documentation = {
					border = "rounded",
					winhighlight = "Normal:CmpDocumentation,Search:None",
					max_width = 80,
					max_height = 12,
				},
			},

			-- configure how nvim-cmp interacts with snippet engine
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			-- keymaps
			mapping = {
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-U>"] = cmp.mapping.scroll_docs(-4),
				["<C-D>"] = cmp.mapping.scroll_docs(4),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			},

			-- suggestions style
			formatting = {
				fields = { "kind", "abbr", "menu" },

				format = function(entry, item)
					local kind = item.kind
					local kind_hl_group = ("CmpItemKind%s"):format(kind)

					item.kind = (" %s "):format(symbols[kind])

					local source = entry.source.name
					if source == "nvim_lsp" or source == "path" then
						item.menu_hl_group = kind_hl_group
					else
						item.menu_hl_group = "Comment"
					end

					item.menu = kind

					if source == "buffer" then
						item.menu_hl_group = nil
						item.menu = nil
					end

					return item
				end,
			},
		})
	end,
}
