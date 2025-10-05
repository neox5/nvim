return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
    "leoluz/nvim-dap-go",
  },
  keys = {  -- NEW: Lazy load on keybindings
    { "<leader>db", desc = "Toggle breakpoint" },
    { "<leader>dc", desc = "Continue" },
    { "<leader>ds", desc = "Step over" },
    { "<F5>", desc = "Continue/Start debugging" },
    { "<F9>", desc = "Toggle breakpoint" },
    { "<F10>", desc = "Step over" },
    { "<F11>", desc = "Step into" },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_virtual_text = require("nvim-dap-virtual-text")
    
    -- Setup DAP UI
    dapui.setup({
      controls = {
        element = "repl",
        enabled = true,
        icons = {
          disconnect = "",
          pause = "",
          play = "",
          run_last = "",
          step_back = "",
          step_into = "",
          step_out = "",
          step_over = "",
          terminate = ""
        }
      },
      element_mappings = {},
      expand_lines = true,
      floating = {
        border = "single",
        mappings = {
          close = { "q", "<Esc>" }
        }
      },
      force_buffers = true,
      icons = {
        collapsed = "",
        current_frame = "",
        expanded = ""
      },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 }
          },
          position = "left",
          size = 40
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 }
          },
          position = "bottom",
          size = 10
        }
      },
      mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
      },
      render = {
        indent = 1,
        max_value_lines = 100
      }
    })
    
    -- UPDATED: Virtual text with improved configuration
    dap_virtual_text.setup({
      enabled = true,  -- CHANGED: Now enabled by default with limits
      enabled_commands = true,
      highlight_changed_variables = true,
      highlight_new_as_changed = false,
      show_stop_reason = true,
      commented = false,
      only_first_definition = true,
      all_references = false,
      clear_on_continue = false,
      
      -- IMPROVED: Custom display callback to limit length
      display_callback = function(variable, buf, stackframe, node, options)
        -- Limit value length to prevent clutter
        local value = variable.value
        if #value > 50 then
          value = string.sub(value, 1, 50) .. '...'
        end
        
        if options.virt_text_pos == 'inline' then
          return ' = ' .. value
        else
          return variable.name .. ' = ' .. value
        end
      end,
      
      virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
      all_frames = false,
      virt_lines = false,
      virt_text_win_col = nil
    })

    -- IMPROVED: Simple toggle function using built-in commands
    local function toggle_dap_virtual_text()
      vim.cmd("DapVirtualTextToggle")
    end   

    -- Setup Go debugging
    require("dap-go").setup({
      delve = {
        path = "dlv",
        initialize_timeout_sec = 20,
        port = "${port}",
        args = {},
        build_flags = "",
        detached = vim.fn.has("win32") == 0,
        cwd = nil,
      },
    })
    
    -- Auto open/close DAP UI
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    
    -- Debugging keymaps (global, since debugging can happen in any language)
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Conditional breakpoint" })
    
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<leader>dC", dap.run_to_cursor, { desc = "Run to cursor" })
    
    vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step over" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
    vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step out" })
    
    vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart" })
    vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate" })
    
    vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
    vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "Evaluate expression" })
    vim.keymap.set("v", "<leader>de", dapui.eval, { desc = "Evaluate selection" })
    
    -- Toggle virtual text keymap
    vim.keymap.set("n", "<leader>dv", toggle_dap_virtual_text, { desc = "Toggle DAP virtual text" })
    
    -- Function keys for debugging (industry standard)
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue/Start debugging" })
    vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
    vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
    vim.keymap.set("n", "<S-F11>", dap.step_out, { desc = "Step out" })
    vim.keymap.set("n", "<S-F5>", dap.restart, { desc = "Restart debugging" })
    vim.keymap.set("n", "<C-F5>", dap.terminate, { desc = "Stop debugging" })
    
    -- Go-specific debugging keymaps
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("GoDebugMappings", { clear = true }),
      pattern = "go",
      callback = function(event)
        vim.keymap.set("n", "<leader>td", function()
          require("dap-go").debug_test()
        end, { buffer = event.buf, desc = "Debug test" })
        
        vim.keymap.set("n", "<leader>tD", function()
          require("dap-go").debug_last_test()
        end, { buffer = event.buf, desc = "Debug last test" })
      end,
    })
    
    -- DAP signs
    vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "🟡", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "🟢", texthl = "DapLogPoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "🔶", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "🚫", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })
  end,
}
