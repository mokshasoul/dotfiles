{
  lib,
  pkgs,
  username,
  ...
}: {
  # Auto upgrade nix package and the daemon service.
  nix.enable = false;
  # nix = {
  #   package = pkgs.nix;
  #   settings = {
  #     substituters = [
  #       "https://cache.nixos.org/"
  #     ];
  #     trusted-public-keys = [
  #       "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
  #     ];
  #     trusted-users = ["@admin" "${username}"];
  #
  #     # enable flakes globally
  #     experimental-features = ["nix-command" "flakes"];
  #     bash-prompt-prefix = "(nix:$name)\040";
  #     extra-nix-path = "nixpkgs=flake:nixpkgs";
  #
  #     upgrade-nix-store-path-url = "https://install.determinate.systems/nix-upgrade/stable/universal";
  #     extra-platforms = lib.mkIf (pkgs.system == "aarch64-darwin") ["x86_64-darwin" "aarch64-darwin"];
  #
  #     # Recommended when using `direnv` etc.
  #     keep-derivations = true;
  #     keep-outputs = true;
  #
  #     # TODO: https://github.com/LnL7/nix-darwin/issues/970
  #     # build-users-group = lib.mkForce "";
  #     #
  #     # TODO: https://github.com/LnL7/nix-darwin/issues/970
  #     # configureBuildUsers = true;
  #   };
  #   gc = {
  #     user = "root";
  #     automatic = true;
  #     options = "--delete-older-than 15d";
  #     interval.Hour = 3;
  #   };
  #   # Store management
  #   optimise = {
  #     automatic = true;
  #     interval.Hour = 4;
  #   };
  # };

  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
}
