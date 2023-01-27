local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/bufferline.fnl"
local _2amodule_name_2a = "config.plugin.bufferline"
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
local bufferline, icons, nvim = autoload("bufferline"), autoload("config.icons"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["bufferline"] = bufferline
_2amodule_locals_2a["icons"] = icons
_2amodule_locals_2a["nvim"] = nvim
local function is_ft(b, ft)
  return (vim.bo[b].filetype == ft)
end
local function _1_(bufnr)
  return M.buf_kill("bd", bufnr, false)
end
local function _2_(buf)
  if (buf.name):match("%.md") then
    return vim.fn.fnamemodify(buf.name, ":t:r")
  else
    return nil
  end
end
local function diagnostics_indicator(num, _, diagnostics, _0)
  local result = {}
  local symbols = {error = icons.diagnostics.Error, warning = icons.diagnostics.Warning, info = icons.diagnostics.Information}
  for name, count in pairs(diagnostics) do
    if (symbols[name] and (count > 0)) then
      table.insert(result, (symbols[name] .. " " .. count))
    else
    end
  end
  result = table.concat(result, " ")
  return (((#result > 0) and result) or "")
end
local function custom_filter(buf, buf_nums)
  local logs
  local function _5_(b)
    return is_ft(b, "log")
  end
  logs = vim.tbl_filter(_5_, (buf_nums or {}))
  if vim.tbl_isempty(logs) then
    return true
  else
  end
  local tab_num = vim.fn.tabpagenr()
  local last_tab = vim.fn.tabpagenr("$")
  local is_log = is_ft(buf, "log")
  if (last_tab == 1) then
    return true
  else
  end
  return (((tab_num == last_tab) and is_log) or ((tab_num ~= last_tab) and not is_log))
end
bufferline.setup({options = {mode = "buffers", numbers = "none", close_command = _1_, right_mouse_command = "vert sbuffer %d", left_mouse_command = "buffer %d", middle_mouse_command = nil, indicator = {icon = icons.ui.BoldLineLeft, style = "icon"}, buffer_close_icon = icons.ui.Close, modified_icon = icons.ui.Circle, close_icon = icons.ui.BoldClose, left_trunc_marker = icons.ui.ArrowCircleLeft, right_trunc_marker = icons.ui.ArrowCircleRight, name_formatter = _2_, max_name_length = 18, max_prefix_length = 15, truncate_names = true, tab_size = 18, diagnostics = "nvim_lsp", diagnostics_indicator = diagnostics_indicator, custom_filter = custom_filter, offsets = {{filetype = "undotree", text = "Undotree", highlight = "PanelHeading", padding = 1}, {filetype = "NvimTree", text = "Explorer", highlight = "PanelHeading", padding = 1}, {filetype = "DiffviewFiles", text = "Diff View", highlight = "PanelHeading", padding = 1}, {filetype = "flutterToolsOutline", text = "Flutter Outline", highlight = "PanelHeading"}, {filetype = "lazy", text = "Lazy", highlight = "PanelHeading", padding = 1}}, color_icons = true, show_buffer_icons = true, show_buffer_close_icons = true, show_tab_indicators = true, persist_buffer_sort = true, separator_style = "thin", hover = {delay = 200, reveal = {"close"}, enabled = false}, sort_by = "id", show_close_icon = false, diagnostics_update_in_insert = false, enforce_regular_tabs = false, always_show_bufferline = false}, highlights = {background = {italic = true}, buffer_selected = {bold = true}}})
return _2amodule_2a