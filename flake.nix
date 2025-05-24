{
  description = "Multi-host configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    disko.url = "github:nix-community/disko";
  };

  outputs = { self, nixpkgs, flake-utils, disko, nixos-hardware, ... }:
    let supportedSystems = [ "x86_64-linux" "aarch64-darwin" ];
    in {
      packages = flake-utils.lib.eachDefaultSystem (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in { default = pkgs.hello; });

      apps = flake-utils.lib.eachDefaultSystem (system: {
        disko = {
          type = "app";
          program = "${disko.packages.${system}.disko}/bin/disko";
        };
      });

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
      };
    };

}
