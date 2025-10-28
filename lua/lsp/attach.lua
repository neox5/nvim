local M = {}

function M.setup()
  local grp = vim.api.nvim_create_augroup("UserLspAttach", { clear = true })
  vim.api.nvim_create_autocmd("LspAttach", {
    group = grp,
    callback = function(ev)
      local b = ev.buf
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = b, desc = desc })
      end

      map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
      map("n", "gr", vim.lsp.buf.references, "Goto References")
      map("n", "K",  vim.lsp.buf.hover, "Hover")
      map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
      map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")

      -- Keep formatting on Conform only; do not map <leader>f here. :contentReference[oaicite:1]{index=1}
      map("n", "<leader>h", function() require("lsp.inlay_hints").toggle(b) end, "Toggle Inlay Hints")
    end,
  })
end

return M
