local binary = "lua-language-server"
if vim.fn.executable(binary) == 0 then
	vim.notify(string.format("LSP binary not found: %s\nInstall from: https://github.com/LuaLS/lua-language-server/releases", binary), vim.log.levels.WARN, { title = "LSP" })
end

---@type vim.lsp.Config
return {
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
