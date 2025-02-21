vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true
vim.wo.relativenumber = true
-- vim.cmd("set clipboard=unnamedplus") makes the default register the system clipboard
-- had to use wl-clipboard in order to get the pasting to work
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])

-- Disable default behavior for <C-j> in insert mode and map it to cmp's next item selection
vim.keymap.set('i', '<C-j>', function() return vim.fn["cmp#confirm"]({ select = true }) end, { noremap = true, silent = true })

-- neorg
vim.wo.foldlevel = 99
vim.wo.conceallevel = 2

vim.opt.conceallevel = 1
-- setup again
-- vim.g.python_host_prog = "/home/steffen/venvs/.nvim-venv/bin/python"
-- vim.g.python3_host_prog = "/home/steffen/venvs/.nvim-venv/bin/python3"
