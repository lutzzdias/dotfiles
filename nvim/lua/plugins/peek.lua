return {
	"toppair/peek.nvim",
	event = "VeryLazy",
	build = "deno task --quiet build:fast",
	config = function()
		local peek = require("peek")

		-- TODO: Figure this out
		vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
		vim.api.nvim_create_user_command("PeekClose", peek.close, {})
	end,
}
