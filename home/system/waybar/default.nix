{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = import ./layout.nix;
    style = builtins.readFile ./style.css;
  };
}
