local coreutils = require "core.utils"

local paths = {
  coreutils.join_paths(vim.call("stdpath", "data"), "site", "pack", "packer", "start", "friendly-snippets"),
}
local user_snippets = coreutils.join_paths(vim.call("stdpath", "config"), "snippets")
if coreutils.is_directory(user_snippets) then
  paths[#paths + 1] = user_snippets
end
require("luasnip.loaders.from_lua").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load {
  paths = paths,
}
require("luasnip.loaders.from_snipmate").lazy_load()
