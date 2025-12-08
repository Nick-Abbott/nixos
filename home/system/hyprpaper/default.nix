{ ... }:

let
  wallpaper = "cartoon-landscape.jpeg";
  wallpaperPath = "hypr/wallpaper/${wallpaper}";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      "$img" = "$HOME/.config/${wallpaperPath}";

      ipc = "on";
      splash = false;

      preload = ''$img'';
      wallpaper = '', $img'';
    };
  };

  home.file.".config/${wallpaperPath}".source = builtins.toPath (./wallpapers + "/${wallpaper}");
}
  
