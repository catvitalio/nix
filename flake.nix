{
  description = "Multi-host configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    disko.url = "github:nix-community/disko";
  };

  outputs = { nixpkgs, flake-utils, disko, nixos-hardware, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in { packages.default = pkgs.hello; })

    {
      nixosConfigurations = {
        sid = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./machines/sid/configuration.nix
            disko.nixosModules.disko
            ./machines/sid/disko.nix
            nixos-hardware.nixosModules.common-cpu-amd
          ];
        };

        joey = nixpkgs.lib.nixosSystem {
          system = "aarch64-darwin";
          modules = [
            ./machines/joey/configuration.nix
            nixos-hardware.nixosModules.apple-macbook
          ];
        };
      };

    };
}
