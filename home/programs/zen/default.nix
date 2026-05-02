{ pkgs, ... }:

let
  # Pin to a specific revision for stability.
  zen = builtins.getFlake "github:0xc000022070/zen-browser-flake?rev=9968536e8ee4f715554dfc994b5399982bcec9e5";
  system = pkgs.stdenv.hostPlatform.system;
  fixedTwilightUnwrapped = zen.packages.${system}.twilight-unwrapped.overrideAttrs (_old: {
    src = pkgs.fetchzip {
      url = "https://github.com/zen-browser/desktop/releases/download/twilight-1/zen.linux-x86_64.tar.xz";
      hash = "sha256-JjWCryY9JXQ/alOmYYTRpwGPGMt39Z8JMvPMhjBR1HU=";
    };
  });
  fixedTwilight = pkgs.wrapFirefox fixedTwilightUnwrapped {};
in {
  imports = [
    zen.homeModules.twilight
  ];

  programs.zen-browser = {
    enable = true;
    package = fixedTwilight;
  };
}
