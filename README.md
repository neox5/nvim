# Neovim Configuration

A clean, Go-focused Neovim configuration built for efficient development with modern tooling and excellent discoverability.

## Requirements

- Neovim >= 0.10
- Git
- Go (with gopls and delve)
- A Nerd Font for icons
- ripgrep (for telescope live_grep)
- wl-clipboard (for Wayland systems)

## Installation

1. **Clone the configuration:**
   ```bash
   git clone <your-repo> ~/.config/nvim
   ```

2. **Install dependencies:**
   ```bash
   # Go language server
   go install golang.org/x/tools/gopls@latest
   
   # Go debugger (delve)
   go install github.com/go-delve/delve/cmd/dlv@latest
   
   # Wayland clipboard (if on Wayland)
   # Ubuntu/Debian: sudo apt install wl-clipboard
   # Arch: sudo pacman -S wl-clipboard
   ```

3. **Start Neovim:**
   ```bash
   nvim
   ```
   Lazy.nvim will automatically handle plugin installation on first run.

## Features

| Category | Features |
|----------|----------|
| **🎨 Theme & UI** | Rose Pine theme, Lualine status bar, Which-key discovery |
| **🔍 Navigation** | Telescope fuzzy finder, Treesitter text objects, Git-aware search |
| **🔧 Go Development** | Full LSP (gopls), Testing suite, Code generation, Coverage visualization |
| **🐛 Debugging** | DAP integration, Visual debugging, Function key shortcuts (F5/F9/F10/F11) |
| **💡 Code Intelligence** | Auto-completion, Diagnostics, Code actions, Hover documentation |
| **⚡ Performance** | Lazy loading, Wayland support, Smart caching, Large codebase optimized |

## Key Mappings

### Core Navigation
| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `jk` | Exit insert mode |
| `<leader><space>` | Clear search highlighting |
| `<C-h/j/k/l>` | Navigate windows |
| `<S-h/l>` | Navigate buffers |
| `<leader>w` | Save file |
| `<leader>bd` | Delete buffer |

### Project & Files
| Key | Action |
|-----|--------|
| `<leader>pf` | Find files |
| `<leader>pg` | Live grep |
| `<leader>ps` | Grep string under cursor |
| `<leader>pb` | Find buffers |
| `<leader>pe` | File explorer |
| `<C-p>` | Find git files |

### LSP & Code
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gi` | Go to implementation |
| `go` | Go to type definition |
| `gr` | Find references |
| `gs` | Signature help |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>f` | Format code |

### Diagnostics
| Key | Action |
|-----|--------|
| `<leader>dd` | Show diagnostic |
| `<leader>dn` | Next diagnostic |
| `<leader>dp` | Previous diagnostic |
| `<leader>dq` | Diagnostic quickfix list |

### Go Development
| Key | Action |
|-----|--------|
| `<leader>gb` | Build package |
| `<leader>gr` | Run package |
| `<leader>gi` | Generate interface implementation |
| `<leader>ge` | Add `if err != nil` |
| `<leader>gj` | Add JSON tags |
| `<leader>gy` | Add YAML tags |
| `<leader>gx` | Remove tags |
| `<leader>gA` | Switch between test and implementation |
| `<leader>gV/gS` | Switch to test/impl in split |

### Testing & Test Debugging
| Key | Action |
|-----|--------|
| `<leader>tt` | Run package tests |
| `<leader>tf` | Run function test |
| `<leader>tF` | Run file tests |
| `<leader>ta` | Add test for function |
| `<leader>ts` | Fill struct |
| `<leader>tc` | Show test coverage |
| `<leader>tC` | Clear coverage |
| `<leader>tT` | Toggle coverage |
| `<leader>td` | Debug test |
| `<leader>tD` | Debug last test |

### Debugging (DAP)
| Key | Action |
|-----|--------|
| `<F5>` / `<leader>dc` | Continue/Start debugging |
| `<F9>` / `<leader>db` | Toggle breakpoint |
| `<F10>` / `<leader>ds` | Step over |
| `<F11>` / `<leader>di` | Step into |
| `<S-F11>` / `<leader>do` | Step out |
| `<leader>dB` | Conditional breakpoint |
| `<leader>dC` | Run to cursor |
| `<leader>dr` | Restart |
| `<leader>dt` | Terminate debugging |
| `<leader>du` | Toggle DAP UI |
| `<leader>de` | Evaluate expression |
| `<leader>dv` | Toggle virtual text hints |


### Text Objects (Treesitter)
| Key | Action |
|-----|--------|
| `af/if` | Around/inside function |
| `ac/ic` | Around/inside class |
| `aa/ia` | Around/inside parameter |
| `<C-space>` | Expand selection |

## Configuration Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── core/
│   │   ├── options.lua      # Neovim settings
│   │   ├── keymaps.lua      # Core keybindings
│   │   └── clipboard.lua    # Wayland clipboard
│   └── plugins/
│       ├── rose-pine.lua    # Theme
│       ├── telescope.lua    # Fuzzy finder
│       ├── treesitter.lua   # Syntax highlighting
│       ├── lspconfig.lua    # Language server
│       ├── go.lua           # Go development
│       ├── dap.lua          # Debugging
│       ├── lualine.lua      # Status line
│       └── which-key.lua    # Key discovery
└── README.md
```

## Plugin Overview

### Core Functionality
- **lazy.nvim** - Modern plugin manager with lazy loading
- **rose-pine** - Beautiful, warm color scheme
- **lualine.nvim** - Fast and customizable statusline
- **which-key.nvim** - Key binding discovery and documentation

### Navigation & Search
- **telescope.nvim** - Fuzzy finder for files, grep, buffers
- **nvim-treesitter** - Advanced syntax highlighting and text objects

### Language Support
- **nvim-lspconfig** - LSP client configurations
- **go.nvim** - Comprehensive Go development support
- **ray-x/go.nvim** - Go-specific testing, building, and utilities

### Debugging
- **nvim-dap** - Debug Adapter Protocol client
- **nvim-dap-ui** - UI for debugging sessions
- **nvim-dap-go** - Go-specific debugging support
- **nvim-dap-virtual-text** - Inline variable values during debugging

## Workflow Examples

### Go Development Workflow
1. **Open project**: `<leader>pf` → find files
2. **Navigate code**: `gd` → go to definition
3. **Run tests**: `<leader>tt` → run package tests
4. **Debug failing test**: `<leader>td` → debug specific test
5. **Add test coverage**: `<leader>tc` → show coverage
6. **Build and run**: `<leader>gb` then `<leader>gr`

### Debugging Workflow
1. **Set breakpoint**: `<F9>` or `<leader>db`
2. **Start debugging**: `<F5>` or `<leader>dc`
3. **Step through code**: `<F10>` (over), `<F11>` (into)
4. **Inspect variables**: `<leader>de` → evaluate expression
5. **Terminate session**: `<leader>dt`

## Customization

### Adding New Language Support
1. Add LSP configuration in `lua/plugins/lspconfig.lua`
2. Install treesitter parser: `:TSInstall <language>`
3. Add language-specific keymaps if needed

### Modifying Keymaps
- Core keymaps: `lua/core/keymaps.lua`
- Plugin-specific keymaps: respective plugin files
- Discovery mappings: `lua/plugins/which-key.lua`

### Theme Customization
- Color scheme: `lua/plugins/rose-pine.lua`
- Statusline: `lua/plugins/lualine.lua`
- UI elements: `lua/core/options.lua`

## Troubleshooting

### LSP Not Working
```bash
# Check if gopls is installed
go version
gopls version

# Check LSP status in Neovim
:LspInfo
```

### Debugging Issues
```bash
# Ensure delve is installed
dlv version

# Check DAP configuration
:lua print(vim.inspect(require('dap').configurations.go))
```

### Performance Issues
- Large files: Treesitter highlighting auto-disables for files >100KB
- Many files: Uses lazy loading for plugins
- Wayland clipboard: Configured for optimal performance

## Contributing

Feel free to fork and customize this configuration. Key areas for enhancement:
- Additional language support
- Custom snippets
- Workflow automation
- Performance optimizations

---

**Note**: This configuration is optimized for Go development but provides a solid foundation for other languages through LSP integration.
