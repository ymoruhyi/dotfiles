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
      end
    },
  },
  keys = {
    { '<leader>ff', "<cmd>Telescope find_files<cr>", desc = "Find Files (Root Dir)" },
    { '<leader>fg', "<cmd>Telescope git_files<cr>", desc = "Find Git Files (Root Dir)" },
    { "<leader>fb", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { '<leader>sh', "<cmd>Telescope help_tags<cr>", desc = "Search Help" },
    { '<leader>sg', "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
    { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
    { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
    { '<leader>s"', "<cmd>Telescope registers<cr>", desc = "Registers" },
  },
}
