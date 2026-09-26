# Arch Bootstrap

This directory scaffolds an Arch Linux setup that aims to recreate a system
similar to the current NixOS machine:

- Hyprland desktop
- PipeWire audio
- greetd + tuigreet login
- gaming tools: Steam, Heroic, GameMode, MangoHud, Gamescope
- dev tools: Neovim, VS Code, Git, Docker, Java/Gradle, Node
- everyday apps: Chrome, Firefox, Spotify, Vesktop, Slack, Ghostty

This is not intended to be fully reproducible in the Nix sense. The goal is:

- the same major tools exist
- the same services are enabled
- the same high-level desktop stack is present

Package philosophy:

- `pacman` for core system, desktop, drivers, runtimes, and repo-available apps
- AUR for missing desktop apps and proprietary binaries
- language package managers like `pipx`, `npm`, `pnpm`, `cargo`, etc. only for
  user tools that do not make sense as system packages

## Layout

- `packages/pacman-base.txt`: base system/runtime packages
- `packages/pacman-desktop.txt`: desktop/session/UI packages
- `packages/pacman-dev.txt`: workstation/dev packages
- `packages/pacman-gaming.txt`: gaming packages
- `packages/pacman-apps.txt`: normal repo desktop/workstation apps
- `packages/pacman-optional.txt`: intentionally excluded from default install
- `packages/aur-desktop.txt`: desktop AUR packages
- `packages/aur-workstation.txt`: workstation AUR packages
- `packages/aur-gaming.txt`: gaming AUR packages
- `scripts/install-packages.sh`: installs all packages
- `scripts/enable-services.sh`: enables system services
- `scripts/post-install.sh`: user-facing setup hints and optional steps
- `scripts/bootstrap.sh`: runs the standard sequence

## Usage

Run after base Arch install, networking, and a working sudo user are in place:

```bash
cd ~/nixos/arch
./scripts/bootstrap.sh
```

## Notes

- Some package names, especially AUR/browser/editor packages, may need tuning.
- This scaffold intentionally avoids partitioning and base-system installation.
- Existing Nix module files are not directly reusable as Arch dotfiles; this
  scaffold focuses on packages and services first.
- `pacman-optional.txt` is the holding area for things that may be useful but
  should not be installed by default until you decide you want them.
