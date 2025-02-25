vim.cmd [[
  augroup AutoThemeSwitch
    autocmd!
    autocmd OptionSet background lua require('lualine').setup({ options = { theme = vim.o.background == "dark" and "github_dark" or "github_light" }})
  augroup END
]]

require("nvim-tree").setup({
  view = {
    side = "right", -- Move sidebar to the right
  }
})

-- Keybinding to toggle file explorer
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })


require("lualine").setup({
  options = { theme = "", section_separators = '', component_separators = '' }
})

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier, -- JS, TS, HTML, CSS
    null_ls.builtins.formatting.gofmt,    -- Go Formatter
    null_ls.builtins.formatting.stylua,   -- Lua Formatter
  },
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

require("smoothcursor").setup({
  cursor = "|",
  type = "default",
  speed = 25
})

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true -- Converts tabs to spaces

require("neoscroll").setup()

require("toggleterm").setup({
  direction = "horizontal",
  size = 10
})

vim.api.nvim_set_keymap("n", "<leader>t", ":ToggleTerm<CR>", { noremap = true, silent = true })

require("bufferline").setup({})

vim.opt.termguicolors = true
require("bufferline").setup({})
require("gitsigns").setup({})
require("ibl").setup({
  scope = { enabled = true },
  indent = { char = "│" },
})
require("impatient")

-- Default options
require('github-theme').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath('cache') .. '/github-theme',
    compile_file_suffix = '_compiled', -- Compiled file suffix
    hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
    hide_nc_statusline = true, -- Override the underline style for non-active statuslines
    transparent = true,       -- Disable setting bg (make neovim's background transparent)
    terminal_colors = true,    -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,      -- Non focused panes set to alternative background
    module_default = true,     -- Default enable value for modules
    styles = {                 -- Style to be applied to different syntax groups
      comments = 'NONE',       -- Value is any valid attr-list value `:help attr-list`
      functions = 'NONE',
      keywords = 'NONE',
      variables = 'NONE',
      conditionals = 'NONE',
      constants = 'NONE',
      numbers = 'NONE',
      operators = 'NONE',
      strings = 'NONE',
      types = 'NONE',
    },
    inverse = {                -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    darken = {                 -- Darken floating windows and sidebar-like windows
      floats = true,
      sidebars = {
        enable = true,
        list = {},             -- Apply dark background to specific windows
      },
    },
    modules = {                -- List of various plugins and additional options
      -- ...
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

-- setup must be called before loading
vim.cmd('colorscheme github_dark')
