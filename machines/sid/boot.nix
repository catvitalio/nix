{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.luks.devices."crypted" = {
      device = "/dev/disk/by-partlabel/luks";
      allowDiscards = true;
    };
  };
}
