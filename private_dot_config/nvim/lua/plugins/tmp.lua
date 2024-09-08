-- taken from folke: https://github.com/folke/dot/blob/master/nvim/lua/plugins/tmp.lua
return {
  { "justinsgithub/wezterm-types", lazy = true },
  { "LuaCATS/luassert", name = "luassert-types", lazy = true },
  { "LuaCATS/busted", name = "busted-types", lazy = true },
  {
    "folke/lazydev.nvim",
    opts = function(_, opts)
      opts.debug = true
      -- opts.runtime = "~/projects/neovim/runtime"
      vim.list_extend(opts.library, {
        { path = "wezterm-types", mods = { "wezterm" } },
        { path = "luassert-types/library", words = { "assert" } },
        { path = "busted-types/library", words = { "describe" } },
      })
    end,
  },
}
