# NeoVim

My personal neovim settings.

Neovim is a customizable text and code editor based on the Vim text editor. Neovim aims to provide Vim’s fast and versatile user experience, but with enhanced extensibility, usability and features.

## Directory Structure

```plaintext
~/.config/nvim/
├── init.lua                     <-- Root entry point
└── lua/
    └── omar/
        ├── init.lua             <-- Loads your config modules

        ├── core/                <-- General core editor settings
        │   ├── options.lua
        │   ├── keymaps.lua
        │   └── autocmds.lua     <-- (Optional) for autocommands

        ├── plugins/             <-- Plugin management
        │   ├── init.lua         <-- lazy.nvim bootstrap + load all plugin modules
        │   └── modules/         <-- Actual plugin declarations
        │       ├── lsp.lua
        │       ├── completion.lua
        │       ├── ui.lua
        │       ├── tools.lua
        │       └── python.lua   <-- (Optional) Python-specific plugins

        ├── config/              <-- Plugin-specific configuration
        │   ├── lsp.lua
        │   ├── cmp.lua
        │   ├── treesitter.lua
        │   ├── null-ls.lua
        │   ├── telescope.lua
        │   ├── nvimtree.lua
        │   └── lualine.lua

        └── utils/               <-- Helper functions (optional)
            └── functions.lua
```

## How is Neovim different than Vim?

While Neovim is built as an extension of Vim, it has a few key differences:

- Neovim uses Lua for its code interface, while Vim uses Vimscript.
- Neovim requires installation, while Vim is installed by default on most Unix systems.
- Neovim includes all features from the start, while Vim has optional features.
- Both Neovim and Vim offer robust plugin support, though Neovim has an enhanced graphical user interface (GUI) ecosystem and a more active development community.
- Both Neovim and Vim have plugins that are compatible with each other, though both also have plugins that are only Neovim-compatible or only Vim-compatible.

## Setup

The repository contains a file `init.lua`. This is the main configuration file that is needed.  In addition, there are a few other files. To use this configuration, you would copy all these files into your `nvim` directory.

## References

- [LunarVim](https://github.com/LunarVim/LunarVim)
- [Kickstart.vim](https://github.com/nvim-lua/kickstart.nvim)
- [AstroNvim](https://github.com/AstroNvim/AstroNvim?ref=playfulpython.com)
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [Programming in Lua](https://www.lua.org/pil/contents.html?ref=playfulpython.com)
- [Neovim Configuration for Beginners](https://builtin.com/software-engineering-perspectives/neovim-configuration)
- [NeoVim Full Setup Guide](https://youtu.be/JWReY93Vl6g)
