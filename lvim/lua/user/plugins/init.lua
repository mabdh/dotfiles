-- local config = require "user.plugins.configs"
local M = {}

M.setup = function()
  local plugins = {}

  local plugin_type_files = {
    "ui",
    "editor",
    "ide",
    "lang",
  }

  for _, f in ipairs(plugin_type_files) do
    local plugin_file = "user.plugins." .. f
    for _, p in ipairs(require(plugin_file)) do
      table.insert(plugins, p)
    end
  end


  lvim.plugins = plugins
end

M.config = function()
  require("user.plugins.configs.colorschemes")
end

return M
