# CLAUDE.md

Project-specific guidance for Claude when working in this repo. Read alongside the user's global `~/.claude/CLAUDE.md` — don't duplicate global rules here.

## What this is

Personal Neovim distribution, forked from [`dam9000/kickstart-modular.nvim`](https://github.com/dam9000/kickstart-modular.nvim). Lives at `~/.config/nvim-personal/` (not `~/.config/nvim/`) and is launched via `NVIM_APPNAME=nvim-personal nvim` so it runs side-by-side with any other Neovim config on the machine.

## ICP

Single user: Omar. No external consumers, no contributors, no users to "support". This is a personal scratch project in the sense of the `feature-skeptic.md` rule — the protocol's skip condition applies. Still, when adding plugins:

- Name what existing surface (kickstart spec or already-installed plugin) overlaps with the new plugin and recommend disabling one — two overlapping plugins is the most common source of drift in this repo.
- Keep `lua/custom/plugins/` small. New plugin? One file per plugin.

## Layout — where things go

| Concern | Location |
| :--- | :--- |
| Bootstrap | `init.lua` |
| Editor options | `lua/options.lua` |
| Non-plugin keymaps | `lua/keymaps.lua` |
| Lazy.nvim bootstrap | `lua/lazy-bootstrap.lua` |
| Plugin registry (which kickstart specs are enabled) | `lua/lazy-plugins.lua` |
| Upstream kickstart plugin specs — **do not edit** | `lua/kickstart/plugins/*.lua` |
| Personal plugin specs — **edit freely** | `lua/custom/plugins/*.lua` |
| Which-key group declarations | `lua/kickstart/plugins/which-key.lua` |

To disable a kickstart-bundled plugin, comment its `require 'kickstart.plugins.X'` line in `lua/lazy-plugins.lua` (or delete the file outright if it's never coming back, as was done for `neo-tree.lua`). Don't fork the kickstart file — that loses the upstream-update path.

To add a plugin, create `lua/custom/plugins/<name>.lua` returning a `LazySpec`. The `{ import = 'custom.plugins' }` line in `lazy-plugins.lua` picks it up automatically.

## Keymap conventions (enforced)

When adding or modifying keymaps anywhere in this repo, conform to these — they were established intentionally and an audit caught violations:

1. **Mnemonic brackets, case-mirrored.** Descriptions use `[X]` bracket notation where the bracketed letter's case matches the keypress case. Examples: `<leader>hs` → `'git [s]tage hunk'`, `<leader>hS` → `'git [S]tage buffer'`.
2. **Uppercase variant = broader scope of the same action.** `<leader>hs` (hunk) → `<leader>hS` (buffer); `<leader>hq` (this file) → `<leader>hQ` (all files). Do not use the uppercase variant for a *different* action — pick a different sub-key.
3. **Every new `<leader>X` sub-group must be declared in which-key.** Add `{ '<leader>X', group = '[X]Name' }` to the `spec` list in `lua/kickstart/plugins/which-key.lua`. An undeclared group shows ungrouped mappings in the popup and breaks visual consistency.
4. **Plugin keymaps live in the plugin spec's `keys = {}` block**, not in `lua/keymaps.lua`. Global / non-plugin keymaps go in `lua/keymaps.lua`.
5. **Every keymap must include a `desc`.** No exceptions — which-key needs it.

## LSP keymaps

`gr*` prefix (no leader) for LSP actions — follows Neovim 0.11+ defaults. Declared as the `gr` group in which-key. Don't add LSP actions under `<leader>l*`.

## Verifying changes

There are no automated tests. To verify a change:

```bash
NVIM_APPNAME=nvim-personal nvim
```

Then exercise the feature. For plugin changes: `:Lazy sync` first, then restart. For LSP changes: `:LspInfo` / `:LspLog`. For health: `:checkhealth kickstart`.

Lua formatting is enforced by stylua via the `Check Lua Formatting` GitHub Actions workflow. Run `stylua .` before committing.

## Don't

- Don't add a plugin that duplicates capability with one already installed without first naming what gets removed or disabled.
- Don't edit `lua/kickstart/plugins/*.lua` — comment out the import in `lazy-plugins.lua` and shadow with a custom spec instead.
- Don't introduce keymaps under `<leader>` without registering the sub-group in which-key.
- Don't add a `lazy-lock.json` ignore unless the user asks — see `.gitignore` for the current stance.
