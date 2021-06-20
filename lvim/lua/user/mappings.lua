local M = {}

M.setup = function()
  lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

  -- lvim.keys.normal_mode = {
  --   ["<A-i>"] = {
  --     function()
  --       require("nvterm.terminal").toggle "float"
  --     end,
  --   },

  --   ["<A-h>"] = {
  --     function()
  --       require("nvterm.terminal").toggle "horizontal"
  --     end,
  --   },

  --   ["<A-v>"] = {
  --     function()
  --       require("nvterm.terminal").toggle "vertical"
  --     end,
  --   },
  -- }

  -- unmap a default keymapping
  -- vim.keymap.del("n", "<C-Up>")
  -- override a default keymapping
  -- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

  -- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
  -- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
  -- local _, actions = pcall(require, "telescope.actions")
  -- lvim.builtin.telescope.defaults.mappings = {
  --   -- for input mode
  --   i = {
  --     ["<C-j>"] = actions.move_selection_next,
  --     ["<C-k>"] = actions.move_selection_previous,
  --     ["<C-n>"] = actions.cycle_history_next,
  --     ["<C-p>"] = actions.cycle_history_prev,
  --   },
  --   -- for normal mode
  --   n = {
  --     ["<C-j>"] = actions.move_selection_next,
  --     ["<C-k>"] = actions.move_selection_previous,
  --   },
  -- }

  -- Use which-key to add extra bindings with the leader-key prefix
  lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
  lvim.builtin.which_key.mappings["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
  }

  -- lvim.builtin.which_key.mappings["c"] = {
  --   name = "+Code",
  --   a = {
  --     function()
  --       vim.lsp.buf.code_action()
  --     end, "   lsp code_action"
  --   },
  -- }

  lvim.builtin.which_key.mappings["x"] = {
    function()
      require("user.utils").close_buffer()
    end, "   close buffer"
  }

  lvim.builtin.which_key.mappings["'"] = {
    name = "+Terminal",
    o = { "<cmd>ToggleTerm<cr>", "Open Terminal" },
  }
end

return M
