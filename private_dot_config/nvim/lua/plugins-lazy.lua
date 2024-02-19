local not_vs_code = function()
  return not vim.g.vscode
end

return {
  "neovim/nvim-lspconfig",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/nvim-cmp",
  "imsnif/kdl.vim",
  "nekowinston/wezterm-types",
  { "mtoohey31/cmp-fish", ft = "fish" },
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    cond = not_vs_code,
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
        },
        -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "css",
          "diff",
          "dockerfile",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "go",
          "gomod",
          "gosum",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "json5",
          "lua",
          "luadoc",
          "make",
          "markdown",
          "markdown_inline",
          "rust",
          "scss",
          "sql",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "vimdoc",
          "yaml",
        },
        auto_install = true,
      })
    end,
  },
  {
    "cuducos/yaml.nvim",
    ft = { "yaml" }, -- optional
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
    },
  },
  "lewis6991/impatient.nvim",
  "luukvbaal/nnn.nvim",
  "folke/neodev.nvim",
	"folke/neoconf.nvim",
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
    "kyazdani42/nvim-tree.lua",
    tag = "nightly", -- optional, updated every week. (see issue #1193)
    dependencies = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icons
    },
  },
  -- {
  -- 	"ur4ltz/surround.nvim",
  -- 	opts = {
  -- 		mappings_style = "sandwhich",
  -- 	},
  -- 	event = "VeryLazy",
  -- 	config = function()
  -- 		require("surround").setup({
  -- 			-- Configuration here, or leave empty to use defaults
  -- 		})
  -- 	end,
  -- },
  "nvim-lua/plenary.nvim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  -- {
  -- 	"projekt0n/github-nvim-theme",
  -- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
  -- 	priority = 1000, -- make sure to load this before all the other start plugins
  -- 	config = function()
  -- 		-- load the colorscheme here
  -- 		vim.cmd([[colorscheme github_light]])
  -- 	end,
  -- },
  "sbdchd/neoformat",
  { "TimUntersberger/neogit", dependencies = "nvim-lua/plenary.nvim" },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = "kyazdani42/nvim-web-devicons",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
  },
  "numToStr/Comment.nvim",
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", opt = true },
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
