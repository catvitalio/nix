{ pkgs, password, ... }:

{
  nix.settings.trusted-users = [ "v" "root" ];

  users.users = {
    root = { hashedPasswordFile = password; };
    v = {
      isNormalUser = true;
      extraGroups = [ "wheel" "docker" ];
      shell = pkgs.fish;
      hashedPasswordFile = password;
      ignoreShellProgramCheck = true;
    };
  };

  programs.fish.enable = true;
}
