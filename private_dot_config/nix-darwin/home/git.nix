{config, ...}: {
  # Git
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.git.enable
  # Aliases config in ./configs/git-aliases.nix
  programs.git.enable = true;

  # programs.git.userEmail = config.home.user-info.email;
  # programs.git.userName = config.home.user-info.fullName;

  # GitHub CLI
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.gh.enable
  # Aliases config in ./gh-aliases.nix
  programs.gh.enable = true;
  programs.gh.settings.version = 1;
  programs.gh.settings.git_protocol = "ssh";
}
