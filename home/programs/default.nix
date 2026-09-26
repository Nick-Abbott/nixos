{ pkgs, lib, ... }:

let
  modules = [
    "zsh"
    "git"
    "ghostty"
    "neovim"
    "ssh"
    "zen"
    "python"
  ];
in {
  imports = map
    (name: ./. + /${name}/default.nix)
    modules;

  programs.zoxide = {
    enable = true;
    options = [
      "--cmd cd"
    ];
  };
  programs.fzf.enable = true;
  programs.fd.enable = true;
  programs.jq.enable = true;
  programs.gh.enable = true;

  programs.btop = {
    enable = true;
    settings = {
      color_theme = "gruvbox_dark";
    };
  };

  home.packages = with pkgs; [
    google-chrome
    firefox
    spotify
    vesktop
    slack

    vscode
    windsurf
    jetbrains.idea
    insomnia

    imv  # Image viewer for Wayland
    mangohud
    labelImg
    ffmpeg
    piper-tts

    zulu21  # Java Zulu 21 JDK
    gradle

    # Playwright CLI + driver with packaged browsers (NixOS-friendly)
    playwright
    playwright-driver
  ];
}
