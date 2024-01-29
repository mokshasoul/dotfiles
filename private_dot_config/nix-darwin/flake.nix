{
  description = "moksha's darwin-nix";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nixpkgs,
    ...
  }: let
    configuration = {pkgs, ...}: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages = with pkgs; [
        vim
        neovim
        joshuto
        atuin
        zoxide
        chezmoi
        atuin
        bat
        clojure
        fd
        fnm
        exiftool
        gh
        htop
        iperf
        httpie
        jq
        yq
        lazygit
        leiningen
        tmux
        xsv
        tree-sitter
        tree
        stylua
        shellcheck
        sd
        ripgrep
        pyenv
        curl
        duf
        dua
        zellij
        coreutils
        direnv
        fzf
        # fishPlugins.fzf-fish
        go
        git-extras
        git-secrets
        glow
        helix
        imgcat
        lf
        lsd
        lua
        # pkgs.luajit
        lua-language-server
        m-cli
        nnn
        mas
        mosh
        navi
        ncdu
        neofetch
        nmap
        oha
        pipx
        procs
        wakeonlan
        wget
        universal-ctags
      ];

      environment.shells = [pkgs.bashInteractive pkgs.zsh pkgs.fish];

      # Auto upgrade nix package and the daemon service.
      services.nix-daemon.enable = true;
      # nix.package = pkgs.nix;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Create /etc/zshrc that loads the nix-darwin environment.
      programs.zsh.enable = true; # default shell on catalina
      programs.fish.enable = true;

      # SysConf
      system.keyboard.remapCapsLockToControl = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 4;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#fenrir-mbp
    darwinConfigurations."fenrir-mbp" = nix-darwin.lib.darwinSystem {
      modules = [configuration];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."fenrir-mbp".pkgs;
  };
}
