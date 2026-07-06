#!/usr/bin/env bash
# Symlink the dotfiles in this repo into their expected locations.
# Idempotent: existing non-symlink targets are backed up to <target>.bak.<timestamp>.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STAMP="$(date +%Y%m%d%H%M%S)"

link() {
  local src="$1" dst="$2"

  # Already the correct symlink? nothing to do.
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "ok    $dst -> $src"
    return
  fi

  # Something already there (file, dir, or wrong symlink)? back it up.
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    echo "backup $dst -> $dst.bak.$STAMP"
    mv "$dst" "$dst.bak.$STAMP"
  fi

  mkdir -p "$(dirname "$dst")"
  ln -s "$src" "$dst"
  echo "link  $dst -> $src"
}

mkdir -p "$HOME/.config"

link "$DOTFILES/nvim"           "$HOME/.config/nvim"
link "$DOTFILES/wezterm"        "$HOME/.config/wezterm"
link "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"

# tmux plugin manager (tpm) — required for the plugins in .tmux.conf.
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "clone tpm -> ~/.tmux/plugins/tpm"
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
  echo "ok    ~/.tmux/plugins/tpm"
fi

cat <<'EOF'

Done. Remaining one-time steps:
  1. Launch nvim once  -> lazy.nvim installs plugins, Treesitter compiles
                          parsers, and Mason installs the LSP servers.
  2. In tmux, press  Ctrl-s  then  I  (capital i) to install tmux plugins.
EOF
