local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/nvim-comment.fnl"
local _2amodule_name_2a = "config.plugin.nvim-comment"
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
local nvim_comment = autoload("nvim_comment")
do end (_2amodule_locals_2a)["nvim-comment"] = nvim_comment
nvim_comment.setup({marker_padding = true, comment_empty = true, comment_empty_trim_whitespace = true, create_mappings = true, line_mapping = "gcc", operator_mapping = "gc", comment_chunk_text_object = "ic", hook = nil})
return _2amodule_2a