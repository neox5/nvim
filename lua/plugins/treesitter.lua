return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "go", "gomod", "gowork", "gosum", "lua", "vim"},
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    }
  end,
}
