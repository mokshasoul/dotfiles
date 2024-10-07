-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font Mono:h34"
  vim.g.neovide_scale_factor = 0.5
end

if os.getenv("OS_APPEARANCE") == "Dark" then
  vim.o.background = "dark"
else
  vim.o.background = "light"
end

if vim.g.vscode then
  vim.opt.incsearch = false
end
