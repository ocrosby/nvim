# 🧠 Neovim Keymap Cheat Sheet

Now when you open a .py file ruff should lint it automatically
<leader>f on a .py file should use ruff to format it if there are no syntax errors


## 🏁 Leader Key
| Mode | Mapping        | Action                      |
|------|----------------|-----------------------------|
| n    | `<Space>`      | Sets space as leader key    |

---

## 📁 File Explorer
| Mode | Mapping     | Action                         |
|------|-------------|--------------------------------|
| n    | `<leader>e` | Open `:NvimTree` file explorer |

---

## 🔁 Move Lines in Visual Mode
| Mode | Mapping | Action                           |
|------|---------|----------------------------------|
| v    | `J`     | Move selected lines **down**     |
| v    | `K`     | Move selected lines **up**       |

---

## 🧪 Testing
| Mode | Mapping    | Action                     |
|------|------------|----------------------------|
| n    | `<leader>tf`| Run Plenary tests for file |

---

## ✂️ Smart Joins and Scrolling
| Mode | Mapping   | Action                          |
|------|-----------|---------------------------------|
| n    | `J`       | Join lines, keep cursor        |
| n    | `<C-d>`   | Half-page down + center screen |
| n    | `<C-u>`   | Half-page up + center screen   |

---

## 🔍 Better Search Navigation
| Mode | Mapping | Action                         |
|------|---------|--------------------------------|
| n    | `n`     | Next match, center screen      |
| n    | `N`     | Previous match, center screen  |

---

## 🧹 Format Paragraph
| Mode | Mapping | Action                       |
|------|---------|------------------------------|
| n    | `=ap`   | Format paragraph, restore pos |

---

## 🔄 LSP
| Mode | Mapping      | Action            |
|------|--------------|-------------------|
| n    | `<leader>zig`| Restart LSP server |

---

## 👯 Vim-With-Me (Pair Programming)
| Mode | Mapping       | Action                      |
|------|---------------|-----------------------------|
| n    | `<leader>vwm` | Start Vim-With-Me           |
| n    | `<leader>svwm`| Stop Vim-With-Me            |

---

## 🧠 Clipboard & Paste
| Mode | Mapping    | Action                             |
|------|------------|------------------------------------|
| x    | `<leader>p`| Paste without overwriting clipboard|
| n/v  | `<leader>y`| Yank to system clipboard           |
| n    | `<leader>Y`| Yank line to system clipboard      |
| n/v  | `<leader>d`| Delete without affecting clipboard |

---

## 💡 Insert Mode Tweaks
| Mode | Mapping | Action         |
|------|---------|----------------|
| i    | `<C-c>` | Escape insert  |

---

## 🚫 Disable Unwanted Behavior
| Mode | Mapping | Action            |
|------|---------|-------------------|
| n    | `Q`     | Disable `Q` command|

---

## 🖥️ Tmux Integration
| Mode | Mapping | Action                           |
|------|---------|----------------------------------|
| n    | `<C-f>` | Launch `tmux-sessionizer` window |

---

## 🧼 Code Formatting
| Mode | Mapping     | Action                     |
|------|-------------|----------------------------|
| n    | `<leader>f` | Format buffer using Conform|

---

## 🧭 Quickfix/Location List Navigation
| Mode | Mapping     | Action                   |
|------|-------------|--------------------------|
| n    | `<C-k>`     | Next quickfix entry      |
| n    | `<C-j>`     | Previous quickfix entry  |
| n    | `<leader>k` | Next location list entry |
| n    | `<leader>j` | Prev location list entry |

---

## 🔁 Search & Replace Word Under Cursor
| Mode | Mapping     | Action                                   |
|------|-------------|------------------------------------------|
| n    | `<leader>s` | Search & replace current word globally   |

---

## 🔓 Make File Executable
| Mode | Mapping     | Action              |
|------|-------------|---------------------|
| n    | `<leader>x` | `chmod +x` on file  |

---

## 🧑‍💻 Go Error Handling Snippets
| Mode | Mapping     | Inserted Snippet                                 |
|------|-------------|--------------------------------------------------|
| n    | `<leader>ee`| `if err != nil { return err }`                  |
| n    | `<leader>ea`| `assert.NoError(err, "")`                        |
| n    | `<leader>ef`| `log.Fatalf("error: %s", err.Error())`           |
| n    | `<leader>el`| `logger.Error("error", "error", err)`            |

---

## 🌧️ Fun Plugin - Cellular Automaton
| Mode | Mapping     | Action                    |
|------|-------------|---------------------------|
| n    | `<leader>ca`| Run "make it rain" effect |

---

## 🔁 Reload Config
| Mode | Mapping         | Action              |
|------|------------------|---------------------|
| n    | `<leader><leader>`| Source current file |
