{ pkgs, ... }:
{
  environment.systemPackages = [ ];

  services.nix-daemon.enable = true;
  system.stateVersion = 4;

  homebrew = {
    enable = true;
    casks = [
      "hammerspoon"
      "google-japanese-ime"
      "alacritty"
    ];
  };
}
