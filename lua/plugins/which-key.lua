return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    
    wk.setup({
      preset = "modern",
      delay = 300,
      filter = function(mapping)
        -- Filter out some mappings
        return mapping.desc and mapping.desc ~= ""
      end,
      spec = {},
      notify = true,
      triggers = {
        { "<auto>", mode = "nixsotc" },
        { "s", mode = { "n", "v" } },
      },
      defer = function(ctx)
        return ctx.mode == "V" or ctx.mode == "<C-V>"
      end,
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = false,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      win = {
        border = "rounded",
        padding = { 1, 2 },
        wo = {
          winblend = 0,
        },
      },
      layout = {
        width = { min = 20 },
        spacing = 3,
      },
      keys = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
      },
      sort = { "local", "order", "group", "alphanum", "mod" },
      expand = 0,
      replace = {
        ["<space>"] = "SPC",
        ["<cr>"] = "RET",
        ["<tab>"] = "TAB",
      },
      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
        ellipsis = "…",
        mappings = true,
        rules = {},
        colors = true,
        keys = {
          Up = " ",
          Down = " ",
          Left = " ",
          Right = " ",
          C = "󰘴 ",
          M = "󰘵 ",
          D = "󰘳 ",
          S = "󰘶 ",
          CR = "󰌑 ",
          Esc = "󱊷 ",
          ScrollWheelDown = "󰍽 ",
          ScrollWheelUp = "󰍾 ",
          NL = "󰌑 ",
          BS = "󰁮",
          Space = "󱁐 ",
          Tab = "󰌒 ",
          F1 = "󱊫",
          F2 = "󱊬",
          F3 = "󱊭",
          F4 = "󱊮",
          F5 = "󱊯",
          F6 = "󱊰",
          F7 = "󱊱",
          F8 = "󱊲",
          F9 = "󱊳",
          F10 = "󱊴",
          F11 = "󱊵",
          F12 = "󱊶",
        },
      },
      show_help = true,
      show_keys = true,
    })

    -- Add key specifications using the new v3 format
    wk.add({
      -- Project group
      { "<leader>p", group = "project" },
      { "<leader>pf", desc = "Find files" },
      { "<leader>pg", desc = "Live grep" },
      { "<leader>ps", desc = "Grep string" },
      { "<leader>pb", desc = "Find buffers" },
      { "<leader>pe", desc = "File explorer" },

      -- Go group
      { "<leader>g", group = "go" },
      { "<leader>gb", desc = "Build package" },
      { "<leader>gr", desc = "Run package" },
      { "<leader>gi", desc = "Generate interface impl" },
      { "<leader>ge", desc = "Add if err != nil" },
      { "<leader>gj", desc = "Add JSON tags" },
      { "<leader>gy", desc = "Add YAML tags" },
      { "<leader>gx", desc = "Remove tags" },
      { "<leader>gA", desc = "Switch test/impl" },
      { "<leader>gV", desc = "Switch test/impl (vsplit)" },
      { "<leader>gS", desc = "Switch test/impl (split)" },

      -- Test group (updated with debug functionality)
      { "<leader>t", group = "test" },
      { "<leader>tt", desc = "Run package tests" },
      { "<leader>tf", desc = "Run function test" },
      { "<leader>tF", desc = "Run file tests" },
      { "<leader>ta", desc = "Add test for function" },
      { "<leader>ts", desc = "Fill struct" },
      { "<leader>tc", desc = "Show coverage" },
      { "<leader>tC", desc = "Clear coverage" },
      { "<leader>tT", desc = "Toggle coverage" },
      { "<leader>td", desc = "Debug test" },
      { "<leader>tD", desc = "Debug last test" },

      -- Debug/Diagnostic group
      { "<leader>d", group = "debug/diagnostic" },
      { "<leader>dd", desc = "Show diagnostic" },
      { "<leader>dn", desc = "Next diagnostic" },
      { "<leader>dp", desc = "Previous diagnostic" },
      { "<leader>dq", desc = "Diagnostic quickfix" },
      { "<leader>db", desc = "Toggle breakpoint" },
      { "<leader>dB", desc = "Conditional breakpoint" },
      { "<leader>dc", desc = "Continue" },
      { "<leader>dC", desc = "Run to cursor" },
      { "<leader>ds", desc = "Step over" },
      { "<leader>di", desc = "Step into" },
      { "<leader>do", desc = "Step out" },
      { "<leader>dr", desc = "Restart" },
      { "<leader>dt", desc = "Terminate debugging" },
      { "<leader>du", desc = "Toggle DAP UI" },
      { "<leader>de", desc = "Evaluate expression" },
      { "<leader>dv", desc = "Toggle virtual text hints" },

      -- LSP group
      { "<leader>l", group = "lsp" },
      { "<leader>ld", desc = "Definition" },
      { "<leader>lD", desc = "Declaration" },
      { "<leader>li", desc = "Implementation" },
      { "<leader>lt", desc = "Type definition" },
      { "<leader>lr", desc = "References" },
      { "<leader>ls", desc = "Signature help" },

      -- Code group
      { "<leader>c", group = "code" },
      { "<leader>ca", desc = "Code action" },

      -- Rename group
      { "<leader>r", group = "rename" },
      { "<leader>rn", desc = "Rename symbol" },

      -- Buffer group
      { "<leader>b", group = "buffer" },
      { "<leader>bd", desc = "Delete buffer" },

      -- Single mappings
      { "<leader>f", desc = "Format code" },
      { "<leader>w", desc = "Save file" },
      { "<leader>h", desc = "Toggle inlay hints" },

      -- LSP goto mappings
      { "g", group = "goto" },
      { "gd", desc = "Definition" },
      { "gD", desc = "Declaration" },
      { "gi", desc = "Implementation" },
      { "go", desc = "Type definition" },
      { "gr", desc = "References" },
      { "gs", desc = "Signature help" },
      { "gh", desc = "Help tags" },

      -- Function keys
      { "<F5>", desc = "Continue/Start debugging" },
      { "<F9>", desc = "Toggle breakpoint" },
      { "<F10>", desc = "Step over" },
      { "<F11>", desc = "Step into" },
      { "<S-F11>", desc = "Step out" },
      { "<S-F5>", desc = "Restart debugging" },
      { "<C-F5>", desc = "Stop debugging" },
      { "<F12>", desc = "Go to definition" },
      { "<S-F12>", desc = "Find references" },
    })
  end,
}
