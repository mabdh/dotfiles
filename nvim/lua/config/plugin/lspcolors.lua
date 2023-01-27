local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/lspcolors.fnl"
local _2amodule_name_2a = "config.plugin.lspcolors"
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
local lspcolors = autoload("lsp-colors")
do end (_2amodule_locals_2a)["lspcolors"] = lspcolors
lspcolors.setup({})
return _2amodule_2a