return {
  {
    "rcarriga/nvim-dap-ui",
  },
  {
    "kevinhwang91/nvim-bqf", ft = "qf"
  },
  -- {
  --   "glepnir/lspsaga.nvim",
  --   branch = "main",
  --   config = function()
  --     local saga = require("lspsaga")

  --     saga.init_lsp_saga({
  --       -- your configuration
  --     })
  --   end,
  -- },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "nvim-telescope/telescope-project.nvim",
    event = "BufWinEnter",
    setup = function()
      vim.cmd [[packadd telescope.nvim]]
    end,
  },
  {
    "ray-x/navigator.lua",
    config = function()
      require("user.plugins.configs.navigator")
    end,
  }
}
