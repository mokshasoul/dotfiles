-- Pull in the wezterm API
local wezterm = require("wezterm")
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.term = "wezterm"
-- For example, changing the color scheme:
-- config.color_scheme = "Github Primer Theme"
config.color_scheme = "Google (light) (terminal.sexy)"
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 15.0

-- Keyboard configuration:
config.keys = {
  {
    key = 'P',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ActivateCommandPalette,
  },
}
-- woop woop
config.bypass_mouse_reporting_modifiers = "CMD"

config.quit_when_all_windows_are_closed = false
config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
-- and finally, return the configuration to wezterm

wezterm.on(
'gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config
