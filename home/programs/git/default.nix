{ ... }:

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
    };
  };
}
