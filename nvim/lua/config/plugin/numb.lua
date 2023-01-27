local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/numb.fnl"
local _2amodule_name_2a = "config.plugin.numb"
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
local numb = autoload("numb")
do end (_2amodule_locals_2a)["numb"] = numb
numb.setup({show_numbers = true, show_cursorline = true, number_only = true, centered_peeking = true})
return _2amodule_2a