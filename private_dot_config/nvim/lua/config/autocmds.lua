-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "ruby" },
  callback = function()
    vim.b.autoformat = false
  end,
})

vim.api.nvim_create_user_command("CleanIllegalCharacters", function()
  vim.cmd("s/[^a-zA-Z0-9.+_]/_/g")
end, {})
