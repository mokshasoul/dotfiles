{pkgs, ...}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    autoconf
		rsync
    shfmt
    gnupg
    ipcalc
    nix-du
    vivid
    alejandra
    asciidoctor
    atool
    atuin
    bat
    bottom
    chezmoi
    clojure
    cmake
    coreutils
    coursier
    curl
    direnv
    dua
    dogdns
    duf
    exiftool
    fclones
    fd
    ffmpegthumbnailer
    ffmpeg-full
    fnm
    fzf
    gh
    git
    git-extras
    git-secrets
    glow
    graphviz
    go
    grml-zsh-config
    gnused
    helix
    htop
    httpie
    imgcat
    imagemagick
    iperf
    joshuto
    jq
    lazygit
    leiningen
    lf
    lsd
    libb2
    lua
    lua-language-server
    m-cli
    mas
    mosh
    navi
    ncdu
    neofetch
    neovim
    taplo
    nmap
    nnn
    oha
    pipx
    procs
    ranger
    ripgrep
    rtmpdump
    ruby
    sd
    shellcheck
    streamlink
    stylua
    tmux
    tree
    tree-sitter
    universal-ctags
    vim
    wakeonlan
    wget
    xsv
		yazi
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
