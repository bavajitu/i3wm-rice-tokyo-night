
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- Keymappings

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Increment/decrement
keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- Delete a word backwards
keymap("n", "dw", "vb_d", opts)

-- Select all
keymap("n", "<C-a>", "gg<V-G>", opts)

-- Jumplist
keymap("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap("n", "te", ":tabedit<CR>", opts)
keymap("n", "<Tab>", ":tabnext<CR>", opts)
keymap("n", "<S-Tab>", ":tabprev<CR>", opts)

-- Split window
keymap("n", "ss", ":split<CR>", opts)
keymap("n", "sv", ":vsplit<CR>", opts)

-- Move window
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sl", "<C-w>l", opts)

-- Resize window
keymap("n", "<C-w><Left>", "<C-w><", opts)
keymap("n", "<C-w><Right>", "<C-w>>", opts)
keymap("n", "<C-w><Up>", "<C-w>+", opts)
keymap("n", "<C-w><Down>", "<C-w>-", opts)

