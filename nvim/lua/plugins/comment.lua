return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	config = function()
		-- import
		local comment = require("Comment")
		local ts_context = require("ts_context_commentstring.integrations.comment_nvim")

		-- use ts_context to infer how to comment out code
		comment.setup({
			pre_hook = ts_context.create_pre_hook(),
		})
	end,
}
