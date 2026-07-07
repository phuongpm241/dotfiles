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
| `prefix` → `h` | Select pane **left** | custom |
| `prefix` → `j` | Select pane **right** | custom |
| `prefix` → `u` | Select pane **up** | custom |
| `prefix` → `n` | Select pane **down** | custom |
| `prefix` → `H` | Resize pane **left** (repeatable — keep tapping) | custom |
| `prefix` → `J` | Resize pane **right** (repeatable) | custom |
| `prefix` → `U` | Resize pane **up** (repeatable) | custom |
| `prefix` → `N` | Resize pane **down** (repeatable) | custom |
| `prefix` → `s` | Prompt for a session name, create/attach it | custom |
| `prefix` → `$` | Rename the current session | default |
| `prefix` → `I` | Install tmux plugins (tpm) | tpm |
| `prefix` → `[` | Enter copy mode (then use vi motions) | default |
| `Ctrl-h` / `Ctrl-j` / `Ctrl-k` / `Ctrl-l` | Move between panes **without** prefix | vim-tmux-navigator |

**Direction scheme**: lowercase `h/j/u/n` selects panes, uppercase `H/J/U/N` resizes them — both map to **left / right / up / down** respectively. Resize bindings are repeatable (`-r`): after the prefix you can tap the key several times within ~0.5s to keep nudging the border.

**Copy mode** is vi-style (`mode-keys vi`): after `prefix [`, move with `h/j/k/l`, start selection with `v` (or `Space`), yank with `y` (or `Enter`), and `q` to quit.

> **Notes**
> - `prefix + U` is **reclaimed for resize**, overriding tpm's default "update plugins" binding. To update tmux plugins now, run `~/.tmux/plugins/tpm/bin/update_plugins all` (installing new ones with `prefix + I` still works).
> - `vim-tmux-navigator` is installed on the **tmux** side, giving `Ctrl-h/j/k/l` pane movement. Its Neovim counterpart plugin is **not** installed, so inside Neovim those chords don't yet jump between splits — add `christoomey/vim-tmux-navigator` to nvim later if you want seamless nvim↔tmux navigation.

---

## Neovim — general

| Keys | Action | Source |
|---|---|---|
| `Space` | Leader key | custom |
| `<leader>e` | Toggle the file-tree sidebar (neo-tree) | custom |
| `<leader>cd` | Open file explorer (netrw `:Ex`) — legacy fallback | custom |

---

## Neovim — file tree & editor tabs (neo-tree + bufferline)

The neo-tree sidebar docks on the **left** and is toggle-only (it never opens on startup). Open files show as tabs across the top via bufferline.

| Keys | Action | Source |
|---|---|---|
| `<leader>e` | Toggle the file-tree sidebar | custom |
| `Shift-l` | Next editor tab | custom |
| `Shift-h` | Previous editor tab | custom |
| `<leader>bd` | Close the current buffer/tab | custom |

**Inside the neo-tree sidebar** (common default keys): `Enter` open, `a` add file (`a` then a trailing `/` makes a directory), `d` delete, `r` rename, `c` copy, `x` cut, `p` paste, `R` refresh, `H` toggle hidden files, `?` show all mappings.

> `Shift-h` / `Shift-l` override Vim's default `H` / `L` (jump to top / bottom of the visible screen) in normal mode.

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

## Obsidian (obsidian.nvim)

Commands (active in markdown files inside the vault). Completion for `[[wiki-links]]`, tags, etc. is served by the built-in `obsidian-ls` LSP and appears in the native completion menu.

| Command | What it does |
|---|---|
| `:Obsidian new` | Create a new note (in the vault root) |
| `:Obsidian today` | Open/create today's daily note (`Areas/SecondBrain/`) |
| `:Obsidian template` | Insert a template from the `templates/` folder |
| `:Obsidian search` | Grep the vault (via Telescope) |
| `:Obsidian quick_switch` | Fuzzy-jump to a note (via Telescope) |
| `:Obsidian follow_link` | Follow the link under the cursor |
| `:Obsidian backlinks` | Show notes linking to the current one |
| `:Obsidian toggle_checkbox` | Toggle a `- [ ]` / `- [x]` checkbox |

Vault: `~/obsidian_vault`.

---

## Handy commands (not keybindings)

| Command | What it does |
|---|---|
| `:Lazy` | Plugin manager UI (install / update / sync) |
| `:Mason` | Manage LSP server binaries |
| `:TSUpdate` | Update / install Treesitter parsers |
| `:checkhealth` | Diagnose config issues (`:checkhealth vim.lsp` for LSP) |
| `:Telescope` | Browse all Telescope pickers |
