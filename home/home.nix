{ config, pkgs, lib, ... }:

{
  imports = [
    ./system/default.nix
    ./programs/default.nix
  ];

  home.stateVersion = "25.11";

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

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Images
      "image/png" = "imv.desktop";
      "image/jpeg" = "imv.desktop";
      "image/jpg" = "imv.desktop";
      "image/gif" = "imv.desktop";
      "image/webp" = "imv.desktop";
      "image/bmp" = "imv.desktop";

      # Web browser
      "text/html" = "zen-twilight.desktop";
      "x-scheme-handler/http" = "zen-twilight.desktop";
      "x-scheme-handler/https" = "zen-twilight.desktop";
      "x-scheme-handler/about" = "zen-twilight.desktop";
      "x-scheme-handler/unknown" = "zen-twilight.desktop";
      "application/pdf" = "zen-twilight.desktop";

      # Terminal
      "x-scheme-handler/terminal" = "com.mitchellh.ghostty.desktop";

      # Text/Code editors
      "text/plain" = "code.desktop";
      "text/x-python" = "code.desktop";
      "text/x-rust" = "code.desktop";
      "text/x-javascript" = "code.desktop";
      "text/x-typescript" = "code.desktop";
      "application/json" = "code.desktop";
      "application/xml" = "code.desktop";
      "text/x-java" = "idea-community.desktop";
      "text/x-kotlin" = "idea-community.desktop";
    };
  };

  accounts.calendar.basePath = "$HOME/.calendar";
}
