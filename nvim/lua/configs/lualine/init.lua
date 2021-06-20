local components = require("configs.lualine.components")


require('lualine').setup {
  options = {
    theme = "auto", 
    icons_enabled = true,
    component_separators = '|',
    section_separators = { left = '', right = '' },
     disabled_filetypes = { "alpha", "NvimTree", "Outline" },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = {
      components.branch,
      components.filename,
    },
      lualine_c = {
      components.diff,
      components.python_env,
    },
    lualine_x = {
      components.diagnostics,
      components.treesitter,
      components.lsp,
      components.filetype,
    },
    lualine_y = { 
      'fileformat', 
      'progress',
        components.scrollbar,
},
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {"nvim-tree"},
}
