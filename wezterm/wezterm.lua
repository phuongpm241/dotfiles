-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 10
config.color_scheme = 'rose-pine-moon'

-- Photo wallpaper with a dark purple tint layered on top,
-- so the photo is still visible but muted.
config.window_background_opacity = 0.85
config.background = {
  {
    source = {
      File = wezterm.config_dir .. '/mainwallpaper.jpeg',
    },
    hsb = { brightness = 0.6 },
    opacity = 1.0,
  },
  {
    source = { Color = '#1a0d2e' },
    height = '100%',
    width = '100%',
    opacity = 0.85,
  },
}

-- Finally, return the configuration to wezterm:
return config
