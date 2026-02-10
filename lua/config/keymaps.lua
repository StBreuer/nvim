-- vim.cmd("set clipboard=unnamedplus") makes the default register the system clipboard
-- had to use wl-clipboard in order to get the pasting to work
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.g.mapleader = " "
vim.g.maplocalleader = " "
