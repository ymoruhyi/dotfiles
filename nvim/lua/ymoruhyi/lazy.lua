local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "tpope/vim-fugitive",
  { "numToStr/Comment.nvim", opts = {} },
  { "mbbill/undotree" },
  { "tpope/vim-sleuth" },
  "ThePrimeagen/git-worktree.nvim",
  { import = "ymoruhyi/plugins" },
}, {
    defaults = { lazy = false },
    ui = {
      border = "rounded",
    },
    performance = {
      cache = {
        enabled = true,
      },
      rtp = {
        disabled_plugins = {
          -- "matchit",
          -- "matchparen",
          "netrwPlugin",
          "gzip",
          "tarPlugin",
          "tohtml",
          "tutor",
          "zipPlugin",
        },
      },
    },
    debug = false,
  })
