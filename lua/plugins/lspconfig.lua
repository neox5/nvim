return {
  "neovim/nvim-lspconfig",
  config = function()
    -- General LSP settings can be configured here
    local lspconfig = require('lspconfig')

    -- Setup other language servers if needed
    -- lspconfig.pyright.setup{}
    -- lspconfig.tsserver.setup{}

    -- Configure gopls with auto-format on save
    lspconfig.gopls.setup{
      on_attach = function(client, bufnr)
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("GoFormat", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end
    }

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

