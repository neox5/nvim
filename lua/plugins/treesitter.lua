return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "go", "lua", "vim"}, -- Add languages you want Treesitter to support
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
  end,
}
