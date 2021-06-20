local M = {}

local server_list = {
  "bashls",
  "clangd",
  "gopls",
  "html",
  "jsonls",
  -- "pyls",
  "pyright",
  "rust_analyzer",
  "sumneko_lua",
  "texlab",
  "tsserver",
}

M.setup = function()
  for _, srv in ipairs(server_list) do
    local opt = require("configs.lsp.server_settings." .. srv)
    require("lspconfig")[srv].setup(opt)
  end
end

M.get_custom_mason_lspconfig = function()
  local mason_conf = {}
  for _, srv in ipairs(server_list) do
    mason_conf[srv] = function()
      local opt = require("configs.lsp.server_settings." .. srv)
      require("lspconfig")[srv].setup(opt)
    end
  end
  return mason_conf
end

return M
