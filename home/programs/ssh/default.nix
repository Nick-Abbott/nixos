{ ... }:

{
  # Start an ssh-agent for this user session so keys stay unlocked.
  services.ssh-agent = {
    enable = true;
    # Cache unlocked keys for 4 hours when they are first added.
    defaultMaximumIdentityLifetime = 14400;
    enableZshIntegration = true;
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
        AddKeysToAgent yes
        IdentityFile ~/.ssh/id_ed25519
    '';
  };
}
