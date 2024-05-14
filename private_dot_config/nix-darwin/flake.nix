{
  description = "moksha's darwin-nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    home-manager,
    nixpkgs,
    ...
  }: let
    username = "moksha";
    system = "aarch64-darwin";
    hostname = "fenrir-mbp";

    specialArgs =
      inputs
      // {
        inherit username hostname;
      };
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#fenrir-mbp
    darwinConfigurations."${hostname}" = nix-darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        ./modules/nix-core.nix
        ./modules/system.nix
        ./modules/apps.nix
        ./modules/host-users.nix
      ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."fenrir-mbp".pkgs;

    # nix code-formatter
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
