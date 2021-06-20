local common_config = require("configs.lsp.server_settings.common")

return {
    on_exit = common_config.on_exit,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        loadOutDirsFromCheck = true,
      },
      checkOnSave = {
        command = "clippy",
      },
      experimental = {
        procAttrMacros = true,
      },
    },
  },
}
