-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.autoformat = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- LazyVim automatically configures lazygit:
--  * theme, based on the active colorscheme.
--  * editorPreset to nvim-remote
--  * enables nerd font icons
-- Set to false to disable.
vim.g.lazygit_config = true

-- Hide deprecation warnings
vim.g.deprecation_warnings = false

-- Show the current document symbols location from Trouble in lualine
vim.g.trouble_lualine = true

local opt = vim.opt

opt.linebreak = true -- Wrap lines at convenient points
opt.showmode = false -- Dont show mode since we have a statusline
opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- My old options
opt.guicursor = "" -- Brick as a cursor in edit mode
opt.nu = true -- Print line number
opt.relativenumber = true
opt.mouse = "a" -- Enable mouse mode(set to "" to disable)
opt.tabstop = 2 -- Number of spaces tabs count for
opt.shiftwidth = 2 -- Size of an indent
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically
opt.wrap = false
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff = 8 -- Lines of context
opt.signcolumn = 'yes'
opt.splitright = true -- Open split to the right(vertical)
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals
opt.cursorline = false -- Disable highlighting of the current line
opt.undofile = true
opt.autoindent = true

vim.cmd.highlight({ 'link', 'TermCursor', 'Cursor' })
vim.cmd.highlight({ 'TermCursorNC', 'guibg=red', 'guifg=white', 'ctermbg=1', 'ctermfg=15' })

if (vim.fn.has('nvim') and vim.fn.executable('nvr')) then
  vim.env.VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
end
