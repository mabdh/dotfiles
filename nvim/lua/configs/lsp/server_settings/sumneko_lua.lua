local common_config = require "configs.lsp.server_settings.common"

return {
  on_attach = common_config.on_attach,
  on_exit = common_config.on_exit,
  capabilities = common_config.capabilities(),
   settings = {
    Lua = {
       runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
     --    library = {
					-- vim.fn.stdpath("config") .. "/lua",
     --    },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}



-- local opts = {
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim", "lvim", "packer_plugins" },
--       },
--       workspace = {
--         library = {
--           [vim.fn.stdpath("config") .. "/lua"] = true,
--           [require("core.utils").join_paths(vim.call("stdpath", "data"), "lua")] = true,
--         },
--         maxPreload = 100000,
--         preloadFileSize = 10000,
--       },
--     },
--   },
-- }
--
-- local lua_dev_loaded, lua_dev = pcall(require, "lua-dev")
-- if not lua_dev_loaded then
--   return opts
-- end
--
-- local dev_opts = {
--   library = {
--     vimruntime = true, -- runtime path
--     types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
--     -- plugins = true, -- installed opt or start plugins in packpath
--     -- you can also specify the list of plugins to make available as a workspace library
--     plugins = { "plenary.nvim" },
--   },
--   lspconfig = opts,
-- }
--
-- return lua_dev.setup(dev_opts)
