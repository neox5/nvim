return {
	"stevearc/conform.nvim",
	--	event = { "BufReadPre", "BufNewFile" },
	event = { "VeryLazy" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = { "n", "v" },
			desc = "Format buffer",
		},
	},
	config = function()
		-- Define formatters by filetype (single source of truth)
		local formatters_by_ft = {
			go = { "goimports", "gofumpt" },
			lua = { "stylua" },
			python = { "isort", "black" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			sh = { "shfmt" },
		}

		-- Extract unique formatters and track which filetypes need them
		local formatter_usage = {}
		for ft, fmts in pairs(formatters_by_ft) do
			for _, fmt in ipairs(fmts) do
				if type(fmt) == "string" then
					formatter_usage[fmt] = formatter_usage[fmt] or {}
					table.insert(formatter_usage[fmt], ft)
				end
			end
		end

		-- Check each unique formatter
		local missing = {}
		for fmt, filetypes in pairs(formatter_usage) do
			if vim.fn.executable(fmt) == 0 then
				missing[fmt] = filetypes
			end
		end

		-- Build and show notification if any formatters are missing
		if next(missing) then
			local lines = { "Missing formatters:" }
			for fmt, fts in pairs(missing) do
				table.insert(lines, string.format("  - %s (needed for: %s)", fmt, table.concat(fts, ", ")))
			end
			vim.notify(table.concat(lines, "\n"), vim.log.levels.WARN, { title = "Conform.nvim" })
		end

		-- Setup conform using the same formatters_by_ft table
		require("conform").setup({
			formatters_by_ft = formatters_by_ft,

			-- Format on save
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end

				return {
					timeout_ms = 500,
					lsp_fallback = true,
				}
			end,

			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		})
	end,
	init = function()
		-- If you want to format on save with a keybinding instead
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

		-- Commands to toggle format on save
		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable globally
				vim.g.disable_autoformat = true
			else
				-- FormatDisable will disable for current buffer
				vim.b.disable_autoformat = true
			end
		end, {
			desc = "Disable format on save",
			bang = true,
		})

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Enable format on save",
		})
	end,
}
