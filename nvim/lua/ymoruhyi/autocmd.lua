vim.api.nvim_create_augroup("WorkingDirectory", { clear = true })
vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  pattern = { '*' },
  callback = function()
    local dir = vim.fn.expand('%:h')..'/'
    vim.api.nvim_command(string.format('cd %s', dir))
  end,
  group = 'WorkingDirectory'
})

-- set textwidth for markdown files
vim.api.nvim_create_augroup("MarkdownSettings", { clear = true })
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'markdown' },
  callback = function()
    vim.opt_local.textwidth = 80
    vim.opt_local.formatoptions='want'
  end,
  group = 'MarkdownSettings'
})
