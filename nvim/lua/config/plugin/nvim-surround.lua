local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/nvim-surround.fnl"
local _2amodule_name_2a = "config.plugin.nvim-surround"
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
local surround = autoload("nvim-surround")
do end (_2amodule_locals_2a)["surround"] = surround
surround.setup({})
return _2amodule_2a