local M = {}

function M.setup()
  local status_ok, null_ls = pcall(require, "null-ls")
  if not status_ok then
    -- Log:error "Missing null-ls dependency"
    return
  end

  local lsp_common = require("configs.lsp.server_settings.common")
  local default_opts = {
     on_attach = lsp_common.on_attach,
    on_exit = lsp_common.on_exit,
    capabilities = lsp_common.capabilities(),
  }
  null_ls.setup(default_opts)

  local formatters = require("configs.null-ls.formatters")
formatters.setup {
  { command = "black",
    filetypes = {"python"},
},
  {
    command = "prettier",
    filetypes = { "typescript", "typescriptreact" },
  },
  {
    command = "stylua",
    filetypes = {"lua"},
  }
}

  local linters = require("configs.null-ls.linters")
linters.setup {
  {
    command = "eslint_d",
    filetypes = { "javascript", "javascriptreact" },
  },
}

--   local code_actions = require("configs.null-ls.code_actions")
-- code_actions.setup {
-- }
end

return M
