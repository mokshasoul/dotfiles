-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font Mono:h34"
  vim.g.neovide_scale_factor = 0.5
end
--
-- Check macOS light / dark user interface state and return theme accordingly
local function getPreferredTheme()
    local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")

    if not handle then
        return "light"
    end

    local result = handle:read("*a")
    handle:close()

    if result and result:match("Dark") then
        return "dark" -- Dark theme
    else
        return "light" -- Light theme
    end
end

-- Apply the preferred theme
local preferred_theme = getPreferredTheme()
vim.cmd.set(string.format("bg=%s",preferred_theme))
vim.print("setting colorscheme")
