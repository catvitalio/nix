install MACHINE:
    sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- --mode destroy,format,mount ./machines/{{MACHINE}}/disks.nix
    sudo nixos-install --flake .#{{MACHINE}}
