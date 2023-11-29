local wezterm = require("wezterm")
local M = {}

function M.apply_to_config(config)
	config.window_background_opacity = 0.75
	config.macos_window_background_blur = 15

	config.window_close_confirmation = "NeverPrompt"
	config.window_decorations = "RESIZE"
	config.adjust_window_size_when_changing_font_size = false
	config.enable_tab_bar = false

	config.window_padding = {
		left = "1.5cell",
		right = "1.5cell",
		top = "0.25cell",
		bottom = "1cell",
	}

	config.selection_word_boundary = " \t\n{}[]()\"'`"

	-- nvim zen mode config -> taken from the docs
	wezterm.on("user-var-changed", function(window, pane, name, value)
		local overrides = window:get_config_overrides() or {}
		if name == "ZEN_MODE" then
			local incremental = value:find("+")
			local number_value = tonumber(value)
			if incremental ~= nil then
				while number_value > 0 do
					window:perform_action(wezterm.action.IncreaseFontSize, pane)
					number_value = number_value - 1
				end
				overrides.enable_tab_bar = false
			elseif number_value < 0 then
				window:perform_action(wezterm.action.ResetFontSize, pane)
				overrides.font_size = nil
				overrides.enable_tab_bar = true
			else
				overrides.font_size = number_value
				overrides.enable_tab_bar = false
			end
		end
		window:set_config_overrides(overrides)
	end)
end

return M
