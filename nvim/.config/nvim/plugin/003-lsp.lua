vim.pack.add{{ src = 'https://github.com/neovim/nvim-lspconfig' }}

local servers = {'lua_ls', 'gopls', 'clangd'}
vim.lsp.enable(servers)
