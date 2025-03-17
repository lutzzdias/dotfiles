local wezterm = require("wezterm")
local mux = wezterm.mux

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- leader
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

-- theme
config.color_scheme = "Tokyo Night"

-- font
config.font = wezterm.font("JetBrains Mono")
config.line_height = 1.25
config.font_size = 15

-- base
config.window_background_opacity = 0.75
config.macos_window_background_blur = 15
config.window_close_confirmation = "NeverPrompt"
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.window_padding = {
	left = "1.5cell",
	right = "1.5cell",
	top = "0.25cell",
	bottom = "0.25cell",
}
config.selection_word_boundary = " \t\n{}[]()\"'`"

-- tab bar
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
wezterm.on("update-status", function(window, pane)
	window:set_left_status(wezterm.format({
		{ Foreground = { Color = "#7aa2f7" } },
		{ Text = "  " },
	}))

	window:set_right_status(wezterm.format({
		{ Foreground = { Color = "#7aa2f7" } },
		{ Text = wezterm.strftime("%a %d %b %H:%M") .. " " },
	}))
end)
-- tab item
wezterm.on("format-tab-title", function(tab, _, _, _, _, _)
	local title = (#tab.tab_title > 0 and tab.tab_title) or ("tab " .. tab.tab_index)
	return wezterm.format({
		{ Text = " " .. title .. " " },
	})
end)

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

local function is_vim(pane)
	-- this is set by the plugin, and unset on ExitPre in Neovim
	return pane:get_user_vars().IS_NVIM == "true"
end

local direction_keys = {
	h = "Left",
	j = "Down",
	k = "Up",
	l = "Right",
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == "resize" and "META" or "CTRL",
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == "resize" and "META" or "CTRL" },
				}, pane)
			else
				if resize_or_move == "resize" then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

-- Keymaps
config.keys = {
	-- move between split panes
	split_nav("move", "h"),
	split_nav("move", "j"),
	split_nav("move", "k"),
	split_nav("move", "l"),
	-- resize panes
	split_nav("resize", "h"),
	split_nav("resize", "j"),
	split_nav("resize", "k"),
	split_nav("resize", "l"),
	{
		key = "f",
		mods = "CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	-- split
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "\\",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "m",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
	-- tab
	{
		key = "c",
		mods = "LEADER",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "R",
		mods = "LEADER",
		action = wezterm.action.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	{
		key = "x",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		key = "p",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "n",
		mods = "LEADER",
		action = wezterm.action.ActivateTabRelative(1),
	},
	-- clear scrollback, current viewport and redraw prompt
	{
		key = "l",
		mods = "LEADER",
		action = wezterm.action.Multiple({
			wezterm.action.ClearScrollback("ScrollbackAndViewport"),
			wezterm.action.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i - 1),
	})
end

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
