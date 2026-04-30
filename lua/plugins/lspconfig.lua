return {
	"neovim/nvim-lspconfig",
	event = { "VeryLazy" },
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
	config = function()
		-- Setup global LSP behavior
		require("lsp.diagnostics").setup()
		require("lsp.attach").setup()

		-- Enable language servers
		-- Configs auto-merge from:
		--   1. nvim-lspconfig/lsp/<server>.lua (defaults)
		--   2. your lsp/<server>.lua (overrides)
		vim.lsp.enable("gopls")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("tsserver")
	end,
}
