{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd.luks.devices."cryptroot" = {
      device = "/dev/disk/by-partlabel/nixos";
      allowDiscards = true;
    };
  };
}
