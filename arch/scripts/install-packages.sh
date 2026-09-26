#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
PACMAN_LISTS=(
  "$ROOT_DIR/packages/pacman-base.txt"
  "$ROOT_DIR/packages/pacman-desktop.txt"
  "$ROOT_DIR/packages/pacman-dev.txt"
  "$ROOT_DIR/packages/pacman-gaming.txt"
  "$ROOT_DIR/packages/pacman-apps.txt"
)
AUR_LISTS=(
  "$ROOT_DIR/packages/aur-desktop.txt"
  "$ROOT_DIR/packages/aur-workstation.txt"
  "$ROOT_DIR/packages/aur-gaming.txt"
)

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "missing required command: $1" >&2
    exit 1
  }
}

read_pkg_file() {
  local file="$1"
  sed -e 's/#.*$//' -e '/^[[:space:]]*$/d' "$file"
}

collect_packages() {
  local -n files_ref="$1"
  local -a collected=()
  local file

  for file in "${files_ref[@]}"; do
    [[ -f "$file" ]] || continue
    while IFS= read -r pkg; do
      collected+=("$pkg")
    done < <(read_pkg_file "$file")
  done

  printf '%s\n' "${collected[@]}"
}

install_pacman_packages() {
  mapfile -t pkgs < <(collect_packages PACMAN_LISTS | awk '!seen[$0]++')
  if ((${#pkgs[@]} == 0)); then
    echo "no pacman packages listed"
    return
  fi

  echo "installing pacman packages"
  sudo pacman -Syu --needed "${pkgs[@]}"
}

ensure_aur_helper() {
  if command -v yay >/dev/null 2>&1; then
    return
  fi

  echo "yay not found; installing yay"
  local tmpdir
  tmpdir="$(mktemp -d)"
  trap 'rm -rf "$tmpdir"' RETURN
  git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
  (
    cd "$tmpdir/yay"
    makepkg -si --noconfirm
  )
}

install_aur_packages() {
  mapfile -t pkgs < <(collect_packages AUR_LISTS | awk '!seen[$0]++')
  if ((${#pkgs[@]} == 0)); then
    echo "no AUR packages listed"
    return
  fi

  ensure_aur_helper
  echo "installing AUR packages"
  yay -S --needed "${pkgs[@]}"
}

main() {
  require_cmd git
  require_cmd sudo
  require_cmd pacman

  install_pacman_packages
  install_aur_packages
}

main "$@"
