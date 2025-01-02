{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      sudo = "sudo ";

      c = "cargo";
      g = "git";
      m = "make";
      s = "screen";
      t = "tmux";
      v = "nvim";

      gs = "git status";
      ls = "ls -a";
      rl = "exec $SEHLL -l";
      vi = "nvim";
      dc = "docker compose";

      dfc = "df | grep 1p2";
      cat = "bat";
      vim = "nvim";
      dci = "docker run --rm -it";

      grep = "rg";
    }

    initExtra =
      ''
        export EDITOR="nvim"
        export NIXPKGS_ALLOW_UNFREE=1
        export TERM=xterm-256color
      '';
}
