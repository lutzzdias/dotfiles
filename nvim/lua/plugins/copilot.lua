return {
	{
		"zbirenbaum/copilot.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local copilot = require("copilot")

			copilot.setup({
				suggestion = {
					auto_trigger = true,
					debouce = 10,
					keymap = {
						accept = "<S-TAB>",
					},
				},
			})
		end,
	},
}
