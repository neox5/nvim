-- vim.g.clipboard = {
--   name = "wl-clipboard",
--   copy = {
--     ["+"] = "wl-copy",
--     ["*"] = "wl-copy",
--   },
--   paste = {
--     ["+"] = "wl-paste --no-newline",
--     ["*"] = "wl-paste --no-newline",
--   },
--   cache_enabled = 1,
-- }

vim.g.clipboard = {
	name = "win32yank",
	copy = {
		["+"] = { "win32yank.exe", "-i", "--crlf" },
		["*"] = { "win32yank.exe", "-i", "--crlf" },
	},
	paste = {
		["+"] = { "win32yank.exe", "-o", "--lf" },
		["*"] = { "win32yank.exe", "-o", "--lf" },
	},
	cache_enabled = 0,
}
