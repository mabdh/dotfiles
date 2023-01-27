local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/gitsigns.fnl"
local _2amodule_name_2a = "config.plugin.gitsigns"
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
local gitsigns = autoload("gitsigns")
do end (_2amodule_locals_2a)["gitsigns"] = gitsigns
gitsigns.setup({signs = {add = {hl = "GitSignsAdd", text = "\226\148\130", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn"}, change = {hl = "GitSignsChange", ftext = "\226\148\130", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"}, delete = {hl = "GitSignsDelete", ftext = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"}, topdelete = {hl = "GitSignsDelete", ftext = "\226\128\190", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn"}, changedelete = {hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn"}}, sign_priority = 6, numhl = true, watch_gitdir = {interval = 1000, follow_files = true}, attach_to_untracked = true, current_line_blame_opts = {virt_text = true, virt_text_pos = "eol", delay = 1000, ignore_whitespace = false}, update_debounce = 100, status_formatter = nil, max_file_length = 40000, preview_config = {border = "single", style = "minimal", relative = "cursor", row = 0, col = 1}, yadm = {enable = false}, linehl = false, current_line_blame = false, signcolumn = false, word_diff = false})
return _2amodule_2a