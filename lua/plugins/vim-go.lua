return {
  "fatih/vim-go",
  ft = "go",
  build = ":GoUpdateBinaries",
  config = function()
    -- Disable vim-go's LSP features since we're using gopls
    vim.g.go_def_mapping_enabled = 0
    vim.g.go_code_completion_enabled = 0
    
    -- Formatting settings
    vim.g.go_fmt_autosave = 0  -- Disable auto formatting since we're using gopls
    vim.g.go_imports_autosave = 0  -- Disable auto imports since we're using gopls
    
    -- Test settings
    vim.g.go_test_timeout = '30s'
    vim.g.go_test_show_name = 1
    vim.g.go_test_prepend_name = 1

    -- Create an autocommand group for Go-specific mappings
    local go_group = vim.api.nvim_create_augroup("GoMappings", { clear = true })
    
    -- Add test mappings only for Go files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      group = go_group,
      callback = function(event)
        -- Test mappings - buffer local
        vim.keymap.set("n", "<leader>tt", "<cmd>GoTest<CR>", { buffer = event.buf, desc = "Go test package" })
        vim.keymap.set("n", "<leader>tf", "<cmd>GoTestFunc<CR>", { buffer = event.buf, desc = "Go test function" })
        vim.keymap.set("n", "<leader>tl", "<cmd>GoTestFile<CR>", { buffer = event.buf, desc = "Go test file" })
        vim.keymap.set("n", "<leader>tv", "<cmd>GoTestVerbose<CR>", { buffer = event.buf, desc = "Go test verbose" })
        vim.keymap.set("n", "<leader>tc", "<cmd>GoCoverage<CR>", { buffer = event.buf, desc = "Go test coverage" })
        vim.keymap.set("n", "<leader>tC", "<cmd>GoCoverageClear<CR>", { buffer = event.buf, desc = "Clear Go coverage" })
      end
    })
  end,
}
