local M = {}

-- enable_all must be called after server configs are defined
function M.enable_all()
  vim.lsp.enable("gopls")
  vim.lsp.enable("lua_ls")
end

return M
