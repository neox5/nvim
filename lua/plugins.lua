-- Ensure Packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Plugin setup
require("packer").startup(function(use)
  use "wbthomason/packer.nvim"
  use "rose-pine/neovim"
  use "neovim/nvim-lspconfig"
  use "nvim-treesitter/nvim-treesitter"
  use "fatih/vim-go"
  use "christoomey/vim-tmux-navigator"

  -- Treesitter configuration for Go
  local treesitter_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
  if treesitter_ok then
    treesitter_configs.setup {
      ensure_installed = { "go" },
      highlight = { enable = true }
    }
  end

  if packer_bootstrap then
    require("packer").sync()
  end
end)

-- Define a function to create the PackerCleanup command after plugins are loaded
local function setup_packer_cleanup()
  vim.api.nvim_create_user_command("PackerCleanup", function()
    vim.fn.delete(vim.fn.stdpath("data"), "rf")   -- Delete plugins
    vim.fn.delete(vim.fn.stdpath("cache"), "rf")  -- Delete cache
    print("Neovim data and cache directories have been cleaned.")
  end, {})
end

-- Call the setup function after a slight delay to ensure Neovim is fully initialized
vim.defer_fn(setup_packer_cleanup, 0)

