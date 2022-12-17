lvim.plugins = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    'ray-x/navigator.lua',
    requires = {
      { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
      { 'neovim/nvim-lspconfig' },
    },
  },
  { "ray-x/go.nvim",
    requires = {
      "folke/trouble.nvim",
    },
    config = function()
      require("plugins/go")
      -- require('go').setup({
      --   goimport = 'goimports', -- goimport command
      --   gofmt = 'gofumpt', --gofmt cmd,
      --   fillstruct = 'gopls',
      --   max_line_len = 120, -- max line length in goline format
      --   tag_transform = false, -- tag_transfer  check gomodifytags for details
      --   verbose = true, -- output loginf in messages
      --   log_path = vim.fn.expand("$HOME") .. "/.config/lvim/log.log",
      --   lsp_cfg = true, -- true: apply go.nvim non-default gopls setup
      --   lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
      --   lsp_on_attach = true, -- if a on_attach function provided:  attach on_attach function to gopls
      --   -- true: will use go.nvim on_attach if true
      --   -- nil/false do nothing

      --   lsp_codelens = true,
      --   -- gopls_remote_auto = true, -- set to false is you do not want to pass -remote=auto to gopls(enable share)
      --   -- gopls_cmd = nil,
      --   -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile", "/var/log/gopls.log" }
      --   lsp_diag_hdlr = true, -- hook lsp diag handler
      --   dap_debug = true, -- set to true to enable dap
      --   dap_debug_keymap = true, -- set keymaps for debugger
      --   dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
      --   dap_debug_vt = true, -- set to true to enable dap virtual text
      --   trouble = true,
      -- })
    end
  },
  { "leoluz/nvim-dap-go" },
  { "theHamsta/nvim-dap-virtual-text" },
  { "nvim-telescope/telescope-dap.nvim" },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "lsp_signature".setup()
    end
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end
  },
  {
    "frabjous/knap"
  },
  {
    "stevearc/dressing.nvim"
  },
  {
    "hashivim/vim-terraform"
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command("augroup user_plugin_cursorword")
      vim.api.nvim_command("autocmd!")
      vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
      vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
      vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
      vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
      vim.api.nvim_command("augroup END")
    end
  },
  {
    "tpope/vim-surround",
    -- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
    -- setup = function()
    --  vim.o.timeoutlen = 500
    -- end
  },
  {
    "p00f/nvim-ts-rainbow",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "kevinhwang91/nvim-bqf",
    event = { "BufRead", "BufNew" },
    config = function()
      require("bqf").setup({
        auto_enable = true,
        preview = {
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          vsplit = "",
          ptogglemode = "z,",
          stoggleup = "",
        },
        filter = {
          fzf = {
            action_for = { ["ctrl-s"] = "split" },
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      })
    end,
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120; -- Width of the floating window
        height = 25; -- Height of the floating window
        default_mappings = false; -- Bind default mappings
        debug = false; -- Print debug information
        opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }
    end
  },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
}
