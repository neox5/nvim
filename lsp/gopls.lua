local binary = "gopls"
if vim.fn.executable(binary) == 0 then
	vim.notify(string.format("LSP binary not found: %s\nInstall with: go install golang.org/x/tools/gopls@latest", binary), vim.log.levels.WARN, { title = "LSP" })
end

---@type vim.lsp.Config
return {
	capabilities = require("lsp.capabilities").make(),
	settings = {
		gopls = {
			gofumpt = true,
			staticcheck = true,
			usePlaceholders = true,
			completeFunctionCalls = true,
			analyses = {
				unusedparams = true,
				unusedwrite = true,
				nilness = true,
				shadow = true,
				useany = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				constantValues = true,
				parameterNames = true,
			},
			semanticTokens = true,
		},
	},
}
