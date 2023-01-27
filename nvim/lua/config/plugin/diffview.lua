local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/diffview.fnl"
local _2amodule_name_2a = "config.plugin.diffview"
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
local diffview = autoload("diffview")
do end (_2amodule_locals_2a)["diffview"] = diffview
diffview.setup({enhanced_diff_hl = true, use_icons = true, icons = {folder_closed = "\238\151\191", folder_open = "\238\151\190"}, diff_binaries = false})
return _2amodule_2a