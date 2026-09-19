-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.snacks_animate = false

-- Avoid OSC52 clipboard reads and Windows Terminal's slow OSC52 writes under WSL.
if vim.fn.has("wsl") == 1 then
  -- This wrapper invokes the Windows binary through /init, which also works
  -- when the WSLInterop binfmt registration is missing.
  local win32yank = vim.fn.expand("$HOME/.local/bin/win32yank")
  local copy = { win32yank, "-i", "--crlf" }
  local paste = { win32yank, "-o", "--lf" }

  vim.g.clipboard = {
    name = "win32yank (WSL)",
    copy = { ["+"] = copy, ["*"] = copy },
    paste = { ["+"] = paste, ["*"] = paste },
    cache_enabled = 0,
  }
end

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.guicursor = "" -- Brick as a cursor in edit mode
opt.relativenumber = true
opt.clipboard = "" -- This is the trick to disable clipboard sync when yanking (I have separate keymap for this)
opt.list = false
