{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    completionInit = "autoload -U compinit && compinit -u";
    defaultKeymap = "emacs";
    envExtra = ''
      export NIX_PATH=$HOME/.nix-defexpr/channels

      if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
        . ~/.nix-profile/etc/profile.d/nix.sh
      fi
    '';

    enableCompletion = true;

    shellAliases = {
      c = "cargo";
      g = "git";
      m = "make";
      t = "tmux";

      gs = "git status";
      ls = "ls -a";
      reload = "exec $SHELL -l";
      dc = "docker compose";

      dfc = "df -h | grep '^/dev'";
      cat = "bat";
      dci = "docker run --rm -it";

      grep = "rg";

      v = "nvim";
      vi = "nvim";
      vim = "nvim";
    };

    initExtra = ''
      export EDITOR="nvim"
      export NIXPKGS_ALLOW_UNFREE=1
      export TERM=xterm-256color

      autoload -Uz vcs_info
      precmd() { vcs_info }

      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
      zstyle ':vcs_info:git:*' formats ' (%b)'
      zstyle ':vcs_info:*' enable git
      zstyle ':vcs_info:git:*' formats '%b'
      zstyle ':vcs_info:git:*' actionformats '%b|%a'

      setopt PROMPT_SUBST

      export PROMPT="%C ~ "

      #if type rg &> /dev/null; then
        export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git'"
      #fi
    '';
  };
}

