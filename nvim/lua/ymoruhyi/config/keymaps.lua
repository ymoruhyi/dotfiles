vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Project View' })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zzzv")
vim.keymap.set("n", "#", "#zzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- blackhole register "_

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Lazy menu
vim.keymap.set("n", "<leader>l", ":Lazy<CR>")

-- Easier window navigation
vim.keymap.set("n", "<M-l>", "<C-w>l")
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")

-- Terminal window remaps for easier window navigation
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<M-v><Esc>", "<Esc>")
vim.keymap.set("t", "<M-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<M-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<M-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<M-k>", "<C-\\><C-n><C-w>k")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })

local enabled = true
local toggle_diagnostics = function ()
  enabled = not enabled
  if enabled then
    vim.diagnostic.enable()
    print("Enabled diagnostics")
  else
    vim.diagnostic.disable()
    print("Disabled diagnostics")
  end
end

vim.keymap.set('n', '<leader>ud', toggle_diagnostics, { desc = 'Toogle Diagnostic' })

-- TODO: add lazygit keymaps

-- eslint_d fix current buffer
-- vim.api.nvim_set_keymap('n', '<leader>xb', [[mF:%!eslint_d --stdin --fix-to-stdout<CR>`F]], {noremap = true, silent = true, desc = 'Linter fix buffer'})

