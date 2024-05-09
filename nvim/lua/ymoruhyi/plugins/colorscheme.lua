return {
  -- {
  --     'navarasu/onedark.nvim',
  --     priority = 1000,
  --     opts = {
  --         style = 'darker',
  --         transparent = true,
  --         highlights = {
  --             NormalFloat = { bg = 'none' }
  --         }
  --     },
  --     config = function(_, opts)
  --         require('onedark').setup(opts)
  --         vim.cmd.colorscheme 'onedark'
  --     end
  -- },
  {
    'rose-pine/neovim',
    priority = 1000,
    name = 'rose-pine',
    opts = {
      variant = 'main',
      styles = {
        transparency = true
      },
      highlight_groups = {
        TroubleNormal = { bg = 'none' }
      },
      -- disable_background = true
    },
    config = function (_, opts)
      require('rose-pine').setup(opts)
      vim.cmd.colorscheme 'rose-pine'
    end
  }
}
