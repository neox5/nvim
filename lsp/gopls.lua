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
