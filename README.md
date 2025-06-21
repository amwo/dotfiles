# Dotfiles managed with Nix

This repository provides a minimal setup using `flake-parts`, `home-manager` and `nix-darwin`.

## Usage

### Home Manager

```sh
nix develop
nh home switch .
```

### macOS (nix-darwin)

```sh
nix run nix-darwin -- switch --flake .
```

Homebrew is used for GUI applications such as Hammerspoon, Google Japanese Input and Alacritty.
