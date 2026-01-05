# Neovim Configuration

Personal Neovim configuration optimized for Go and Lua development.

## Requirements

- Neovim 0.11+
- Go toolchain (for gopls)
- lua-language-server

## Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── core/                   # Core Neovim settings
│   │   ├── options.lua         # Vim options
│   │   ├── keymaps.lua         # Key mappings
│   │   └── clipboard.lua       # Clipboard configuration
│   ├── lsp/                    # LSP configuration
│   │   ├── gopls.lua           # Go server overrides
│   │   ├── lua_ls.lua          # Lua server overrides
│   │   ├── attach.lua          # LspAttach autocmd
│   │   ├── capabilities.lua    # Client capabilities
│   │   ├── diagnostics.lua     # Diagnostic configuration
│   │   └── inlay_hints.lua     # Inlay hint toggle
│   ├── plugins/                # Plugin specifications
│   │   ├── lspconfig.lua       # LSP setup
│   │   ├── cmp.lua             # Completion
│   │   ├── conform.lua         # Formatting
│   │   └── ...
│   └── utils/
│       └── functions.lua       # Utility functions
└── lazy-lock.json              # Plugin versions
```

## LSP Configuration

Uses Neovim 0.11+ native LSP API with nvim-lspconfig for server defaults.

### How It Works

Configurations are automatically merged from multiple sources:

1. **nvim-lspconfig defaults** (`nvim-lspconfig/lsp/<server>.lua`)
   - Provides: `cmd`, `filetypes`, `root_dir` logic
   - Battle-tested defaults for 300+ servers

2. **Your overrides** (`lsp/<server>.lua`)
   - Override: `capabilities`, `settings`, or any default
   - Only specify what you customize

3. **Enable servers** (`plugins/lspconfig.lua`)
   - Call `vim.lsp.enable('<server>')` to activate

### Adding a New Server

1. Install the language server binary
2. Create `lsp/<server>.lua` with your overrides:
   ```lua
   return {
     capabilities = require("lsp.capabilities").make(),
     settings = { ... },
   }
   ```
3. Enable in `plugins/lspconfig.lua`:
   ```lua
   vim.lsp.enable('<server>')
   ```

### Current Servers

- **gopls**: Go language server with gofumpt, staticcheck, inlay hints
- **lua_ls**: Lua language server with Neovim API support

## Installation

```bash
# Clone repository
git clone https://github.com/yourusername/nvim-config ~/.config/nvim

# Launch Neovim (lazy.nvim will auto-install plugins)
nvim
```

## Key Features

- Native LSP with auto-completion
- Treesitter syntax highlighting
- Fuzzy finding with Telescope
- Git integration
- Auto-formatting on save
- Inlay hints toggle

## References

- [Neovim LSP Documentation](https://neovim.io/doc/user/lsp.html)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
