# CLAUDE.md

Project-specific guidance for Claude when working in this repo. Read alongside the user's global `~/.claude/CLAUDE.md` — don't duplicate global rules here.

## What this is

Personal Neovim distribution. Lives at `~/.config/nvim-personal/` (not `~/.config/nvim/`) and is launched via `NVIM_APPNAME=nvim-personal nvim` so it runs side-by-side with any other Neovim config on the machine.

## ICP

Single user: Omar. No external consumers, no contributors, no users to "support". This is a personal scratch project in the sense of the `feature-skeptic.md` rule — the protocol's skip condition applies. Still, when adding plugins:

- Name what existing surface (already-installed plugin) overlaps with the new plugin and recommend disabling one — two overlapping plugins is the most common source of drift in this repo.
- Keep `lua/plugins/` small. One file per plugin.

## Layout — where things go

| Concern | Location |
| :--- | :--- |
| Bootstrap | `init.lua` |
| Editor options | `lua/options.lua` |
| Non-plugin keymaps | `lua/keymaps.lua` |
| Lazy.nvim bootstrap | `lua/lazy-bootstrap.lua` |
| Lazy.nvim setup (single `{ import = 'plugins' }`) | `lua/lazy-plugins.lua` |
| All plugin specs — auto-discovered | `lua/plugins/*.lua` |
| Distribution health check | `lua/personal/health.lua` |
| Vimdoc help + keymap reference | `doc/nvim-personal.txt` |
| Which-key group declarations | `lua/plugins/which-key.lua` |

To add a plugin, drop a `LazySpec`-returning file into `lua/plugins/`. To remove one, delete its file. The single `{ import = 'plugins' }` line in `lua/lazy-plugins.lua` auto-discovers every spec.

## Keymap conventions (enforced)

When adding or modifying keymaps anywhere in this repo, conform to these — they were established intentionally and an audit caught violations:

1. **Mnemonic brackets, case-mirrored.** Descriptions use `[X]` bracket notation where the bracketed letter's case matches the keypress case. Examples: `<leader>hs` → `'git [s]tage hunk'`, `<leader>hS` → `'git [S]tage buffer'`.
2. **Uppercase variant = broader scope of the same action.** `<leader>hs` (hunk) → `<leader>hS` (buffer); `<leader>hq` (this file) → `<leader>hQ` (all files). Do not use the uppercase variant for a *different* action — pick a different sub-key.
3. **Every new `<leader>X` sub-group must be declared in which-key.** Add `{ '<leader>X', group = '[X]Name' }` to the `spec` list in `lua/plugins/which-key.lua`. An undeclared group shows ungrouped mappings in the popup and breaks visual consistency.
4. **Plugin keymaps live in the plugin spec's `keys = {}` block**, not in `lua/keymaps.lua`. Global / non-plugin keymaps go in `lua/keymaps.lua`.
5. **Every keymap must include a `desc`.** No exceptions — which-key needs it.
6. **When a keymap is added, removed, or renamed, update `doc/nvim-personal.txt`.** The doc is the canonical reference; out-of-date entries are worse than missing ones.

## LSP keymaps

`gr*` prefix (no leader) for LSP actions — follows Neovim 0.11+ defaults. Declared as the `gr` group in which-key. Don't add LSP actions under `<leader>l*`.

## Augroup naming

All autocommand groups defined in this config use the `personal-*` prefix (e.g., `personal-highlight-yank`, `personal-lsp-attach`). Keep this prefix for any new augroups — it keeps them collision-free and easy to grep for.

## Verifying changes

There are no automated tests. To verify a change:

```bash
NVIM_APPNAME=nvim-personal nvim
```

Then exercise the feature. For plugin changes: `:Lazy sync` first, then restart. For LSP changes: `:LspInfo` / `:LspLog`. For health: `:checkhealth nvim-personal`.

Lua formatting is enforced by stylua via the `Check Lua Formatting` GitHub Actions workflow. Run `stylua .` before committing.

## Don't

- Don't add a plugin that duplicates capability with one already installed without first naming what gets removed or disabled.
- Don't introduce keymaps under `<leader>` without registering the sub-group in which-key and updating `doc/nvim-personal.txt`.
- Don't create augroups without the `personal-*` prefix.
- Don't add a `lazy-lock.json` ignore unless the user asks — see `.gitignore` for the current stance.
