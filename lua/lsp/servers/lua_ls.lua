-- Return configuration table directly
-- Neovim 0.11+ automatically loads this from lsp/ directory
return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		{ ".luarc.json", ".luarc.jsonc" },
		".git",
	},
	capabilities = require("lsp.capabilities").make(),
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			completion = { callSnippet = "Replace" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				checkThirdParty = false,
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = { enable = false },
		},
	},
}
