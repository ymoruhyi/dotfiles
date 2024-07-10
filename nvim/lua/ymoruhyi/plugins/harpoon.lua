return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require('harpoon')

    harpoon.setup()

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = 'Harpoon Add mark' })
    vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
    -- vim.keymap.set("n", "<space>-8", function() harpoon:list():select(3) end)
    -- vim.keymap.set("n", "<space>-9", function() harpoon:list():select(4) end)
  end,
}

