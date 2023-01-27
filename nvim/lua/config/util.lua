local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/util.fnl"
local _2amodule_name_2a = "config.util"
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
local core, nvim = autoload("aniseed.core"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["core"] = core
_2amodule_locals_2a["nvim"] = nvim
local function insert_keymap(from, to)
  local map_opts = {noremap = true}
  local to0 = (":" .. to .. "<cr>")
  return nvim.set_keymap("i", from, to0, map_opts)
end
_2amodule_2a["insert-keymap"] = insert_keymap
local function nnoremap(from, to, opts)
  local map_opts = {noremap = true}
  local to0 = (":" .. to .. "<cr>")
  if core.get(opts, "local?") then
    return nvim.buf_set_keymap(0, "n", from, to0, map_opts)
  else
    return nvim.set_keymap("n", from, to0, map_opts)
  end
end
_2amodule_2a["nnoremap"] = nnoremap
local function lnnoremap(from, to)
  return nnoremap(("<leader>" .. from), to)
end
_2amodule_2a["lnnoremap"] = lnnoremap
local function expand(path)
  return nvim.fn.expand(path)
end
_2amodule_2a["expand"] = expand
local function glob(path)
  return nvim.fn.glob(path, true, true, true)
end
_2amodule_2a["glob"] = glob
local function exists_3f(path)
  return (nvim.fn.filereadable(path) == 1)
end
_2amodule_2a["exists?"] = exists_3f
local function lua_file(path)
  return nvim.ex.luafile(path)
end
_2amodule_2a["lua-file"] = lua_file
local config_path = nvim.fn.stdpath("config")
do end (_2amodule_2a)["config-path"] = config_path
local function set_global_option(key, value)
  return core.assoc(nvim.o, key, value)
end
_2amodule_2a["set-global-option"] = set_global_option
local function set_global_variable(key, value)
  return core.assoc(nvim.g, key, value)
end
_2amodule_2a["set-global-variable"] = set_global_variable
return _2amodule_2a