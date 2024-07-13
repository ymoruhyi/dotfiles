return {
  "jiaoshijie/undotree",
  config = true,
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader>ut", function () require('undotree').toggle() end, desc = "Undo Tree" },
  },
}
