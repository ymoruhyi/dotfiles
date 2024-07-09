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

-- opt.autowrite = true -- Enable auto write
-- -- only set clipboard if not in ssh, to make sure the OSC 52
-- -- integration works automatically. Requires Neovim >= 0.10.0
-- opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
-- opt.completeopt = "menu,menuone,noselect"
-- -- opt.confirm = true -- Confirm to save changes before exiting modified buffer
-- opt.expandtab = true -- Use spaces instead of tabs
-- -- opt.fillchars = {
-- --   foldopen = "",
-- --   foldclose = "",
-- --   fold = " ",
-- --   foldsep = " ",
-- --   diff = "╱",
-- --   eob = " ",
-- -- }
-- -- opt.foldlevel = 99
-- -- opt.formatoptions = "jcroqlnt" -- tcqj
-- -- opt.grepformat = "%f:%l:%c:%m"
-- -- opt.grepprg = "rg --vimgrep"
-- opt.ignorecase = true -- Ignore case
-- opt.inccommand = "nosplit" -- preview incremental substitute
-- opt.jumpoptions = "view"
-- opt.laststatus = 3 -- global statusline
-- opt.linebreak = true -- Wrap lines at convenient points
-- opt.list = true -- Show some invisible characters (tabs...
-- opt.mouse = "a" -- Enable mouse mode
-- opt.number = true -- Print line number
-- opt.pumblend = 10 -- Popup blend
-- opt.pumheight = 10 -- Maximum number of entries in a popup
-- opt.relativenumber = true -- Relative line numbers
-- opt.scrolloff = 4 -- Lines of context
-- opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
-- opt.shiftround = true -- Round indent
-- opt.shiftwidth = 2 -- Size of an indent
-- opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- opt.showmode = false -- Dont show mode since we have a statusline
-- opt.sidescrolloff = 8 -- Columns of context
-- opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
-- opt.smartcase = true -- Don't ignore case with capitals
-- opt.smartindent = true -- Insert indents automatically
-- opt.spelllang = { "en" }
-- opt.spelloptions:append("noplainbuffer")
-- opt.splitbelow = false -- Put new windows above current
-- opt.splitkeep = "screen"
-- opt.splitright = true -- Put new windows right of current
-- opt.tabstop = 2 -- Number of spaces tabs count for
-- opt.termguicolors = true -- True color support
-- opt.timeoutlen = vim.g.vscode and 1000 or 300 -- Lower than default (1000) to quickly trigger which-key
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
-- opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
-- opt.wildmode = "longest:full,full" -- Command-line completion mode
-- opt.winminwidth = 5 -- Minimum window width
opt.wrap = false -- Disable line wrap

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

-- My old options
opt.guicursor = ""
opt.nu = true
opt.relativenumber = true
opt.mouse = ""
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = 'yes'
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true
opt.cursorline = false
opt.undofile = true
opt.autoindent = true

vim.cmd.highlight({ 'link', 'TermCursor', 'Cursor' })
vim.cmd.highlight({ 'TermCursorNC', 'guibg=red', 'guifg=white', 'ctermbg=1', 'ctermfg=15' })

if (vim.fn.has('nvim') and vim.fn.executable('nvr')) then
  vim.env.VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
end
