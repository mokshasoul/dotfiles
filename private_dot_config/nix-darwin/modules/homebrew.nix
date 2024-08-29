{
  config,
  lib,
  ...
}: let
  inherit (lib) mkIf;
  # caskPresent = cask: lib.any (x: x.name == cask) config.homebrew.casks;
  brewEnabled = config.homebrew.enable;
in {
  environment.shellInit = mkIf brewEnabled ''
    eval "$(${config.homebrew.brewPrefix}/brew shellenv)"
  '';

  # https://docs.brew.sh/Shell-Completion#configuring-completions-in-fish
  # For some reason if the Fish completions are added at the end of `fish_complete_path` they don't
  # seem to work, but they do work if added at the start.
  programs.fish.interactiveShellInit = mkIf brewEnabled ''
    if test -d (brew --prefix)"/share/fish/completions"
      set -p fish_complete_path (brew --prefix)/share/fish/completions
    end

    if test -d (brew --prefix)"/share/fish/vendor_completions.d"
      set -p fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    end
  '';

  #TODO: To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = true;
  homebrew.onActivation.cleanup = "zap";
  homebrew.global.brewfile = true;

  homebrew.taps = [
    "ankitpokhrel/jira-cli"
    "borkdude/brew"
    "clojure-lsp/brew"
    "clojure/tools"
    "confluentinc/tap"
    "coursier/formulas"
    "ellie/atuin"
    "homebrew/bundle"
    "jesseduffield/lazygit"
    "jondot/tap"
    "kudulab/dojo-osx"
    "neovim/neovim"
    "railwaycat/emacsmacport"
    "wez/wezterm"
    "homebrew-ffmpeg/ffmpeg"
    "homebrew/services"
  ];

  # Prefer installing application from the Mac App Store
  homebrew.masApps = {};

  # If an app isn't available in the Mac App Store, or the version in the App Store has
  # limitiations, e.g., Transmit, install the Homebrew Cask.
  homebrew.casks = [
    "alfred"
    "android-platform-tools"
    "anydesk"
    "caprine"
    "cyberduck"
    "dash"
    "dbeaver-community"
    "discord@canary"
    "drawio"
    "dteoh-devdocs"
    "firefox"
    "font-fira-code"
    "font-fira-code-nerd-font"
    "font-hack"
    "font-hack-nerd-font"
    "github"
    "gog-galaxy"
    "google-chrome"
    "iina"
    "jordanbaird-ice"
    "karabiner-elements"
    "keepassxc"
    "keka"
    "kextviewr"
    "latest"
    "monitorcontrol"
    "motrix"
    "netnewswire"
    "obs"
    "rectangle-pro"
    "royal-tsx"
    "sloth"
    "syntax-highlight"
    "telegram"
    "tunnelblick"
    "veracrypt"
    "visual-studio-code"
    "vlc"
    "wezterm"
    "whisky"
    #"1password"
    #"google-chrome"
    #"google-drive"
    #"gpg-suite"
    #"hammerspoon"
    #"postman"
    #"transmit"
    "visual-studio-code"
    #"vlc"
    "whisky"
    "zed"
  ];

  # Configuration related to casks
  # home-manager.users.${config.users.primaryUser.username} = mkIf (caskPresent "1password" && config ? home-manager) {
  #   programs.ssh.enable = true;
  #   programs.ssh.extraConfig = ''
  #     # Only set `IdentityAgent` not connected remotely via SSH.
  #     # This allows using agent forwarding when connecting remotely.
  #     Match host * exec "test -z $SSH_TTY"
  #       IdentityAgent "~/Library/Group Containers/3BUA8C4S2C.com.1password/t/agent.sock"
  #   '';
  # };

  # For cli packages that aren't currently available for macOS in `nixpkgs`.Packages should be
  # installed in `../home/default.nix` whenever possible.
  homebrew.brews = [
    "swift-format"
    "swiftlint"
    "xz"
  ];
}
