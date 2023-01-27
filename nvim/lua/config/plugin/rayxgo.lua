local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/rayxgo.fnl"
local _2amodule_name_2a = "config.plugin.rayxgo"
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
local cmplsp, go = autoload("cmp_nvim_lsp"), autoload("go")
do end (_2amodule_locals_2a)["cmplsp"] = cmplsp
_2amodule_locals_2a["go"] = go
go.setup({})
return _2amodule_2a