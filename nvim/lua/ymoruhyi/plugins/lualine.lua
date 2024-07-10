return {
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = true,
        component_separators = {
          right = '|',
        },
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1,
          },
        },
      },
    },
  },
}
