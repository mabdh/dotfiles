local coreutils = require "core.utils"

local plugins = {
  -- Plugin manager
  ["wbthomason/packer.nvim"] = {},
  -- Optimiser
  ["lewis6991/impatient.nvim"] = {},

  -- Lua functions
  ["nvim-lua/plenary.nvim"] = { module = "plenary" },

  -- Theme
  ["EdenEast/nightfox.nvim"] = {
    config = function()
      vim.cmd "colorscheme nightfox"
    end,
  },

  -- Popup API
  ["nvim-lua/popup.nvim"] = {},

  -- Indent detection
  ["Darazaki/indent-o-matic"] = {
    event = "BufReadPost",
    config = function()
      require "configs.indent-o-matic"
    end,
  },

  -- Notification Enhancer
  ["rcarriga/nvim-notify"] = {
    event = "VimEnter",
    config = function()
      require "configs.notify"
    end,
  },

  -- Neovim UI Enhancer
  ["stevearc/dressing.nvim"] = {
    -- event = "VimEnter",
    config = function()
      require "configs.dressing"
    end,
  },

  -- Cursorhold fix
  ["antoinemadec/FixCursorHold.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  },

  -- Smarter Splits
  ["mrjones2014/smart-splits.nvim"] = {
    module = "smart-splits",
    config = function()
      require "configs.smart-splits"
    end,
  },

  -- Icons
  ["kyazdani42/nvim-web-devicons"] = {
    event = "VimEnter",
    config = function()
      require "configs.icons"
    end,
  },

  -- LSP Icons
  ["onsails/lspkind.nvim"] = {
    module = "lspkind",
    config = function()
      require "configs.lspkind"
    end,
  },

  -- LSP Lua helper
  ["max397574/lua-dev.nvim"] = {
    module = "lua-dev",
  },

  -- Bufferline
  ["akinsho/bufferline.nvim"] = {
    after = "nvim-web-devicons",
    config = function()
      require "configs.bufferline"
    end,
  },

  -- Better buffer closing
  ["famiu/bufdelete.nvim"] = { cmd = { "Bdelete", "Bwipeout" } },

  ["s1n7ax/nvim-window-picker"] = {
    tag = "v1.*",
    module = "window-picker",
    config = function()
      require "configs.window-picker"
    end,
  },

  -- File explorer
  ["kyazdani42/nvim-tree.lua"] = {
    config = function()
      require "configs.nvimtree"
    end,
  },
  ["ahmedkhalf/project.nvim"] = {
    config = function()
      require("project_nvim").setup()
    end,
  },
  -- Statusline
  -- ["feline-nvim/feline.nvim"] = {
  --   after = "nvim-web-devicons",
  --   config = function() require "configs.feline" end,
  -- },
  ["nvim-lualine/lualine.nvim"] = {
    config = function()
      require "configs.lualine"
    end,
  },

  -- Parenthesis highlighting
  ["p00f/nvim-ts-rainbow"] = { after = "nvim-treesitter" },

  -- Autoclose tags
  ["windwp/nvim-ts-autotag"] = { after = "nvim-treesitter" },

  -- Context based commenting
  ["JoosepAlviste/nvim-ts-context-commentstring"] = { after = "nvim-treesitter" },

  -- Syntax highlighting
  ["nvim-treesitter/nvim-treesitter"] = {
    run = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function()
      require "configs.treesitter"
    end,
  },
  -- Completion engine
  -- Snippet collection
  ["rafamadriz/friendly-snippets"] = { opt = true },

  -- Snippet engine
  ["L3MON4D3/LuaSnip"] = {
    module = "luasnip",
    wants = "friendly-snippets",
    config = function()
      require "configs.luasnip"
    end,
  },

  -- Completion engine
  ["hrsh7th/cmp-nvim-lsp"] = {},
  ["saadparwaiz1/cmp_luasnip"] = {},
  ["hrsh7th/cmp-buffer"] = {},
  ["hrsh7th/cmp-path"] = {},
  ["hrsh7th/nvim-cmp"] = {
    event = "InsertEnter",
    config = function()
      require "configs.cmp"
    end,
  },


  -- -- Package Manager
  -- ["williamboman/mason.nvim"] = {
  --   config = function()
  --     require "configs.mason"
  --   end,
  -- },
  --
  -- -- LSP manager
  -- ["williamboman/mason-lspconfig.nvim"] = {
  --   after = { "mason.nvim", "nvim-lspconfig" },
  --   config = function()
  --     require("mason-lspconfig").setup()
  --   end
  -- },
  --
  -- Built-in LSP
  ["williamboman/mason.nvim"] = {},
  ["williamboman/mason-lspconfig.nvim"] = {},
  ["neovim/nvim-lspconfig"] = {
    after = "cmp-nvim-lsp",
    config = function()
      require "configs.lsp"
    end,
  },

  -- LSP symbols
  ["stevearc/aerial.nvim"] = {
    -- module = "aerial",
    -- cmd = { "AerialToggle", "AerialOpen", "AerialInfo" },
    config = function()
      require "configs.aerial"
    end,
  },

  -- Formatting and linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "configs.null-ls"
    end,
  },

  -- Fuzzy finder
  ["nvim-telescope/telescope.nvim"] = {
    cmd = "Telescope",
    module = "telescope",
    config = function()
      require "configs.telescope"
    end,
  },

  -- Git integration
  ["lewis6991/gitsigns.nvim"] = {
    event = "BufEnter",
    config = function()
      require "configs.gitsigns"
    end,
  },

  -- -- Start screen
  -- ["goolord/alpha-nvim"] = {
  --   cmd = "Alpha",
  --   module = "alpha",
  --   config = function() require "configs.alpha" end,
  -- },

  -- Color highlighting
  ["NvChad/nvim-colorizer.lua"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "configs.colorizer"
    end,
  },

  -- -- Autopairs
  -- ["windwp/nvim-autopairs"] = {
  --   event = "InsertEnter",
  --   config = function() require "configs.autopairs" end,
  -- },

  -- Terminal
  ["akinsho/toggleterm.nvim"] = {
    cmd = "ToggleTerm",
    module = { "toggleterm", "toggleterm.terminal" },
    config = function()
      require "configs.toggleterm"
    end,
  },

  -- Commenting
  ["numToStr/Comment.nvim"] = {
    module = { "Comment", "Comment.api" },
    keys = { "gc", "gb", "g<", "g>" },
    config = function()
      require "configs.Comment"
    end,
  },

  -- Indentation
  ["lukas-reineke/indent-blankline.nvim"] = {
    event = "BufRead",
    config = function()
      require "configs.indent-line"
    end,
  },

  -- Keymaps popup
  ["folke/which-key.nvim"] = {
    module = "which-key",
    config = function()
      require "configs.which-key"
    end,
  },

  -- Smooth scrolling
  ["declancm/cinnamon.nvim"] = {
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "configs.cinnamon"
    end,
  },

  -- Smooth escaping
  ["max397574/better-escape.nvim"] = {
    event = "InsertCharPre",
    config = function()
      require "configs.better_escape"
    end,
  },

  -- Get extra JSON schemas
  ["b0o/SchemaStore.nvim"] = { module = "schemastore" },

  -- -- Session manager
  -- ["Shatur/neovim-session-manager"] = {
  --   module = "session_manager",
  --   cmd = "SessionManager",
  --   event = "BufWritePost",
  --   config = function() require "configs.session_manager" end,
  -- },
  ["mfussenegger/nvim-dap"] = {},
  ["rcarriga/nvim-dap-ui"] = {},
  ["windwp/nvim-spectre"] = {
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  ["ray-x/guihua.lua"] = {
    run = "cd lua/fzy && make",
  },
  ["ray-x/navigator.lua"] = {
    config = function()
      require "configs.navigator"
    end,
  },
  -- Lang
  ["ray-x/go.nvim"] = {
    config = function()
      require("go").setup {
        run_in_floaterm = true,
        dap_debug = true,
        dap_debug_gui = true,
      }
    end,
  },
  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- Code
  ["f-person/git-blame.nvim"] = {
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  ["tpope/vim-fugitive"] = {
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit",
    },
    ft = { "fugitive" },
  },
  ["tpope/vim-surround"] = {},
  ["frabjous/knap"] = {
    config = function()
      require "configs.knap"
    end,
  },
  -- Log
  ["Tastyep/structlog.nvim"] = {},
}

-- local user_plugin_opts = coreutils.user_plugin_opts
local status_ok, packer = pcall(require, "packer")
if status_ok then
  packer.startup {
    function(use)
      for key, plugin in pairs(plugins) do
        if type(key) == "string" and not plugin[1] then
          plugin[1] = key
        end
        use(plugin)
      end
    end,
    config = {
      compile_path = coreutils.default_compile_path,
      display = {
        open_fn = function()
          return require("packer.util").float { border = "rounded" }
        end,
      },
      profile = {
        enable = true,
        threshold = 0.0001,
      },
      git = {
        clone_timeout = 300,
        subcommands = {
          update = "pull --rebase",
        },
      },
      auto_clean = true,
      compile_on_sync = true,
    },
  }
end
