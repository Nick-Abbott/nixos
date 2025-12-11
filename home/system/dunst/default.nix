{ ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 500;
        height = "(0,300)";
        font = "JetBrainsMono Nerd Font 16";

        background = "#1d2021";
        foreground = "#ebdbb2";

        frame_width = 2;
        frame_color = "#665c54";
        separator_color = "frame";
        separator_height = 2;

        padding = 12;
        horizontal_padding = 16;
        line_height = 0;
        offset = "20x40";
        alignment = "left";
        vertical_alignment = "center";

        corner_radius = 8;
        transparency = 0;
        icon_position = "left";
        max_icon_size = 128;
        min_icon_size = 64;

        mouse_left_click = "do_action, close_current";
        mouse_middle_click = "close_current";
        mouse_right_click = "close_all";

        show_indicators = true;
      };

      urgency_low = {
        background = "#32302f";
        foreground = "#bdae93";
        frame_color = "#504945";
        timeout = 4;
      };

      urgency_normal = {
        background = "#1d2021";
        foreground = "#ebdbb2";
        frame_color = "#665c54";
        timeout = 10;
      };

      urgency_high = {
        background = "#1d2021";
        foreground = "#fbf1c7";
        frame_color = "#fb4934";
        timeout = 0;
      };
    };
  };
}
