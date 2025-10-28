local caps = require("lsp.capabilities").make()

local M = {}

function M.setup()
	vim.lsp.config("gopls", {
		capabilities = caps,
		settings = {
			gopls = {
				gofumpt = true,
				staticcheck = true,
				usePlaceholders = true, -- insert ${1:arg} tabstops
				completeFunctionCalls = true, -- include () + params
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
	})
end

return M
