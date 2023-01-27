local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/trouble.fnl"
local _2amodule_name_2a = "config.plugin.trouble"
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
local trouble = autoload("trouble")
do end (_2amodule_locals_2a)["trouble"] = trouble
trouble.setup({})
return _2amodule_2a