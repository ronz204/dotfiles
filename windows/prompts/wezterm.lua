local wezterm = require 'wezterm'
local act = wezterm.action
local config = wezterm.config_builder()

local p = {
  base = '#1A1B26',
  surface = '#24283B',
  surface_hover = '#2F344D',
  text = '#C0CAF5',
  dim = '#565F89',
  blue = '#7AA2F7',
  cyan = '#7DCFFF',
  green = '#9ECE6A',
  yellow = '#E0AF68',
  orange = '#FF9E64',
  red = '#F7768E',
  violet = '#BB9AF7',
}

config.default_prog = { 'pwsh.exe', '-NoLogo' }
config.scrollback_lines = 10000
config.max_fps = 120
config.animation_fps = 60

config.font = wezterm.font_with_fallback {
  { family = 'JetBrainsMono Nerd Font', weight = 'DemiBold' },
  'Segoe UI Symbol',
  'Segoe UI Emoji',
}

config.font_size = 12.0
config.line_height = 1.1
config.adjust_window_size_when_changing_font_size = false

config.dpi= 96.0
config.initial_cols = 128
config.initial_rows = 28

config.colors = {
  foreground = p.text,
  background = p.base,
  cursor_bg = p.blue,
  cursor_fg = p.base,
  cursor_border = p.blue,
  selection_bg = 'rgba(187, 154, 247, 0.35)',
  selection_fg = p.text,
  scrollbar_thumb = p.surface,
  split = p.surface_hover,

  ansi = {
    '#414868',
    p.red,
    p.green,
    p.yellow,
    p.blue,
    p.violet,
    p.cyan,
    '#A9B1D6',
  },
  brights = {
    p.dim,
    '#FF899D',
    '#9FE044',
    '#FAC85A',
    '#8DB0FF',
    '#C7A9FF',
    '#A4DAFF',
    p.text,
  },

  tab_bar = {
    background = p.base,
    active_tab = { bg_color = p.surface, fg_color = p.text },
    inactive_tab = { bg_color = p.base, fg_color = p.dim },
    inactive_tab_hover = { bg_color = p.surface, fg_color = p.text },
    new_tab = { bg_color = p.base, fg_color = p.dim },
    new_tab_hover = { bg_color = p.surface, fg_color = p.text },
  },
}

config.inactive_pane_hsb = { saturation = 0.85, brightness = 0.7 }

config.window_background_opacity = 0.9
config.win32_system_backdrop = 'Acrylic'
config.window_padding = { left = 18, right = 18, top = 13, bottom = 11 }
config.enable_scroll_bar = false

config.default_cursor_style = 'SteadyBlock'

config.window_frame = {
  font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Bold' }),
  font_size = 11.0,
  active_titlebar_bg = p.base,
  inactive_titlebar_bg = p.base,
  button_fg = p.dim,
  button_bg = p.base,
  button_hover_fg = p.text,
  button_hover_bg = p.surface,
}

config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
config.integrated_title_button_style = 'Windows'

config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.tab_max_width = 24
config.hide_tab_bar_if_only_one_tab = false

wezterm.on('format-tab-title', function(tab, _, _, _, _, max_width)
  local title = tab.tab_title
  if not title or #title == 0 then
    title = tab.active_pane.title
  end
  return ' ' .. wezterm.truncate_right(title, max_width - 2) .. ' '
end)

config.keys = {
  { key = 'd', mods = 'ALT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'd', mods = 'ALT|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'h', mods = 'ALT', action = act.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'ALT', action = act.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'ALT', action = act.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'ALT', action = act.ActivatePaneDirection 'Right' },
  { key = 'w', mods = 'ALT', action = act.CloseCurrentPane { confirm = false } },
}

return config
