local _2afile_2a = "/Users/muhammad.abduh/.config/nvim/fnl/config/plugin/lspconfig.fnl"
local _2amodule_name_2a = "config.plugin.lspconfig"
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
local cmplsp, core, lsp, nvim = autoload("cmp_nvim_lsp"), autoload("aniseed.core"), autoload("lspconfig"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["cmplsp"] = cmplsp
_2amodule_locals_2a["core"] = core
_2amodule_locals_2a["lsp"] = lsp
_2amodule_locals_2a["nvim"] = nvim
local function define_signs(prefix)
  local error = (prefix .. "SignError")
  local warn = (prefix .. "SignWarn")
  local info = (prefix .. "SignInfo")
  local hint = (prefix .. "SignHint")
  vim.fn.sign_define(error, {text = "\239\129\151", texthl = error})
  vim.fn.sign_define(warn, {text = "\239\129\177", texthl = warn})
  vim.fn.sign_define(info, {text = "\239\129\154", texthl = info})
  return vim.fn.sign_define(hint, {text = "\239\129\153", texthl = hint})
end
_2amodule_2a["define-signs"] = define_signs
if (nvim.fn.has("nvim-0.6") == 1) then
  define_signs("Diagnostic")
else
  define_signs("LspDiagnostics")
end
require("lspconfig.configs")["fennel_language_server"] = {default_config = {cmd = {vim.fn.expand("$HOME/.cargo/bin/fennel-language-server")}, filetypes = {"fennel"}, single_file_support = true, root_dir = lsp.util.root_pattern("fnl"), settings = {fennel = {workspace = {library = vim.api.nvim_list_runtime_paths()}, diagnostics = {globals = {"vim"}}}}}}
do
  local handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, underline = true, virtual_text = false, update_in_insert = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
  local capabilities = cmplsp.default_capabilities()
  local on_attach
  local function _2_(client, bufnr)
    nvim.buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{async = true}<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<CR> ", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lw", ":lua require('telescope.builtin').lsp_workspace_diagnostics()<cr>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lr", ":lua require('telescope.builtin').lsp_references()<cr>", {noremap = true})
    return nvim.buf_set_keymap(bufnr, "n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>", {noremap = true})
  end
  on_attach = _2_
  lsp.clojure_lsp.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities})
  lsp.fennel_language_server.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities})
  lsp.gopls.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities})
  lsp.clangd.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities})
  lsp.rust_analyzer.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities})
  lsp.tsserver.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities})
  lsp.cssls.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities, cmd = {"vscode-css-languageserver", "--stdio"}})
  lsp.html.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities, cmd = {"vscode-html-languageserver", "--stdio"}})
  lsp.jsonls.setup({on_attach = on_attach, handlers = handlers, capabilities = capabilities, cmd = {"vscode-json-languageserver", "--stdio"}})
end
require("vim.lsp.protocol")["CompletionItemKind"] = {" \239\146\158  (Text) ", " \239\154\166  (Method)", " \239\158\148  (Function)", " \239\144\165  (Constructor)", " \239\180\178  (Field)", "[\238\156\150] (Variable)", " \239\160\150  (Class)", " \239\176\174  (Interface)", " \239\153\168  (Module)", " \239\170\182 (Property)", " \239\145\181  (Unit)", " \239\162\159  (Value)", " \239\169\151 (Enum)", " \239\160\138  (Keyword)", " \239\131\132  (Snippet)", " \239\163\151  (Color)", " \239\156\147  (File)", " \239\156\156  (Reference)", " \239\157\138  (Folder)", " \239\133\157  (EnumMember)", " \239\178\128  (Constant)", " \239\179\164  (Struct)", " \239\131\167  (Event)", " \239\151\171  (Operator)", " \239\158\131  (TypeParameter)"}
return _2amodule_2a