-- set leader early to allow plugins to use it
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap LazyVim / lazy.nvim (via config/lazy.lua)
require("config.lazy")

-- Load core modules
require("config.options")
require("config.keymaps")
-- used for on open file stuff
-- require("config.autocmds")
