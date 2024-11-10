return {
  "neovim/nvim-lspconfig",
  config = function()
    -- General LSP settings can be configured here
    local lspconfig = require('lspconfig')

    -- Setup other language servers if needed
    -- lspconfig.pyright.setup{}
    -- lspconfig.tsserver.setup{}

    -- Global LSP handlers
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover,
      { border = "rounded" }
    )
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signature_help,
      { border = "rounded" }
    )

    -- Configure diagnostics
    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
      },
    })
  end,
}

