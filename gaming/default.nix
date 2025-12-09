{ ... }:

let
  modules = [
    "steam"
  ];
in {
  imports = map
    (name: ./. + /${name}/default.nix)
    modules;

  programs.gamemode.enable = true;
}