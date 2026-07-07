# dotfiles

Personal terminal setup for macOS: **WezTerm** (terminal) + **tmux** (multiplexer) + **Neovim** (editor). Clone onto a new machine, run one script, and get the same environment.

## Folder structure

```
dotfiles/
├── README.md
├── install.sh              # symlinks everything into place (idempotent)
├── .gitignore
├── nvim/                   # → symlinked to ~/.config/nvim
│   ├── init.lua            # entrypoint: loads config/* then plugins
│   ├── lazy-lock.json      # pinned plugin versions (committed on purpose)
│   └── lua/
│       ├── config/
│       │   ├── options.lua     # editor options (numbers, shiftwidth, completeopt)
│       │   ├── keybinds.lua    # leader = <Space>, netrw toggle
│       │   └── lazy.lua        # bootstraps the lazy.nvim plugin manager
│       └── plugins/
│           ├── colors.lua      # tokyonight theme + lualine statusline
│           ├── telescope.lua   # fuzzy finder (needs ripgrep)
│           ├── treesitter.lua  # syntax parsers (needs tree-sitter CLI)
│           ├── lsp.lua         # Mason + nvim-lspconfig + native completion
│           ├── obsidian.lua    # obsidian.nvim — Obsidian vault integration
│           └── vimfugitive.lua # git integration
├── wezterm/                # → symlinked to ~/.config/wezterm
│   ├── wezterm.lua         # references the wallpaper via wezterm.config_dir
│   └── mainwallpaper.jpeg  # background image (travels with the config)
└── tmux/
    └── .tmux.conf          # → symlinked to ~/.tmux.conf
```

## Prerequisites

Install [Homebrew](https://brew.sh) first, then the Xcode command-line tools (provide `cc`/`make`, needed to build the `telescope-fzf-native` plugin):

```sh
xcode-select --install
```

Then the packages:

```sh
brew install neovim tmux ripgrep tree-sitter-cli go node git gh
brew install --cask wezterm
```

| Dependency | Why it's needed |
|---|---|
| `neovim` (≥ 0.12) | Editor. The LSP and Treesitter configs use APIs that require 0.11+/0.12. |
| `wezterm` (cask) | The terminal emulator. |
| `tmux` (≥ 3.x) | Terminal multiplexer. |
| `ripgrep` | Backend for Telescope's `live_grep` (`<leader>fg`). Without it, live grep errors. |
| `tree-sitter-cli` | Compiles the Treesitter language parsers. The `main`-branch nvim-treesitter shells out to this binary. |
| `go` | Mason builds the `gopls` language server from source with `go install`. |
| `node` / `npm` | Mason installs the `pyright`, `ts_ls` (typescript), and `vimls` language servers via npm. |
| `git` | Cloning this repo, tpm, and plugin managers. |
| `gh` | GitHub CLI, used to create/push the repo (optional after first setup). |

### Installed automatically — no manual `brew`/`npm` needed

These bootstrap themselves the first time you launch the apps:

- **lazy.nvim** — the Neovim plugin manager self-installs on first `nvim` launch (see `nvim/lua/config/lazy.lua`), then installs all plugins.
- **Treesitter parsers** — compiled on first launch for: lua, vim, vimdoc, markdown, markdown_inline, typescript, javascript, python, go.
- **LSP servers via Mason** — `ensure_installed` pulls: `lua_ls`, `vimls`, `marksman`, `ts_ls`, `pyright`, `gopls`. (Requires `node` and `go` to be present.)
- **tmux plugins** — `install.sh` clones tpm; you then press `prefix + I` inside tmux to install `vim-tmux-navigator` and `dracula/tmux`.

## Install on a new machine

```sh
git clone git@github.com:phuongpm241/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

Then:

1. **Launch `nvim`** and wait — lazy.nvim installs plugins, Treesitter compiles parsers, and Mason installs the language servers. Run `:Lazy` and `:Mason` to watch progress. Restart nvim once it's done.
2. **Start `tmux`** and press **`Ctrl-s`** then **`I`** (capital i) to install the tmux plugins.

`install.sh` is safe to re-run — anything already in place is backed up to `<target>.bak.<timestamp>` before the symlink is created.

## Making changes (daily workflow)

Because the configs are **symlinked** into place, editing them at their usual paths (`~/.config/nvim/…`, `~/.config/wezterm/wezterm.lua`, `~/.tmux.conf`) edits the files *inside this repo* directly. To save your changes:

```sh
cd ~/dotfiles
git add -A
git commit -m "describe the change"
git push
```

On another machine, `git pull` and the symlinks pick up the changes immediately.

## Future upgrades

Optional tweaks to make the neo-tree sidebar behave even more like VSCode/Cursor. Both live in `nvim/lua/plugins/neo-tree.lua`:

- **Auto-reveal the active file** — flip `follow_current_file.enabled = true`. The sidebar then highlights and scrolls to whichever file you're editing (VSCode's "reveal active file" behavior).
- **Auto-open the sidebar on startup** — add a `VimEnter` autocmd that runs `:Neotree show left` so the tree is already docked when nvim launches, instead of toggle-only. For example:

  ```lua
  vim.api.nvim_create_autocmd('VimEnter', {
      callback = function() vim.cmd('Neotree show left') end,
  })
  ```

Both are intentionally left off by default to keep startup fast and Vim-like.

## Key mappings

See **[KEYBINDINGS.md](KEYBINDINGS.md)** for the full reference (tmux, Neovim, Telescope, LSP, completion, file tree, tabs). Quick highlights:

- **Neovim leader**: `<Space>`. `<leader>e` toggle file-tree sidebar, `<leader>ff` find files, `<leader>fg` live grep. `Shift-h`/`Shift-l` switch editor tabs.
- **LSP** (Neovim 0.12 defaults): `K` hover, `grn` rename, `gra` code action, `grr` references, `]d`/`[d` diagnostics. Completion auto-triggers; accept with `Ctrl-y`.
- **tmux prefix**: `Ctrl-s`. `prefix + r` reloads config; `h`/`j`/`u`/`n` switch panes; `prefix + $` renames the session; `prefix + I` installs plugins.
