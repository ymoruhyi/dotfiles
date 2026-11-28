vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim", -- required
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-fzf-native.nvim", -- optional, faster sorting
})

local telescope = require("telescope")

telescope.setup({
	defaults = {
		prompt_prefix = "  ",
		selection_caret = "> ",
		sorting_strategy = "ascending",
		layout_config = { prompt_position = "top" },
		path_display = { "truncate" },
	},
	pickers = {
		find_files = { hidden = true }, -- include dotfiles
		buffers = { sort_mru = true, ignore_current_buffer = true },
	},
})

pcall(telescope.load_extension, "fzf") -- skipped quietly if the build failed

local builtin = require("telescope.builtin")
local map = function(lhs, rhs, desc)
	vim.keymap.set("n", lhs, rhs, { desc = desc })
end

-- main keymaps
map("<leader>ff", builtin.find_files, "Find files")
map("<leader>fg", builtin.live_grep, "Live grep")

-- optional, don't use often
map("<leader>fw", builtin.grep_string, "Grep word under cursor")
map("<leader>fb", builtin.buffers, "Buffers")
map("<leader>fh", builtin.help_tags, "Help tags")
map("<leader>fo", builtin.oldfiles, "Recent files")
map("<leader>fr", builtin.resume, "Resume last picker")
map("<leader>fm", function()
	builtin.man_pages({ sections = { "ALL" } })
end, "List manpage entries (ALL)")
map("<leader>fd", function()
	builtin.diagnostics({ bufnr = 0 })
end, "Buffer diagnostics")
map("<leader>fD", builtin.diagnostics, "All diagnostics")
map("<leader>fs", builtin.lsp_document_symbols, "Document symbols")
map("<leader>fc", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, "Neovim config")
