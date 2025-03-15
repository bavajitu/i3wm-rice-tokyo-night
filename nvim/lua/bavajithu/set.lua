vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.api.nvim_set_keymap('n', '<leader>c', '0i// <Esc>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<leader>c', ":s/^/\\/\\/ /<CR>:noh<CR>", { noremap = true, silent = true })



vim.api.nvim_set_keymap('v', '<leader>u', ":s/^\\/\\/ //<CR>:noh<CR>", { noremap = true, silent = true })

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- vim.opt.wrap = false
vim.o.wrap = true        -- Enable line wrapping
vim.o.linebreak = true   -- Break lines at word boundaries
vim.o.list = false       -- Ensure special characters don’t interfere with wrapping


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "


vim.api.nvim_set_keymap('n', '<leader>ll', ':VimtexCompile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lv', ':VimtexView<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>lc', ':VimtexClean<CR>', { noremap = true, silent = true })

