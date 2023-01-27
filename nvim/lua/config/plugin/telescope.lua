local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/telescope.fnl"
local _2amodule_name_2a = "config.plugin.telescope"
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
local actions, nvim, telescope, themes = autoload("telescope.actions"), autoload("aniseed.nvim"), autoload("telescope"), autoload("telescope.themes")
do end (_2amodule_locals_2a)["actions"] = actions
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["telescope"] = telescope
_2amodule_locals_2a["themes"] = themes
telescope.setup({defaults = {file_ignore_patterns = {"node_modules"}}, extensions = {file_browser = {hidden = true}, env = {}, heading = {treesitter = true}, ["ui-select"] = {themes.get_dropdown({})}, tele_tabby = {use_highlighter = false}, packer = {}, project = {sync_with_nvim_tree = true}}, pickers = {find_files = {find_command = {"rg", "--files", "--iglob", "!.git"}}}})
telescope.load_extension("env")
telescope.load_extension("heading")
telescope.load_extension("file_browser")
telescope.load_extension("neoclip")
telescope.load_extension("packer")
telescope.load_extension("ports")
telescope.load_extension("project")
telescope.load_extension("tele_tabby")
telescope.load_extension("terraform_doc")
telescope.load_extension("ui-select")
return _2amodule_2a