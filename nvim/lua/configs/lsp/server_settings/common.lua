local M = {}

local coreutils = require "core.utils"

M.capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  }
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  return capabilities
end

M.on_attach = function(client, bufnr)
  local lu = require "configs.lsp.utils"
  lu.setup_document_highlight(client, bufnr)
  lu.setup_codelens_refresh(client, bufnr)

  -- Mappings.
  coreutils.set_mappings({
    n = {
      ["K"] = {
        function()
          vim.lsp.buf.hover()
        end,
        desc = "Hover symbol details",
      },
      ["<leader>la"] = {
        function()
          vim.lsp.buf.code_action()
        end,
        desc = "LSP code action",
      },
      ["<leader>lf"] = {
        function()
          vim.lsp.buf.formatting_sync()
        end,
        desc = "Format code",
      },
      ["<leader>lh"] = {
        function()
          vim.lsp.buf.signature_help()
        end,
        desc = "Signature help",
      },
      ["<leader>lr"] = {
        function()
          vim.lsp.buf.rename()
        end,
        desc = "Rename current symbol",
      },
      ["<leader>wa"] = {
        function()
          vim.lsp.buf.add_workspace_folder()
        end,
        desc = "Add workspace folder",
      },
      ["<leader>wr"] = {
        function()
          vim.lsp.buf.remove_workspace_folder()
        end,
        desc = "Remove workspace folder",
      },
      ["<leader>wl"] = {
        function()
          inspect(vim.lsp.buf.list_workspace_folders())
        end,
        desc = "Remove workspace folder",
      },
      ["gD"] = {
        function()
          vim.lsp.buf.declaration()
        end,
        desc = "Declaration of current symbol",
      },
      ["gI"] = {
        function()
          vim.lsp.buf.implementation()
        end,
        desc = "Implementation of current symbol",
      },
      ["gd"] = {
        function()
          vim.lsp.buf.definition()
        end,
        desc = "Show the definition of current symbol",
      },
      ["gr"] = {
        function()
          vim.lsp.buf.references()
        end,
        desc = "References of current symbol",
      },
      ["gp"] = {
        function()
          require("configs.lsp.peek").Peek "definition"
        end,
        desc = "Peek definition",
      },
      ["<leader>ld"] = {
        function()
          vim.diagnostic.open_float()
        end,
        desc = "Hover diagnostics",
      },
      ["[d"] = {
        function()
          vim.diagnostic.goto_prev()
        end,
        desc = "Previous diagnostic",
      },
      ["]d"] = {
        function()
          vim.diagnostic.goto_next()
        end,
        desc = "Next diagnostic",
      },
      ["gl"] = {
        function()
          vim.diagnostic.open_float()
        end,
        desc = "Hover diagnostics",
      },
      ["<leader>q"] = {
        function()
          vim.diagnostic.setqflist { open = true }
        end,
        desc = "Hover diagnostics",
      },
      ["<leader>ca"] = {
        function()
          vim.lsp.buf.code_action()
        end,
        desc = "Hover diagnostics",
      },
    },
    v = {
      ["<leader>la"] = {
        function()
          vim.lsp.buf.range_code_action()
        end,
        desc = "Range LSP code action",
      },
      ["<leader>lf"] = {
        function()
          vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, true, true), "n", false)
          vim.lsp.buf.range_formatting()
        end,
        desc = "Range format code",
      },
    },
  }, { buffer = bufnr })

  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local float_opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always", -- show source in diagnostic popup window
        prefix = " ",
      }

      if not vim.b.diagnostics_pos then
        vim.b.diagnostics_pos = { nil, nil }
      end

      local cursor_pos = vim.api.nvim_win_get_cursor(0)
      if (cursor_pos[1] ~= vim.b.diagnostics_pos[1] or cursor_pos[2] ~= vim.b.diagnostics_pos[2])
          and #vim.diagnostic.get() > 0
      then
        vim.diagnostic.open_float(nil, float_opts)
      end

      vim.b.diagnostics_pos = cursor_pos
    end,
  })

  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
  -- -- Set some key bindings conditional on server capabilities
  -- if client.resolved_capabilities.document_formatting then
  --   vim.keymap.set("n", "<leader>bf", vim.lsp.buf.formatting_sync, opts)
  -- end
  -- if client.resolved_capabilities.document_range_formatting then
  --   vim.keymap.set("x", "<leader>bf", vim.lsp.buf.range_formatting, opts)
  -- end

  -- The blow command will highlight the current variable and its usages in the buffer.
  if client.resolved_capabilities.document_highlight then
    vim.cmd [[
      hi! link LspReferenceRead Visual
      hi! link LspReferenceText Visual
      hi! link LspReferenceWrite Visual
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end

  if vim.g.logging_level == "debug" then
    local msg = string.format("Language server %s started!", client.name)
    vim.notify(msg, vim.log.levels.DEBUG, { title = "Nvim-config" })
  end
end

M.on_exit = function(_, _)
  autocmds.clear_augroup "lsp_document_highlight"
  autocmds.clear_augroup "lsp_code_lens_refresh"
end

return M
