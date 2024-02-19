{pkgs, ...}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    vim
    grml-zsh-config
		neovim
    joshuto
		fclones
    atuin
    zoxide
    asciidoctor
    chezmoi
    atuin
    bat
    cmake
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
    alejandra
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
