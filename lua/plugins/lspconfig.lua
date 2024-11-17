return {
  "neovim/nvim-lspconfig",
  dependencies = { "hrsh7th/cmp-nvim-lsp", "hrsh7th/nvim-cmp" },
  config = function()
    lspconfig = require("lspconfig")
    
    -- Reserve a space in the gutter
    vim.opt.signcolumn = "yes"

    -- Add cmp_nvim_lsp capabilities settings to lspconfig
    -- This should be executed before you configure any language server
    local lspconfig_defaults = lspconfig.util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend(
      "force",
      lspconfig_defaults.capabilities,
      require("cmp_nvim_lsp").default_capabilities()
    )

    -- This is where you enable features that only work
    -- if there is a language server active in the file
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set({"n", "x"}, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
      end,
    })

    -- golsp
    -- > add imports on save
    -- > auto-format on save
    lspconfig.gopls.setup({
      on_attach = function(client, bufnr)
        -- Define the organize_imports function
        local function organize_imports()
          local params = vim.lsp.util.make_range_params()
          params.context = { only = { "source.organizeImports" } }
          local result = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 1000)
          if result and result[1] then
            local actions = result[1].result
            if actions and actions[1] then
              vim.lsp.util.apply_workspace_edit(actions[1].edit, "utf-8")
            end
          end
        end

        if client.server_capabilities.documentFormattingProvider then
          -- Register the BufWritePre autocmd
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("GoFormat", { clear = true }),
            buffer = bufnr,
            callback = function()
              organize_imports()
              vim.lsp.buf.format({ async = false })
            end
          })
        end
      end
    })

  end
}

-- return {
--   "neovim/nvim-lspconfig",
--   config = function()
--     -- General LSP settings can be configured here
--     local lspconfig = require("lspconfig")
--
--     -- Setup other language servers if needed
--     -- lspconfig.pyright.setup{}
--     -- lspconfig.tsserver.setup{}
--
--     -- Configure gopls with auto-format on save
--     lspconfig.gopls.setup{
--       on_attach = function(client, bufnr)
--         if client.server_capabilities.documentFormattingProvider then
--           vim.api.nvim_create_autocmd("BufWritePre", {
--             group = vim.api.nvim_create_augroup("GoFormat", { clear = true }),
--             buffer = bufnr,
--             callback = function()
--               vim.lsp.buf.format({ async = false })
--             end,
--           })
--         end
--       end
--     }
--
--     -- Global LSP handlers
--     vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--       vim.lsp.handlers.hover,
--       { border = "rounded" }
--     )
--     vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
--       vim.lsp.handlers.signature_help,
--       { border = "rounded" }
--     )
--
--     -- Configure diagnostics
--     vim.diagnostic.config({
--       virtual_text = false,
--       signs = true,
--       update_in_insert = false,
--       underline = true,
--       severity_sort = true,
--       float = {
--         border = "rounded",
--         source = "always",
--       },
--     })
--   end,
-- }
--
