local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- netrw
keymap("n", "<leader>pe", vim.cmd.Ex, opts) -- po..."project open"

-- telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })    -- pf ... "project find"
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find files in repo" })  -- "project find (only files in git)"
vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Telescope live grep" })      -- pg ... "project grep"
vim.keymap.set("n", "<leader>gh", builtin.help_tags, { desc = "Telescope help tags" })      -- gh ... "global help"
-- vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
