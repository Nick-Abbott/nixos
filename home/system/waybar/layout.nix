{
  mainBar = {
    layer = "top";
    modules-left = [ "custom/launcher" "cpu" "memory" ];
    modules-center = [ "hyprland/workspaces" ];
    modules-right = [ "tray" "pulseaudio" "clock" ];

    pulseaudio = {
      format = "{icon} {volume:3d}%";
      format-bluetooth = "{icon} {volume:3d}%";
      format-muted = " {volume:3d}%";
      format-icons = {
        headphones = "";
        default = [
          ""
          ""
        ];
      };
      scroll-step = 5;
      on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      on-click-right = "pavucontrol";
    };

    clock = {
      format = "{:%I:%M %p}";
      tooltip = false;
    };

    cpu = {
      interval = 15;
      format = "  {}%";
      max-length = 10;
      on-click = "ghostty -e btop";
    };

    memory = {
      interval = 30;
      format = "  {}%";
      max-length = 10;
      on-click = "ghostty -e btop";
    };

    "custom/launcher" = {
      format = " ";
      on-click = "rofi -show drun";
    };

    "hyprland/workspaces" = {
      format = "{icon}";
      on-click = "activate";
      sort-by-number = true;
      format-icons = {
        active = "";
        default = "";
        empty = "";
      };
      persistent-workspaces = {
        "*" = [ 1 2 3 ];
      };
    };

    tray = {
      icon-size = 20;
    };
  };
}
