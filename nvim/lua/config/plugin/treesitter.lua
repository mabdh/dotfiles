local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/treesitter.fnl"
local _2amodule_name_2a = "config.plugin.treesitter"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local treesitter = autoload("nvim-treesitter.configs")
do end (_2amodule_locals_2a)["treesitter"] = treesitter
treesitter.setup({ensure_installed = {"clojure", "fennel", "markdown", "org"}, sync_install = true, highlight = {enable = true}, indent = {enable = true}})
return _2amodule_2a