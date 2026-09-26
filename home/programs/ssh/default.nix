{ ... }:

{
  # Start an ssh-agent for this user session so keys stay unlocked.
  services.ssh-agent = {
    enable = true;
    # Keep unlocked keys cached until the agent stops (no time limit).
    defaultMaximumIdentityLifetime = null;
    enableZshIntegration = true;
  };

  programs.ssh = {
    enable = true;
    matchBlocks."*".addKeysToAgent = "yes";
    # Read private host details at runtime, outside the repo and Nix store.
    includes = [ "~/.ssh/config.local" ];
  };
}
