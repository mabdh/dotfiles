local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/neogit.fnl"
local _2amodule_name_2a = "config.plugin.neogit"
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
local neogit = autoload("neogit")
do end (_2amodule_locals_2a)["neogit"] = neogit
neogit.setup({disable_hint = true, disable_commit_confirmation = true, disable_insert_on_commit = true, auto_refresh = true, use_magit_keybindings = true, kind = "tab", commit_popup = {kind = "split"}, popup = {kind = "split"}, signs = {section = {"\239\152\181", "\239\152\182"}, item = {"\239\133\156", "\239\131\182"}, hunk = {"\239\174\181", "\239\174\180"}}, integrations = {diffview = true}, sections = {untracked = {folded = false}, unstaged = {folded = false}, staged = {folded = false}, stashes = {folded = true}, unpulled = {folded = true}, unmerged = {folded = false}, recent = {folded = true}}, mappings = {status = {}}, disable_context_highlighting = false, disable_signs = false, disable_builtin_notifications = false})
return _2amodule_2a