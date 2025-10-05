return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",  -- NEW: Explicit branch to prevent future breakage
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },  -- NEW: Lazy load on buffer read
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Languages to install
      ensure_installed = {
        "go",
        "gomod", 
        "gowork", 
        "gosum",
        "proto",
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "yaml",
        "json",
        "markdown",
        "markdown_inline",
      },
      
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      
      highlight = {
        enable = true,
        -- Disable for large files
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = false,
      },
      
      indent = {
        enable = true,
        -- Go indentation can be tricky, let LSP handle it
        disable = { "go" },
      },
      
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = "<C-s>",
          node_decremental = "<M-space>",
        },
      },
      
      textobjects = {
        select = {
          enable = true,
          
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
        },
      },
      
      -- Add folding support is now handled in core/options.lua
    })
  end,
}
