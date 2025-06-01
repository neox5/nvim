return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("Comment").setup({
      padding = true,
      sticky = true,
      ignore = "^(%s*)$",
      
      toggler = {
        line = "gcc",  -- Toggle line comment
        block = "gbc", -- Toggle block comment 
      },
      
      opleader = {
        line = "gc",   -- Line comment operator
        block = "gb",  -- Block comment operator
      },
      
      extra = {
        above = "gcO", 
        below = "gco", 
        eol = "gcA",   
      },
      
      mappings = {
        basic = true,
        extra = true,
      },
    })
  end,
}
