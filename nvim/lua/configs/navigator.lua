local navigator = require("navigator")

local config = {
  debug = true, -- log output, set to true and log path: ~/.cache/nvim/gh.log
  width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
  height = 0.3, -- max list window height, 0.3 by default
  preview_height = 0.35, -- max height of preview windows
  border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- border style, can be one of 'none', 'single', 'double',
  -- 'shadow', or a list of chars which defines the border
  -- put a on_attach of your own here, e.g
  -- function(client, bufnr)
  --   -- the on_attach will be called at end of navigator on_attach
  -- end,
  -- The attach code will apply to all LSP clients

  ts_fold = false, -- modified version of treesitter folding
  default_mapping = true, -- set to false if you will remap every key or if you using old version of nvim-
  keymaps = { { key = "gK", func = vim.lsp.declaration, desc = 'declaration' } }, -- a list of key maps
  -- this kepmap gK will override "gD" mapping function declaration()  in default kepmap
  -- please check mapping.lua for all keymaps
  treesitter_analysis = true, -- treesitter variable context
  treesitter_analysis_max_num = 100, -- how many items to run treesitter analysis
  -- this value prevent slow in large projects, e.g. found 100000 reference in a project
  transparency = 50, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it

  lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
  -- setup here. if it is nil, navigator will not init signature help
  signature_help_cfg = nil, -- if you would like to init ray-x/lsp_signature plugin in navigator, and pass in your own config to signature help
  icons = {
    -- Code action
    code_action_icon = "🏏", -- note: need terminal support, for those not support unicode, might crash
    -- Diagnostics
    diagnostic_head = '🐛',
    diagnostic_head_severity_1 = "🈲",
    -- refer to lua/navigator.lua for more icons setups
  },
  lsp_installer = false, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer
  mason = true, -- set to true if you would like use the lsp installed by williamboman/mason
  lsp = {
    enable = true, -- skip lsp setup if disabled make sure add require('navigator.lspclient.mapping').setup() in your own on_attach
    code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
    code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
    document_highlight = true, -- LSP reference highlight,
    -- it might already supported by you setup, e.g. LunarVim
    format_on_save = true, -- set to false to disable lsp code format on save (if you are using prettier/efm/formater etc)
    format_options = { async = false }, -- async: disable by default, the option used in vim.lsp.buf.format({async={true|false}, name = 'xxx'})
    disable_format_cap = {},
    -- If you using null-ls and want null-ls format your code
    -- you should disable all other lsp and allow only null-ls.
    disable_lsp = { 'pylsd', 'sqlls' }, -- a list of lsp server disabled for your project, e.g. denols and tsserver you may
    --want to enable one lsp server at a time
    -- to disable all default config and use your own lsp setup set
    -- disable_lsp = 'all' and you may need to hook mapping.setup() in your on_attach
    -- Default {}
    diagnostic = {
      underline = true,
      virtual_text = true, -- show virtual for diagnostic message
      update_in_insert = false, -- update diagnostic message in insert mode
    },

    diagnostic_scrollbar_sign = { '▃', '▆', '█' }, -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,
    -- for other style, set to {'╍', 'ﮆ'} or {'-', '='}
    diagnostic_virtual_text = true, -- show virtual for diagnostic message
    diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
    display_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you  want to ignore it
    -- servers = { 'cmake', 'ltex' }, -- by default empty, and it should load all LSP clients avalible based on filetype
    -- but if you whant navigator load  e.g. `cmake` and `ltex` for you , you
    -- can put them in the `servers` list and navigator will auto load them.
    -- you could still specify the custom config  like this
    -- cmake = {filetypes = {'cmake', 'makefile'}, single_file_support = false},
  }
}

navigator.setup(config)
