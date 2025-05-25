return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { 
    "nvim-lua/plenary.nvim",
    -- Optional: telescope-fzf-native for better performance
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
    
    -- Keymaps
    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find git files" })
    vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>gh", builtin.help_tags, { desc = "Help tags" })
    vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set("n", "<leader>ps", builtin.grep_string, { desc = "Grep string under cursor" })
  end,
}
