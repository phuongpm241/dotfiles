# Keybindings

A reference for every shortcut in this setup. Verified against the actual configs and Neovim 0.12 defaults.

**Legend**
- **tmux prefix** = `Ctrl-s` — press it, release, then press the next key.
- **Neovim leader** = `Space`.
- *Custom* = defined in this repo. *Default* = provided by the tool/plugin out of the box.

---

## tmux  (prefix = `Ctrl-s`)

| Keys | Action | Source |
|---|---|---|
| `Ctrl-s` | Prefix (all bindings below start with it unless noted) | custom |
| `prefix` → `r` | Reload `~/.tmux.conf` | custom |
| `prefix` → `h` | Select pane to the **left** | custom |
| `prefix` → `j` | Select pane **down** | custom |
| `prefix` → `u` | Select pane **up** | custom |
| `prefix` → `n` | Select pane to the **right** | custom |
| `prefix` → `s` | Prompt for a session name, create/attach it | custom |
| `prefix` → `I` | Install tmux plugins (tpm) | tpm |
| `prefix` → `U` | Update tmux plugins | tpm |
| `prefix` → `[` | Enter copy mode (then use vi motions) | default |
| `Ctrl-h` / `Ctrl-j` / `Ctrl-k` / `Ctrl-l` | Move between panes **without** prefix | vim-tmux-navigator |

**Copy mode** is vi-style (`mode-keys vi`): after `prefix [`, move with `h/j/k/l`, start selection with `v` (or `Space`), yank with `y` (or `Enter`), and `q` to quit.

> **Notes**
> - Pane selection uses `h/j/u/n` (not the usual `h/j/k/l`) — `u`=up, `n`=right, matching this config.
> - `vim-tmux-navigator` is installed on the **tmux** side, giving `Ctrl-h/j/k/l` pane movement. Its Neovim counterpart plugin is **not** installed, so inside Neovim those chords don't yet jump between splits — add `christoomey/vim-tmux-navigator` to nvim later if you want seamless nvim↔tmux navigation.

---

## Neovim — general

| Keys | Action | Source |
|---|---|---|
| `Space` | Leader key | custom |
| `<leader>cd` | Open file explorer (netrw `:Ex`) | custom |

---

## Neovim — Telescope (fuzzy finder)

| Keys | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search file contents — needs ripgrep) |
| `<leader>fb` | List open buffers |
| `<leader>fh` | Search help tags |

**Inside a Telescope picker** (default mappings):

| Keys | Action |
|---|---|
| `Ctrl-n` / `Ctrl-p` (or `↓` / `↑`) | Next / previous result |
| `Enter` | Open selection |
| `Ctrl-x` | Open in a horizontal split |
| `Ctrl-v` | Open in a vertical split |
| `Ctrl-t` | Open in a new tab |
| `Ctrl-u` / `Ctrl-d` | Scroll the preview up / down |
| `Tab` | Toggle multi-selection |
| `Esc` (normal) / `Ctrl-c` | Close the picker |

---

## Neovim — LSP  (Neovim 0.12 built-in defaults)

Active when a language server is attached to the buffer.

| Keys | Action |
|---|---|
| `K` | Hover documentation |
| `grn` | Rename symbol |
| `gra` | Code action (works in normal & visual mode) |
| `grr` | List references |
| `gri` | Go to implementation |
| `grt` | Go to type definition |
| `grx` | Run codelens |
| `gO` | Document symbols |
| `Ctrl-s` *(insert mode)* | Signature help |
| `]d` / `[d` | Next / previous diagnostic |
| `Ctrl-w` `d` | Show diagnostic under the cursor in a float |

> **Notes**
> - There is **no default mapping for go-to-definition** (`gd` is unmapped). To add it: `vim.keymap.set('n', 'gd', vim.lsp.buf.definition)`.
> - The insert-mode `Ctrl-s` signature help is shadowed by tmux's `Ctrl-s` prefix when Neovim runs inside tmux — tmux captures it first.

---

## Neovim — completion (native `vim.lsp.completion`)

Autocompletion triggers automatically as you type in insert mode.

| Keys | Action |
|---|---|
| `Ctrl-n` / `Ctrl-p` | Next / previous completion item |
| `Ctrl-y` | Accept the highlighted item |
| `Ctrl-e` | Dismiss the completion menu |
| `Ctrl-x` `Ctrl-o` | Manually trigger LSP (omni) completion |

---

## Neovim — netrw file explorer

Opened via `<leader>cd`. Useful built-in keys:

| Keys | Action |
|---|---|
| `Enter` | Open file / enter directory |
| `-` | Go up one directory |
| `%` | Create a new file (then press `i` to type in it) |
| `d` | Create a new directory |
| `D` | Delete the file/directory under the cursor |
| `R` | Rename |
| `Ctrl-l` | Refresh the listing |

> Reminder: after `%` creates a new file you land in **Normal** mode — press `i` to start typing.

---

## Handy commands (not keybindings)

| Command | What it does |
|---|---|
| `:Lazy` | Plugin manager UI (install / update / sync) |
| `:Mason` | Manage LSP server binaries |
| `:TSUpdate` | Update / install Treesitter parsers |
| `:checkhealth` | Diagnose config issues (`:checkhealth vim.lsp` for LSP) |
| `:Telescope` | Browse all Telescope pickers |
