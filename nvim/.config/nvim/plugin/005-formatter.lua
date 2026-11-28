vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	default_format_opts = {
		-- Allow formatting from LSP server if no dedicated formatter is available
		timeout_ms = 3000,
		async = false, -- not recommended to change
		quiet = false, -- not recommended to change
		lsp_format = "fallback",
	},
	-- Map of filetype to formatters
	-- Make sure that necessary CLI tool is available
	formatters_by_ft = {
		lua = { "stylua" },
		sh = { "shfmt" },
		go = { "goimports", "gofumpt" },
	},
})
