return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    vim.keymap.set('n', '<leader>xx', function() require('trouble').toggle() end, { desc = 'Toggle Trouble window' })
    vim.keymap.set('n', '<leader>xw', function() require('trouble').toggle('workspace_diagnostics') end, { desc = 'Workspace diagnostics' })
    vim.keymap.set('n', '<leader>xd', function() require('trouble').toggle('document_diagnostics') end, { desc = 'Document diagnostics' })
    vim.keymap.set('n', '<leader>xq', function() require('trouble').toggle('quickfix') end, { desc = 'Toggle quickfix list view' })
    vim.keymap.set('n', '<leader>xl', function() require('trouble').toggle('loclist') end, { desc = 'Toggle location list view' })
    vim.keymap.set('n', 'gR', function() require('trouble').toggle('lsp_references') end, { desc = 'LSP reference for word under cursor' })

    -- To disable line highlight on cursor (nice for transparent mode)
    vim.cmd[[highlight clear CursorLine]]
  end
}
