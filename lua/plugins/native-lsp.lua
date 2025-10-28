return {
  -- Use a real plugin as the carrier for our native LSP bootstrap.
  -- We do not call lspconfig.setup(); we only need a valid spec.
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    require("lsp.diagnostics").setup()
    require("lsp.attach").setup()
    require("lsp.servers.gopls").setup()
    require("lsp.servers.lua_ls").setup()
    require("lsp").enable_all()
  end,
}
