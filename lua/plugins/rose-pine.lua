return {
  "rose-pine/neovim",
  name = "rose-pine",
  priority = 1000, -- Load before other plugins
  config = function()
    require("rose-pine").setup({
      variant = "moon", -- auto, main, moon, or dawn
      dark_variant = "moon",
      
      styles = {
        bold = true,
        italic = false,
        transparency = false,
      },
      
      groups = {
        -- Customize specific highlight groups if needed
        border = "muted",
        link = "iris",
        panel = "surface",
      },
    })

    -- Set colorscheme
    vim.cmd("colorscheme rose-pine")
  end,
}
