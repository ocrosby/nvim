# NeoVim

My personal neovim settings.

For a rundown of my keymaps check out my [cheatsheet](CHEATSHEET.md).

Neovim is a customizable text and code editor based on the Vim text editor. 
Neovim aims to provide Vim’s fast and
versitile user experience, but with enhanced extensibility, usability and 
features.

## Prerequisites

```shell
brew install ripgrep # Required for telescope
brew install shellcheck # Required for null-ls
brew install pngpaste # Required for obsidian
```

## Getting Started 

Getting started with a custom neovim configuration is difficult. Looking 
through the various tutorials and articles out there I found that none did 
a good job of explaining what all this lua configuration junk was about, 
until I found [Neovim for Newbs](https://typecraft.dev/neovim-for-newbs). I 
would strongly recommend that anyone interested in customizing neovim read 
through that article and watch the videos that are linked in it. It is a great 
introduction to neovim configuration in lua.

### Generating a new cheatsheet

In copilot enter the following:

```plaintext
I have updated my Neovim keymaps, here they are:

(paste my keymaps here as Lua)

Please generate a PDF cheatsheet with the following requirements:
- Group the keymaps into logical categories (e.g., Buffer Management, Window Navigation, Git, Search, etc.)
- Place the most commonly used keymaps first (Core Navigation, Save/Quit, Buffer Switching, etc.)
- Each logical group should start a new page, with a clear title at the top.
- Use a clean, one-column layout for each page.
- Font size should be readable (~11pt or so).
- The file should be optimized for printing on a single-sided 8.5"x11" (Letter) or A4 page per group.
- Final output should be a downloadable PDF.

When building the groupings, prioritize:
1. Core Navigation (Save, Quit, Move windows, Buffers, Splits)
2. Search, Editing, and Clipboard
3. Git, Diagnostics, and Testing
4. Advanced Tools (Debugging, Harpoon, Codesnap, Obsidian, Pomodoro, Copilot)

Please return only a download link to the finished PDF.
```

## Installing Nerd Fonts

```shell
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git ~/.nerd-fonts
id ~/.nerd-fonts
./install.sh Hack  # or FiraCode, JetBrainsMono, etc.
```

That will install a full patched font set to your local font directory.
Warning: It takes a minute!

Update yoru Ghostty config:

```toml
# ~/.config/ghostty/config
font-family = "JetBrainsMono Nerd Font"
```

## Setup Copilot

In order to setup copilot execute the following command in neovim:

```shell
:Copilot setup
```

Verify authentication after completing the setup:

```shell
:Copilot status
```

If you need to re-authenticate Copilot in the future you can simply re-run the setup command.


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

## How is Neovim different from Vim?

While Neovim is built as an extension of Vim, it has a few key differences:

- Neovim uses Lua for its code interface, while Vim uses Vimscript.
- Neovim requires installation, while Vim is installed by default on most Unix systems.
- Neovim includes all features from the start, while Vim has optional features.
- Both Neovim and Vim offer robust plugin support, though Neovim has an enhanced graphical user interface (GUI) ecosystem and a more active development community.
- Both Neovim and Vim have plugins that are compatible with each other, though both also have plugins that are only Neovim-compatible or only Vim-compatible.



## Setup

Backing up a previous config

```shell
mv ~/.config/nvim ~/.config/nvim.bak
rm -rf ~/.local/share/nvim
```


```shell
brew install neovim
```

While editing `.config/nvim/init.lua`, you can use the following command to reload the configuration:

```shell
:source ~/.config/nvim/init.lua
```

or if you have the `~/.config/nvim/init.load` file open you can

```shell
:source %
```

The result will be that nvim will reload its configuration.


1. The init.lua file

The convention is that it goes in `'~.config/nvim/init.lua`
nvim will automatically load this file

2. Choose an install package manager (lazy.nvim)
3. Install our first package (Colorscheme)
4. Fuzzy finding file and grepping through your codebase (Telescope)
5. Highlighting and indenting (Treesitter)


The repository contains a file `init.lua`. This is the main configuration file that is needed.  In addition, there are a few other files. To use this configuration, you would copy all these files into your `nvim` directory.

## Resetting Plugins for Lazy.nvim

If you want to reset the plugins for lazy.nvim, you can do so by running the following commands:

```shell
# Delete the lazy directory inside ~/.local/share/nvim:
# Optionally, you can also clear the ~/.local/state/nvim directory, which may store additional state data:
rm -rf ~/.local/share/nvim/lazy && rm -rf ~/.local/state/nvim
```

Restart Neovim. Lazy.nvim will detect the missing data and re-install the plugins automatically.

## Components

### [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it.

---

### [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)

A file explorer for Neovim written in Lua.

---

### [Telescope](https://github.com/nvim-telescope/telescope.nvim)

A highly extendable fuzzy finder over lists.

---

### [DAP (Debug Adapter Protocol)](https://github.com/mfussenegger/nvim-dap)

A Debug Adapter Protocol client implementation.

---

### [Gitsigns](https://github.com/lewis6991/gitsigns.nvim)

Deep buffer integration for Git.

---

### [Trouble](https://github.com/folke/trouble.nvim)

A pretty list for showing diagnostics, references, telescope results, quickfix and location lists to help you solve all the trouble your code is causing.

---

### [Zen Mode](https://github.com/folke/zen-mode.nvim)

Distraction-free coding for Neovim.

---

### [Neogit](https://github.com/NeogitOrg/neogit)

A git interface for Neovim that is fast and easy to use.

---

### [Lualine](https://github.com/nvim-lualine/lualine.nvim)

A blazing fast and easy to configure Neovim statusline written in Lua.

### [Catppuccin Color Scheme](https://github.com/catppuccin/nvim)

### Shortcuts

Find Files `Ctrl + p` or `<leader>ff`
Live Grep `<leader>fg`


## References

- [Nerd Fonts](https://www.nerdfonts.com/)
- [LunarVim](https://github.com/LunarVim/LunarVim)
- [Kickstart.vim](https://github.com/nvim-lua/kickstart.nvim)
- [AstroNvim](https://github.com/AstroNvim/AstroNvim?ref=playfulpython.com)
- [LazyVim](https://github.com/LazyVim/LazyVim)
- [Lazy Site](https://lazy.folke.io/)
- [Programming in Lua](https://www.lua.org/pil/contents.html?ref=playfulpython.com)
- [Neovim Configuration for Beginners](https://builtin.com/software-engineering-perspectives/neovim-configuration)
- [NeoVim Full Setup Guide](https://youtu.be/JWReY93Vl6g)
- [The perfect Neovim setup for Python](https://www.youtube.com/watch?v=4BnVeOUeZxc&pp=ygUNbmVvdmltIHB5dGhvbg%3D%3D)
- [Python in Neovim](https://www.youtube.com/watch?v=IobijoroGE0&pp=ygUNbmVvdmltIHB5dGhvbg%3D%3D)
- [How to Setup Neovim To Make It Amazing in 2024](https://www.youtube.com/watch?v=6pAG3BHurdM&t=29s&pp=ygUNbmVvdmltIHB5dGhvbtIHCQl-CQGHKiGM7w%3D%3D)
- [Full Neovim Setup from Scratch in 2025](https://www.youtube.com/watch?v=KYDG3AHgYEs&t=58s&pp=ygUNbmVvdmltIHB5dGhvbg%3D%3D)
- [Python in Neovim](https://www.youtube.com/watch?v=jWZ_JeLgDxU&pp=ygUNbmVvdmltIHB5dGhvbg%3D%3D)
- [Debug Pythgon in Neovim](https://www.youtube.com/watch?v=tfC1i32eW3A&pp=ygUNbmVvdmltIHB5dGhvbg%3D%3D)
- [Neovim for Newbs](https://typecraft.dev/neovim-for-newbs)
- [Neovim Lua Guide](https://github.com/nanotee/nvim-lua-guide)
- [ThePrimeagen](https://github.com/ThePrimeagen/init.lua)
- [0 to LSP: Neovim RC From Scratch](https://www.youtube.com/watch?v=w7i4amO_zaE)
