-- init.lua
-- Neovim-specific configuration
--
local opt = vim.opt
local o = vim.o
local g = vim.g
local fn = vim.fn
local env = vim.env
local cmd = vim.cmd
local map = vim.keymap.set
local api = vim.api
local not_vscode = not vim.g.vscode
vim.loader.enable()
-- Bootstrap LazyNvim: https://github.com/folke/lazy.nvim#-installation
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
opt.rtp:prepend(lazypath)
--

opt.backup = false -- don't use backup files
opt.writebackup = false -- don't backup the file while editing
opt.swapfile = false -- don't create swap files for new buffers
opt.updatecount = 0 -- don't write swap files after some number of updates
opt.history = 1000 -- store the last 1000 commands entered
opt.rtp:append("/opt/homebrew/opt/fzf")

opt.termguicolors = true
opt.background = "light"
-- show the results of substition as they're happening
---- but don't open a split
opt.inccommand = "nosplit"

opt.backspace = { "indent", "eol", "start" } -- make backspace behave in a sane manner
opt.clipboard:append("unnamedplus") -- use the system clipboard
opt.mouse = "a" -- set mouse mode to all modes

-- searching
opt.ignorecase = true -- case insensitive searching
opt.smartcase = true -- case-sensitive if expresson contains a capital letter
opt.hlsearch = true -- highlight search results
opt.incsearch = true -- set incremental search, like modern browsers
opt.lazyredraw = false -- don't redraw while executing macros
opt.magic = true -- set magic on, for regular expressions

if fn.executable("rg") then
  -- if ripgrep installed, use that as a grepper
  opt.grepprg = "rg --vimgrep --no-heading"
  opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- error bells
opt.errorbells = false
opt.visualbell = true
opt.timeoutlen = 500

-- Appearance
---------------------------------------------------------
opt.number = true -- show line numbers
opt.wrap = true -- turn on line wrapping
opt.wrapmargin = 8 -- wrap lines when coming within n characters from side
opt.linebreak = true -- set soft wrapping
opt.showbreak = "↪"
opt.ttyfast = true -- faster redrawing
table.insert(opt.diffopt, "vertical")
table.insert(opt.diffopt, "iwhite")
table.insert(opt.diffopt, "internal")
table.insert(opt.diffopt, "algorithm:patience")
table.insert(opt.diffopt, "hiddenoff")
opt.laststatus = 2 -- show the status line all the time
opt.scrolloff = 7 -- set 7 lines to the cursors - when moving vertical
opt.wildmenu = true -- enhanced command line completion
opt.showmode = true -- don't show which mode disabled for PowerLine
opt.wildmode = { "list", "longest" } -- complete files like a shell
opt.shell = env.SHELL
opt.cmdheight = 1 -- command bar height
opt.title = true -- set terminal title
opt.showmatch = true -- show matching braces
opt.mat = 2 -- how many tenths of a second to blink
opt.updatetime = 300
opt.signcolumn = "yes"
opt.shortmess = "atToOFc" -- prompt message options
-- Tab control
opt.smarttab = true -- tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
opt.tabstop = 2 -- the visible width of tabs
opt.softtabstop = 2 -- edit as if the tabs are 4 characters wide
opt.shiftwidth = 2 -- number of spaces to use for indent and unindent
opt.shiftround = true -- round indent to a multiple of 'shiftwidth'

--
-- wildignore
--
opt.wildignore:append({ ".git", ".hg", ".svn", "node_modules" })
opt.wildignore:append({ "*.o", "*.obj", "*.exe", "*.dll", "*.manifest", "*.rbc", "*.class", "*.pyc" })
opt.wildignore:append({ "*.aux", "*.out", "*.toc" })

-- SET: base keymaps
map("n", "<Space>", "<NOP>", { noremap = true })
g.mapleader = " "
g.maplocalleader = ","

map("n", "<C-S>", ":w<CR><ESC>")


----------
-- Plugins
----------
require("lazy").setup({
  {
    import = "plugins.plugins_notvscode",
    cond = function()
      return not vim.g.vscode
    end,
  },
  { import = "plugins.plugins_always", cond = true },
  {
    import = "plugins.plugins_vscode",
    cond = function()
      return vim.g.vscode
    end,
  },
})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
map("n", ",e", vim.diagnostic.open_float, opts)
map("n", "[d", vim.diagnostic.goto_prev, opts)
map("n", "]d", vim.diagnostic.goto_next, opts)
map("n", "<space>q", vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })

  -- Mappings. See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  map("n", "gD", vim.lsp.buf.declaration, bufopts)
  map("n", "gd", vim.lsp.buf.definition, bufopts)
  map("n", "K", vim.lsp.buf.hover, bufopts)
  map("n", "gi", vim.lsp.buf.implementation, bufopts)
  map("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  map("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  map("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  map("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  map("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  map("n", "gr", vim.lsp.buf.references, bufopts)
  map("n", "<space>f", vim.lsp.buf.format, bufopts)
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "?.lua")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

if vim.g.vscode then
  map("x", "gc", "<Plug>VSCodeCommentary")
  map("n", "gc", "<Plug>VSCodeCommentary")
  map("o", "gc", "<Plug>VSCodeCommentary")
  map("n", "gcc", "<Plug>VSCodeCommentaryLine")
  map("n", "<Leader>w", '<Cmd>call VSCodeCall("workbench.action.files.save")<CR>')
end

if not_vscode then
  require("neoconf").setup({})
  -- This inits plugins with default configuration
  require("Comment").setup()
  require("nnn").setup()
  local cmp = require("cmp")
  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "vsnip" }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = "buffer" },
    }),
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
      { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = "buffer" },
    }),
  })

  cmp.setup({
    sources = cmp.config.sources({
      { name = "fish" },
    }),
  })

  -- Set up lspconfig.
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local lsp = require("lspconfig")
  lsp["lua_ls"].setup({
    on_attach = on_attach,
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          -- path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          checkThirdParty = false,
          -- Make the server aware of Neovim runtime files
          library = {
            vim.env.VIMRUNTIME,
            "${3rd}/luv/library",
            "${3rd}/luassert/library",
          },
          -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
          -- library = api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
        capabilities = capabilities,
      },
    },
  })
  g.do_filetype_lua = true
  g.neoformat_enabled_lua = { "stylua" }
  g.neoformat_enabled_python = { "black" }
  map("n", "<Leader>ff", ":Telescope find_files<CR>", { noremap = true })
  map("n", "<Leader>pp", ":Telescope<CR>", { noremap = true })
  map("n", "<Leader>e", ":NvimTreeOpen<CR>", { noremap = true })
  --
  -- allows managing dotfiles using chezmoi plugin + telescope
  local telescope = require("telescope")
  telescope.load_extension("chezmoi")
  map("n", "<leader>cz", telescope.extensions.chezmoi.find_files, {})

  require("noice").setup({
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      command_palette = true, -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
  })

  local util = require('util')

  util.wezterm()
end

if vim.g.vscode then
  vim.g.clipboard = vim.g.vscode_clipboard
end

if vim.g.neovide then
  o.guifont = "Fira_Code:h34" -- text below applies for VimScript
  g.neovide_scale_factor = 0.4
  g.neovide_fullscreen = false
end
