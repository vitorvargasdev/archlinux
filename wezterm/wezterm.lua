local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font")
config.color_scheme = "Dark+"

config.font_size = 12
config.window_decorations = "RESIZE"
config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Set initial zoom level (0.8 = 80% = two CTRL -)
wezterm.on("window-config-reloaded", function(window, pane)
  window:perform_action(wezterm.action.ResetFontSize, pane)
  window:perform_action(wezterm.action.DecreaseFontSize, pane)
  window:perform_action(wezterm.action.DecreaseFontSize, pane)
end)

config.keys = {
  {
    key = "d",
    mods = "CMD",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "r",
    mods = "CMD",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "x",
    mods = "CMD",
    action = wezterm.action.TogglePaneZoomState,
  },
  { key = "h",          mods = "CMD",       action = wezterm.action({ ActivatePaneDirection = "Left" }) }, -- Focus left pane
  { key = "l",          mods = "CMD",       action = wezterm.action({ ActivatePaneDirection = "Right" }) }, -- Focus right pane
  { key = "k",          mods = "CMD",       action = wezterm.action({ ActivatePaneDirection = "Up" }) }, -- Focus pane above
  { key = "j",          mods = "CMD",       action = wezterm.action({ ActivatePaneDirection = "Down" }) }, -- Focus pane below

  -- Resize pane commands
  { key = "LeftArrow",  mods = "CMD|ALT",   action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
  { key = "RightArrow", mods = "CMD|ALT",   action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
  { key = "UpArrow",    mods = "CMD|ALT",   action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
  { key = "DownArrow",  mods = "CMD|ALT",   action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },

  -- Alternative resize with vim keys
  { key = "h",          mods = "CMD|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
  { key = "l",          mods = "CMD|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
  { key = "k",          mods = "CMD|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
  { key = "j",          mods = "CMD|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
}

return config
