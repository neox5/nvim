# Neovim Config (neox5)

Configuration for Neovim, optimized for Go development, with Rose Pine theme and Tmux integration.

## Prerequisites

- **Neovim**: Version 0.5 or higher
- **Packer**: Plugin manager, auto-installed if missing
- **Go**: [Install](https://golang.org/dl/) and add to `PATH`

## Installation

1. **Clone the Repository**  
   ```bash
   git clone https://github.com/yourusername/nvim ~/.config/nvim
   ```

2. **Install Plugins**  
   Open Neovim and run `:PackerSync`

3. **Install Go Language Server**  
   ```bash
   go install golang.org/x/tools/gopls@latest
   ```

4. **Restart Neovim**

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

### Development

| Tool          | Description                      |
|---------------|----------------------------------|
| `gopls`       | Go language server               |
| Treesitter    | Syntax highlighting for Go       |
| `vim-go`      | Go tools (linting, formatting)   |
| Tmux Navigator| Seamless Tmux-Neovim navigation  |

## Usage

- **Start Neovim**: `nvim`
- **Update Plugins**: `:PackerSync`

