Here’s the updated, more concise `README.md`:

# Neovim Config (neox5)

Configuration for Neovim, optimized for Go development, with Rose Pine theme and Tmux integration.

## Prerequisites

- **Neovim**: Version 0.5 or higher
- **Packer**: Plugin manager, auto-installed if missing
- **Go**: [Install](https://golang.org/dl/) and add to `PATH`

## Installation

1. **Clone the Repository**  
   `git clone https://github.com/neox5/nvim ~/.config/nvim`

2. **Install Language Servers and Tools**

   | Language | Installation Command                                             | Description                           |
   |----------|------------------------------------------------------------------|---------------------------------------|
   | Go       | `go install golang.org/x/tools/gopls@latest`                     | Installs the Go language server       |

3. **Start Neovim**  
   Automatically installs plugins on the first start.

4. **Restart Neovim**  
   Restart to apply the configured theme.

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

### Development

| Tool          | Description                      |
|---------------|----------------------------------|
| `gopls`       | Go language server               |
| Treesitter    | Syntax highlighting for Go       |
| `vim-go`      | Go tools (linting, formatting)   |
| Tmux Navigator| Seamless Tmux-Neovim navigation  | 

This `README.md` is now concise, providing essential information without unnecessary verbosity.
