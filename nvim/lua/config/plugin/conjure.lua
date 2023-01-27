local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/conjure.fnl"
local _2amodule_name_2a = "config.plugin.conjure"
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
local nvim = autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["nvim"] = nvim
nvim.g["conjure#eval#result_register"] = "e"
nvim.g["conjure#mapping#eval_comment_current_form"] = "ece"
nvim.g["conjure#mapping#eval_root_form"] = "ef"
nvim.g["conjure#mapping#eval_comment_root_form"] = "ecf"
nvim.g["conjure#mapping#eval_file"] = "el"
nvim.g["conjure#log#hud#width"] = 1
nvim.g["conjure#log#hud#enabled"] = false
nvim.g["conjure#log#hud#anchor"] = "SE"
nvim.g["conjure#log#botright"] = true
nvim.g["conjure#extract#context_header_lines"] = 100
nvim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
nvim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
nvim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = nil
nvim.g["conjure#client#clojure#nrepl#eval#raw_out"] = true
nvim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
nvim.g["conjure#client#clojure#nrepl#test#runner"] = "kaocha"
nvim.g["conjure#client#clojure#nrepl#test#raw_out"] = true
return _2amodule_2a