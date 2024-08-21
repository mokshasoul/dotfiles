local M = {}
local wezterm = require("wezterm")
local appearance = wezterm.gui.get_appearance()

local function get_appearance()
  if wezterm.gui then
    if wezterm.gui.get_appearance():find("Dark") then
      return "Dark"
    else
      return "Light"
    end
  end
  return "Dark"
end

M.get_appearance = get_appearance()

M.is_dark = appearance:find("Dark")

M.get_random_entry = function(tbl)
  local keys = {}
  for key, _ in pairs(tbl) do
    table.insert(keys, key)
  end
  local random_key = keys[math.random(#keys)]
  return tbl[random_key]
end

return M
