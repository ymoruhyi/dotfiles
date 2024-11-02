return {
  {
    'folke/which-key.nvim',
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
      defaults = {
        mode = { "n", "v" },
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file/find" },
        ["<leader>p"] = { name = "+project" },
        ["<leader>h"] = { name = "+harpoon/hunk" },
        ["<leader>s"] = { name = "+search" },
        ["<leader>x"] = { name = "+diagnostics/quickfix" },
        ["<leader>w"] = { name = "+git-worktree" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  }
}
