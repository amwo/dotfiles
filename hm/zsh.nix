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
      ls = "ls -a";
      rl = "exec $SHELL -l";
      vi = "nvim";
      dc = "docker compose";

      dfc = "df -h | grep '/dev'";
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
	export PROMPT="${PWD##*/}@${:-%m}${vcs_info_msg_0_} ~ "


	autoload -Uz vcs_info
	zstyle ":vcs_info:*" formats "%s: %b"
	zstyle ":vcs_info:*" actionformats "%s: %b (%a)"
	
	PROMPT="
	%F{blue}[%~]%f %1(v|%F{green}%1v%f|)
	%(?.%F{yellow}%}.%F{red})$%f "

	zstyle ":completion:*' matcher-list 'm:{a-z}={A-Z}"
	zstyle ":vcs_info:git:*' formats ' (%b)"
      '';
  };
}
