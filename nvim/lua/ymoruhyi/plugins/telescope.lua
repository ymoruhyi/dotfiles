return {
  'nvim-telescope/telescope.nvim',
  cmd = "Telescope",
  version = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
      config = function()
        require('telescope').load_extension('fzf')
        -- require('telescope').load_extension('git_worktree')
        -- local builtin = require('telescope.builtin')
        --
        -- vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
        -- vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Find Git files' })
        -- vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help' })
        -- vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Live Grep' })
        -- vim.keymap.set('n', '<leader>wa', require('telescope').extensions.git_worktree.create_git_worktree,
        -- { desc = 'Create Git Worktree' })
        -- vim.keymap.set('n', '<leader>wl', require('telescope').extensions.git_worktree.git_worktrees,
        -- { desc = 'List Git Worktrees' })
      end
    },
  },
  keys = {
    { '<leader>ff', "<cmd>Telescope find_files<cr>", desc = "Find Files (Root Dir)" },
    { '<leader>fg', "<cmd>Telescope git_files<cr>", desc = "Find Git Files (Root Dir)" },
    { '<leader>sh', "<cmd>Telescope help_tags<cr>", desc = "Search Help" },
    { '<leader>sg', "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
  },
}
