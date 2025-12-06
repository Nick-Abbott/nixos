{ pkgs, lib, ... }:

let
  homeDir = "/home/nabbott";
  configDir = homeDir + "/.config";
  zen = builtins.getFlake "github:0xc000022070/zen-browser-flake";
in {
  imports = [
    zen.homeModules.twilight
  ];

  home.stateVersion = "25.11";
  home.username = "nabbott";
  home.homeDirectory = homeDir;

  systemd.user.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  wayland.windowManager.hyprland = import ./hypr/hyprland.nix;
  services.hyprpaper = import ./hypr/hyprpaper.nix;
  services.dunst = import ./dunst/dunst.nix;

  programs.waybar = import ./waybar/waybar.nix;
  programs.rofi = import ./rofi/rofi.nix;

  programs.zsh = import ./zsh/zsh.nix { inherit pkgs lib configDir; };
  home.file.".config/zsh/.p10k.zsh".source = ./zsh/p10k.zsh;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.zen-browser = {
    enable = true;
  };

  home.packages = with pkgs; [
    google-chrome
    firefox
    spotify
    vesktop
    slack
    vscode

    btop
    grim
    slurp
    wl-clipboard
    fastfetch

    zsh-powerlevel10k
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.capitaine-cursors;
    name = "capitaine-cursors";
    size = 42;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark";
      package = pkgs.gruvbox-gtk-theme;
    };
  };

  accounts.calendar.basePath = "$HOME/.calendar";

  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "nick.abbott67@gmail.com";
        name = "Nick-Abbott";
      };
      init.defaultBranch = "main";
    };
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings.theme = "Gruvbox Dark";
  };
}
