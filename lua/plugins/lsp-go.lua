return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua", -- Recommended for floating window support
    "neovim/nvim-lspconfig",
  },
  ft = { "go", "gomod" },
  config = function()
    require('go').setup()

    -- Format on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require("go.format").goimport() -- Go format and import
      end,
    })
  end,
}
