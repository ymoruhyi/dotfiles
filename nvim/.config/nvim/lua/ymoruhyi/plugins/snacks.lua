return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = { enabled = false },
  },
  config = function(_, opts)
    require("snacks").setup(opts)
  end,
  keys = {
    { "<leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit" },
  },
}
