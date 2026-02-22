-- taken from folke: https://github.com/folke/dot/blob/master/nvim/lua/plugins/tmp.lua
return {
  { "LuaCATS/luassert", name = "luassert-types", lazy = true },
  { "LuaCATS/busted", name = "busted-types", lazy = true },
  { "godlygeek/tabular", lazy = true, cmd = "Tabularize" },
  {
    "folke/lazydev.nvim",
    opts = {
      library = {
        { path = "${3rd}/luassert/library", words = { "assert" } },
        { path = "${3rd}/busted/library", words = { "describe" } },
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "LazyVim", words = { "LazyVim" } },
      },
      enabled = function(root_dir)
        return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
      end,
    },
  },
}
