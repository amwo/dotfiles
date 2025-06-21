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

## Modules

Configuration modules for Git, Zsh, and Neovim live in the `pkgs` directory:

- `pkgs/git.nix` manages Git with Home Manager
- `pkgs/zsh.nix` contains Zsh settings
- `pkgs/neovim.nix` configures Neovim

These modules are imported by `home/home.nix`.
