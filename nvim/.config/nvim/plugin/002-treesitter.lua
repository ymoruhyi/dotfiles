vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
})

local parsers = { "go", "cpp" }
local isnt_installed = function(lang)
	return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0
end

local to_install = vim.tbl_filter(isnt_installed, parsers)
if #to_install > 0 then
	require("nvim-treesitter").install(to_install)
end

-- Enable tree-sitter after opening a file for a target language
local filetypes = {}
for _, lang in ipairs(parsers) do
	for _, ft in ipairs(vim.treesitter.language.get_filetypes(lang)) do
		table.insert(filetypes, ft)
	end
end

local ts_start = function(ev)
	vim.treesitter.start(ev.buf)
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = filetypes,
	callback = ts_start,
	desc = "Start tree-sitter",
})
