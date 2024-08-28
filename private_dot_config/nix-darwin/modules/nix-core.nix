{
  lib,
  pkgs,
  ...
}: {
  nix.settings = {
    substituters = [
      "https://cache.nixos.org/"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];

    # https://github.com/NixOS/nix/issues/7273
    auto-optimise-store = false;

    # enable flakes globally
    experimental-features = ["nix-command" "flakes"];
    extra-platforms = lib.mkIf (pkgs.system == "aarch64-darwin") ["x86_64-darwin" "aarch64-darwin"];

    # Recommended when using `direnv` etc.
    keep-derivations = true;
    keep-outputs = true;

    # TODO: https://github.com/LnL7/nix-darwin/issues/970
    build-users-group = lib.mkForce "";
  };

  # TODO: https://github.com/LnL7/nix-darwin/issues/970
  # nix.configureBuildUsers = true;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  nix.package = pkgs.nixVersions.latest;
  nixpkgs.hostPlatform = "aarch64-darwin";
  # Store management
  nix.gc.automatic = true;
  nix.gc.interval.Hour = 3;
  nix.gc.options = "--delete-older-than 15d";
  nix.optimise.automatic = true;
  nix.optimise.interval.Hour = 4;
}
