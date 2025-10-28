# Neovim Configuration

### Requirements
- **Neovim ≥ 0.11**
- **wl-clipboard** (Wayland)
- **Go**, **Lua**, **Python**, and other relevant language toolchains
- **git**, **make**, **ripgrep**

---

### Structure
```

~/.config/nvim/
├── init.lua
├── lua/
│   ├── core/         # options, keymaps, clipboard
│   ├── plugins/      # all plugin specs for lazy.nvim
│   ├── lsp/          # native LSP config using new API
│   │   ├── servers/  # one file per server (gopls, lua_ls, etc.)
│   │   ├── attach.lua
│   │   ├── capabilities.lua
│   │   ├── diagnostics.lua
│   │   ├── inlay_hints.lua
│   │   └── init.lua
│   └── utils/        # utility functions

````

---

### Key Features
- **Native LSP** using `vim.lsp.config()` and `vim.lsp.enable()`
- **Completion** via `nvim-cmp` + `LuaSnip` with `<Tab>` navigation
- **Formatting** via `conform.nvim` (mapped to `<leader>f`)
- **DAP** debugging with `nvim-dap` + `nvim-dap-ui`
- **Tree-sitter** syntax highlighting and folding
- **Go** integration using `go.nvim`
- **Commenting**, **Telescope**, **Neo-tree**, and **Lualine** preconfigured

---

### Notable Keymaps
| Action | Key |
|--------|-----|
| Save file | `<leader>w` |
| Format code | `<leader>f` |
| File explorer | `<leader>e` |
| Toggle inlay hints | `<leader>h` |
| LSP rename | `<leader>rn` |
| Code actions | `<leader>ca` |
| DAP controls | `<F5>`, `<F9>`, `<F10>`, `<F11>` |
| Telescope find files | `<leader>pf` |

---

### Updating and Maintenance
```bash
:PackerClean
:Lazy sync
````

* All LSP servers use the **new native config/enable API**.
* `lspconfig.lua` was removed — replaced by `plugins/native-lsp.lua`.
* Ensure `completeopt = menu,menuone,noinsert` in `core/options.lua`.

---

### Notes

* Use `<leader>` = `space`.
* Completion triggers on `InsertEnter` and `TextChanged`.
* Format-on-save is optional and can be toggled with `:FormatDisable` / `:FormatEnable`.
* DAP UI auto-opens on debugging start.

---

This README reflects the streamlined Neovim 0.11+ configuration with lazy.nvim and native LSP setup.
