{ config, pkgs, ... }:

{
  imports = [ ./disks.nix ./boot.nix ];

  system.stateVersion = "25.05";

  networking = {
    hostName = "sid";
    networkmanager.enable = true;
  };

  time.timeZone = "Asia/Krasnoyarsk";
  i18n.defaultLocale = "en_US.UTF-8";

  services = { openssh.enable = true; };

  environment.systemPackages = with pkgs; [ neovim htop curl git ];
}
