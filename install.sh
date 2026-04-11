#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1"
  local dst="$2"

  if [ ! -f "$src" ]; then
    echo "skip: $src (not found)"
    return
  fi

  mkdir -p "$(dirname "$dst")"

  if [ -L "$dst" ]; then
    local current
    current="$(readlink "$dst")"
    if [ "$current" = "$src" ]; then
      echo "ok:   $dst (already linked)"
      return
    fi
    rm "$dst"
  elif [ -f "$dst" ]; then
    echo "back: $dst -> $dst.bak"
    mv "$dst" "$dst.bak"
  fi

  ln -s "$src" "$dst"
  echo "link: $dst -> $src"
}

# opencode
link "$SCRIPT_DIR/opencode/AGENTS.md" "$HOME/.config/opencode/AGENTS.md"
