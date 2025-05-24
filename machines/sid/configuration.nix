{ config, pkgs, ... }:

{
  imports = [ ./disko.nix ./boot.nix ./mounts.nix ];

  system.stateVersion = "24.11";

  networking = {
    hostName = "sid";
    networkmanager.enable = true;
    useDHCP = true;
  };

  time.timeZone = "Asia/Krasnoyarsk";
  i18n.defaultLocale = "en_US.UTF-8";

  services = { openssh.enable = true; };

  environment.systemPackages = with pkgs; [ vim htop curl git ];
}
