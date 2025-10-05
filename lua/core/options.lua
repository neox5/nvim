local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Clipboard
opt.clipboard = "unnamedplus"

-- File handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Window splitting
opt.splitright = true
opt.splitbelow = true

-- Performance
opt.updatetime = 50
opt.timeoutlen = 300

-- Command line
opt.showcmd = true
opt.cmdheight = 1

-- Completion
opt.completeopt = { "menu", "menuone", "noselect" }

-- UPDATED: Treesitter folding configuration
opt.foldmethod = "manual"
opt.foldexpr = ""
opt.foldlevel = 99         -- Start with all folds open
opt.foldlevelstart = 1     -- Top-level folds open by default
opt.foldnestmax = 4        -- Limit fold depth for performance
opt.foldenable = false      -- Enable folding

-- Disable automatic comment continuation
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})
