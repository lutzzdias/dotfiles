return {
	"zbirenbaum/copilot.lua",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local copilot = require("copilot")

		copilot.setup({
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<Tab>",
				},
			},
		})
	end,
}
