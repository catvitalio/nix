{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/crypted";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-partlabel/esp";
      fsType = "vfat";
    };
  };
}
