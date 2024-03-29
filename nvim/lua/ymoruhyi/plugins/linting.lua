return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- Event to trigger linters
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
       -- Use the "*" filetype to run linters on all filetypes.
        -- ['*'] = { 'global linter' },
        -- Use the "_" filetype to run linters on filetypes that don't have other linters configured.
        -- ['_'] = { 'fallback linter' },
      },
    },
    config = function (_, opts)
      local lint = require('lint')

      lint.linters_by_ft = opts.linters_by_ft

      local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true });

      vim.api.nvim_create_autocmd(opts.events, {
        group = lint_augroup,
        callback = function ()
          lint.try_lint()
        end
      })
    end
  }
}
