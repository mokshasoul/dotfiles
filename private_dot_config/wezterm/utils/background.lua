local h = require("utils.helpers")
local wezterm = require("wezterm")
local M = {}

M.get_default_theme = function()
  return h.is_dark and "Catppuccin Mocha" or "Catppuccin Latte"
end

return M
