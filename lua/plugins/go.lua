return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup({
      -- Disable LSP features (handled by lspconfig.lua)
      lsp_cfg = false,
      diagnostic_hdlr = false,
      
      -- Disable formatting (handled by gopls in lspconfig.lua)
      fmt = false,
      import_on_save = false,

      lsp_inlay_hints = {
        enable = false
      },
      
      -- Enable testing and debugging features
      test_runner = "go",
      dap_debug = true,
      dap_debug_gui = true,
      luasnip = true,
      
      -- Test options
      test_efm = true,
      test_timeout = "30s",
      test_env = {},
      test_template = "",
      test_template_dir = "",
      
      -- Coverage options
      coverage = {
        sign = "│",
        sign_priority = 5,
      },
      
      -- Other useful features
      comment_placeholder = "",
      icons = { breakpoint = "🔴", currentpos = "🔶" },
      verbose = false,
      
      -- Build options
      build_tags = "",
      textobjects = true,
      
      -- Run in floaterm
      run_in_floaterm = false,
    })

    -- Go-specific keymaps (only when in Go files)
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("GoMappings", { clear = true }),
      pattern = "go",
      callback = function(event)
        local opts = { buffer = event.buf, silent = true }
        
        -- Testing
        vim.keymap.set("n", "<leader>tt", "<cmd>GoTest<CR>", { buffer = event.buf, desc = "Run package tests" })
        vim.keymap.set("n", "<leader>tf", "<cmd>GoTestFunc<CR>", { buffer = event.buf, desc = "Run function test" })
        vim.keymap.set("n", "<leader>tF", "<cmd>GoTestFile<CR>", { buffer = event.buf, desc = "Run file tests" })
        vim.keymap.set("n", "<leader>ta", "<cmd>GoAddTest<CR>", { buffer = event.buf, desc = "Add test for function" })
        vim.keymap.set("n", "<leader>ts", "<cmd>GoFillStruct<CR>", { buffer = event.buf, desc = "Fill struct" })
        
        -- Coverage
        vim.keymap.set("n", "<leader>tc", "<cmd>GoCoverage<CR>", { buffer = event.buf, desc = "Show test coverage" })
        vim.keymap.set("n", "<leader>tC", "<cmd>GoCoverageClear<CR>", { buffer = event.buf, desc = "Clear coverage" })
        vim.keymap.set("n", "<leader>tT", "<cmd>GoCoverageToggle<CR>", { buffer = event.buf, desc = "Toggle coverage" })
        
        -- Build and run
        vim.keymap.set("n", "<leader>gb", "<cmd>GoBuild<CR>", { buffer = event.buf, desc = "Build package" })
        vim.keymap.set("n", "<leader>gr", "<cmd>GoRun<CR>", { buffer = event.buf, desc = "Run package" })
        
        -- Code generation
        vim.keymap.set("n", "<leader>gi", "<cmd>GoImpl<CR>", { buffer = event.buf, desc = "Generate interface implementation" })
        vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<CR>", { buffer = event.buf, desc = "Add if err != nil" })
        
        -- Struct tags
        vim.keymap.set("n", "<leader>gj", "<cmd>GoTagAdd json<CR>", { buffer = event.buf, desc = "Add JSON tags" })
        vim.keymap.set("n", "<leader>gy", "<cmd>GoTagAdd yaml<CR>", { buffer = event.buf, desc = "Add YAML tags" })
        vim.keymap.set("n", "<leader>gx", "<cmd>GoTagRm<CR>", { buffer = event.buf, desc = "Remove tags" })
        
        -- Alternative functions
        vim.keymap.set("n", "<leader>gA", "<cmd>GoAlt<CR>", { buffer = event.buf, desc = "Switch between test and implementation" })
        vim.keymap.set("n", "<leader>gV", "<cmd>GoAltV<CR>", { buffer = event.buf, desc = "Switch to test/impl (vertical split)" })
        vim.keymap.set("n", "<leader>gS", "<cmd>GoAltS<CR>", { buffer = event.buf, desc = "Switch to test/impl (horizontal split)" })
      end,
    })
  end,
  event = { "CmdlineEnter" },
  ft = { "go", "gomod" },
  build = ':lua require("go.install").update_all_sync()',
}
