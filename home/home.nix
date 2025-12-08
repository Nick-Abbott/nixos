{ pkgs, lib, ... }:

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

  accounts.calendar.basePath = "$HOME/.calendar";
}
