#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIST_DIR="$ROOT_DIR/dist"

required_paths=(
  "$ROOT_DIR/index.html"
  "$ROOT_DIR/README.md"
  "$ROOT_DIR/Surge"
)

for path in "${required_paths[@]}"; do
  if [[ ! -e "$path" ]]; then
    echo "Missing required path: $path" >&2
    exit 1
  fi
done

rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

cp "$ROOT_DIR/index.html" "$DIST_DIR/"
cp "$ROOT_DIR/README.md" "$DIST_DIR/"
cp -R "$ROOT_DIR/Surge" "$DIST_DIR/"

echo "Build complete: $DIST_DIR"
