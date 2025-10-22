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
    variant = "dawn", -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    lazy = false,
    opts = {
      variant = 'main',
      styles = {
        transparency = true,
        italic = false,
      },
      highlight_groups = {
        TroubleNormal = { bg = 'none' }
        -- uncomment if you want comments to be in italic
        -- Comment = { italic = true }
      },
      -- disable_background = true
    },
    config = function (_, opts)
      require('rose-pine').setup(opts)
      vim.cmd.colorscheme 'rose-pine'
    end
  }
}
