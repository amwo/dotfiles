{
  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
    nix-darwin.url = "github:LnL7/nix-darwin";
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, home-manager, nix-darwin, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];

      perSystem = { system, pkgs, ... }: {
        _module.args.pkgs = import nixpkgs { inherit system; };
        _module.args.username = let u = builtins.getEnv "USER"; in if u == "" then "user" else u;
        _module.args.hostname = let h = builtins.getEnv "HOSTNAME"; in if h == "" then "darwin" else h;

        devShells.default = pkgs.mkShell {
          buildInputs = [ pkgs.git pkgs.home-manager pkgs.nh ];
        };

        packages = import ./pkgs { inherit pkgs; };
      };

      flake = { config, inputs, ... }@attrs: let
        username = attrs.username;
        hostname = attrs.hostname;
      in {
        homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = config.system; };
          modules = [ ./home/home.nix ];
        };

        darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
          system = config.system;
          modules = [
            ./darwin/darwin.nix
            home-manager.darwinModules.home-manager
            { users.users.${username}.home = "/Users/${username}"; }
            { home-manager.users.${username}.imports = [ ./home/home.nix ]; }
          ];
        };
      };
    };
}
