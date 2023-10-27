-- Vim Settings


vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.wo.relativenumber = true --for later use
vim.wo.number = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Imports

require("lazysetup")
require("remappings")
require("language-server")
