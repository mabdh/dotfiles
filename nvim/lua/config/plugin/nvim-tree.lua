local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/nvim-tree.fnl"
local _2amodule_name_2a = "config.plugin.nvim-tree"
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
local tree = autoload("nvim-tree")
do end (_2amodule_locals_2a)["tree"] = tree
tree.setup({sort_by = "case_sensitive", view = {adaptive_size = true, mappings = {list = {{key = "u", action = "dir_up"}}}}, renderer = {group_empty = true}, filters = {dotfiles = false}})
return _2amodule_2a