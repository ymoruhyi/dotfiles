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
  opts = function ()
    local open_with_trouble = function(...)
      return require("trouble.sources.telescope").open(...)
    end

    return {
      defaults = {
        mappings = {
          i = {
            ["<c-t>"] = open_with_trouble,
          }
        }
      },
    }
  end,
  keys = {
    { '<leader>ff', function () require('telescope.builtin').find_files() end, desc = "Find Files (Root Dir)" },
    { '<leader>fg', function () require('telescope.builtin').git_files() end, desc = "Find Git Files (Root Dir)" },
    { "<leader>fb", function () require('telescope.builtin').buffers({ sort_mru = true, sort_lastused = true }) end, desc = "Buffers" },
    { '<leader>sh', function () require('telescope.builtin').help_tags() end, desc = "Search Help" },
    { '<leader>sg', function () require('telescope.builtin').live_grep() end, desc = "Live Grep" },
    { "<leader>sb", function () require('telescope.builtin').current_buffer_fuzzy_find() end, desc = "Buffer" },
    { "<leader>sd", function () require('telescope.builtin').diagnostics({ bufnr=0 }) end, desc = "Document Diagnostics" },
    { "<leader>sD", function () require('telescope.builtin').diagnostics() end, desc = "Workspace Diagnostics" },
    { '<leader>s"', function () require('telescope.builtin').registers() end, desc = "Registers" },
    { '<leader>ss', function () require('telescope.builtin').lsp_document_symbols() end, desc = "Search Symbols" },
  },
}
