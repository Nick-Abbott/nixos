{ pkgs, lib, ... }:

let
  modules = [
    "hyprland"
    "hyprpaper"
    "waybar"
    "dunst"
    "rofi"
  ];
in {
  imports = map
    (name: ./. + /${name}/default.nix)
    modules;
}
