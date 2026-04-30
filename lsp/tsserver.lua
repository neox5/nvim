local binary = "typescript-language-server"
if vim.fn.executable(binary) == 0 then
	vim.notify(string.format("LSP binary not found: %s\nInstall with: npm install -g typescript-language-server", binary), vim.log.levels.WARN, { title = "LSP" })
end

---@type vim.lsp.Config
return {
	capabilities = require("lsp.capabilities").make(),
	settings = {},
}
