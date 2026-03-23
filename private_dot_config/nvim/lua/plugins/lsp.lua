return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        fish_lsp = {
          mason = false,
        },
      },
    },
    setup = {
      fish_lsp = function(_, opts)
        require("fish_lsp").setup({ server = opts })
      end,
    },
  },
}
