{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
  
    baseIndex = 1;
    clock24 = true;
    escapeTime = 1;
    historyLimit = 5000;
    keyMode = "vi";
    newSession = false;
    prefix = "C-z";
    shell = pkgs.lib.getExe pkgs.zsh;
    terminal = "screen-256color";
    extraConfig = ''
        set -g status-justify centre
        set -g window-status-format "◯"
        set -g window-status-current-format "●"
        set-option -g status-bg "colour0"
        set-option -g status-fg "colour255"
        set-option -g status-left ""
        set-option -g status-right ""
    '';
  };
}
