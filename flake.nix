 {
  description = "am's environment.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs:
    let
      allSystems = [
        "aarch64-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = inputs.nixpkgs.lib.genAttrs allSystems;
    in
    {
      homeConfigurations = (import ./hosts inputs).home-manager;

      devShells = forAllSystems (
        system:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
          formatters = with pkgs; [
            nixfmt-rfc-style
            rustfmt
          ];
          scripts = [
            (pkgs.writeScriptBin "update-input" ''
              nix flake lock --override-input "$1" "$2"
            '')
          ];
        in
        {
          default = pkgs.mkShell { packages = formatters ++ scripts; };
        }
      );
    };
}
