{
  inputs = {
    nixpkgs.url = "nixpkgs";
    flake-parts.url = "github:hercules-ci/flake-parts";
    home-manager.url = "github:nix-community/home-manager";
    nix-darwin.url = "github:LnL7/nix-darwin";
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, home-manager, nix-darwin, ... }:
    let
      username = "am";
      hostname = "pax";
      systemName = "aarch64-darwin";
    in flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ systemName ];

      perSystem = { system, pkgs, ... }: {
        _module.args.pkgs = import nixpkgs { inherit system; };
        _module.args.username = username;
        _module.args.hostname = hostname;

        devShells.default = pkgs.mkShell {
          buildInputs = [ pkgs.git pkgs.home-manager pkgs.nh ];
        };

        packages = import ./pkgs { inherit pkgs; };
      };

      flake = { inputs, ... }: {
        homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs { system = systemName; };
          modules = [
            { home.username = username; home.homeDirectory = "/Users/${username}"; }
            ./home/home.nix
          ];
        };

        # Use a host-specific module if it exists under hosts/${hostname}/nix-darwin.nix
        darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
          system = systemName;
          modules = let
            hostModulePath = "${toString ./.}/hosts/${hostname}/nix-darwin.nix";
            hostModule = if builtins.pathExists hostModulePath
              then builtins.toPath hostModulePath
              else ./darwin/darwin.nix;
          in [
            hostModule
            home-manager.darwinModules.home-manager
            { users.users.${username}.home = "/Users/${username}"; }
            { home-manager.users.${username}.imports = [ ./home/home.nix ]; }
          ];
        };
      };
    };
}
