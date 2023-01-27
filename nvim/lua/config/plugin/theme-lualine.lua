local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/theme-lualine.fnl"
local _2amodule_name_2a = "config.plugin.theme-lualine"
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
local core, lsp, lualine = autoload("aniseed.core"), autoload("config.plugin.lspconfig"), autoload("lualine")
do end (_2amodule_locals_2a)["core"] = core
_2amodule_locals_2a["lsp"] = lsp
_2amodule_locals_2a["lualine"] = lualine
local function lsp_connection()
  if vim.tbl_isempty(vim.lsp.buf_get_clients(0)) then
    return "\239\128\144"
  else
    return "\239\128\142"
  end
end
_2amodule_2a["lsp_connection"] = lsp_connection
lualine.setup({options = {theme = "tokyonight", icons_enabled = true, section_separators = {"\238\130\176", "\238\130\178"}, component_separators = {"\238\130\177", "\238\130\179"}}, sections = {lualine_a = {{"mode", {upper = true}}}, lualine_b = {{"filename", {filestatus = true, path = 1}}}, lualine_c = {{"branch"}, {"diff", {diff_color = {added = "GitSignsAdd", modified = "GitSignsChange", removed = "GitSignsDelete"}, symbols = {added = "\239\145\151 ", modified = "\239\145\153 ", removed = "\239\145\152 "}}}}, lualine_x = {{"diagnostics", {sections = {"error", "warn", "info", "hint"}, diagnostics_color = {error = "LualineDiagnosticError", warn = "LualineDiagnosticWarn", info = "LualineDiagnosticInfo", hint = "LualineDiagnosticHint"}, symbols = {error = "\239\153\153 ", warn = "\239\148\169 ", info = "\239\145\137 ", hint = "\239\160\181 "}, sources = {"nvim_diagnostic"}}}, {lsp_connection}}, lualine_y = {"location"}, lualine_z = {"filetype"}}, inactive_sections = {lualine_a = {}, lualine_b = {}, lualine_c = {{"filename", {filestatus = true, path = 1}}}, lualine_x = {}, lualine_y = {}, lualine_z = {}}})
return _2amodule_2a