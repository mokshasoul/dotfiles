{
  username,
  pkgs,
  ...
}:
#############################################################
#
#  Host & Users configuration
#
#############################################################
{
  users.users."${username}" = {
    home = "/Users/${username}";
    description = username;
    shell = pkgs.fish;
  };

  nix.settings.trusted-users = [username];
}
