{ pkgs, ... }:
{
  imports = [
    ../pkgs/zsh.nix
    ../pkgs/neovim.nix
  ];

  # Manage Git through home-manager
  programs.git = {
    enable = true;
    package = pkgs.git;
  };

  home.packages = [ ];

  xdg.configFile."hammerspoon/init.lua".source = ../hammerspoon/init.lua;

  home.stateVersion = "23.05";
}
