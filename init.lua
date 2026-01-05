-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print("Installing lazy.nvim...")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
	print("lazy.nvim installed successfully.")
end
vim.opt.rtp:prepend(lazypath)

-- Load core configurations
require("core.clipboard")
require("core.filetypes")
require("core.keymaps")
require("core.options")

-- Load plugins
require("lazy").setup("plugins", {
	-- Lazy.nvim configuration
	install = {
		colorscheme = { "rose-pine" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})
