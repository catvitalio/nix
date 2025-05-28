{ config, input, pkgs, ... }:

{
  nix.settings.trusted-users = [ "v" ];

  users.users.v = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ];
    shell = pkgs.fish;
    hashedPasswordFile = builtins.toPath ./users/v/.password.hash;
    ignoreShellProgramCheck = true;
  };

  programs.fish.enable = true;
}
