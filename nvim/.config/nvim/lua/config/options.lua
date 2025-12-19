-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.guicursor = "" -- Brick as a cursor in edit mode
opt.relativenumber = true
opt.clipboard = "" -- This is the trick to disable clipboard sync when yanking (I have separate keymap for this)
opt.list = false
