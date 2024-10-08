{
  config,
  pkgs,
  ...
}:
###################################################################################
#
#  macOS's System configuration
#
#  All the configuration options are documented here:
#    https://daiderd.com/nix-darwin/manual/index.html#sec-options
#
###################################################################################
{
  system = {
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      menuExtraClock.Show24Hour = true; # show 24 hour clock

      # other macOS's defaults configuration.
      # ......
    };
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    # Set Git commit hash for darwin-version.
    # configurationRevision = self.rev or self.dirtyRev or null;

    # Used for backwards compatibility, please read the changelog before changing.
    # $ darwin-rebuild changelog
    stateVersion = 5;
  };
  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = false;
  #
  # Shells -----------------------------------------------------------------------------------------

  # Add shells installed by nix to /etc/shells file
  environment.shells = with pkgs; [
    bashInteractive
    fish
    zsh
  ];
  programs.fish.enable = true;
  programs.fish.useBabelfish = true;
  programs.fish.babelfishPackage = pkgs.babelfish;
  # Needed to address bug where $PATH is not properly set for fish:
  # https://github.com/LnL7/nix-darwin/issues/122
  programs.fish.shellInit = ''
    for p in (string split : ${config.environment.systemPath})
      if not contains $p $fish_user_paths
        set -g fish_user_paths $fish_user_paths $p
      end
    end
  '';
  environment.variables = {
    SHELL = "${pkgs.fish}/bin/fish";
    EDITOR = "${pkgs.neovim}/bin/nvim";
  };

  # Create /etc/zshrc that loads the nix-darwin environment.
  # is required if you want to use darwin's default shell - zsh
  programs.zsh = {
    enable = true;
    enableGlobalCompInit = true;
    enableFzfCompletion = true;
    enableFzfHistory = true;
    enableSyntaxHighlighting = true;
  };

  programs.nix-index.enable = true;

  programs.direnv = {
    enable = true;
  };
}
