return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
	config = function()
		-- Setup diagnostics and attach behavior
		require("lsp.diagnostics").setup()
		require("lsp.attach").setup()

		-- Enable language servers
		-- Configs are auto-loaded from lsp/ directory by Neovim 0.11+
		vim.lsp.enable("gopls")
		vim.lsp.enable("lua_ls")
	end,
}
