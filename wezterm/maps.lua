local wezterm = require("wezterm")
local M = {}

function M.apply_to_config(config)
	config.keys = {
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
	}
end

return M
