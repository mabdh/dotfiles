local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/todocomments.fnl"
local _2amodule_name_2a = "config.plugin.todocomments"
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
local todos = autoload("todo-comments")
do end (_2amodule_locals_2a)["todos"] = todos
todos.setup({signs = true, sign_priority = 5, comments_only = true, keywords = {TODO = {icon = "\239\152\180"}, DONE = {icon = "\239\152\178"}, WARN = {icon = "\239\137\152", alt = {"WARNING", "XXX", "DRAGONS"}}}})
return _2amodule_2a