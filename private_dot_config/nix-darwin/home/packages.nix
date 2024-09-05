{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) attrValues mkIf elem;
in {
  # 1Password CLI plugin integration
  # https://developer.1password.com/docs/cli/shell-plugins/nix
  programs._1password-shell-plugins.enable = true;
  programs._1password-shell-plugins.plugins = attrValues {
    inherit (pkgs) gh cachix;
  };
  home.shellAliases = {
    # Run `nixpkgs-review` in 1Password env to get `GITHUB_TOKEN` envvar.
    nixpkgs-review = mkIf (elem pkgs.nixpkgs-review config.home.packages) "op run -- nixpkgs-review";
  };
  home.sessionVariables = {
    GITHUB_TOKEN = "op://Personal/GitHub Personal Access Token/credential";
  };
  # Bat, a substitute for cat.
  # https://github.com/sharkdp/bat
  # https://nix-community.github.io/home-manager/options.html#opt-programs.bat.enable
  programs.bat.enable = true;
  #
  # Btop, a fancy version of `top`.
  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.btop.enable
  programs.btop.enable = true;
  #
  # Direnv, load and unload environment variables depending on the current directory.
  # https://direnv.net
  # https://nix-community.github.io/home-manager/options.html#opt-programs.direnv.enable
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Zoxide, a faster way to navigate the filesystem
  # https://github.com/ajeetdsouza/zoxide
  # https://nix-community.github.io/home-manager/options.html#opt-programs.zoxide.enable
  programs.zoxide.enable = true;

  # Zsh
  # https://nix-community.github.io/home-manager/options.xhtml#opt-programs.zsh.enable
  programs.zsh.enable = true;
  programs.zsh.dotDir = ".config/zsh";
  programs.zsh.history.path = "${config.xdg.stateHome}/zsh_history";

  home.packages = attrValues (
    {
      inherit
        (pkgs)
        bandwhich
        bottom
        coreutils
        curl
        du-dust
        fd
        lsd
        mosh
        parallel
        ripgrep
        unrar
        wget
        xz
        ;
      # Dev stuff
      inherit
        (pkgs)
        cloc # source code line counter
        github-copilot-cli
        google-cloud-sdk
        # idris2

        jq
        nodejs
        s3cmd
        stack
        typescript
        ;
      #
      # Useful nix related tools
      inherit
        (pkgs)
        cachix # adding/managing alternative binary caches hosted by Cachix
        comma # run software from without installing it
        nix-output-monitor # get additional information while building packages
        nix-tree # interactively browse dependency graphs of Nix derivations
        nix-update # swiss-knife for updating nix packages
        nixpkgs-review # review pull-requests on nixpkgs
        statix # lints and suggestions for the Nix programming language
        ;
    }
    // lib.optionalAttrs pkgs.stdenv.isDarwin {
      inherit
        (pkgs)
        cocoapods
        m-cli # useful macOS CLI commands
        ;
    }
  );
}
