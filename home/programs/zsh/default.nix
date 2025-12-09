{ config, pkgs, lib, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dotDir = "${config.home.homeDirectory}/.config/zsh";
    history = {
      path = "${config.home.homeDirectory}/.config/zsh/.zsh_history";
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
    initContent =
      let
        early = lib.mkOrder 500 ''
          source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
          source ~/.config/zsh/.p10k.zsh
          if [[ -r "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
            source "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
          fi
        '';

        config = lib.mkOrder 550 ''
          setopt NO_BEEP
        '';

        final = lib.mkOrder 1500 ''
          fastfetch
        '';
      in lib.mkMerge [ early config final ];
  };

  home.file.".config/zsh/.p10k.zsh".source = ./p10k.zsh;

  home.packages = with pkgs; [
    zsh-powerlevel10k
    fastfetch
  ];

  programs.zoxide.enableZshIntegration = true;
  programs.fzf.enableZshIntegration = true;
  programs.ghostty.enableZshIntegration = true;
}
