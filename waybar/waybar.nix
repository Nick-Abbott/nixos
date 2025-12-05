{
  enable = true;
  systemd.enable = true;
  settings = {
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
  };

  style = ''
    * {
      border: none;
      border-radius: 8;
      font-family: "JetbrainsMono Nerd Font";
      font-size: 16px;
      min-height: 20px;
    }

    window#waybar {
      background: transparent;
    }

    window#waybar.hidden {
      opacity: 0.2;
    }

    #window {
      margin-top: 6px;
      padding-left: 10px;
      padding-right: 10px;
      border-radius: 10px;
      transition: none;
      color: transparent;
      background: transparent;
    }

    #workspaces {
      margin-top: 6px;
      margin-left: 12px;
      font-size: 20px;
      font-weight: 500;
      margin-bottom: 0px;
      border-radius: 10px;
      background: #282828;
      /* default: background: #161320; */
      transition: none;
    }

    #workspaces button {
      transition: none;
      color: #fbf1c7;
      /* default: color: #b5e8e0; */
      background: transparent;
      border-radius: 2px;
    }

    #workspaces button.active {
      color: #fe8019;
    }

    #workspaces button:hover {
      transition: none;
      box-shadow: inherit;
      text-shadow: inherit;
      color: #d65d0e;
      border-color: #d65d0e;
      /* border-color: #e8a2af; */
      /* color: #e8a2af; */
    }

    #pulseaudio {
      margin-top: 6px;
      margin-left: 8px;
      padding-left: 10px;
      padding-right: 10px;
      margin-bottom: 0px;
      border-radius: 10px;
      transition: none;
      color: #1a1826;
      background: #fae3b0;
    }

    #clock {
      margin-top: 6px;
      margin-left: 8px;
      margin-right: 8px;
      padding-left: 10px;
      padding-right: 10px;
      margin-bottom: 0px;
      border-radius: 10px;
      transition: none;
      color: #161320;
      background: #8ec07c;
      /*default: background: #abe9b3; */
    }

    #memory {
      margin-top: 6px;
      margin-left: 8px;
      padding-left: 10px;
      margin-bottom: 0px;
      padding-right: 10px;
      border-radius: 10px;
      transition: none;
      color: #161320;
      background: #fabd2f;
      /*default: background: #ddb6f2; */
    }

    #cpu {
      margin-top: 6px;
      margin-left: 8px;
      padding-left: 10px;
      margin-bottom: 0px;
      padding-right: 10px;
      border-radius: 10px;
      transition: none;
      color: #161320;
      background: #b8bb26;
      /*default: background: #96cdfb; */
    }

    #custom-launcher {
      font-size: 24px;
      margin-top: 6px;
      margin-left: 8px;
      padding-left: 10px;
      padding-right: 5px;
      border-radius: 10px;
      transition: none;
      color: #fe8019;
      /*default: color: #89dceb; */
      background: #161320;
    }

    #custom-media {
      margin-top: 6px;
      margin-left: 8px;
      padding-left: 10px;
      padding-right: 10px;
      margin-bottom: 0px;
      border-radius: 10px;
      transition: none;
      color: #161320;
      background: #f2cdcd;
    }

    #tray{
      padding: 0px 5px;
      transition: all .3s ease;
    }
    #tray menu * {
      padding: 0px 5px;
      transition: all .3s ease; 
    }
    #tray menu separator {
      padding: 0px 5px;
      transition: all .3s ease; 
    }
  '';
}
