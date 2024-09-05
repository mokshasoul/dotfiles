{
  description = "moksha's darwin-nix";

  inputs = {
    # Package sets
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    #
    # Env system-management
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
    _1password-shell-plugins.url = "github:1Password/shell-plugins";
    _1password-shell-plugins.inputs.nixpkgs.follows = "nixpkgs-unstable";
    _1password-shell-plugins.inputs.flake-utils.follows = "flake-utils";

    # Flake utilities
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    flake-utils.url = "github:numtide/flake-utils";

    # Utility for watching macOS `defaults`.
    prefmanager.url = "github:malob/prefmanager";
    prefmanager.inputs.nixpkgs.follows = "nixpkgs-unstable";
    prefmanager.inputs.flake-compat.follows = "flake-compat";
    prefmanager.inputs.flake-utils.follows = "flake-utils";
  };

  outputs = {
    self,
    darwin,
    home-manager,
    flake-utils,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self.lib) attrValues makeOverridable mkForce optionalAttrs singleton;

    username = "moksha";
    system = "aarch64-darwin";
    hostname = "fenrir-mbp";

    homeStateVersion = "24.05";

    nixpkgsDefaults = {
      config = {
        allowUnfree = true;
      };
      overlays =
        attrValues self.overlays
        ++ [
          inputs.prefmanager.overlays.prefmanager
        ];
    };

    primaryUserDefaults = {
      username = username;
      fullName = "Charis-Nicolas Georgiou";
      email = "charis_nic.georgiou@icloud.com";
      nixConfigDirectory = "/Users/moksha/.config/nixpkgs";
    };

    specialArgs =
      inputs
      // {
        inherit username hostname;
      };
  in {
    darwinModules = {
      nix-core = import ./modules/nix-core.nix;
      system = import ./modules/system.nix;
      homebrew = import ./modules/homebrew.nix;
      apps = import ./modules/apps.nix;
      host-users = import ./modules/host-users.nix;
    };
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#fenrir-mbp
    # $ darwin-rebuild switch --flake .#fenrir-mbp
    darwinConfigurations = {
      # Minimal macOS configurations to bootstrap systems
      bootstrap-x86 = makeOverridable darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [./darwin/bootstrap.nix {nixpkgs = nixpkgsDefaults;}];
      };
      bootstrap-arm = self.darwinConfigurations.bootstrap-x86.override {
        system = "aarch64-darwin";
      };

      fenrir-mbp = inputs.darwin.lib.darwinSystem {
        inherit system specialArgs;
        modules =
          [
            ./modules/nix-core.nix
            ./modules/system.nix
            ./modules/apps.nix
            ./modules/host-users.nix
            ./modules/homebrew.nix
            ./modules/defaults.nix
          ]
          ++ [
            {
              networking.computerName = "FENRIR";
              networking.hostName = "fenrir-mbp";
              system.defaults.smb.NetBIOSName = "FENRIR-MBP";
              networking.knownNetworkServices = [
                "Wi-Fi"
                "USB 10/100/1000 LAN"
              ];
            }
          ];
      };

      soundcloud-mbp = darwin.lib.darwinSystem {
        inherit system;
        specialArgs =
          inputs
          // {
            hostname = "soundcloud-mbp";
            username = "charis";
          };
        modules =
          [
            ./modules/nix-core.nix
            ./modules/system.nix
            ./modules/apps.nix
            ./modules/host-users.nix
            ./modules/homebrew-work.nix
            ./modules/defaults.nix
          ]
          ++ [
            {
              networking.computerName = "charis-soundcloud-mbp";
              networking.hostName = "soundcloud-mbp";
              system.defaults.smb.NetBIOSName = "SOUNDCLOUDMBP";
              networking.knownNetworkServices = [
                "Wi-Fi"
                "USB 10/100/1000 LAN"
              ];
            }
          ];
      };
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."${hostname}".pkgs;

    # nix code-formatter
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
# vim: foldmethod=marker

