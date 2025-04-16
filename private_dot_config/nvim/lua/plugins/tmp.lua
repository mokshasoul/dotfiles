-- taken from folke: https://github.com/folke/dot/blob/master/nvim/lua/plugins/tmp.lua
return {
  -- { "justinsgithub/wezterm-types", lazy = true },
  { "LuaCATS/luassert", name = "luassert-types", lazy = true },
  { "LuaCATS/busted", name = "busted-types", lazy = true },
  { "godlygeek/tabular", lazy = true, cmd = "Tabularize" },
  {
    "folke/lazydev.nvim",
    opts = function(_, opts)
      opts.debug = true
      -- opts.runtime = "~/projects/neovim/runtime"
      vim.list_extend(opts.library, {
        -- { path = "wezterm-types", mods = { "wezterm" } },
        { path = "${3rd}/luassert/library", words = { "assert" } },
        { path = "${3rd}/busted/library", words = { "describe" } },
      })
    end,
  },
}
