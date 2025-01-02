{pkgs, ...}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment = {
    etc = {
      terminfo = {
        source = "${pkgs.ncurses}/share/terminfo";
      };
    };
    systemPackages = with pkgs; [
      alejandra
      asciidoctor
      atool
      atuin
      ast-grep
      autoconf
      awscli2
      bat
      bun
      chezmoi
      clojure
      cmake
      coursier
      ctop
      delta
      dive
      dogdns
      dua
      duf
      exiftool
      fclones
      ffmpeg-full
      ffmpegthumbnailer
      findutils
      fnm
      fzf
      gawk
      gh
      git
      git-extras
      git-secrets
      glow
      gnupg
      gnused
      go
      graphviz
      grml-zsh-config
      helix
      htop
      imagemagick
      imgcat
      ipcalc
      ipmitool
      iperf
      joshuto
      jq
      lazygit
      leiningen
      lf
      libb2
      libffi
      libxml2
      libmysqlclient
      llvm
      llvmPackages.bintools
      lua
      lua-language-server
      luajitPackages.luarocks-nix
      luajitPackages.tiktoken_core
      m-cli
      mas
      massren
      maven
      miller
      navi
      # ncdu
      ncurses
      neofetch
      nix-du
      nmap
      nnn
      oha
      openblas
      openssl
      pandoc
      php
      pipx
      procs
      protobuf
      pkg-config
      python311
      pyright
      pyenv
      rbenv
      readline
      rsync
      rtmpdump
      ruby
      sd
      shellcheck
      shfmt
      streamlink
      stylua
      taplo
      tenv
      terraform-ls
      tflint
      tflint-plugins.tflint-ruleset-aws
      tflint-plugins.tflint-ruleset-google
      tree
      tree-sitter
      tmux
      universal-ctags
      viddy
      vim
      vivid
      wakeonlan
      xsv
      xh
      yazi
      yq
      yt-dlp
      zellij
      # from home-conf
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

      cloc # source code line counter
      github-copilot-cli
      google-cloud-sdk
      # idris2

      jq
      nodejs
      s3cmd
      stack
      typescript

      comma # run software from without installing it
      nix-output-monitor # get additional information while building packages
      nix-tree # interactively browse dependency graphs of Nix derivations
      nix-update # swiss-knife for updating nix packages
      nixpkgs-review # review pull-requests on nixpkgs
      statix # lints and suggestions for the Nix programming language

      cocoapods
      m-cli # useful macOS CLI commands
      zoxide
    ];
  };
}
