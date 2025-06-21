{ pkgs, ... }:
{
  imports = [
    ../pkgs/zsh.nix
    ../pkgs/neovim.nix
    ../pkgs/git.nix
  ];

  home.packages = [ ];

  xdg.configFile."hammerspoon/init.lua".source = ../hammerspoon/init.lua;

  home.stateVersion = "23.05";
}
