local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/project.fnl"
local _2amodule_name_2a = "config.plugin.project"
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
local project = autoload("project_nvim")
do end (_2amodule_locals_2a)["project"] = project
project.setup({})
return _2amodule_2a