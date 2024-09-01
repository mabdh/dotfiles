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
local function buf_kill(kill_command, bufnr)
  kill_command = (kill_command or "bd")
  if ((bufnr == 0) or (bufnr == nil)) then
    bufnr = vim.api.nvim_get_current_buf()
  else
  end
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local warning = nil
  if vim.bo[bufnr].modified then
    warning = string.format("No write since last change for (%s)", vim.fn.fnamemodify(bufname, ":t"))
  elseif (vim.api.nvim_buf_get_option(bufnr, "buftype") == "terminal") then
    warning = string.format("Terminal %s will be killed", bufname)
  else
  end
  if warning then
    local function _3_(choice)
      if ((choice ~= nil) and choice:match("ye?s?")) then
        return __fnl_global__buf_2dforce_2dkill(kill_command, bufnr)
      else
        return nil
      end
    end
    vim.ui.input({prompt = string.format("%s. Close it anyway? [y]es or [n]o (default: no): ", warning)}, _3_)
    return 
  else
  end
  local windows
  local function _6_(win)
    return (vim.api.nvim_win_get_buf(win) == bufnr)
  end
  windows = vim.tbl_filter(_6_, vim.api.nvim_list_wins())
  local buffers
  local function _7_(buf)
    return (vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted)
  end
  buffers = vim.tbl_filter(_7_, vim.api.nvim_list_bufs())
  if ((#buffers > 1) and (#windows > 0)) then
    for i, v in ipairs(buffers) do
      if (v == bufnr) then
        local prev_buf_idx = (((i == 1) and #buffers) or (i - 1))
        local prev_buffer = buffers[prev_buf_idx]
        for _, win in ipairs(windows) do
          vim.api.nvim_win_set_buf(win, prev_buffer)
        end
      else
      end
    end
  else
  end
  if (vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted) then
    return vim.cmd(string.format("%s %d", kill_command, bufnr))
  else
    return nil
  end
end
local function buf_force_kill(kill_command, bufnr)
  kill_command = (kill_command or "bd")
  if ((bufnr == 0) or (bufnr == nil)) then
    bufnr = vim.api.nvim_get_current_buf()
  else
  end
  local bufname = vim.api.nvim_buf_get_name(bufnr)
  local windows
  local function _12_(win)
    return (vim.api.nvim_win_get_buf(win) == bufnr)
  end
  windows = vim.tbl_filter(_12_, vim.api.nvim_list_wins())
  kill_command = (kill_command .. "!")
  local buffers
  local function _13_(buf)
    return (vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted)
  end
  buffers = vim.tbl_filter(_13_, vim.api.nvim_list_bufs())
  if ((#buffers > 1) and (#windows > 0)) then
    for i, v in ipairs(buffers) do
      if (v == bufnr) then
        local prev_buf_idx = (((i == 1) and #buffers) or (i - 1))
        local prev_buffer = buffers[prev_buf_idx]
        for _, win in ipairs(windows) do
          vim.api.nvim_win_set_buf(win, prev_buffer)
        end
      else
      end
    end
  else
  end
  if (vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted) then
    return vim.cmd(string.format("%s %d", kill_command, bufnr))
  else
    return nil
  end
end
local function _17_(bufnr)
  return buf_kill("bd", bufnr, false)
end
local function _18_(buf)
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
  local function _21_(b)
    return is_ft(b, "log")
  end
  logs = vim.tbl_filter(_21_, (buf_nums or {}))
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
bufferline.setup({options = {mode = "buffers", numbers = "none", close_command = _17_, right_mouse_command = "vert sbuffer %d", left_mouse_command = "buffer %d", middle_mouse_command = nil, indicator = {icon = icons.ui.BoldLineLeft, style = "icon"}, buffer_close_icon = icons.ui.Close, modified_icon = icons.ui.Circle, close_icon = icons.ui.BoldClose, left_trunc_marker = icons.ui.ArrowCircleLeft, right_trunc_marker = icons.ui.ArrowCircleRight, name_formatter = _18_, max_name_length = 18, max_prefix_length = 15, truncate_names = true, tab_size = 18, diagnostics = "nvim_lsp", diagnostics_indicator = diagnostics_indicator, custom_filter = custom_filter, offsets = {{filetype = "undotree", text = "Undotree", highlight = "PanelHeading", padding = 1}, {filetype = "NvimTree", text = "Explorer", highlight = "PanelHeading", padding = 1}, {filetype = "DiffviewFiles", text = "Diff View", highlight = "PanelHeading", padding = 1}, {filetype = "flutterToolsOutline", text = "Flutter Outline", highlight = "PanelHeading"}, {filetype = "lazy", text = "Lazy", highlight = "PanelHeading", padding = 1}}, color_icons = true, show_buffer_icons = true, show_buffer_close_icons = true, show_tab_indicators = true, persist_buffer_sort = true, separator_style = "thin", hover = {delay = 200, reveal = {"close"}, enabled = false}, sort_by = "id", enforce_regular_tabs = false, always_show_bufferline = false, diagnostics_update_in_insert = false, show_close_icon = false}, highlights = {background = {italic = true}, buffer_selected = {bold = true}}})
return _2amodule_2a