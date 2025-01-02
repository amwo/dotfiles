{ pkgs, ... }:
{
  home.packages = with pkgs; [
    bat
    fd
    fzf
    gh
    jq
    nh
    ripgrep
    unzip
  ];
}
