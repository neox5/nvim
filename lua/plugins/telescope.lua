return {
  "nvim-telescope/telescope.nvim",
  branch = "master",  -- CHANGED: from '0.1.x' to 'master'
  cmd = "Telescope",  -- NEW: Lazy load on command
  keys = {  -- NEW: Lazy load on keybindings
    { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<C-p>", "<cmd>Telescope git_files<cr>", desc = "Find git files" },
    { "<leader>pg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>gh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    { "<leader>pb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
    { "<leader>ps", "<cmd>Telescope grep_string<cr>", desc = "Grep string under cursor" },
  },
  dependencies = { 
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")
    
    telescope.setup({
      defaults = {
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
          hidden = true,
        },
        git_files = {
          theme = "dropdown",
          previewer = false,
        },
        live_grep = {
          theme = "ivy",
        },
        help_tags = {
          theme = "ivy",
        },
      },
    })
    
    -- Load fzf extension for better performance
    pcall(telescope.load_extension, "fzf")
  end,
}
