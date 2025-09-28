local b = require("utils.background")
local h = require("utils.helpers")
local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

local theme = b.get_default_theme()

wezterm.log_info("reloading")

require("keys").setup(config)
-- Use WebGPU
config.term = "wezterm"
config.window_decorations = "RESIZE"
config.font = wezterm.font("FiraCode Nerd Font", { weight = 450, stretch = "Normal", style = "Normal" })
-- config.font = wezterm.font("CommitMono Nerd Font Propo", { weight = 450, stretch = "Normal", style = "Normal" })
config.bold_brightens_ansi_colors = "BrightAndBold"
config.font_size = 20.0

config.quit_when_all_windows_are_closed = true
config.window_close_confirmation = "NeverPrompt"
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

wezterm.on("gui-startup", function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

local appearance = h.get_appearance

if h.is_dark then
  config.color_scheme = theme
  config.window_background_opacity = 1
  config.set_environment_variables = {
    THEME_FLAVOUR = "mocha",
    OS_APPEARANCE = appearance,
  }
else
  config.color_scheme = theme
  config.set_environment_variables = {
    THEME_FLAVOUR = "latte",
    OS_APPEARANCE = appearance,
  }
end

if wezterm.GLOBAL.appearance ~= appearance then
  wezterm.GLOBAL.appearance = appearance
  wezterm.background_child_process({
    os.getenv("SHELL"), -- /usr/local/bin/fish
    "-c",
    "set -g -x OS_APPEARANCE " .. appearance,
  })
end

-- and finally, return the configuration to wezterm
return config
