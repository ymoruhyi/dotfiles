return {
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        {"g", name = "+goto" },
        {"]", name = "+next" },
        {"[", name = "+prev" },
        {"<leader>c", desc = "+code" },
        {"<leader>f", desc = "+file/find" },
        {"<leader>p", desc = "+project" },
        {"<leader>h", desc = "+harpoon/hunk" },
        {"<leader>s", desc = "+search" },
        {"<leader>x", desc = "+diagnostics/quickfix" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.add(opts.defaults)
    end,
  }
}
