local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Better escape
-- important with options.lua coniig: opt.timeoutlen = 300 (300ms)
keymap("i", "kj", "<ESC>", opts)

-- Clear search highlighting
keymap("n", "<leader><space>", ":nohlsearch<CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Better indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- File explorer
keymap("n", "<leader>pe", vim.cmd.Ex, opts) -- "project explore"

-- Quick save
keymap("n", "<leader>w", ":w<CR>", opts)

-- Code folding
keymap("n", "za", "za", opts)  -- Toggle fold under cursor
keymap("n", "zR", "zR", opts)  -- Open all folds
keymap("n", "zM", "zM", opts)  -- Close all folds
keymap("n", "zr", "zr", opts)  -- Open one fold level
keymap("n", "zm", "zm", opts)  -- Close one fold level
