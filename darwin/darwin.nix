{ pkgs, ... }:
{
  # Only install system-wide packages here. Git is managed via
  # home-manager in `home/home.nix`.
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
