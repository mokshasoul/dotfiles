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
}
