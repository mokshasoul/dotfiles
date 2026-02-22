-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.g.neovide then
  vim.o.guifont = "CommitMono Nerd Font Propo:h34"
  vim.g.neovide_scale_factor = 0.5
end
PREFERRED_THEME = "light"

local uname = io.popen("uname -s")
local system = uname and uname:read("*a"):gsub("%s+", "") or ""
if uname then uname:close() end

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
elseif system == "Linux" then
  local handle = io.popen(
    "gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null"
  )
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result and result:match("dark") then
      PREFERRED_THEME = "dark"
    end
  end
end

vim.o.bg = PREFERRED_THEME

local home = os.getenv("HOME")
local venv_python = string.format("%s/.tool-venv/nvim/.venv/bin/python", home)
if vim.fn.executable(venv_python) == 1 then
  vim.g["python3_host_prog"] = venv_python
end
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

if vim.fn.getenv("TERM_PROGRAM") == "ghostty" then
  vim.opt.title = true
  vim.opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"
end
