return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/nvim-cmp",
	},
	config = function()
		-- imports
		local autopairs = require("nvim-autopairs")
		local cmp = require("cmp")
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		-- configure autopairs
		autopairs.setup({
			check_ts = true, -- enable treesitter
		})

		-- make autopairs and completion work together -> taken from the docs
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
