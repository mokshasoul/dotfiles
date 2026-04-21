-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

PREFERRED_THEME = "light"

local system = vim.loop.os_uname().sysname

if system == "Darwin" then
  local handle = io.popen(
    "osascript -e 'tell application \"System Events\" to tell appearance preferences to get dark mode' 2>/dev/null"
  )
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result and result:match("true") then
      PREFERRED_THEME = "dark"
    end
  end
end

local home = os.getenv("HOME")
local venv_python = string.format("%s/.tool-venv/nvim/bin/python3", home)
if vim.fn.executable(venv_python) == 1 then
  vim.g["python3_host_prog"] = venv_python
end
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

if vim.fn.getenv("TERM_PROGRAM") == "ghostty" then
  vim.opt.title = true
  vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"
end
