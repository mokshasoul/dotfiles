-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  vim.o.guifont = "CommitMono Nerd Font Propo:h34"
  vim.g.neovide_scale_factor = 0.5
end
PREFERRED_THEME = "light"

local handle = io.popen(
  "osascript -e 'tell application \"System Events\" to tell appearance preferences to get dark mode' 2>/dev/null"
)

if handle then
  local result = handle:read("*a")
  handle:close()

  if result and result:match("true") then
    PREFERRED_THEME = "dark" -- Dark theme
  end
end

vim.o.bg = PREFERRED_THEME
