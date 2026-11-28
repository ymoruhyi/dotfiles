local opt = vim.opt

-- General
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.markdown_recommended_style = 0 -- Fix markdown indentation settings

vim.o.undofile = true -- Enable persistent undo

-- UI
vim.o.showmode = false -- Don't show mode in command line
opt.signcolumn = "yes" -- Always show the signcolumn (less flicker)
opt.ruler = true -- Don't show cursor coordinates
opt.colorcolumn = "+1" -- Draw column on the right of maximum width
opt.textwidth = 80 -- Draw column on the right of maximum width
opt.wrap = false -- Disable line wrap
opt.number = true
opt.pumborder = "single" -- Use border in popup menu
opt.pumheight = 10 -- Make popup menu smaller
opt.pummaxwidth = 100 -- Make popup menu not too wide
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen" -- Reduce scroll during window split
opt.splitright = true -- Put new windows right of current
opt.winborder = "single" -- border style for all floating windows

-- Folds (see `:h fold-commands`, `:h zM`, `:h zR`, `:h zA`, `:h zj`)
opt.foldlevel = 10 -- Fold nothing by default; set to 0 or 1 to fold
opt.foldmethod = "indent" -- Fold based on indent level
opt.foldnestmax = 10 -- Limit number of fold levels
opt.foldtext = "" -- Show text under fold with its highlighting

-- Editing
opt.autoindent = true -- Use auto indent
opt.expandtab = true -- Convert tabs to spaces
opt.formatoptions = "jcroqlnt" -- add 't' for auto-wrap
opt.ignorecase = true -- Ignore case during search
opt.incsearch = true -- Show search matches while typing
opt.infercase = true -- Infer case in built-in completion
opt.shiftwidth = 2 -- Use this number of spaces for indentation
opt.smartcase = true -- Respect case if search pattern has upper case
opt.smartindent = true -- Insert indents automatically
opt.spelloptions = "camel" -- Treat camelCase word parts as separate words
opt.tabstop = 2 -- Show tab as this number of spaces
opt.virtualedit = "block" -- Allow going past end of line in blockwise mode

opt.iskeyword = "@,48-57,_,192-255,-" -- Treat dash as `word` textobject part

-- Built-in completion (type <C-n> in insert mode to show the options)
opt.complete = ".,w,b,kspell" -- Use less sources
opt.completeopt = "menuone,noselect,fuzzy,nosort" -- Use custom behavior
opt.completetimeout = 100 -- Limit sources delay

-- Other stuff
opt.relativenumber = true
opt.conceallevel = 0
opt.sidescrolloff = 8 -- Columns of context
opt.smoothscroll = true
opt.spelllang = { "en" }
opt.termguicolors = true -- True color support
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
