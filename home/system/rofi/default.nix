{ ... }:

let
  theme = "gruvbox-material/theme.rasi";
  themePath = "rofi/${theme}";
in {
  programs.rofi = {
    enable = true;
    theme = "~/.config/${themePath}";
    extraConfig = {
      display-ssh = "";
      display-run = "";
      display-drun = "";
      display-window = "";
      display-combi = "";
      show-icons = true;
    };
  };

  home.file.".config/${themePath}".source = builtins.toPath (./themes + "/${theme}");
}
