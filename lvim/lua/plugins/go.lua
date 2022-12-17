require('go').setup({
  gofmt = 'gofumpt', --gofmt cmd,
  fillstruct = 'gopls',
  max_line_len = 120, -- max line length in goline format
  tag_transform = false, -- tag_transfer  check gomodifytags for details
  verbose = true, -- output loginf in messages
  log_path = vim.fn.expand("$HOME") .. "/.config/lvim/log.log",
  lsp_cfg = true, -- true: apply go.nvim non-default gopls setup
  lsp_gofumpt = true, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = true, -- if a on_attach function provided:  attach on_attach function to gopls
  -- true: will use go.nvim on_attach if true
  -- nil/false do nothing

  lsp_codelens = true,
  -- gopls_remote_auto = true, -- set to false is you do not want to pass -remote=auto to gopls(enable share)
  -- gopls_cmd = nil,
  -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile", "/var/log/gopls.log" }
  lsp_diag_hdlr = true, -- hook lsp diag handler
  dap_debug = true, -- set to true to enable dap
  dap_debug_keymap = true, -- set keymaps for debugger
  dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
  dap_debug_vt = true, -- set to true to enable dap virtual text
  trouble = true,
})


-- vim.cmd("autocmd FileType go nmap <Leader><Leader>l GoLint")
-- vim.cmd("autocmd FileType go nmap <Leader>gc :lua require('go.comment').gen()")

lvim.autocommands.custom_groups = {
  { "BufWritePre", "*.go", ":silent! lua require('go.format').goimport()" }
}

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require('go.format').goimport()
  end,
  group = format_sync_grp,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*.go",
  callback = function ()

    -- lvim.keys.normal_mode["<>"] = function() require("knap").process_once() end
    lvim.builtin.which_key.mappings["<Leader>"] = {
      name = "+Go",
      l = {"<cmd>GoLint<cr>", "GoLint"},
      c = function ()
        require("go.comment").gen()
      end,
      t = {
        f = {"<cmd>GoTestFunc<cr>", "Test function"}
      }
    }
  end
})
