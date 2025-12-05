{ pkgs, lib, ... }:

let
  homeDir = "/home/nabbott";
  configDir = homeDir + "/.config";
in {
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
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
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

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = "${configDir}/zsh";
    history = {
      path = "$HOME/.zsh_history";
      size = 10000;
      save = 10000;
      ignoreDups = true;
      ignoreAllDups = true;
      findNoDups = true;
      share = true;
      append = true;
      extended = true;
    };
    autocd = true;
    initContent = lib.mkOrder 500 "setopt NO_BEEP";
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings.theme = "Gruvbox Dark";
  };
}
