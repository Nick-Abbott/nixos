{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
    withRuby = true;
    withPython3 = true;

    extraPackages = with pkgs; [
      ripgrep
      fd
    ];
  };

  # enable once config is stable
  # home.file.".config/nvim".source = ./config;
}
