{pkgs, ...}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    atool
    fclones
    ffmpegthumbnailer
    neovim
    ranger
    # fishPlugins.fzf-fish
    alejandra
    asciidoctor
    atuin
    atuin
    bat
    chezmoi
    clojure
    cmake
    coreutils
    curl
    direnv
    dua
    duf
    exiftool
    fd
    fnm
    fzf
    gh
    git-extras
    git-secrets
    glow
    go
    grml-zsh-config
    helix
    htop
    httpie
    imgcat
    iperf
    joshuto
    jq
    lazygit
    leiningen
    lf
    lsd
    lua
    lua-language-server
    m-cli
    mas
    mosh
    navi
    ncdu
    neofetch
    nmap
    nnn
    oha
    pipx
    procs
    pyenv
    ripgrep
    sd
    shellcheck
    stylua
    tmux
    tree
    tree-sitter
    universal-ctags
    vim
    wakeonlan
    wget
    xsv
    yq
    zellij
    zoxide
  ];
  # TODO To make this work, homebrew need to be installed manually, see https://brew.sh
  #
  # The apps installed by homebrew are not managed by nix, and not reproducible!
  # But on macOS, homebrew has a much larger selection of apps than nixpkgs, especially for GUI apps!
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      # 'zap': uninstalls all formulae(and related files) not listed here.
      # cleanup = "zap";
    };

    taps = [
      "homebrew/cask-fonts"
      "homebrew/services"
      "homebrew/cask-versions"
    ];

    # `brew install`
    # TODO Feel free to add your favorite apps here.
    brews = [
      # "aria2"  # download tool
    ];

    # `brew install --cask`
    # TODO Feel free to add your favorite apps here.
    casks = [
      # "google-chrome"
    ];
  };
}
