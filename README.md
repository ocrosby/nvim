# nvim

Omar's personal Neovim distribution — installed at `~/.config/nvim-personal/` and launched via `NVIM_APPNAME` so it runs side-by-side with any other Neovim configuration.

![Check Lua Formatting](https://github.com/ocrosby/nvim/actions/workflows/stylua.yml/badge.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE.md)

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Development](#development)
- [Contributing](#contributing)
- [License](#license)

## Overview

This is a modular Neovim configuration. It is intentionally installed into `~/.config/nvim-personal/` rather than the default `~/.config/nvim/`, so it does not interfere with any other Neovim setup on the machine. You launch it by setting [`NVIM_APPNAME`](https://neovim.io/doc/user/starting.html#%24NVIM_APPNAME) before invoking `nvim`, which also redirects all runtime state (data, cache, state, logs) to matching `nvim-personal` subdirectories.

## Features

- Modular Lua layout: `lua/options.lua`, `lua/keymaps.lua`, `lua/lazy-bootstrap.lua`, `lua/lazy-plugins.lua`, with per-plugin specs auto-discovered from `lua/plugins/`
- Plugin management via [`lazy.nvim`](https://github.com/folke/lazy.nvim) with an auto-bootstrap step
- LSP via `nvim-lspconfig`, completion via `blink.cmp`, formatting via `conform.nvim`, linting via `nvim-lint`, and debugging via `nvim-dap`
- Telescope, Treesitter, gitsigns, todo-comments, which-key, and the `mini.nvim` suite preconfigured
- Tokyonight colourscheme and Neo-tree file explorer included
- Drop-in extension point at `lua/custom/plugins/init.lua` for personal additions

## Requirements

- Neovim **0.10+** (stable or nightly)
- `git`, `make`, `unzip`, and a C compiler (`gcc` or `clang`)
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) and [`fd-find`](https://github.com/sharkdp/fd)
- [tree-sitter CLI](https://github.com/tree-sitter/tree-sitter)
- A clipboard provider (`pbcopy` on macOS; `xclip`, `xsel`, or `win32yank` elsewhere)
- A [Nerd Font](https://www.nerdfonts.com/) (optional but recommended; set `vim.g.have_nerd_font = true` in `init.lua` if installed)

## Installation

This distribution is designed to live alongside any existing Neovim config, not replace it.

1. Clone the repository into `~/.config/nvim-personal/`:

   ```bash
   git clone https://github.com/ocrosby/nvim.git ~/.config/nvim-personal
   ```

2. (Optional) Add a shell alias so the `NVIM_APPNAME` prefix is implicit:

   ```bash
   echo "alias nvim-personal='NVIM_APPNAME=nvim-personal nvim'" >> ~/.zshrc
   source ~/.zshrc
   ```

3. Launch it once so `lazy.nvim` bootstraps and installs all plugins:

   ```bash
   NVIM_APPNAME=nvim-personal nvim
   ```

   The first launch downloads plugins into `~/.local/share/nvim-personal/`. Use `:Lazy` to inspect plugin status; press `q` to close the window.

## Usage

Run this distribution by setting `NVIM_APPNAME` to the config directory name:

```bash
NVIM_APPNAME=nvim-personal nvim
```

The general pattern for any side-by-side Neovim config installed at `~/.config/nvim-<name>/` is:

```bash
NVIM_APPNAME=nvim-<name> nvim
```

Setting `NVIM_APPNAME=nvim-<name>` redirects Neovim's runtime paths to:

| Path kind | Resolved location |
| :--- | :--- |
| Config | `~/.config/nvim-<name>/` |
| Data | `~/.local/share/nvim-<name>/` |
| State | `~/.local/state/nvim-<name>/` |
| Cache | `~/.cache/nvim-<name>/` |

This keeps every distribution fully isolated — plugins, shada, swap files, and lazy lockfiles never leak between configs.

To open a specific file:

```bash
NVIM_APPNAME=nvim-personal nvim path/to/file.lua
```

## Configuration

| Path | Purpose |
| :--- | :--- |
| `init.lua` | Entry point; loads options, keymaps, the lazy bootstrap, and plugin specs |
| `lua/options.lua` | Editor options (line numbers, indentation, clipboard, etc.) |
| `lua/keymaps.lua` | Global key mappings |
| `lua/lazy-bootstrap.lua` | Auto-clones `lazy.nvim` if missing |
| `lua/lazy-plugins.lua` | Registers plugin specs with `lazy.nvim` |
| `lua/plugins/` | One file per plugin spec; auto-discovered by lazy.nvim |
| `lua/personal/health.lua` | Health check — run `:checkhealth nvim-personal` |

Toggle distribution-level defaults such as `vim.g.have_nerd_font` in `init.lua`. To enable or disable a plugin, add or delete its file under `lua/plugins/`.

## Development

Format Lua files with [StyLua](https://github.com/JohnnyMorganz/StyLua) before committing:

```bash
stylua .
```

`.stylua.toml` at the repo root defines the formatting rules. The `Check Lua Formatting` GitHub Actions workflow enforces them on pull requests.

To run the distribution's bundled health check from inside Neovim:

```vim
:checkhealth nvim-personal
```

## Contributing

Issues and pull requests are welcome. Open a PR against `main` with one logical change per branch. Commit messages follow [Conventional Commits](https://www.conventionalcommits.org/).

## License

MIT — see [LICENSE.md](LICENSE.md).
