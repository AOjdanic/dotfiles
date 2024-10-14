-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
config.colors = theme.colors()
config.keys = {
	{
		key = "^",
		mods = "CTRL | SHIFT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

config.font = wezterm.font("MesloLGS NF")
config.font_size = 16

config.enable_tab_bar = false
config.cursor_blink_rate = 300
config.force_reverse_video_cursor = true
config.window_decorations = "RESIZE"
-- config.window_background_opacity = 0.75
-- config.macos_window_background_blur = 8

-- and finally, return the configuration to wezterm
return config
