local M = {}

function M.enable_format_on_save()
  local opts = {
    ---@usage pattern string pattern used for the autocommand (Default: '*')
    pattern = "*",
    ---@usage timeout number timeout in ms for the format request (Default: 1000)
    timeout = 1000,
    ---@usage filter func to select client
    filter = require("configs.lsp.utils").format_filter,
  },
      vim.api.nvim_create_augroup("lsp_format_on_save", {})
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = "lsp_format_on_save",
    pattern = opts.pattern,
    callback = function()
      require("configs.lsp.utils").format { timeout_ms = opts.timeout, filter = opts.filter }
    end,
  })
  -- Log:debug "enabled format-on-save"
end

function M.disable_format_on_save()
  M.clear_augroup "lsp_format_on_save"
  -- Log:debug "disabled format-on-save"
end

function M.configure_format_on_save()
  M.enable_format_on_save()
end

return M
