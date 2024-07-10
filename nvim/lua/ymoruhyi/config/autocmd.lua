local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- set current working directory upon opening a project with fzf
vim.api.nvim_create_autocmd("VimEnter", {
  group = augroup("work_dir"),
  pattern = { '*' },
  callback = function()
    local dir = vim.fn.expand('%:h')..'/'
    vim.api.nvim_command(string.format('cd %s', dir))
  end,
})

-- set textwidth for markdown files
vim.api.nvim_create_autocmd("FileType", {
  group = augroup('md_width'),
  pattern = { 'markdown' },
  callback = function()
    vim.opt_local.textwidth = 120
    vim.opt_local.formatoptions='want'
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Open nvim-tree for directories and change current working dir
-- local function open_nvim_tree(data)
--   -- buffer is a directory
--   local directory = vim.fn.isdirectory(data.file) == 1
--
--   if not directory then
--     return
--   end
--
--   -- change to the directory
--   vim.cmd.cd(data.file)
--
--   -- open the tree
--   -- require("nvim-tree.api").tree.open()
--
--   -- open Telescope
--   vim.cmd[[Telescope find_files]]
-- end
--
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
