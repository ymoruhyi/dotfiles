return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPost" },
  dependencies = { "mason.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local nls = require("null-ls").builtins

    null_ls.setup({
      sources = {
        nls.code_actions.gomodifytags,
        nls.code_actions.impl,
        nls.formatting.goimports_reviser,
        nls.formatting.gofumpt,
        nls.formatting.golines,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
