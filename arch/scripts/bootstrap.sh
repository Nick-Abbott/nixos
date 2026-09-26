#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

echo "==> installing packages"
"$ROOT_DIR/install-packages.sh"

echo "==> enabling services"
"$ROOT_DIR/enable-services.sh"

echo "==> post-install notes"
"$ROOT_DIR/post-install.sh"
