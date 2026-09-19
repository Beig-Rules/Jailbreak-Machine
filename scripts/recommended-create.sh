#!/usr/bin/env bash
# Jailbreak Machine — recommended one-shot creator
# Usage: ./scripts/recommended-create.sh [vm-name] [variant]
# Default: myphone + jb

set -euo pipefail

NAME="${1:-myphone}"
VARIANT="${2:-jb}"

echo "==> Jailbreak Machine recommended create"
echo "    VM name : $NAME"
echo "    Variant : $VARIANT"
echo

if ! command -v vphone-cli >/dev/null 2>&1; then
  echo "Error: vphone-cli not found in PATH."
  echo "Build the upstream tool first (see README / docs/QUICKSTART.md)."
  exit 1
fi

echo "==> Creating VM (full pipeline)..."
vphone-cli vm create "$NAME" -V "$VARIANT"

echo
echo "==> Done."
echo "Launch with:"
echo "  vphone-cli vm launch $NAME"
echo
echo "SSH (after boot):"
echo "  ssh -p 22222 mobile@<vm-ip>   # password: alpine"
