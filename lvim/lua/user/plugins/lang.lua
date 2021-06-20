return {
  {
    "ray-x/go.nvim",
    config = function()
      require("go").setup({
        run_in_floaterm = true,
        dap_debug = true,
        dap_debug_gui = true,
      })
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
  {
    -- "lervag/vimtex",
  },
  {
    'f3fora/nvim-texlabconfig',
    config = function()
      require('texlabconfig').setup()
    end,
    ft = { 'tex', 'bib' }, -- for lazy loading
    run = 'go build'
    -- run = 'go build -o ~/.bin/' if e.g. ~/.bin/ is in $PATH
  }
}
