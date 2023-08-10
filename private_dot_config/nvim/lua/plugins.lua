local not_vs_code = function()
	return not vim.g.vscode
end
local vscode = function()
	return vim.g.vscode == 1
end
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use({ "wbthomason/packer.nvim", opt = true })
	-- Collection of configurations for the built-in LSP client
	-- Required for native LSP
	use("neovim/nvim-lspconfig")
	-- nvim-cmp
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")

	-- Additional cmp completions
	require("packer").use({ "mtoohey31/cmp-fish", ft = "fish" })

	-- Post-install/update hook with neovim command
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

	use({
		"cuducos/yaml.nvim",
		ft = { "yaml" }, -- optional
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim", -- optional
		},
	})

	use("lewis6991/impatient.nvim")
	use("nathom/filetype.nvim")

	use("luukvbaal/nnn.nvim")

	use("khaveesh/vim-fish-syntax")

	-- use {
	-- 	'asvetliakov/vim-easymotion',
	-- 	cond = {vscode},
	-- 	-- disable = vim.g.vscode ~= nil,
	-- 	as = 'vsc-easymotion'
	-- }

	-- Lua development
	use("folke/neodev.nvim")

	use({
		"phaazon/hop.nvim",
		branch = "v1", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({})
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	use({
		"ur4ltz/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "sandwich" })
		end,
	})
	use({ "nvim-lua/plenary.nvim" })
	use({ "overcache/NeoSolarized" })
	use({ "projekt0n/github-nvim-theme" })
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "sbdchd/neoformat" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({})
		end,
	})
	use({ "TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim" })
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	-- Lua
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		-- or                            , branch = '0.1.x',
		--   requires = { {'nvim-lua/plenary.nvim'} }
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
end)
