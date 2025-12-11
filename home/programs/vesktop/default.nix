{ ... }:

{
  programs.vesktop = {
    enable = true;

    # optional but nice to be explicit
    vencord.useSystem = true;

    vencord.settings = {
      # Make Vencord always use system (dunst) notifications
      notifications = {
        useNative = "always";   # "not-focused" is the default
        timeout   = 5000;
        position  = "top-right";  # Vencord’s own popup position, independent of dunst
      };

      # Enable the Vencord Settings plugin so the missing UI appears in Discord’s settings
      plugins.Settings.enabled = true;
    };
  };
}