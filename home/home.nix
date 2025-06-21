{ pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./neovim.nix
  ];

  home.packages = [
    pkgs.git
  ];

  xdg.configFile."hammerspoon/init.lua".source = ../hammerspoon/init.lua;

  home.stateVersion = "23.05";
}
