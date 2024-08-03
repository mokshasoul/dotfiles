local wezterm = require("wezterm") --[[@as Wezterm]]
local config = wezterm.config_builder()
local mux = wezterm.mux

wezterm.log_info("reloading")

require("keys").setup(config)
-- Use WebGPU
config.front_end = "WebGpu"
config.term = "wezterm"
config.window_decorations = "RESIZE"
-- For example, changing the color scheme:
-- config.color_scheme = "Github Primer Theme"
-- config.color_scheme = "Google (light) (terminal.sexy)"
config.color_scheme = "Catppuccin Latte"
--
config.font = wezterm.font({ family = "Fira Code" })
config.bold_brightens_ansi_colors = false
config.font_size = 16.0

config.quit_when_all_windows_are_closed = true
config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- making window titles more distinct
wezterm.on('format-window-title', function()
  local title = '[' .. wezterm.mux.get_active_workspace() .. ']'
  title = title .. ' ' .. wezterm.mux.get_domain():name()
  title = title .. ' - $W'
  -- some logic here
  return title
end)

-- and finally, return the configuration to wezterm
return config --[[@as Wezterm]]
