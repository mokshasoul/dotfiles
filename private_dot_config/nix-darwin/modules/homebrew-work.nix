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
  homebrew.onActivation.cleanup = "none";
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
  # only free apps can be installed it seems
  homebrew.masApps = {
    "Things" = 904280696;
    # "Microsoft Excel" = 462058435;
    # "Table Tool" = 112200842;
    # "FakespotSafari" = 159254161;
    # "Popcorn for Safari" = 153571967;
    # "Xcode" = 497799835;
    # "Microsoft Word" = 462054704;
    # "Cake Wallet" = 133470254;
    # "1Password for Safari" = 156981329;
    # "Swiftify for Xcode" = 118341211;
    # "Zen: Coloring Book For Adults" = 106365985;
    # "OTP Auth" = 147186742;
    # "Hyperduck" = 644466706;
    # "LanguageTool" = 153427576;
    # "Actions" = 158643517;
    # "Sink It for Reddit" = 644987363;
    # "Microsoft PowerPoint" = 462062816;
    # "Baking Soda" = 160115161;
    # "The Camelizer" = 153257908;
    # "TestFlight" = 899247664;
    # "Microsoft Remote Desktop" = 129520346;
    # "Pages" = 409201541;
    # "rcmd" = 159628316;
    # "Telegram" = 747648890;
    # "Developer" = 640199958;
    # "Boop" = 151842504;
    # "Microsoft OneNote" = 784801555;
    # "WireGuard" = 145168502;
    # "Vinegar" = 159130322;
    # "Microsoft Outlook" = 985367838;
    # "Kindle Classic" = 405399194;
    # "iMovie" = 408981434;
    # "JWT Inspector" = 155967016;
    "HazeOver" = 430798174;
    "Prime Video" = 545519333;
    # "Bear" = 109118912; Needs to be installed manually
  };

  # If an app isn't available in the Mac App Store, or the version in the App Store has
  # limitiations, e.g., Transmit, install the Homebrew Cask.
  homebrew.casks = [
    "1password"
    "1password-cli"
    "alfred"
    "android-ndk"
    "android-platform-tools"
    "db-browser-for-sqlite"
    "dbeaver-community"
    "discord@canary"
    "docker"
    "drawio"
    "dteoh-devdocs"
    "font-fira-code"
    "font-fira-code-nerd-font"
    "font-hack"
    "font-hack-nerd-font"
    "github"
    "google-chrome"
    "hammerspoon"
    "iina"
    "intellij-idea-ce"
    "jordanbaird-ice"
    "keka"
    "kextviewr"
    "latest"
    "monitorcontrol"
    "netnewswire"
    "postman"
    "proxyman"
    "rectangle-pro"
    "royal-tsx"
    "sloth"
    "sublime-text"
    "syntax-highlight"
    "telegram"
    "tunnelblick"
    "visual-studio-code"
    "vlc"
    "wezterm"
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
    "mysql-client"
    "swift-format"
    "swiftlint"
    "xz"
  ];
}
