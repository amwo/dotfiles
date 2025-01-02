{ pkgs, ... }:
{
  imports = [
    ../../hm/cli/direnv.nix
    ../../hm/cli/git.nix
    ../../hm/cli/nix.nix
    ../../hm/cli/tools.nix
    ../../hm/cli/neovim
    ../../hm/cli/zsh
  ];

  home.packages = with pkgs; [
    gcc
    nodePackages_latest.nodejs
    nodePackages_latest.pnpm
    rust-bin.stable.latest.default
  ];
}
