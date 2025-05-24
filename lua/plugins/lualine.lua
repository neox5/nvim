return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        theme = "rose-pine",
        component_separators = { left = "·", right = "·" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = {
        lualine_a = { 
          {
            "mode",
            fmt = function(str)
              return str:sub(1,1) -- Show only first letter of mode
            end,
          }
        },
        lualine_b = { 
          {
            "branch",
            icon = "",
            fmt = function(str)
              if str == "" then
                return ""
              end
              return str:len() > 20 and str:sub(1,17) .. "..." or str
            end,
          },
          {
            "diff",
            symbols = {
              added = " ",
              modified = "󰏫 ",
              removed = " "
            },
            colored = true,
            diff_color = {
              added    = { fg = "#a3be8c" },
              modified = { fg = "#ebcb8b" },
              removed  = { fg = "#bf616a" },
            },
          }
        },
        lualine_c = {
          {
            "filename",
            path = 1, -- Show relative path
            symbols = {
              modified = " 󰷥",
              readonly = " ",
              unnamed = "[No Name]",
              newfile = " 󰄛",
            },
            fmt = function(str)
              -- Shorten long paths
              if str:len() > 40 then
                local parts = vim.split(str, "/")
                if #parts > 3 then
                  return ".../" .. table.concat({parts[#parts-1], parts[#parts]}, "/")
                end
              end
              return str
            end,
          }
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },
            symbols = { 
              error = " ", 
              warn = " ", 
              info = " ", 
              hint = "󰌶 " 
            },
            colored = true,
            update_in_insert = false,
            always_visible = false,
            diagnostics_color = {
              error = { fg = "#bf616a" },
              warn  = { fg = "#ebcb8b" },
              info  = { fg = "#81a1c1" },
              hint  = { fg = "#88c0d0" },
            },
          },
          {
            -- Show LSP status
            function()
              local clients = vim.lsp.get_active_clients()
              if next(clients) == nil then
                return ""
              end
              
              local client_names = {}
              for _, client in pairs(clients) do
                table.insert(client_names, client.name)
              end
              return "󰒋 " .. table.concat(client_names, " ")
            end,
            colored = true,
            color = { fg = "#a3be8c" },
          }
        },
        lualine_y = { 
          {
            "filetype",
            colored = true,
            icon_only = false,
            icon = { align = "right" },
          }
        },
        lualine_z = { 
          {
            "location", 
            fmt = function(str)
              return str .. " 󰕾"
            end,
          },
          {
            "progress",
            fmt = function(str)
              return str == "Top" and "󰝤" or str == "Bot" and "󰝦" or str
            end,
          }
        }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 
          {
            "filename",
            path = 1,
            symbols = {
              modified = " 󰷥",
              readonly = " ",
            }
          }
        },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "nvim-dap-ui", "lazy" }
    })
  end,
}
