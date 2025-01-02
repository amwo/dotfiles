{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      c = "cargo";
      g = "git";
      m = "make";
      t = "tmux";
      v = "nvim";

      gs = "git status";
      ls = "ls -lh";
      rl = "exec $SHELL -l";
      vi = "nvim";
      dc = "docker compose";

      dfc = "df -h | grep '^/dev'";
      cat = "bat";
      vim = "nvim";
      dci = "docker run --rm -it";

      grep = "rg";
    };

    initExtra =
      ''
        export EDITOR="nvim"
        export NIXPKGS_ALLOW_UNFREE=1
        export TERM=xterm-256color

        autoload -Uz vcs_info
        precmd() { vcs_info }
        setopt prompt_subst

        zstyle ":vcs_info:git:*" formats " (%b)"
        zstyle ":vcs_info:*" enable git

        # Customize the prompt
        export PROMPT="${PWD##*/}@${:-%m}${vcs_info_msg_0_} ~ "
      '';
  };
}

