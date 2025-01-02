{ pkgs, ... }:
{
  imports = [
    ../../hm/direnv.nix
    ../../hm/git.nix
    ../../hm/nix.nix
    ../../hm/tools.nix
    ../../hm/neovim.nix
    ../../hm/zsh.nix
  ];

  home.packages = with pkgs; [
    gcc
    nodePackages_latest.nodejs
    nodePackages_latest.pnpm
  ];
}
