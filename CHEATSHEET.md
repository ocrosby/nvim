# 🧠 Neovim Keymap Cheatsheet

Now when you open a .py file ruff should lint it automatically
<leader>f on a .py file should use ruff to format it if there are no syntax errors

## Leader Keys
- `<Space>` → Leader key
- `\` → Local leader key

---

## File Management
| Keymap          | Action                             |
|-----------------|------------------------------------|
| `<leader>w`     | Save file                          |
| `<leader>q`     | Quit window                        |
| `<leader>s`     | Quick save                         |
| `<leader>nf`    | New file at NvimTree location      |
| `<leader>bd`    | Delete current buffer              |
| `<leader>ba`    | Close all buffers except current   |

---

## NvimTree
| Keymap        | Action                                        |
|---------------|-----------------------------------------------|
| `<leader>e`   | Toggle focus between NvimTree and editor      |

---

## Window Navigation & Resizing
| Keymap         | Action                       |
|----------------|-------------------------------|
| `<leader>h`    | Move to left window            |
| `<leader>j`    | Move to bottom window          |
| `<leader>k`    | Move to top window             |
| `<leader>l`    | Move to right window           |
| `<C-Up>`       | Increase window height         |
| `<C-Down>`     | Decrease window height         |
| `<C-Left>`     | Decrease window width          |
| `<C-Right>`    | Increase window width          |

---

## Buffer Navigation
| Keymap         | Action          |
|----------------|-----------------|
| `<Tab>`        | Next buffer     |
| `<S-Tab>`      | Previous buffer |

---

## Visual Mode Editing
| Keymap | Action                       |
|--------|------------------------------|
| `J`    | Move selected lines down     |
| `K`    | Move selected lines up       |

---

## Smarter Scrolling
| Keymap  | Action                  |
|---------|-------------------------|
| `J`     | Join lines (keep cursor) |
| `<C-d>` | Scroll down and center   |
| `<C-u>` | Scroll up and center     |

---

## Yank to Clipboard
| Keymap         | Action                       |
|----------------|-------------------------------|
| `<leader>y`    | Yank whole buffer to clipboard |

---

## Search Enhancements
| Keymap         | Action                       |
|----------------|-------------------------------|
| `<leader>nh`   | Clear search highlights       |
| `<leader>sc`   | Toggle search case sensitivity |

---

## Line Numbers
| Keymap         | Action                    |
|----------------|----------------------------|
| `<leader>ln`   | Toggle relative line numbers |

---

## Spell Check
| Keymap         | Action              |
|----------------|---------------------|
| `<leader>sp`   | Toggle spell check   |

---

## Telescope
| Keymap         | Action                |
|----------------|-----------------------|
| `<leader>gb`   | Git branches           |
| `<leader>ps`   | Grep for string        |

---

## Git (Neogit)
| Keymap         | Action              |
|----------------|---------------------|
| `<leader>gg`   | Open Neogit          |
| `<leader>gc`   | Commit with Neogit   |
| `<leader>gp`   | Push with Neogit     |
| `<leader>gl`   | Pull with Neogit     |

---

## Trouble (Diagnostics)
| Keymap         | Action                         |
|----------------|---------------------------------|
| `<leader>xx`   | Toggle Trouble                  |
| `<leader>xw`   | Workspace diagnostics           |
| `<leader>xd`   | Document diagnostics            |
| `<leader>xr`   | LSP references                  |
| `<leader>xl`   | Location list                   |
| `<leader>xq`   | Quickfix list                   |

---

## Treesitter Incremental Selection
| Keymap         | Action                       |
|----------------|-------------------------------|
| `gnn`          | Initialize selection          |
| `grc`          | Scope incremental             |
| `grm`          | Node decremental              |

---

## Copilot
| Keymap          | Action                       |
|-----------------|-------------------------------|
| `<C-J>` (Insert) | Accept Copilot suggestion    |
| `<C-K>` (Insert) | Dismiss Copilot suggestion   |
| `<C-Space>` (Insert) | Trigger Copilot completion |
| `<leader>cp`    | Toggle Copilot                |

---

## Codesnap
| Keymap         | Action                      |
|----------------|------------------------------|
| `<leader>cs`   | Take CodeSnap Screenshot (Visual mode) |

---

## DAP (Debugging)
| Keymap         | Action              |
|----------------|---------------------|
| `<F5>`         | Start/Continue Debugging |
| `<F10>`        | Step Over            |
| `<F11>`        | Step Into            |
| `<F12>`        | Step Out             |
| `<leader>db`   | Toggle Breakpoint    |
| `<leader>dr`   | Open REPL             |

---

## Harpoon
| Keymap         | Action                          |
|----------------|----------------------------------|
| `<leader>ha`   | Add file to Harpoon              |
| `<leader>h1`   | Navigate to Harpoon file 1       |
| `<leader>h2`   | Navigate to Harpoon file 2       |
| `<leader>h3`   | Navigate to Harpoon file 3       |
| `<leader>h4`   | Navigate to Harpoon file 4       |

---

## Obsidian.nvim
| Keymap         | Action                  |
|----------------|--------------------------|
| `<leader>oo`   | Open Obsidian note        |
| `<leader>ot`   | Open today's note         |
| `<leader>on`   | Create a new note         |
| `<leader>os`   | Search notes              |
| `<leader>ob`   | Show backlinks            |
| `<leader>ol`   | Create link to another note |
| `<leader>of`   | Follow link               |

---

## Zen Mode
| Keymap         | Action                  |
|----------------|--------------------------|
| `<leader>zz`   | Toggle Zen Mode          |
| `<leader>zq`   | Toggle Zen Mode + quit   |

---

## Pomo.nvim (Pomodoro Timer)
| Keymap         | Action                  |
|----------------|--------------------------|
| `<leader>ps`   | Start Pomodoro timer     |
| `<leader>pp`   | Pause Pomodoro timer     |
| `<leader>pr`   | Resume Pomodoro timer    |
| `<leader>pe`   | End Pomodoro timer       |

---

## Quickfix List Navigation
| Keymap         | Action                    |
|----------------|----------------------------|
| `<leader>cn`   | Next quickfix item          |
| `<leader>cp`   | Previous quickfix item      |

---

## Session Management
| Keymap         | Action                  |
|----------------|--------------------------|
| `<leader>ss`   | Save session             |
| `<leader>sl`   | Load session             |