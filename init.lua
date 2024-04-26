-- Vim Settings

vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.wo.relativenumber = true
vim.wo.number = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.showmode = false

-- Imports

require("lazysetup")
require("remappings")
require("language-server")
