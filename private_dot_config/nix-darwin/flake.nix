{
  description = "moksha's darwin-nix";

  inputs = {
    # Package sets
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    #
    # Env system-management
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-stable";
    darwin.url = "github:LnL7/nix-darwin/nix-darwin-25.11";
    darwin.inputs.nixpkgs.follows = "nixpkgs-stable";
    _1password-shell-plugins.url = "github:1Password/shell-plugins";
    _1password-shell-plugins.inputs.nixpkgs.follows = "nixpkgs-stable";

    # Flake utilities
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
    flake-utils.url = "github:numtide/flake-utils";

    # Utility for watching macOS `defaults`.
    prefmanager.url = "github:malob/prefmanager";
    prefmanager.inputs.nixpkgs.follows = "nixpkgs-stable";
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

    homeStateVersion = "25.11";

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
    # Overlays --------------------------------------------------------------------------------{{{

    overlays = {
      # Overlays to add different versions `nixpkgs` into package set
      pkgs-master = _: prev: {
        pkgs-master = import inputs.nixpkgs-master {
          inherit (prev.stdenv) system;
          inherit (nixpkgsDefaults) config;
        };
      };
      pkgs-stable = _: prev: {
        pkgs-stable = import inputs.nixpkgs-stable {
          inherit (prev.stdenv) system;
          inherit (nixpkgsDefaults) config;
        };
      };
      pkgs-unstable = _: prev: {
        pkgs-unstable = import inputs.nixpkgs-unstable {
          inherit (prev.stdenv) system;
          inherit (nixpkgsDefaults) config;
        };
      };
      apple-silicon = _: prev:
        optionalAttrs (prev.stdenv.system == "aarch64-darwin") {
          # Add access to x86 packages system is running Apple Silicon
          pkgs-x86 = import inputs.nixpkgs-unstable {
            system = "x86_64-darwin";
            inherit (nixpkgsDefaults) config;
          };
        };
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
            home-manager.darwinModules.home-manager
            {
              # `home-manager` config
              users.users.moksha.home = "/Users/moksha";
              home-manager.useGlobalPkgs = true;
              home-manager.backupFileExtension = "bak";
              home-manager.useUserPackages = true;
              home-manager.users.${username} = {
                imports = [
                  ./home/packages.nix
                  ./home/git.nix
                  inputs._1password-shell-plugins.hmModules.default
                ];
                home.stateVersion = homeStateVersion;
                # home.user-info = primaryUserDefaults;
              };
            }
          ]
          ++ [
            {
              # Support legacy workflows that use `<nixpkgs>` etc.
              nix.nixPath.nixpkgs = "${inputs.nixpkgs-unstable}";
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
    # darwinPackages = self.darwinConfigurations."${hostname}".pkgs;

    # nix code-formatter
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
# vim: foldmethod=marker

