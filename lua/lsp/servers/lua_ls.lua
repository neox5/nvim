local caps = require("lsp.capabilities").make()

local M = {}

function M.setup()
	vim.lsp.config("lua_ls", {
		capabilities = caps,
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
	})
end

return M
