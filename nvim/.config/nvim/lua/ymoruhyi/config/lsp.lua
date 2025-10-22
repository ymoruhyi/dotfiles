local config = {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.HINT]  = "",
      [vim.diagnostic.severity.INFO]  = "",
    },
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style     = "minimal",
    border    = "rounded",
    source    = "always",
    header    = false,
    prefix    = "",
    suffix    = "",
  },
}
vim.diagnostic.config(config)

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = true,
  lineFoldingOnly = true,
}

capabilities.textDocument.semanticTokens.multilineTokenSupport = true
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- my old config
-- vim.diagnostic.config({
--   float = { border = 'single' },
--   underline = true,
--   update_in_insert = false,
--   virtual_text = {
--     spacing = 4,
--     source = "if_many",
--     prefix = "●",
--   },
--   severity_sort = true,
-- })

-- This function gets run when an LSP connects to a particular buffer
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

  -- See `:help K` for why this keymap
  nmap('K', function()
    vim.lsp.buf.hover({ border = "rounded" })
  end, 'Hover Documentation')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = on_attach,
  -- Add default handlers for consistent borders
  handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
  },
})

local servers = {
  gopls = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_markers = { "go.work", "go.mod", ".git", vim.uv.cwd() },
    settings = {
      gopls = {
        gofumpt = true,
        codelenses = {
          gc_details = false,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          test = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
        },
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        analyses = {
          nilness = true,
          unusedparams = true,
          unusedwrite = true,
          useany = true,
        },
        usePlaceholders = true,
        completeUnimported = true,
        staticcheck = true,
        directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
        semanticTokens = true,
      },
    },
  },
  biome = {},
  marksman = {},
  ts_ls = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
    root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git", vim.uv.cwd() },
    settings = {
      typescript = {
        format = {
          indentSize = vim.o.shiftwidth,
          convertTabsToSpaces = vim.o.expandtab,
          tabSize = vim.o.tabstop,
        },
      },
      javascript = {
        format = {
          indentSize = vim.o.shiftwidth,
          convertTabsToSpaces = vim.o.expandtab,
          tabSize = vim.o.tabstop,
        },
      },
      completions = {
        completeFunctionCalls = true,
      },
    },
    init_options = {
      hostInfo = "neovim",
    },
  },
  lua_ls = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc", "lua.mod", ".git", vim.uv.cwd() },
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  templ = {},
  html = {},
  htmx = {},
  tailwindcss = {},
}

for server_name, _ in pairs(servers) do
  vim.lsp.config[server_name] = servers[server_name]
  vim.lsp.enable(server_name)
end
