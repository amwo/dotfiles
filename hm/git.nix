{
  programs.git = {
    enable = true;
    userName = "amwo";
    userEmail = "tsushimori@gmail.com";

    delta.enable = true;

    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.gh = {
    enable = true;
  };
}
