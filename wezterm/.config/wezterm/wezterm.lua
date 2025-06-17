-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Window padding
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.max_fps = 165
config.animation_fps = 165

-- Font
config.font = wezterm.font_with_fallback({
	{ family = "Liga SFMono Nerd Font", weight = "Medium" },
	{ family = "Noto Sans Symbols 2" },
	{ family = "Symbol Nerd Font" },
})
config.font_size = 16

-- Theme
config.color_scheme = "tokyonight"

-- and finally, return the configuration to wezterm
return config
