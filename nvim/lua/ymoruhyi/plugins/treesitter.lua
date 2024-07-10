return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
  event = "BufReadPost",
  lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
  keys = {
    { "<c-space>", desc = "Increment Selection" },
    { "<bs>", desc = "Decrement Selection", mode = "x" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-treesitter/nvim-treesitter-context",
      config = true,
      keys = {
        { "<leader>uc", ":TSContextToggle<CR>", desc = "Toggle TSContext" },
        {
          "[c",
          ":lua require('treesitter-context').go_to_context()<cr>",
          silent = true,
          desc = "Go to context",
        },
      },
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag",
  },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "bash",
      "c",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
    textobjects = {
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
-- return {
--     -- Highlight, edit, and navigate code
--     'nvim-treesitter/nvim-treesitter',
--     dependencies = {
--         'nvim-treesitter/nvim-treesitter-textobjects',
--     },
--     build = ':TSUpdate',
--     config = function()
--         ---@diagnostic disable-next-line: missing-fields
--         require('nvim-treesitter.configs').setup {
--             -- Add languages to be installed here that you want installed for treesitter
--             ensure_installed = { 'go', 'gowork', 'gomod', 'gosum', 'lua', 'python', 'tsx', 'javascript', 'typescript', 'vimdoc', 'vim', 'bash', 'yaml', 'json', 'markdown' },
--             auto_install = true,
--             highlight = { enable = true },
--             indent = { enable = true },
--             incremental_selection = {
--                 enable = true,
--                 keymaps = {
--                     init_selection = '<c-space>',
--                     node_incremental = '<c-space>',
--                     scope_incremental = '<c-s>',
--                     node_decremental = '<M-space>',
--                 },
--             },
--             textobjects = {
--                 select = {
--                     enable = true,
--                     lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
--                     keymaps = {
--                         -- You can use the capture groups defined in textobjects.scm
--                         ['aa'] = '@parameter.outer',
--                         ['ia'] = '@parameter.inner',
--                         ['af'] = '@function.outer',
--                         ['if'] = '@function.inner',
--                         ['ac'] = '@class.outer',
--                         ['ic'] = '@class.inner',
--                     },
--                 },
--                 move = {
--                     enable = true,
--                     set_jumps = true, -- whether to set jumps in the jumplist
--                     goto_next_start = {
--                         [']m'] = '@function.outer',
--                         [']]'] = '@class.outer',
--                     },
--                     goto_next_end = {
--                         [']M'] = '@function.outer',
--                         [']['] = '@class.outer',
--                     },
--                     goto_previous_start = {
--                         ['[m'] = '@function.outer',
--                         ['[['] = '@class.outer',
--                     },
--                     goto_previous_end = {
--                         ['[M'] = '@function.outer',
--                         ['[]'] = '@class.outer',
--                     },
--                 },
--                 swap = {
--                     enable = true,
--                     swap_next = {
--                         ['<leader>a'] = '@parameter.inner',
--                     },
--                     swap_previous = {
--                         ['<leader>A'] = '@parameter.inner',
--                     },
--                 },
--             },
--         }
--     end
-- }
