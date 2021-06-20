local M = {}
local uv = vim.loop

local tbl_insert = table.insert
local map = vim.keymap.set

local Log = require "core.log"

--- table of user created terminals
M.user_terminals = {}
--- regex used for matching a valid URL/URI string
M.url_matcher =
"\\v\\c%(%(h?ttps?|ftp|file|ssh|git)://|[a-z]+[@][a-z]+[.][a-z]+:)%([&:#*@~%_\\-=?!+;/0-9a-z]+%(%([.;/?]|[.][.]+)[&:#*@~%_\\-=?!+/0-9a-z]+|:\\d+|,%(%(%(h?ttps?|ftp|file|ssh|git)://|[a-z]+[@][a-z]+[.][a-z]+:)@![0-9a-z]+))*|\\([&:#*@~%_\\-=?!+;/.0-9a-z]*\\)|\\[[&:#*@~%_\\-=?!+;/.0-9a-z]*\\]|\\{%([&:#*@~%_\\-=?!+;/.0-9a-z]*|\\{[&:#*@~%_\\-=?!+;/.0-9a-z]*})\\})+"

local path_sep = uv.os_uname().version:match "Windows" and "\\" or "/"
local function join_paths(...)
  local result = table.concat({ ... }, path_sep)
  return result
end

M.join_paths = join_paths

--- Set vim options with a nested table like API with the format vim.<first_key>.<second_key>.<value>
-- @param options the nested table of vim options
function M.set_vim_opts(options)
  for scope, table in pairs(options) do
    for setting, value in pairs(table) do
      vim[scope][setting] = value
    end
  end
end

--- Open a URL under the cursor with the current operating system
function M.url_opener()
  -- if mac use the open command
  if vim.fn.has "mac" == 1 then
    vim.fn.jobstart({ "open", vim.fn.expand "<cfile>" }, { detach = true })
    -- if unix then use xdg-open
  elseif vim.fn.has "unix" == 1 then
    vim.fn.jobstart({ "xdg-open", vim.fn.expand "<cfile>" }, { detach = true })
    -- if any other operating system notify the user that there is currently no support
  else
    M.notify("gx is not supported on this OS!", "error")
  end
end

-- --- Toggle a user terminal if it exists, if not then create a new one and save it
-- -- @param term_details a terminal command string or a table of options for Terminal:new() (Check toggleterm.nvim documentation for table format)
-- function M.toggle_term_cmd(term_details)
--   -- if a command string is provided, create a basic table for Terminal:new() options
--   if type(term_details) == "string" then
--     term_details = { cmd = term_details, hidden = true }
--   end
--   -- use the command as the key for the table
--   local term_key = term_details.cmd
--   -- set the count in the term details
--   if vim.v.count > 0 and term_details.count == nil then
--     term_details.count = vim.v.count
--     term_key = term_key .. vim.v.count
--   end
--   -- if terminal doesn't exist yet, create it
--   if M.user_terminals[term_key] == nil then
--     M.user_terminals[term_key] = require("toggleterm.terminal").Terminal:new(term_details)
--   end
--   -- toggle the terminal
--   M.user_terminals[term_key]:toggle()
-- end
--
--- Add a source to cmp
-- @param source the cmp source string or table to add (see cmp documentation for source table format)
function M.add_cmp_source(source)
  -- load cmp if available
  local cmp_avail, cmp = pcall(require, "cmp")
  if cmp_avail then
    -- get the current cmp config
    local config = cmp.get_config()
    -- add the source to the list of sources
    tbl_insert(config.sources, source)
    -- call the setup function again
    cmp.setup(config)
  end
end

--- Get the priority of a cmp source
-- @param  source the cmp source string or table (see cmp documentation for source table format)
-- @return a cmp source table with the priority set from the user configuration
function M.get_user_cmp_source(source)
  -- if the source is a string, convert it to a cmp source table
  source = type(source) == "string" and { name = source } or source
  -- get the priority of the source name from the user configuration
  local priority = M.user_plugin_opts("cmp.source_priority", {
    nvim_lsp = 1000,
    luasnip = 750,
    buffer = 500,
    path = 250,
  })[source.name]
  -- if a priority is found, set it in the source
  if priority then
    source.priority = priority
  end
  -- return the source table
  return source
end

--- add a source to cmp with the user configured priority
-- @param source a cmp source string or table (see cmp documentation for source table format)
function M.add_user_cmp_source(source)
  M.add_cmp_source(M.get_user_cmp_source(source))
end

--- register mappings table with which-key
-- @param mappings nested table of mappings where the first key is the mode, the second key is the prefix, and the value is the mapping table for which-key
-- @param opts table of which-key options when setting the mappings (see which-key documentation for possible values)
function M.which_key_register(mappings, opts)
  local status_ok, which_key = pcall(require, "which-key")
  if not status_ok then
    return
  end
  for mode, prefixes in pairs(mappings) do
    for prefix, mapping_table in pairs(prefixes) do
      which_key.register(
        mapping_table,
        vim.tbl_deep_extend("force", {
          mode = mode,
          prefix = prefix,
          buffer = nil,
          silent = true,
          noremap = true,
          nowait = true,
        }, opts or {})
      )
    end
  end
end

--- Get a list of registered null-ls providers for a given filetype
-- @param filetype the filetype to search null-ls for
-- @return a list of null-ls sources
function M.null_ls_providers(filetype)
  local registered = {}
  -- try to load null-ls
  local sources_avail, sources = pcall(require, "null-ls.sources")
  if sources_avail then
    -- get the available sources of a given filetype
    for _, source in ipairs(sources.get_available(filetype)) do
      -- get each source name
      for method in pairs(source.methods) do
        registered[method] = registered[method] or {}
        tbl_insert(registered[method], source.name)
      end
    end
  end
  -- return the found null-ls sources
  return registered
end

--- Get the null-ls sources for a given null-ls method
-- @param filetype the filetype to search null-ls for
-- @param method the null-ls method (check null-ls documentation for available methods)
-- @return the available sources for the given filetype and method
function M.null_ls_sources(filetype, method)
  local methods_avail, methods = pcall(require, "null-ls.methods")
  return methods_avail and M.null_ls_providers(filetype)[methods.internal[method]] or {}
end

--- Create a button entity to use with the alpha dashboard
-- @param sc the keybinding string to convert to a button
-- @param txt the explanation text of what the keybinding does
-- @return a button entity table for an alpha configuration
function M.alpha_button(sc, txt)
  -- replace <leader> in shortcut text with LDR for nicer printing
  local sc_ = sc:gsub("%s", ""):gsub("LDR", "<leader>")
  -- if the leader is set, replace the text with the actual leader key for nicer printing
  if vim.g.mapleader then
    sc = sc:gsub("LDR", vim.g.mapleader == " " and "SPC" or vim.g.mapleader)
  end
  -- return the button entity to display the correct text and send the correct keybinding on press
  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = {
      position = "center",
      text = txt,
      shortcut = sc,
      cursor = 5,
      width = 36,
      align_shortcut = "right",
      hl = "DashboardCenter",
      hl_shortcut = "DashboardShortcut",
    },
  }
end

--- Check if a plugin is defined in packer. Useful with lazy loading when a plugin is not necessarily loaded yet
-- @param plugin the plugin string to search for
-- @return boolean value if the plugin is available
function M.is_available(plugin)
  return packer_plugins ~= nil and packer_plugins[plugin] ~= nil
end

--- Table based API for setting keybindings
-- @param map_table A nested table where the first key is the vim mode, the second key is the key to map, and the value is the function to set the mapping to
-- @param base A base set of options to set on every keybinding
function M.set_mappings(map_table, base)
  -- iterate over the first keys for each mode
  for mode, maps in pairs(map_table) do
    -- iterate over each keybinding set in the current mode
    for keymap, options in pairs(maps) do
      -- build the options for the command accordingly
      if options then
        local cmd = options
        if type(options) == "table" then
          cmd = options[1]
          options[1] = nil
        else
          options = {}
        end
        -- extend the keybinding options with the base provided and set the mapping
        map(mode, keymap, cmd, vim.tbl_deep_extend("force", options, base or {}))
      end
    end
  end
end

--- Delete the syntax matching rules for URLs/URIs if set
function M.delete_url_match()
  for _, match in ipairs(vim.fn.getmatches()) do
    if match.group == "HighlightURL" then
      vim.fn.matchdelete(match.id)
    end
  end
end

--- Add syntax matching rules for highlighting URLs/URIs
function M.set_url_match()
  M.delete_url_match()
  if vim.g.highlighturl_enabled then
    vim.fn.matchadd("HighlightURL", M.url_matcher, 15)
  end
end

--- Toggle URL/URI syntax highlighting rules
function M.toggle_url_match()
  vim.g.highlighturl_enabled = not vim.g.highlighturl_enabled
  M.set_url_match()
end

--- Run a shell command and capture the output and if the command succeeded or failed
-- @param cmd the terminal command to execute
-- @param show_error boolean of whether or not to show an unsuccessful command as an error to the user
-- @return the result of a successfully executed command or nil
function M.cmd(cmd, show_error)
  local result = vim.fn.system(cmd)
  local success = vim.api.nvim_get_vvar "shell_error" == 0
  if not success and (show_error == nil and true or show_error) then
    Log:error("Error running command: " .. cmd .. "\nError message:\n" .. result)
  end
  return success and result or nil
end

--- Checks whether a given path exists and is a directory
--@param path (string) path to check
--@returns (bool)
function M.is_directory(path)
  local stat = uv.fs_stat(path)
  return stat and stat.type == "directory" or false
end

return M
