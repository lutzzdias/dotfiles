local wezterm = require("wezterm")
local mux = wezterm.mux

local base = require("base")
local maps = require("maps")
local theme = require("theme")
local font = require("font")

local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

base.apply_to_config(config)
maps.apply_to_config(config)
theme.apply_to_config(config)
font.apply_to_config(config)

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)

return config
