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
  };
}
