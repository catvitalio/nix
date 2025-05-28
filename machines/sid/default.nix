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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services = {
    openssh.enable = true;
    blueman.enable = true;
    ntp.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  security.rtkit.enable = true;

  environment.systemPackages = with pkgs; [ fish neovim htop curl git ];
}
