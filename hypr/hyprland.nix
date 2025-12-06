{
  enable = true;
  package = null;
  portalPackage = null;
  systemd.enable = true;

  settings = {
    "$mod"      = "SUPER";
    "$terminal" = "ghostty";
    "$browser"  = "zen";
    "$editor"   = "code";
    "$editor2"  = "idea";
    "$aiEditor" = "windsurf";
    "$chat1"    = "vesktop";
    "$chat2"    = "slack";

    monitor = [ "DP-3, 5120x2160@120, 0x0, 1" ];

    env = [
      "XCURSOR_THEME,capitaine-cursors"
      "XCURSOR_SIZE,42"
    ];

    input = {
      kb_layout = "us";
      follow_mouse = 1;
    };

    general = {
      layout = "dwindle";
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;
      "col.active_border" = "rgba(5e81acff) rgba(81a1c1ff) 45deg";
      "col.inactive_border" = "rgba(595959aa)";

      resize_on_border = false;
      allow_tearing = false;
    };

    dwindle = {
      force_split = 2;
      pseudotile = true;
      preserve_split = true;
      split_width_multiplier = 2;
    };

    decoration = {
      rounding = 10;
      active_opacity = 1.0;
      inactive_opacity = 0.9;
      blur = {
        enabled = "yes";
        size = 12;
        passes = 1;
      };
      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
        color = "rgba(1a1a1aee)";
      };
    };

    animations = {
      enabled = "yes";
      bezier = [
        "easeOutQuint,0.23,1,0.32,1"
        "easeInOutCubic,0.65,0.05,0.36,1"
        "linear,0,0,1,1"
        "almostLinear,0.5,0.5,0.75,1.0"
        "quick,0.15,0,0.1,1"
      ];

      animation = [
        "global,        1, 10,   default"
        "border,        1, 5.39, easeOutQuint"
        "windows,       1, 4.79, easeOutQuint"
        "windowsIn,     1, 4.1,  easeOutQuint, popin 87%"
        "windowsOut,    1, 1.49, linear,       popin 87%"
        "fadeIn,        1, 1,    almostLinear"
        "fadeOut,       1, 1,    almostLinear"
        "fade,          1, 1.5,  quick"
        "layers,        1, 3.81, easeOutQuint"
        "layersIn,      1, 4,    easeOutQuint, fade"
        "layersOut,     1, 1.5,  linear, fade"
        "fadeLayersIn,  1, 1.79, almostLinear"
        "fadeLayersOut, 1, 1.39, almostLinear"
        "workspaces,    1, 1,    almostLinear, fade"
        "workspacesIn,  1, 1,    almostLinear, fade"
        "workspacesOut, 1, 1,    almostLinear, fade"
      ];
    };

    windowrulev2 = [
      "workspace 2, class:^(code|Code|idea|jetbrains-idea-cte|jetbrains-rustrover)$"
      "workspace 3, class:^(discord|vesktop|Slack|slack)$"
      "workspace 3, class:^(Spotify)"
      "workspace 4, class:^(steam)$"
    ];

    layerrule = [
      "dimaround, rofi"
    ];

    exec-once = [
      "nm-applet"
      "blueman-applet"
      "systemctl --user start hyprpolkitagent"
    ];

    bind = [
      "$mod, RETURN, exec, $terminal"
      "$mod, B, exec, $browser"
      "$mod, C, exec, $editor"
      "$mod, I, exec, $editor2"
      "$mod, W, exec, $aiEditor"
      "$mod, D, exec, rofi -show drun"
      "$mod, X, exec, $chat1"
      "$mod|SHIFT, X, exec, $chat2"
      "$mod, S, exec, steam"
      "$mod, M, exec, spotify"

      "$mod, LEFT,  movefocus, l"
      "$mod, RIGHT, movefocus, r"
      "$mod, UP,    movefocus, u"
      "$mod, DOWN,  movefocus, d"

      "$mod|SHIFT, LEFT,  movewindow, l"
      "$mod|SHIFT, RIGHT, movewindow, r"
      "$mod|SHIFT, UP,    movewindow, u"
      "$mod|SHIFT, DOWN,  movewindow, d"
      "$mod|SHIFT, S,     layoutmsg,  togglesplit"

      "$mod, L, layoutmsg, orientationcycle"
      ''$mod, Y, exec, hyprctl keyword general:layout "$(hyprctl getoption general:layout | grep -q 'dwindle' && echo 'master' || echo 'dwindle')''
      "$mod, F, fullscreen, 1"
      "$mod, SPACE, togglefloating"

      "$mod, P, exec, playerctl play-pause"

      "$mod, Q, killactive"

      "$mod, O, exec, grim - | wl-copy"
      ''$mod|SHIFT, O, exec, grim -g "$(slurp)" - | wl-copy''
      ''$mod|ALT, O, exec, grim ~/Pictures/screenshot-$(date +%F-%T).png''
      ''$mod|SHIFT|ALT, O, exec, grim -g "$(slurp)" ~/Pictures/screenshot-$(date +%F-%T).png''
    ]
    ++ (
      builtins.concatLists (builtins.genList (i:
        let ws = i + 1;
        in [
          "$mod, code:1${toString i}, workspace, ${toString ws}"
          "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
        ]
      )
      9)
    );

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];
  };
}
