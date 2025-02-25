require("base")
-- Set up lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy.nvim
require("lazy").setup({
  -- LSP and autocomplete
  { "neovim/nvim-lspconfig" },  -- LSP support
  { "williamboman/mason.nvim" },  -- LSP installer
  { "williamboman/mason-lspconfig.nvim" },  -- Bridge for mason & lspconfig
  { "hrsh7th/nvim-cmp" },  -- Autocomplete
  { "hrsh7th/cmp-nvim-lsp" },  -- LSP source for nvim-cmp
  { "hrsh7th/cmp-buffer" },  -- Buffer source for nvim-cmp
  { "L3MON4D3/LuaSnip" },  -- Snippet engine
  { "saadparwaiz1/cmp_luasnip" },  -- Snippet source for nvim-cmp
  { "jose-elias-alvarez/null-ls.nvim" },  -- Formatter & Linter
  { "jay-babu/mason-null-ls.nvim" },  -- Mason integration for null-ls
  { "mfussenegger/nvim-dap" },  -- Core debug adapter
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } }, -- UI for DAP
  { "jay-babu/mason-nvim-dap.nvim" }, -- Mason integration for DAP
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "folke/which-key.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "Exafunction/codeium.vim" },
  { "gen740/SmoothCursor.nvim" },
  { "karb94/neoscroll.nvim" },
  {'akinsho/toggleterm.nvim', version = "*", config = true},
  { "akinsho/bufferline.nvim", dependencies = "nvim-tree/nvim-web-devicons" },
  { "lewis6991/gitsigns.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "lewis6991/impatient.nvim" },

  -- COLOR SCHEMES
  { "projekt0n/github-nvim-theme", name = "github-theme"},
 })

require("map")

require("which-key").setup()

require("nvim-treesitter.configs").setup({
  ensure_installed = { "javascript", "typescript", "go", "lua", "json" },
  highlight = { enable = true },
})

-- LSP Configuration
local lspconfig = require("lspconfig")

require("mason").setup()  -- Ensure Mason is set up
require("mason-lspconfig").setup({
  ensure_installed = { "ts_ls", "gopls" }
})

-- JavaScript/TypeScript LSP
lspconfig.ts_ls.setup({})

-- Go LSP
lspconfig.gopls.setup({})

-- Autocompletion Setup
local cmp = require("cmp")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body) -- Use LuaSnip for snippets
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.select_next_item(), -- Tab to select next item
    ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Shift+Tab to select previous
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to confirm selection
    ["<C-Space>"] = cmp.mapping.complete(), -- Ctrl+Space to trigger completion
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- LSP suggestions
    { name = "buffer" }, -- Buffer suggestions
    { name = "luasnip" }, -- Snippet suggestions
  }),
})

-- Setup null-ls for formatting & linting
local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Formatting
    null_ls.builtins.formatting.prettier.with({ filetypes = { "javascript", "typescript" } }),
    null_ls.builtins.formatting.gofmt,

    -- Linting
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.golangci_lint,
  },
})

-- Autoformat on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

-- Setup Lualine (Status Bar)
require("lualine").setup({
  options = { theme = "auto" },
})

require("editor-settings")
