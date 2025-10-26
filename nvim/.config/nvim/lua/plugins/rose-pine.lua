return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      variant = 'main',
      styles = {
        transparency = true,
        italic = false,
      },
      highlight_groups = {
        -- TroubleNormal = { bg = 'none' }
        -- uncomment if you want comments to be in italic
        -- Comment = { italic = true }
      },
      -- disable_background = true
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  }
}
