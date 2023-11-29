local wezterm = require("wezterm")
local M = {}

function M.apply_to_config(config)
	config.font = wezterm.font("JetBrains Mono")
	config.line_height = 1.25
	config.font_size = 15
end

return M
