{ ... }:

{
  # Start an ssh-agent for this user session so keys stay unlocked.
  services.ssh-agent = {
    enable = true;
    # Keep unlocked keys cached until the agent stops (no time limit).
    defaultMaximumIdentityLifetime = null;
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings."*" = {
      ForwardAgent = false;
      AddKeysToAgent = "yes";
      Compression = false;
      ServerAliveInterval = 0;
      ServerAliveCountMax = 3;
      HashKnownHosts = false;
      UserKnownHostsFile = "~/.ssh/known_hosts";
      ControlMaster = "no";
      ControlPath = "~/.ssh/master-%r@%n:%p";
      ControlPersist = "no";
    };
    # Read private host details at runtime, outside the repo and Nix store.
    includes = [ "~/.ssh/config.local" ];
  };
}
