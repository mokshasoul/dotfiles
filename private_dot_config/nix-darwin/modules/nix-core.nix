{pkgs, ...}: {
  nix.settings = {
    auto-optimise-store = false;
    # enable flakes globally
    experimental-features = ["nix-command" "flakes"];
  };

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nixUnstable;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
