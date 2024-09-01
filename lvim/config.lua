lvim.log.level = "warn"
lvim.format_on_save = false
lvim.colorscheme = "tokyonight"
lvim.builtin.theme.tokyonight.dim_inactive = false
lvim.builtin.theme.tokyonight.style = "storm"

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "project")
  -- any other extensions loading
end

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.terminal.open_mapping = "<c-t>"

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.actions.open_file.resize_window = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.nvimtree.auto_close = false

lvim.builtin.dap.active = true
lvim.builtin.lualine.active = true
lvim.builtin.terminal.active = true
lvim.builtin.bufferline.active = true

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "go",
  "gomod",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.treesitter.rainbow.enable = true


local modules = {
  "plugins",
  "lsp",
  "dapconfig",
  "autocmd",
  "keymappings",
}

for _, mod in ipairs(modules) do
  local ok, err = pcall(require, mod)
  if not ok then
    error(("Error loading %s...\n\n%s"):format(mod, err))
  end
end
