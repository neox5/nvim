local M = {}

function M.make()
  local caps = vim.lsp.protocol.make_client_capabilities()
  local ok, cmp = pcall(require, "cmp_nvim_lsp")
  if ok then
    caps = cmp.default_capabilities(caps)
  end
  return caps
end

return M
