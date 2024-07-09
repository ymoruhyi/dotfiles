return {
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  opts = {
    modes = {
      lsp = {
        win = { position = "right" },
      },
    },
  },
  config = function (_, opts)
    require("trouble").setup(opts);

    -- To disable line highlight on cursor (nice for transparent mode)
    vim.cmd[[highlight clear CursorLine]]
  end,
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>cs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
    { "<leader>cS", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/... (Trouble)" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
    { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").prev({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Previous Trouble/Quickfix Item",
    },
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Next Trouble/Quickfix Item",
    },
  },
}
-- return {
--   'folke/trouble.nvim',
--   dependencies = { 'nvim-tree/nvim-web-devicons' },
--   config = function()
--     -- vim.keymap.set('n', '<leader>xx', function() require('trouble').toggle() end, { desc = 'Toggle Trouble window' })
--     -- vim.keymap.set('n', '<leader>xw', function() require('trouble').toggle('workspace_diagnostics') end, { desc = 'Workspace diagnostics' })
--     vim.keymap.set('n', '<leader>xx', function() require('trouble').toggle('diagnostics') end, { desc = 'Document diagnostics' })
--     vim.keymap.set('n', '<leader>xq', function() require('trouble').toggle('quickfix') end, { desc = 'Toggle quickfix list view' })
--     vim.keymap.set('n', '<leader>xl', function() require('trouble').toggle('loclist') end, { desc = 'Toggle location list view' })
--     vim.keymap.set('n', 'gR', function() require('trouble').toggle('lsp_references') end, { desc = 'LSP reference for word under cursor' })
--
--     -- To disable line highlight on cursor (nice for transparent mode)
--     vim.cmd[[highlight clear CursorLine]]
--   end,
-- }
