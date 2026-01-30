return {
	"refractalize/oil-git-status.nvim",
	dependencies = { "stevearc/oil.nvim" },
	ft = "oil",
	config = function()
		require("oil-git-status").setup({
			show_ignored = false, -- Don't show !! for gitignored files
		})
	end,
}
