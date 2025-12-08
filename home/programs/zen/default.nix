{ ... }:

let
  zen = builtins.getFlake "github:0xc000022070/zen-browser-flake";
in {
  imports = [
    zen.homeModules.twilight
  ];

  programs.zen-browser = {
    enable = true;
  };
}