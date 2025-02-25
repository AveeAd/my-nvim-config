-- LSP Keybindings
-- Set space as the leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.keymap.set("n"," ", ":")
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true }) -- Go to definition
vim.keymap.set("n", "gr", vim.lsp.buf.references, { noremap = true, silent = true }) -- Show references
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true }) -- Hover docs

-- DAP (Debugging) Keybindings
vim.keymap.set("n", "<F5>", ":DapContinue<CR>", { noremap = true, silent = true }) -- Start debugging
vim.keymap.set("n", "<F9>", ":DapToggleBreakpoint<CR>", { noremap = true, silent = true }) -- Toggle breakpoint
vim.keymap.set("n", "<F10>", ":DapStepOver<CR>", { noremap = true, silent = true }) -- Step over
vim.keymap.set("n", "<F11>", ":DapStepInto<CR>", { noremap = true, silent = true }) -- Step into
vim.keymap.set("n", "<F12>", ":DapStepOut<CR>", { noremap = true, silent = true }) -- Step out

-- Telescope
local telescope = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope.find_files, { noremap = true, silent = true })  -- Find files
vim.keymap.set("n", "<leader>fg", telescope.live_grep, { noremap = true, silent = true })  -- Grep in project
vim.keymap.set("n", "<leader>fb", telescope.buffers, { noremap = true, silent = true })  -- Search buffers
vim.keymap.set("n", "<leader>fh", telescope.help_tags, { noremap = true, silent = true })  -- Search help docs

-- Tabs
vim.api.nvim_set_keymap("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":tabprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><Tab>", ":tabnew<CR>", { noremap = true, silent = true }) -- New Tab
vim.api.nvim_set_keymap("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true }) -- Close Tab
