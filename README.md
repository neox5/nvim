# Neovim Config (neox5)

Configuration for Neovim, optimized for Go development, with Rose Pine theme and Tmux integration.

## Prerequisites

- **Neovim**: Version 0.5 or higher
- **Packer**: Plugin manager, auto-installed if missing
- **Go**: [Install](https://golang.org/dl/) and add to `PATH`

## Installation

1. **Clone the Repository**  

```bash
git clone git@github.com:neox5/nvim ~/.config/nvim
```

2. **Install Language Servers and Tools**

  | Language | Installation Command                                             | Description                           |
  |----------|------------------------------------------------------------------|---------------------------------------|
  | Go       | `go install golang.org/x/tools/gopls@latest`                     | Installs the Go language server       |

3. **Start Neovim**: Installs plugins automatically on the first start.

4. **Restart Neovim**: Restart to apply the theme.

## Commands

| Command           | Description                                                     |
|-------------------|-----------------------------------------------------------------|
| `:PackerSync`     | Installs and updates plugins specified in the configuration     |
| `:PackerCleanup`  | Removes installed plugins and cache, resetting the plugin state |

## Configuration Overview

### General

| Setting         | Value      |
|-----------------|------------|
| Line numbers    | Enabled    |
| Rel. numbers    | Enabled    |
| Tab width       | 2 spaces   |
| Shift width     | 2 spaces   |
| Expand tab      | Enabled    |
| Termguicolors   | Enabled    |

### Theme

| Setting      | Value     |
|--------------|-----------|
| Colorscheme  | Rose Pine |

### Plugins

| Plugin                          | Function                                                                 |
|---------------------------------|--------------------------------------------------------------------------|
| `christoomey/vim-tmux-navigator`| Enables seamless navigation between Tmux and Neovim panes                |
| `fatih/vim-go`                  | Adds Go-specific tools for linting, formatting, and testing             |
| `neovim/nvim-lspconfig`         | Provides configurations for setting up language servers (LSPs)          |
| `nvim-treesitter/nvim-treesitter` | Provides advanced syntax highlighting and code structure parsing      |
| `rose-pine/neovim`              | Adds the Rose Pine theme for a minimalist aesthetic                     |
| `wbthomason/packer.nvim`        | Plugin manager used to install and manage Neovim plugins                |

