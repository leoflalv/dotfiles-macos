local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Format
keymap("n", "<leader>f", ":Format<CR>", opts)

-- NvimTree
keymap("n", "<C-b>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>n", ":NvimTreeFindFile<CR>", opts)

keymap("t", "<C-c><C-c>", "<C-\\><C-n><C-w>c", opts)
keymap("n", "<C-c><C-c>", "<C-w>c", opts)

-- Telescope
keymap("n", "<leader>p", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap("n", "<leader>l", "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)
keymap("n", "<leader>q", "<cmd>lua require('telescope.builtin').buffers()<cr>", opts)
keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", opts)

-- Terminal
keymap("t", "<Esc>", "<C-\\><C-n>", opts)

-- Close buffer
keymap("n", "<C-C>", ":BufferClose<CR>", opts)
