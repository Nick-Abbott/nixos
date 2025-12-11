{ pkgs, lib, ... }:

let
  modules = [
    "zsh"
    "git"
    "ghostty"
    "neovim"
    "zen"
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
    jetbrains.idea-community

    imv  # Image viewer for Wayland
  ];
}

