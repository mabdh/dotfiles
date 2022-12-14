local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local function bootstrap_lsp(use) end
local function bootstrap_ide(use)
	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("configs.nvimtree")
		end,
	})

	use({
		"kyazdani42/nvim-web-devicons",
		event = "VimEnter",
		config = function()
			-- require("configs.icons")
		end,
	})

	use({
		"akinsho/bufferline.nvim",
		after = "nvim-web-devicons",
		config = function()
			-- require("configs.bufferline")
		end,
	})

	use({
		"rcarriga/nvim-notify",
		event = "VimEnter",
		config = function()
			require("configs.notify")
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		config = function()
			-- require("configs.nvimtree")
		end,
	})

	use({"nvim-lualine/lualine.nvim",
		  config = function()
		    require "configs.lualine"
		  end,
		})
end

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	use("lewis6991/impatient.nvim")

	use({
		"nvim-lua/plenary.nvim",
		module = "plenary",
	})

	use({
		"EdenEast/nightfox.nvim",
		config = function()
			vim.cmd("colorscheme nightfox")
		end,
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
