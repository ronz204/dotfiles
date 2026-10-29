local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { 'pwsh.exe', '-NoLogo' }

config.color_scheme = 'Catppuccin Mocha'
config.font = wezterm.font('CaskaydiaCove Nerd Font')
config.font_size = 11.0

config.window_background_opacity = 0.95
config.enable_scroll_bar = false

return config
