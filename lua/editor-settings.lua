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
