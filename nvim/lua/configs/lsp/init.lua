local fn = vim.fn
local api = vim.api
local Log = require "core.log"

for _, sign in ipairs {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
} do
  fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local float_config = {
  focusable = false,
  style = "minimal",
  border = "rounded",
  source = "always",
  header = "",
  prefix = "",
  format = function(d)
    local t = vim.deepcopy(d)
    local code = d.code or (d.user_data and d.user_data.lsp.code)
    if code then
      t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "")
    end
    return t.message
  end,
}

vim.diagnostic.config { -- your config
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
  float = true,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float_config)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float_config)
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  virtual_text = false,
  signs = true,
  update_in_insert = false,
})

require "configs.mason"

local mason_lspconfig = require "mason-lspconfig"
mason_lspconfig.setup {
  ensure_installed = {
    "eslint-lsp",
    "lua-language-server",
    "marksman",
    "terraform-ls",
    "tflint",
    "typescript-language-server",
    "yaml-language-server",
    "yamllint",
  },
}

require("configs.lsp.server_settings").setup()
-- local custom_mason_lspconfig = require("configs.lsp.server_settings").get_custom_mason_lspconfig()

-- local mason_handlers = {
--   function(server_name)
--     require("lspconfig")[server_name].setup {
--       -- on_attach = function(client, bufnr)
--       --   require("shared").on_attach(client, bufnr)
--       --   require("illuminate").on_attach(client)
--       -- end,
--     }
--   end,
-- }

-- for k, v in pairs(custom_mason_lspconfig) do
--   mason_handlers[k] = v
-- end
--
-- mason_lspconfig.setup_handlers(mason_handlers)

require("configs.null-ls").setup()

-- enable_format_on_save()
