#!/usr/bin/env bash
set -euo pipefail

cat <<'EOF'
Post-install checklist
======================

System
- Set your user shell if needed: `chsh -s /bin/zsh`
- Add your user to useful groups:
  `sudo usermod -aG wheel,docker,video,input,network nabbott`
- Reboot after the initial package + service install.

Gaming
- Launch Steam once to let it finish runtime setup.
- Launch Heroic once and set your preferred Proton version.
- In Heroic, review per-game settings for GameMode, MangoHud, and Wine/Proton.

Desktop
- Hyprland, Waybar, Dunst, and Rofi packages are installed, but config files
  still need to be migrated from the Nix-managed setup into plain dotfiles.
- Ghostty, Git, Zsh, and Neovim configs also need migration into dotfiles.
- Use `pipx` for Python CLI tools that are not worth carrying as system packages.
- Use `npm`/`pnpm` only for tools you intentionally want managed in the JS ecosystem.

App choices
- `jetbrains-toolbox` is installed instead of directly packaging IntelliJ.
- `google-chrome`, `zen-browser-bin`, `vesktop-bin`, `slack-desktop`, and
  `windsurf` are AUR.
- `code` is intentionally not installed here yet; decide later whether you want
  the official repo package, `visual-studio-code-bin`, or only Windsurf.

Likely manual follow-up
- Fonts/theme/cursor config
- SSH signing setup
- Hyprland keybind/config conversion from Nix to flat config files
- Waybar and Rofi config conversion
EOF
