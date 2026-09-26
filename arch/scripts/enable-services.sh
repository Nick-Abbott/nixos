#!/usr/bin/env bash
set -euo pipefail

required_services=(
  NetworkManager
  greetd
  fstrim.timer
)

# These are useful on many desktops, but not every machine needs them.
optional_services=(
  bluetooth
  cups.socket
  docker.socket
  fwupd-refresh.timer
)

enable_if_present() {
  local unit="$1"
  if systemctl list-unit-files "$unit" >/dev/null 2>&1; then
    echo "enabling optional unit: $unit"
    sudo systemctl enable "$unit"
  else
    echo "skipping missing optional unit: $unit"
  fi
}

echo "enabling required system services"
sudo systemctl enable "${required_services[@]}"

echo "enabling optional system services when available"
for unit in "${optional_services[@]}"; do
  enable_if_present "$unit"
done

cat <<'EOF'

Notes
=====
- PipeWire, PipeWire Pulse, WirePlumber, and RTKit are not enabled here.
  On a typical Arch desktop, PipeWire/WirePlumber are user-session services and
  RTKit is D-Bus activated when needed.
- If you want Docker always running, swap `docker.socket` for `docker.service`.
- If you do not use Bluetooth or printing, disable or remove those units.
EOF

echo "service enablement complete"
