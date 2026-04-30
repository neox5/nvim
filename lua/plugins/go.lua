return {
	"ray-x/go.nvim",
	version = "v0.10.4",
	dependencies = {
		"ray-x/guihua.lua",
		"nvim-treesitter/nvim-treesitter",
	},
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()',
	config = function()
		-- Binary check
		if vim.fn.executable("go") == 0 then
			vim.notify("Binary not found: go\nInstall from: https://go.dev/dl/", vim.log.levels.WARN, { title = "go.nvim" })
			return
		end

		require("go").setup({
			lsp_cfg = false,
			diagnostic_hdlr = false,
			fmt = false,
			import_on_save = false,

			lsp_inlay_hints = {
				enable = false,
			},

			test_runner = "go",
			dap_debug = true,
			dap_debug_gui = true,
			luasnip = true,

			test_efm = true,
			test_timeout = "30s",
			test_env = {},
			test_template = "",
			test_template_dir = "",

			coverage = {
				sign = "│",
				sign_priority = 5,
			},

			comment_placeholder = "",
			icons = { breakpoint = "🔴", currentpos = "🔶" },
			verbose = false,

			build_tags = "",
			textobjects = true,

			run_in_floaterm = true,
		})

		local function run_package_from_root(prompt_for_args)
			local current_file_dir = vim.fn.expand("%:p:h")

			local args = ""
			if prompt_for_args then args = vim.fn.input("Run arguments: ") end

			local cmd = "go run " .. current_file_dir
			if args ~= "" then cmd = cmd .. " " .. args end

			vim.cmd("split | terminal " .. cmd)
		end

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("GoMappings", { clear = true }),
			pattern = "go",
			callback = function(event)
				vim.keymap.set("n", "<leader>tt", "<cmd>GoTest<CR>", { buffer = event.buf, desc = "Run package tests" })
				vim.keymap.set("n", "<leader>tf", "<cmd>GoTestFunc -v<CR>", { buffer = event.buf, desc = "Run function test" })
				vim.keymap.set("n", "<leader>tF", "<cmd>GoTestFile<CR>", { buffer = event.buf, desc = "Run file tests" })
				vim.keymap.set("n", "<leader>ta", "<cmd>GoAddTest<CR>", { buffer = event.buf, desc = "Add test for function" })
				vim.keymap.set("n", "<leader>ts", "<cmd>GoFillStruct<CR>", { buffer = event.buf, desc = "Fill struct" })
				vim.keymap.set("n", "<leader>tb", "<cmd>GoTestFunc -bench<CR>", { buffer = event.buf, desc = "Run function benchmark" })
				vim.keymap.set("n", "<leader>tc", "<cmd>GoCoverage<CR>", { buffer = event.buf, desc = "Show test coverage" })
				vim.keymap.set("n", "<leader>tC", "<cmd>GoCoverageClear<CR>", { buffer = event.buf, desc = "Clear coverage" })
				vim.keymap.set("n", "<leader>tT", "<cmd>GoCoverageToggle<CR>", { buffer = event.buf, desc = "Toggle coverage" })
				vim.keymap.set("n", "<leader>gb", "<cmd>GoBuild<CR>", { buffer = event.buf, desc = "Build package" })
				vim.keymap.set("n", "<leader>gr", function() run_package_from_root(false) end, { buffer = event.buf, desc = "Run current go package" })
				vim.keymap.set("n", "<leader>gR", function() run_package_from_root(true) end, { buffer = event.buf, desc = "Run current go package (with arguments)" })
				vim.keymap.set("n", "<leader>gi", "<cmd>GoImpl<CR>", { buffer = event.buf, desc = "Generate interface implementation" })
				vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<CR>", { buffer = event.buf, desc = "Add if err != nil" })
				vim.keymap.set("n", "<leader>gj", "<cmd>GoTagAdd json<CR>", { buffer = event.buf, desc = "Add JSON tags" })
				vim.keymap.set("n", "<leader>gy", "<cmd>GoTagAdd yaml<CR>", { buffer = event.buf, desc = "Add YAML tags" })
				vim.keymap.set("n", "<leader>gx", "<cmd>GoTagRm<CR>", { buffer = event.buf, desc = "Remove tags" })
				vim.keymap.set("n", "<leader>gA", "<cmd>GoAlt<CR>", { buffer = event.buf, desc = "Switch between test and implementation" })
				vim.keymap.set("n", "<leader>gV", "<cmd>GoAltV<CR>", { buffer = event.buf, desc = "Switch to test/impl (vertical split)" })
				vim.keymap.set("n", "<leader>gS", "<cmd>GoAltS<CR>", { buffer = event.buf, desc = "Switch to test/impl (horizontal split)" })
			end,
		})
	end,
}
