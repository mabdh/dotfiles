local common_config = require "configs.lsp.server_settings.common"

return {
  on_attach = common_config.on_attach,
    on_exit = common_config.on_exit,
  capabilities = common_config.capabilities(),
}
