{
  inputs:
  let
    mkHomeManagerConfiguration =
      {
        system,
        username,
        overlays,
        modules,
      }:
      inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import inputs.nixpkgs {
          inherit system overlays;
          config = {
            allowUnfree = true;
          };
        };
        extraSpecialArgs = {
          inherit inputs username;
          pkgs-stable = import inputs.nixpkgs-stable {
            inherit system overlays;
            config = {
              allowUnfree = true;
            };
          };
        };
        modules = modules ++ [
          {
            home = {
              inherit username;
              homeDirectory = "/home/${username}";
              stateVersion = "22.11";
            };
            programs.home-manager.enable = true;
            programs.git.enable = true;
          }
        ];
      };
  in
  {
    home-manager = {
      "am@arch.local" = mkHomeManagerConfiguration {
        system = "x86_64-linux";
        username = "am";
        overlays = [ inputs.fenix.overlays.default ];
        modules = [ ./arch.local/hm.nix ];
      };
      "am@mini.local" = mkHomeManagerConfiguration {
        system = "aarch64-darwin";
        username = "am";
        overlays = [ inputs.fenix.overlays.default ];
        modules = [ ./mini.local/hm.nix ];
      };
      "am@air.local" = mkHomeManagerConfiguration {
        system = "aarch64-darwin";
        username = "am";
        overlays = [ inputs.fenix.overlays.default ];
        modules = [ ./air.local/hm.nix ];
      };
    };
  }
}
