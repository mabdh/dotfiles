local coreutils = require("core.utils")
local Log = require("core.log")

-- try loading packer
  local packer_avail, _ = pcall(require, "packer")
  -- if packer isn't availble, reinstall it
  if not packer_avail then
    -- set the location to install packer
    local packer_path = vim.fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
    -- delete the old packer install if one exists
    vim.fn.delete(packer_path, "rf")
    -- clone packer
    vim.fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      packer_path,
    }
    Log:debug("Initializing Packer...\n\n")
    -- add packer and try loading it
    vim.cmd "packadd packer.nvim"
    packer_avail, _ = pcall(require, "packer")
    -- if packer didn't load, print error
    if not packer_avail then
      vim.api.nvim_err_writeln("Failed to load packer at:" .. packer_path)
    end
  end
  -- if packer is available, check if there is a compiled packer file
  if packer_avail then
    -- try to load the packer compiled file
   local default_compile_path = coreutils.join_paths(vim.fn.stdpath "data", "site", "lua", "packer_compiled.lua")

    local run_me, _ = loadfile(default_compile_path)
    -- if the file loads, run the compiled function
    if run_me then
      run_me()
      -- if there is no compiled file, prompt the user to run :PackerSync
    else
      Log:debug("Please run :PackerSync")
    end
  end

