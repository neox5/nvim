-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.termguicolors = true

-- Load Rose Pine theme if available
local status_ok, _ = pcall(vim.cmd, "colorscheme rose-pine")
if not status_ok then
  vim.notify("Rose Pine theme not found. Restart Neovim after the automatic Packer installation (or run :PackerSync).", vim.log.levels.WARN)
end

-- Load plugins
require("plugins")

-- Go language server setup
local lsp_status, lspconfig = pcall(require, "lspconfig")
if lsp_status then
  lspconfig.gopls.setup{}
end

