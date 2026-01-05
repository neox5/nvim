return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
	config = function()
		-- Setup global LSP behavior
		require("lsp.diagnostics").setup()
		require("lsp.attach").setup()

		-- Enable language servers
		-- Configs auto-merge from:
		--   1. nvim-lspconfig/lsp/gopls.lua (defaults)
		--   2. your lsp/gopls.lua (overrides)
		vim.lsp.enable("gopls")
		vim.lsp.enable("lua_ls")
	end,
}
