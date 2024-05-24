return {
  {
    "phaazon/hop.nvim",
    branch = "v1", -- optional but strongly recommended
    event = "VeryLazy",
    config = function()
      require("hop").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          normal = "sa",
          delete = "sd",
          change = "sr",
        },
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
