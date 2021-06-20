local M = {}

M.setup = function()
  -- store listed buffers in tab local var
  vim.t.bufs = vim.api.nvim_list_bufs()
  -- autocmds for tabufline -> store bufnrs on bufadd, bufenter events
  -- thx to https://github.com/ii14 & stores buffer per tab -> table
  vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter" }, {
    callback = function(args)
      if vim.t.bufs == nil then
        vim.t.bufs = { args.buf }
      else
        local bufs = vim.t.bufs

        -- check for duplicates
        if not vim.tbl_contains(bufs, args.buf) and (args.event == "BufAdd" or vim.bo[args.buf].buflisted) then
          table.insert(bufs, args.buf)
          vim.t.bufs = bufs
        end
      end
    end,
  })

  -- vim.api.nvim_create_autocmd("BufEnter", {
  --   pattern = { "*.json", "*.jsonc" },
  --   -- enable wrap mode for json files only
  --   command = "setlocal wrap",
  -- })
  -- vim.api.nvim_create_autocmd("FileType", {
  --   pattern = "zsh",
  --   callback = function()
  --     -- let treesitter use bash highlight for zsh files as well
  --     require("nvim-treesitter.highlight").attach(0, "bash")
  --   end,
  -- })
end

return M
