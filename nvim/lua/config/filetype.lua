local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/filetype.fnl"
local _2amodule_name_2a = "config.filetype"
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
local nvim, util = autoload("aniseed.nvim"), autoload("config.util")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["util"] = util
local function _1_()
  vim.opt_local.commentstring = ";; %s"
  return nil
end
vim.api.nvim_create_autocmd("FileType", {group = vim.api.nvim_create_augroup("commentary_config", {clear = true}), pattern = {"lisp", "clojure", "racket", "fennel"}, callback = _1_})
nvim.ex.autocmd("BufNewFile,BufRead", ".edn,.clj,.cljstyle", "set filetype=clojure")
local function _2_()
  return (require("go.format")).goimport()
end
vim.api.nvim_create_autocmd("BufWritePre", {pattern = "*.go", callback = _2_, group = vim.api.nvim_create_augroup("GoFormat", {})})
return _2amodule_2a