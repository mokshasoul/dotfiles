{pkgs, ...}: {
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment = {
    systemPackages = with pkgs; [
      alejandra
      imgcat
      # llvmPackages.bintools
      # luajitPackages.luarocks-nix
      # luajitPackages.tiktoken_core
      nix-du
      # openblas
      # openssl
      # pkg-config
      # python311
      # python311Packages.pip
      # tflint-plugins.tflint-ruleset-aws
      # tflint-plugins.tflint-ruleset-google
      #      tree-sitter
      # from home-conf
      unrar

      github-copilot-cli
      # idris2

      # jq
      # s3cmd
      # stack
      # typescript

      comma # run software from without installing it
      nix-output-monitor # get additional information while building packages
      nix-tree # interactively browse dependency graphs of Nix derivations
      nix-update # swiss-knife for updating nix packages
      nixpkgs-review # review pull-requests on nixpkgs
      statix # lints and suggestions for the Nix programming language
    ];
  };
}
