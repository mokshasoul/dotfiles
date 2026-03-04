return {
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.markdown = { "markdownlint-cli2" }

      opts.linters = opts.linters or {}
      opts.linters["markdownlint-cli2"] = {
        -- Disable stdin to enable config file discovery.
        -- markdownlint-cli2 traverses directories to find .markdownlint.json,
        -- .markdownlint-cli2.jsonc, etc., but this only works with file paths.
        stdin = false,
        args = {},
        parser = require("lint.parser").from_errorformat("%f:%l:%c %m,%f:%l %m", {
          source = "markdownlint",
          severity = vim.diagnostic.severity.WARN,
        }),
      }
    end,
  },
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
