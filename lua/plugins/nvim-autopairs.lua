return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    local autopairs = require("nvim-autopairs")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    
    autopairs.setup({
      check_ts = true,  -- Enable treesitter integration
      ts_config = {
        lua = { "string" },  -- Don't add pairs in lua string nodes
        javascript = { "template_string" },
        java = false,  -- Don't check treesitter on java
      },
      disable_filetype = { "TelescopePrompt", "vim" },
      disable_in_macro = false,
      disable_in_visualblock = false,
      disable_in_replace_mode = true,
      ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
      enable_moveright = true,
      enable_afterquote = true,
      enable_check_bracket_line = true,
      enable_bracket_in_quote = true,
      enable_abbr = false,
      break_undo = true,
      check_comma = true,
      map_cr = true,
      map_bs = true,
      map_c_h = false,
      map_c_w = false,
    })
    
    -- Integration with nvim-cmp
    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done()
    )
    
    -- Custom rules for specific languages
    local Rule = require("nvim-autopairs.rule")
    local cond = require("nvim-autopairs.conds")
    
    -- Add spaces between parentheses
    autopairs.add_rules({
      Rule(" ", " ")
        :with_pair(function(opts)
          local pair = opts.line:sub(opts.col - 1, opts.col)
          return vim.tbl_contains({ "()", "[]", "{}" }, pair)
        end),
      Rule("( ", " )")
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match(".%)") ~= nil
        end)
        :use_key(")"),
      Rule("{ ", " }")
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match(".%}") ~= nil
        end)
        :use_key("}"),
      Rule("[ ", " ]")
        :with_pair(function() return false end)
        :with_move(function(opts)
          return opts.prev_char:match(".%]") ~= nil
        end)
        :use_key("]"),
    })
    
    -- Arrow function shortcut for JavaScript/TypeScript
    autopairs.add_rules({
      Rule("%(.*%)%s*%=>$", " {  }", { "typescript", "typescriptreact", "javascript", "javascriptreact" })
        :use_regex(true)
        :set_end_pair_length(2),
    })
  end,
}
