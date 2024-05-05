vim.o.guicursor = ""
vim.o.nu = true
vim.o.relativenumber = true
vim.o.mouse = ""
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.o.splitright = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = false
vim.o.undofile = true
vim.o.autoindent = true

-- not sure if really want this
vim.opt.backup = false
vim.opt.updatetime = 50

vim.cmd.highlight({ 'link', 'TermCursor', 'Cursor' })
vim.cmd.highlight({ 'TermCursorNC', 'guibg=red', 'guifg=white', 'ctermbg=1', 'ctermfg=15' })

if (vim.fn.has('nvim') and vim.fn.executable('nvr')) then
  vim.env.VISUAL="nvr -cc split --remote-wait +'set bufhidden=wipe'"
end
