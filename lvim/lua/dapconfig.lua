local dap = require "dap"

require('dap-go').setup()
-- dap.adapters.go = {
--   type = 'executable';
--   command = 'node';
--   args = { os.getenv('HOME') .. '/vscode-go/dist/debugAdapter.js' }; -- specify the path to the adapter
-- }
-- dap.adapters.go = function(callback, _)
--   local stdout = vim.loop.new_pipe(false)
--   local handle
--   local pid_or_err
--   local port = 38697
--   local opts = {
--     stdio = { nil, stdout },
--     args = { "dap", "-l", "127.0.0.1:" .. port },
--     detached = true,
--   }
--   handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
--     stdout:close()
--     handle:close()
--     if code ~= 0 then
--       print("dlv exited with code", code)
--     end
--   end)
--   assert(handle, "Error running dlv: " .. tostring(pid_or_err))
--   stdout:read_start(function(err, chunk)
--     assert(not err, err)
--     if chunk then
--       vim.schedule(function()
--         require("dap.repl").append(chunk)
--       end)
--     end
--   end)
--   -- Wait for delve to start
--   vim.defer_fn(function()
--     callback { type = "server", host = "127.0.0.1", port = port }
--   end, 100)
-- end
-- dap.configurations.go = {
--   {
--     type = "go",
--     name = "Attach",
--     request = "attach",
--     processId = require("dap.utils").pick_process,
--     program = "${workspaceFolder}",
--     dlvToolPath = vim.fn.exepath('dlv')
--   },
--   {
--     type = "go",
--     name = "Debug curr file",
--     request = "launch",
--     program = "${file}",
--     dlvToolPath = vim.fn.exepath('dlv')
--   },
--   {
--     type = "go",
--     name = "Debug",
--     request = "launch",
--     program = "${workspaceFolder}",
--     dlvToolPath = vim.fn.exepath('dlv')
--   },
--   {
--     type = "go",
--     name = "Debug curr test",
--     request = "launch",
--     mode = "test",
--     program = "${file}",
--     dlvToolPath = vim.fn.exepath('dlv')
--   },
--   {
--     type = "go",
--     name = "Debug test",
--     request = "launch",
--     mode = "test",
--     program = "${workspaceFolder}",
--     dlvToolPath = vim.fn.exepath('dlv')
--   },
-- }

dap.adapters.python = {
  type = 'executable';
  command = 'path/to/virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}
