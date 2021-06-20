local common_config = require "configs.lsp.server_settings.common"

return {
  on_attach = common_config.on_attach,
    on_exit = common_config.on_exit,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
    },
  },
  setup = {
    commands = {
      Format = {
        function() vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 }) end,
      },
    },
  },
}
