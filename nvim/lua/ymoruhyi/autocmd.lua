vim.api.nvim_create_augroup("WorkingDirectory", { clear = true })

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  pattern = { '*' },
  callback = function()
    local dir = vim.fn.expand('%:h')..'/'
    vim.api.nvim_command(string.format('cd %s', dir))
  end,
  group = 'WorkingDirectory'
})
