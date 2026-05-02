{ config, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      user = {
        email = "nick.abbott67@gmail.com";
        name = "Nick-Abbott";
      };
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.config/git/allowed_signers";
      # Use a wrapper that loads the key into ssh-agent with a 4h cache on first sign.
      gpg.ssh.program = "${config.home.homeDirectory}/.local/bin/git-ssh-sign";
      user.signingKey = "~/.ssh/id_ed25519.pub";
    };
  };

  # Allow Git to verify SSH-signed commits with your public key.
  home.file.".config/git/allowed_signers".text = ''
    nick.abbott67@gmail.com ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBMCyAjE4ABspxCO9DkFrsewdZTwwdYYpt1bqDr90C8L
  '';

  # Wrapper that auto-loads your SSH key into the agent on first commit/tag sign,
  # caching it for 4h, then defers to the real ssh-keygen.
  home.file.".local/bin/git-ssh-sign" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      set -euo pipefail

      key="$HOME/.ssh/id_ed25519"
      # Fingerprint of key file
      fp=$(ssh-keygen -lf "$key" | awk '{print $2}')

      # If agent missing the key, add with 4h lifetime (ssh-agent default is set via HM).
      if ! ssh-add -l 2>/dev/null | grep -q "$fp"; then
        ssh-add -t 4h "$key"
      fi

      exec ssh-keygen -Y sign "$@"
    '';
  };
}
