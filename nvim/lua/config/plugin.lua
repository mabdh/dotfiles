local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin.fnl"
local _2amodule_name_2a = "config.plugin"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local a, nvim, packer, util = autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("packer"), autoload("config.util")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["packer"] = packer
_2amodule_locals_2a["util"] = util
local function safe_require_plugin_config(name)
  local ok_3f, val_or_err = pcall(require, ("config.plugin." .. name))
  if not ok_3f then
    return print(("config error: " .. val_or_err))
  else
    return nil
  end
end
_2amodule_locals_2a["safe-require-plugin-config"] = safe_require_plugin_config
local function use(...)
  do
    local pkgs = {...}
    local function _2_(use0)
      for i = 1, a.count(pkgs), 2 do
        local name = pkgs[i]
        local opts = pkgs[(i + 1)]
        do
          local _3_ = opts.mod
          if (nil ~= _3_) then
            safe_require_plugin_config(_3_)
          else
          end
        end
        use0(a.assoc(opts, 1, name))
      end
      return nil
    end
    packer.startup(_2_)
  end
  return nil
end
_2amodule_locals_2a["use"] = use
use("wbthomason/packer.nvim", {}, "Olical/aniseed", {branch = "develop"}, "folke/which-key.nvim", {mod = "which-key"}, "kyazdani42/nvim-web-devicons", {mod = "web-devicons"}, "folke/trouble.nvim", {mod = "trouble"}, "folke/lsp-colors.nvim", {mod = "lspcolors"}, "folke/todo-comments.nvim", {requires = {"nvim-lua/plenary.nvim"}, mod = "todocomments"}, "folke/tokyonight.nvim", {}, "nvim-lualine/lualine.nvim", {mod = "lualine", requires = {"kyazdani42/nvim-web-devicons"}}, "akinsho/bufferline.nvim", {mod = "bufferline"}, "nacro90/numb.nvim", {mod = "numb"}, "kyazdani42/nvim-tree.lua", {requires = {"kyazdani42/nvim-web-devicons"}, tag = "nightly", mod = "nvim-tree"}, "nvim-telescope/telescope.nvim", {requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "rcarriga/nvim-notify", "nvim-telescope/telescope-file-browser.nvim", "LinArcX/telescope-env.nvim", "crispgm/telescope-heading.nvim", "LinArcX/telescope-ports.nvim", "nvim-telescope/telescope-packer.nvim", "nvim-telescope/telescope-project.nvim", "TC72/telescope-tele-tabby.nvim", "ANGkeith/telescope-terraform-doc.nvim", "nvim-telescope/telescope-ui-select.nvim"}, mod = "telescope"}, "nvim-orgmode/orgmode", {mod = "orgmode"}, "sindrets/diffview.nvim", {requires = {"nvim-lua/plenary.nvim"}, mod = "diffview"}, "lewis6991/gitsigns.nvim", {mod = "gitsigns"}, "TimUntersberger/neogit", {requires = {"nvim-lua/plenary.nvim", "sindrets/diffview.nvim"}, mod = "neogit"}, "tpope/vim-fugitive", {mod = "fugitive"}, "ixru/nvim-markdown", {}, "simrat39/symbols-outline.nvim", {mod = "symbols-outline"}, "clojure-vim/clojure.vim", {}, "clojure-vim/vim-jack-in", {}, "Olical/conjure", {mod = "conjure"}, "windwp/nvim-autopairs", {mod = "autopairs"}, "tpope/vim-abolish", {}, "terrortylor/nvim-comment", {mod = "nvim-comment"}, "tpope/vim-dadbod", {}, "tpope/vim-dispatch", {}, "AckslD/nvim-neoclip.lua", {requires = {"nvim-telescope/telescope.nvim"}, mod = "neoclip"}, "tpope/vim-repeat", {}, "tpope/vim-sexp-mappings-for-regular-people", {}, "tpope/vim-sleuth", {}, "kylechui/nvim-surround", {mod = "nvim-surround"}, "tpope/vim-unimpaired", {}, "terryma/vim-expand-region", {}, "junegunn/vim-easy-align", {mod = "easy-align"}, "mg979/vim-visual-multi", {}, "ekalinin/Dockerfile.vim", {}, "nvim-treesitter/nvim-treesitter", {run = ":TSUpdate", mod = "treesitter"}, "neovim/nvim-lspconfig", {mod = "lspconfig", requires = {"williamboman/mason-lspconfig.nvim"}}, "williamboman/mason.nvim", {mod = "mason"}, "mfussenegger/nvim-dap", {}, "rcarriga/nvim-dap-ui", {}, "theHamsta/nvim-dap-virtual-text", {}, "ray-x/go.nvim", {require = "ray-x/guihua.lua", mod = "rayxgo"}, "L3MON4D3/LuaSnip", {requires = {"saadparwaiz1/cmp_luasnip"}}, "hrsh7th/nvim-cmp", {requires = {"hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-nvim-lsp", "PaterJason/cmp-conjure"}, mod = "cmp"}, "jamessan/vim-gnupg", {}, "akinsho/toggleterm.nvim", {tag = "*", mod = "toggleterm"})
return _2amodule_2a