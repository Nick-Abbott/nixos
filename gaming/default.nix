{ ... }:

let
  modules = [
    "heroic"
    "steam"
  ];
in {
  imports = map
    (name: ./. + /${name}/default.nix)
    modules;

  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
}
