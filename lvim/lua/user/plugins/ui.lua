return {
  { "catppuccin/nvim",
    as = "catppuccin",
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "ray-x/guihua.lua",
    run = "cd lua/fzy && make",
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  }
}
